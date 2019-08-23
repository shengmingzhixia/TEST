package cgy.controller;

import cgy.model.Cv;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ToUrl {
    @RequestMapping("toLogin")  //跳转到员工登录页面
    public String toAdminLogin() {
        return "jsp/login";
    }

    @RequestMapping("entertouristLogin")  //跳转到游客登录页面
    public String entertouristLogin() {
        return "jsp/touristlogin";
    }

    @RequestMapping("toRegister")  //跳转到注册页面
    public String toRegister() {
        return "jsp/register";
    }

    @RequestMapping("tocvadd")
    public String tocvadd() {
        return "jsp/cvadd";
    }

}
