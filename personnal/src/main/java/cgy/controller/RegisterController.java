package cgy.controller;

import cgy.model.Customer;
import cgy.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class RegisterController {
    @Resource
    private CustomerService customerService;

    @RequestMapping("checkName")
    @ResponseBody
    protected void checkName(String name, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        boolean repetition = customerService.repetition(name);
        if (repetition) {
            pw.write("用户名重复！");
        }
    }

    @RequestMapping("register")
    protected String register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        boolean b = customerService.register(new Customer(name, pass));
        request.setAttribute("b",b);
        return "jsp/touristlogin";
    }
}
