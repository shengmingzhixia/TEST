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

    @RequestMapping("insertInterView")
    public String insertInterView(HttpServletRequest request) {
        String id = request.getParameter("rctId");
        int rct_id = Integer.parseInt(id);
        String cvid = request.getParameter("cv");
        int cv_id = Integer.parseInt(cvid);
        InterView interView = new InterView();
        interView.setCvId(cv_id);
        interView.setRctId(rct_id);
        interView.setDate(new Date());
        interView.setIsRead(0);//0代表未读
        interView.setIsAccept(0);//0代表管理员未接受该简历
        interView.setIsAgree(0);//0代表该游客尚未同意来面试
        interView.setReadAccount(0);//代表尚未看过  所以阅读次数是0
        boolean view = interViewService.insertInterView(interView);
        request.setAttribute("view",view);
        return "forward:getRecruits";
    }
}
