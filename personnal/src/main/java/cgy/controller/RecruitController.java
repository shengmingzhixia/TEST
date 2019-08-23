package cgy.controller;

import cgy.model.Page;
import cgy.model.Recruit;
import cgy.service.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class RecruitController {
    @Resource
    private RecruitService recruitService;

    @RequestMapping("getRecruits")
    public String getRecruits(HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Page<Recruit> recruitPage = recruitService.getRecruitByPage(pageNo, 1);
        request.setAttribute("recruitPage", recruitPage);
        return "../index";
    }
}
