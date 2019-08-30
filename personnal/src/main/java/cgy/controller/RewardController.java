package cgy.controller;

import cgy.model.Employee;
import cgy.model.Reward;
import cgy.model.Salary;
import cgy.model.Trouble;
import cgy.service.EmployeeService;
import cgy.service.RewardService;
import cgy.service.SalaryService;
import cgy.service.TroubleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class RewardController {
    @Resource
    private EmployeeService employeeService;

    @Resource
    private RewardService rewardService;

    @Resource
    private SalaryService salaryService;
    @Resource
    private TroubleService troubleService;

    @RequestMapping("getRewards")
    public String getRewards(Employee employee, Reward reward, HttpServletRequest request) {
        String name = null;
        Date date = null;
        if (employee != null && employee.getE_name() != null) {
            name = employee.getE_name();
        }
        if (reward != null && reward.getR_date() != null) {
            date = reward.getR_date();
        }
        List<Employee> list = employeeService.getEmployees(employee);
        List<Reward> rewards = rewardService.getRewards(name, date);
        request.setAttribute("list", list);
        request.setAttribute("rewards", rewards);
        return "admin/reward/rewardlist";
    }

    @RequestMapping("addReward")
    public String addReward(int s_id, Reward reward, HttpServletRequest request) {
        reward.setR_date(new Date());
        Salary salary = new Salary();
        salary.setS_id(s_id);
        salary.setS_is_trouble(3);
        Trouble trouble = new Trouble();
        trouble.setS_id(s_id);
        trouble.setT_state(0);
        boolean insert22 = rewardService.insert(reward, salary, trouble);
        request.setAttribute("insert22", insert22);
        return "main/main";
    }
}
