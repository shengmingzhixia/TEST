package cgy.service.impl;

import cgy.dao.AttendenceDao;
import cgy.dao.EmployeeDao;
import cgy.dao.RewardDao;
import cgy.model.Attendence;
import cgy.model.Employee;
import cgy.model.Reward;
import cgy.service.AttendenceService;
import cgy.utils.GetUnWeekendDays;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("attendenceService")
public class AttendenceServiceImpl implements AttendenceService {
    @Resource
    private AttendenceDao attendenceDao;
    @Resource
    private RewardDao rewardDao;
    @Resource
    private EmployeeDao employeeDao;

    @Override
    public int insert(Attendence attendence) {
        List<Attendence> attendences = attendenceDao.getAtd(attendence);
        for (int i = 0; i < attendences.size(); i++) {
            Date date = attendences.get(i).getAtd_start_time();
            SimpleDateFormat formatterYear = new SimpleDateFormat("yyyy");
            SimpleDateFormat formatterMonth = new SimpleDateFormat("MM");
            SimpleDateFormat formatterDay = new SimpleDateFormat("dd");
            String dateYear = formatterYear.format(date);
            String dateMonth = formatterMonth.format(date);
            String dateDay = formatterDay.format(date);
            Date dateNow = new Date();
            String dateYearNow = formatterYear.format(dateNow);
            String dateMonthNow = formatterMonth.format(dateNow);
            String dateDayNow = formatterDay.format(dateNow);
            if (dateYear.equals(dateYearNow) && dateMonth.equals(dateMonthNow)
                    && dateDay.equals(dateDayNow)) {
                return 2;//代表今天已经打过上班卡
            }
        }
        //判断时间  添加奖惩

        Date atd_start_time = attendence.getAtd_start_time();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 09:00:00");
        String dateString = formatter.format(atd_start_time);
        System.out.println(atd_start_time);
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = format1.parse(dateString);
            long a = atd_start_time.getTime() - date.getTime();
            double b = 1.0 * a / 1000 / 60 / 60;
            System.out.println(b);
            if (b > 2) {
                Reward reward = new Reward();
                reward.setR_e_id(attendence.getAtd_e_id());
                reward.setR_date(atd_start_time);
                reward.setR_reason("旷工");
                Employee employee = new Employee();
                employee.setE_id(attendence.getAtd_e_id());
                List<Employee> e = employeeDao.getE(employee);
                reward.setR_money(-e.get(0).getE_salary() / GetUnWeekendDays.getAttendance());
                rewardDao.insertReward(reward);
                attendence.setAtd_end_time(atd_start_time);//此处将结尾时间也放上 是为了防止忘记打卡，忘记打卡
                //就是旷工 需要和管理员申请复议
                attendenceDao.insert(attendence);
                return 0;//迟到2小时  算旷工
            }
            if (a > 0) {
                Reward reward = new Reward();
                reward.setR_e_id(attendence.getAtd_e_id());
                reward.setR_date(atd_start_time);
                reward.setR_reason("迟到");
                reward.setR_money(-50);
                rewardDao.insertReward(reward);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        attendence.setAtd_end_time(atd_start_time);//此处将结尾时间也放上 是为了防止忘记打卡，忘记打卡
        //就是旷工 需要和管理员申请复议
        attendenceDao.insert(attendence);
        return 1;
    }

    @Override
    public List<Attendence> getAtd(Attendence attendence) {
        return attendenceDao.getAtd(attendence);
    }

    @Override
    public boolean update(Attendence attendence) {
        List<Attendence> attendences = attendenceDao.getAtd(attendence);
        for (int i = 0; i < attendences.size(); i++) {
            Date date = attendences.get(i).getAtd_start_time();
            SimpleDateFormat formatterYear = new SimpleDateFormat("yyyy");
            SimpleDateFormat formatterMonth = new SimpleDateFormat("MM");
            SimpleDateFormat formatterDay = new SimpleDateFormat("dd");
            String dateYear = formatterYear.format(date);
            String dateMonth = formatterMonth.format(date);
            String dateDay = formatterDay.format(date);

            Date dateNow = new Date();
            String dateYearNow = formatterYear.format(dateNow);
            String dateMonthNow = formatterMonth.format(dateNow);
            String dateDayNow = formatterDay.format(dateNow);
            if (dateYear.equals(dateYearNow) && dateMonth.equals(dateMonthNow)
                    && dateDay.equals(dateDayNow)) {
                Attendence attendence1 = attendences.get(i);
                attendence1.setAtd_end_time(new Date());
                boolean update = attendenceDao.update(attendence1);
                System.out.println("更新：" + update);
                //判断时间  添加奖惩

                Date atd_end_time = attendence1.getAtd_end_time();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 17:00:00");
                String dateString = formatter.format(atd_end_time);
                SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");

                DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date date1 = format1.parse(dateString);//规定下班时间

                    //获得所有今天的奖惩记录
                    Reward rewardToday = new Reward();
                    rewardToday.setR_e_id(attendence.getAtd_e_id());
                    List<Reward> rewardList = rewardDao.getRewards(rewardToday);//当天该人的所有记录
                    System.out.println(rewardList);
                    long a = atd_end_time.getTime() - date1.getTime();
                    if (a < 0) {
                        for (Reward reward : rewardList) {
                            if (dateYear.equals(dateYearNow) && dateMonth.equals(dateMonthNow)
                                    && dateDay.equals(dateDayNow)) {
                                if (reward.getR_reason().equals("早退")) {
                                    return true;
                                }
                                if (reward.getR_reason().equals("旷工")) {
                                    return true;
                                }
                            }
                        }
                        Reward reward = new Reward();
                        reward.setR_e_id(attendence.getAtd_e_id());
                        reward.setR_date(atd_end_time);
                        reward.setR_reason("早退");
                        reward.setR_money(-50);
                        rewardDao.insertReward(reward);
                    } else {
                        for (int i1 = 0; i1 < rewardList.size(); i1++) {
                            if (rewardList.get(i1).getR_reason().equals("早退")) {
                                rewardDao.delete(rewardList.get(i1));
                            }
                        }
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Attendence> getList(Employee employee) {
        if (employee == null || employee.getE_name() == null || employee.getE_name() == "") {
            return attendenceDao.getAllAtd();
        } else {
            List<Employee> e = employeeDao.getE(employee);
            Attendence attendence = new Attendence();
            if (e == null || e.size() == 0) return null;
            attendence.setAtd_e_id(e.get(0).getE_id());
            return attendenceDao.getAtd(attendence);
        }
    }
}
