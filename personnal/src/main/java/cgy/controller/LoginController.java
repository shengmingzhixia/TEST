package cgy.controller;
import cgy.model.Employee;
import cgy.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Resource
    private EmployeeService employeeService;

    @RequestMapping("login") //登录
    public String login(HttpServletRequest request) {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String type = request.getParameter("type");
        Employee employee = new Employee(account, password, Integer.parseInt(type));
        System.out.println(employee);
        employee = employeeService.login(employee);
        System.out.println(employee);
        if (employee == null) {
            request.setAttribute("login", false);
            return "jsp/login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("employeeNow", employee);
        if (employee.getType() == 0) {
            request.setAttribute("login", true);
            return "admin/index";
        } else {
            request.setAttribute("login", true);
            return "../index";
        }
    }
}
