package cgy.controller;

import cgy.model.Employee;
import cgy.model.Page;
import cgy.model.Salary;
import cgy.model.Salary2;
import cgy.service.SalaryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

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

    @RequestMapping("getSalary")
    public String getSalary(HttpServletRequest request){
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        Salary salary = salaryService.getSalary(employee.getE_id());
        request.setAttribute("salary", salary);
        return "employee/salaryLook";
    }

    @RequestMapping("getSalaryOwnerAll")
    public String getSalaryOwnerAll(HttpServletRequest request){
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        List<Salary> salarys = salaryService.getSalarys(employee.getE_id());
        request.setAttribute("salarys", salarys);
        return "employee/salarylist";
    }

    @RequestMapping("updateSalary")
    public String updateSalary(Salary salary,String reason,HttpServletRequest request){
        boolean updatesalary = salaryService.update(salary,reason);
        request.setAttribute("updatesalary", updatesalary);
        return "employee/index";
    }
}
