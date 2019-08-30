package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.dao.RewardDao;
import cgy.dao.SalaryDao;
import cgy.dao.TroubleDao;
import cgy.model.Employee;
import cgy.model.Reward;
import cgy.model.Salary;
import cgy.model.Trouble;
import cgy.service.RewardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("rewardService")
public class RewardServiceImpl implements RewardService {
    @Resource
    private RewardDao rewardDao;
    @Resource
    private EmployeeDao employeeDao;
    @Resource
    private TroubleDao troubleDao;
    @Resource
    private SalaryDao salaryDao;

    @Override
    public List<Reward> getRewards(String name, Date date) {
        Employee employee = new Employee();
        employee.setE_name(name);
        List<Employee> e = employeeDao.getE(employee);
        List<Reward> list = new ArrayList<>();
        for (Employee employee1 : e) {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Reward reward = new Reward();
            reward.setR_e_id(employee1.getE_id());
            List<Reward> rewards = rewardDao.getRewards(reward);
            if (date == null)
                list.addAll(rewards);
            else {
                for (Reward reward1 : rewards) {
                    if (format.format(date).equals(format.format(reward1.getR_date()))) {
                        list.add(reward1);
                    }
                }
            }
        }
        return list;
    }

    @Override
    public boolean insert(Reward reward, Salary salary, Trouble trouble) {
        salaryDao.updateState(salary);
        troubleDao.updateState(trouble);
        return rewardDao.insertReward(reward);
    }
}
