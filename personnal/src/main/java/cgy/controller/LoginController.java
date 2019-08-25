package cgy.controller;

import cgy.model.Customer;
import cgy.model.Employee;
import cgy.service.CustomerService;
import cgy.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Resource
    private EmployeeService employeeService;
    @Resource
    private CustomerService customerService;

    @RequestMapping("login") //登录
    public String login(Employee employee,HttpServletRequest request) {
        System.out.println(employee);
        employee = employeeService.login(employee);
        System.out.println(employee);
        if (employee == null) {
            request.setAttribute("login", false);
            return "jsp/login";
        }
        HttpSession session = request.getSession();
        session.setAttribute("employeeNow", employee);
        if (employee.getE_type() == 0) {
            request.setAttribute("login", true);
            return "admin/head";
        } else {
            request.setAttribute("login", true);
            return "employee/index";
        }
    }

    @RequestMapping("touristLogin") //登录
    public String touristLogin(Customer customer,HttpServletRequest request) {
        Customer customer1 = customerService.login(customer);
        if (customer1 == null){
            request.setAttribute("touristLogin",false);
        }else {
            request.getSession().setAttribute("cust",customer1);
            request.setAttribute("touristLogin",true);
        }
        return "../index";
    }
}
