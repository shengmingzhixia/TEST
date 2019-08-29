package cgy.controller;

import cgy.model.Employee;
import cgy.model.Reward;
import cgy.service.EmployeeService;
import cgy.service.RewardService;
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
        List<Reward> rewards = rewardService.getRewards(name,date);
        request.setAttribute("list",list);
        request.setAttribute("rewards",rewards);
        return "admin/reward/rewardlist";
    }
}
