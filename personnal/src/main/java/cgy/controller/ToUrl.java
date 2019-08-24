package cgy.controller;

import cgy.model.Cv;
import cgy.model.Position;
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

    @RequestMapping("todepartmentadd")
    public String todepartmentadd() {
        return "admin/departmentadd";
    }

    @RequestMapping("toupdateposition")
    public String toupdateposition(Position position, HttpServletRequest request) {
        request.setAttribute("position", position);
        return "admin/positionupdate";
    }
}
