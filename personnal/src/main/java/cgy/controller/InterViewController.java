package cgy.controller;

import cgy.service.InterViewService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
public class InterViewController {
    @Resource
    private InterViewService interViewService;

    @RequestMapping("insertInterView")
    public String insertInterView() {
        return null;
    }
}
