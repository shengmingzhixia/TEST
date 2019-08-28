package cgy.controller;

import cgy.model.Page;
import cgy.model.Salary2;
import cgy.service.SalaryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class SalaryController {
    @Resource
    private SalaryService salaryService;

    @RequestMapping("getSalarys")
    public String getSalarys(HttpServletRequest request){
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Page<Salary2> salaryPage = salaryService.getSalaryByPage(pageNo);
        request.setAttribute("salaryPage", salaryPage);
        return "admin/salaryManage";
    }

    @RequestMapping("insertAllSalary")
    public String insertAllSalary(HttpServletRequest request){
        boolean insertSalarys = salaryService.insertSalarys();
        request.setAttribute("insertSalarys", insertSalarys);
        return "admin/salaryManage";
    }
}
