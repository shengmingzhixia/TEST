package cgy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ToUrl {
    @RequestMapping("toLogin")  //跳转到登录页面
    public String toAdminLogin(){
        return "jsp/login";
    }
}
