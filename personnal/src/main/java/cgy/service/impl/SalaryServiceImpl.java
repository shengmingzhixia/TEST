package cgy.service.impl;

import cgy.dao.AttendenceDao;
import cgy.dao.EmployeeDao;
import cgy.dao.RewardDao;
import cgy.dao.SalaryDao;
import cgy.model.*;
import cgy.service.SalaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("salaryService")
public class SalaryServiceImpl implements SalaryService {
    @Resource
    private SalaryDao salaryDao;
    @Resource
    private EmployeeDao employeeDao;
    @Resource
    private RewardDao rewardDao;
    @Resource
    AttendenceDao attendenceDao;

    @Override
    public Page<Salary2> getSalaryByPage(int pageNo) {
        Page page = new Page<>();
        int totalRows = salaryDao.getTotalRows();
        List<Salary> salaries = salaryDao.getSalarysByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize());
        List<Salary2> salary2s = new ArrayList<>();
        for (Salary salary : salaries) {
            Employee employee = new Employee();
            employee.setE_id(salary.getS_e_id());
            employee = employeeDao.getE(employee).get(0);
            Salary2 salary2 = new Salary2(salary, employee.getE_name());
            salary2s.add(salary2);
        }
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(salary2s);
        return page;
    }

    @Override
    public boolean insertSalarys() {
        SimpleDateFormat formatterYear = new SimpleDateFormat("yyyy");
        SimpleDateFormat formatterMonth = new SimpleDateFormat("MM");
        SimpleDateFormat formatterDay = new SimpleDateFormat("dd");
        Date date = new Date();
        String dateYear = formatterYear.format(date);
        String dateMonth = formatterMonth.format(date);
        String dateDay = formatterDay.format(date);

        if (!dateDay.equals("29")) {
            System.out.println("今天不是结算日子");
            return false;
        }
        if (dateMonth.equals("1")) {
            int year = Integer.parseInt(dateYear) - 1;
            dateYear = "" + year;
            dateMonth = "12";
        } else {
            int month = Integer.parseInt(dateMonth) - 1;
            if (month < 10)
                dateMonth = "0" + month;
            else
                dateMonth = "" + month;
        }
        String dateString = dateYear + "-" + dateMonth + "-" + dateDay;
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        Date dateNew = null;
        try {
            dateNew = format1.parse(dateString);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        List<Salary> salaryList = salaryDao.getSalarys();
        for (Salary salary : salaryList) {
            Date date1 = salary.getS_date();
            String dateYear2 = formatterYear.format(date1);
            String dateMonth2 = formatterMonth.format(date1);
            Date date2 = new Date();
            String dateYear3 = formatterYear.format(date2);
            String dateMonth3 = formatterMonth.format(date2);
            if (dateMonth3.equals(dateMonth2) && dateYear2.equals(dateYear3)) {
                System.out.println("这个月已经结算过了");
                return false;
            }
        }
        List<Employee> employees = employeeDao.getE(null);
        for (Employee employee : employees) {
            Salary salary = new Salary();
            salary.setS_extra(0);
            Attendence attendence = new Attendence();
            attendence.setAtd_e_id(employee.getE_id());
            List<Attendence> attendenceList = attendenceDao.getAtd(attendence);
            int i = 0;
            for (Attendence attendence1 : attendenceList) {
                String dateYear1 = formatterYear.format(attendence1.getAtd_start_time());
                String dateMonth1 = formatterMonth.format(attendence1.getAtd_start_time());
                if (dateYear1.equals(dateYear) && dateMonth1.equals(dateMonth)) {
                    i++;
                }
            }

            if (i < 22 && i > 0) {
                Reward reward = new Reward();
                reward.setR_e_id(employee.getE_id());
                reward.setR_date(dateNew);
                reward.setR_reason("没上班的日子很爽吧？但是没钱！上班天数：" + i + "天");
                reward.setR_money(-(22 - i) * (employee.getE_salary() / 22));
                rewardDao.insertReward(reward);
            } else if (i > 22) {
                salary.setS_extra((i - 22) * 150);
                Reward reward = new Reward();
                reward.setR_e_id(employee.getE_id());
                reward.setR_date(dateNew);
                reward.setR_reason("加班就加钱！");
                reward.setR_money((i - 22) * 150);
                rewardDao.insertReward(reward);
            } else if (i == 0) {
                System.out.println("不上班死路一条！");
                Reward reward = new Reward();
                reward.setR_e_id(employee.getE_id());
                reward.setR_date(dateNew);
                reward.setR_reason("一天都没来上班！胆子贼大");
                reward.setR_money(-employee.getE_salary());//本月就扣掉了
                rewardDao.insertReward(reward);
            }
            double s_reward = 0;
            List<Reward> list = rewardDao.getRewards(null);
            System.out.println(list);
            for (Reward reward : list) {
                Date date1 = reward.getR_date();
                String dateYear1 = formatterYear.format(date1);
                String dateMonth1 = formatterMonth.format(date1);
                System.out.println(dateYear1 + "==" + dateMonth1);
                System.out.println(dateYear + "=--=" + dateMonth);
                if (dateYear1.equals(dateYear) && dateMonth1.equals(dateMonth)) {
                    if (reward.getR_e_id().toString().equals(employee.getE_id().toString())) {
                        System.out.println("进入了奖惩");
                        s_reward = s_reward + reward.getR_money();
                    }
                }
            }
            System.out.println("奖惩金额：" + s_reward);
            salary.setS_date(new Date());
            salary.setS_e_id(employee.getE_id());
            salary.setS_performance(employee.getE_salary());
            salary.setS_reward(s_reward);
            salary.setS_insurance(500);
            salary.setS_is_trouble(0);
            salary.setS_total(employee.getE_salary() + s_reward - 500);
            salaryDao.insertSalary(salary);
        }
        return true;
    }

    @Override
    public Salary getSalary(Integer s_e_id) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");

        Date date = new Date();

        String dateString = formatter.format(date);

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");

        List<Salary> salarys = salaryDao.getSalary(s_e_id);
        for (Salary salary : salarys) {
            Date date1 = salary.getS_date();
            String ds = format.format(date1);
            if (ds.equals(dateString)) {
                return salary;
            }
        }
        return null;
    }

    @Override
    public List<Salary> getSalarys(Integer e_id) {
        return salaryDao.getSalary(e_id);
    }
}
