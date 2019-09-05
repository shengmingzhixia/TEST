package cgy.controller;

import cgy.model.Attendence;
import cgy.model.Employee;
import cgy.service.AttendenceService;
import cgy.service.EmployeeService;
import cgy.utils.CheckType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AttendenceController {
    @Resource
    private AttendenceService attendenceService;
    @Resource
    private EmployeeService employeeService;

    @RequestMapping("shangban")
    public String shangban(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee.getE_id() == null) return "jsp/login";
        Attendence attendence = new Attendence();
        attendence.setAtd_e_id(employee.getE_id());
        attendence.setAtd_start_time(new Date());
        int insert = attendenceService.insert(attendence);
        request.setAttribute("insert", insert);
        return "employee/index";
    }

    @RequestMapping("xiaban")
    public String xiaban(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee.getE_id() == null) return "jsp/login";
        Attendence attendence = new Attendence();
        attendence.setAtd_e_id(employee.getE_id());
        boolean update = attendenceService.update(attendence);
        request.setAttribute("update", update);
        return "employee/index";
    }

    @RequestMapping("getAttends")
    public String getAttends(Employee employee, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        String date = request.getParameter("date");
        List<Employee> employees = employeeService.getEmployees(employee);
        request.setAttribute("employees", employees);
        if (date == null || "".equals(date)) {
            System.out.println("日期为空");
            List<Attendence> list = attendenceService.getList(employee);
            request.setAttribute("list", list);
        } else {
            List<Attendence> attendenceList = new ArrayList<>();
            List<Attendence> list = attendenceService.getList(employee);
            System.out.println(employee);
            System.out.println(list);
            for (Attendence attendence : list) {
                System.out.println(date+"前面传来的时间");
                Date date1 = attendence.getAtd_start_time();
                System.out.println(date1+"后面获取的时间");
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String dateString1 = formatter.format(date1);
                DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
                Date date2 = null;
                try {
                    date2 = format1.parse(date);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String dateString2 = formatter.format(date2);
                System.out.println(dateString1+"==="+dateString2);
                if (dateString1.equals(dateString2)) {
                    attendenceList.add(attendence);
                }
            }
            request.setAttribute("list", attendenceList);
        }
        return "admin/employee/attendencelist";
    }

    @RequestMapping("getAttends2")
    public String getAttends2(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        String date = request.getParameter("date");
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (date == null || "".equals(date)) {
            System.out.println("日期为空");
            List<Attendence> list = attendenceService.getList(employee);
            request.setAttribute("list", list);
        } else {
            List<Attendence> attendenceList = new ArrayList<>();
            List<Attendence> list = attendenceService.getList(employee);
            for (Attendence attendence : list) {
                System.out.println(date+"前面传来的时间");
                Date date1 = attendence.getAtd_start_time();
                System.out.println(date1+"后面获取的时间");
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                String dateString1 = formatter.format(date1);
                DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
                Date date2 = null;
                try {
                    date2 = format1.parse(date);
                } catch (ParseException e) {
                    e.printStackTrace();
                }
                String dateString2 = formatter.format(date2);
                if (dateString1.equals(dateString2)) {
                    attendenceList.add(attendence);
                }
            }
            request.setAttribute("list", attendenceList);
        }
        return "employee/attendencelist";
    }
}
