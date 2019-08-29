package cgy.controller;

import cgy.model.Attendence;
import cgy.model.Employee;
import cgy.service.AttendenceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class AttendenceController {
    @Resource
    private AttendenceService attendenceService;

    @RequestMapping("shangban")
    public String shangban(HttpServletRequest request){
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        Attendence attendence = new Attendence();
        attendence.setAtd_e_id(employee.getE_id());
        attendence.setAtd_start_time(new Date());
        boolean insert = attendenceService.insert(attendence);
        request.setAttribute("insert",insert);
        return "employee/index";
    }

    @RequestMapping("xiaban")
    public String xiaban(HttpServletRequest request){
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        Attendence attendence = new Attendence();
        attendence.setAtd_e_id(employee.getE_id());
        boolean update = attendenceService.update(attendence);
        request.setAttribute("update",update);
        return "employee/index";
    }
}
