package cgy.controller;

import cgy.model.Customer;
import cgy.model.InterView;
import cgy.service.InterViewService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class InterViewController {
    @Resource
    private InterViewService interViewService;

    //游客投递简历
    @RequestMapping("insertInterView")
    public String insertInterView(InterView interView,HttpServletRequest request) {
        interView.setIn_date(new Date());
        interView.setIn_is_read(0);//0代表未读
        interView.setIn_is_accept(0);//0代表管理员未接受该简历
        interView.setIn_is_accept(0);//0代表该游客尚未同意来面试
        interView.setIn_read_account(0);//代表尚未看过  所以阅读次数是0
        boolean view = interViewService.insertInterView(interView);
        request.setAttribute("view", view);
        return "forward:getRecruits";
    }
}
