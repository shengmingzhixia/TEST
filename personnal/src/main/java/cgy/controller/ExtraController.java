package cgy.controller;

import cgy.model.Employee;
import cgy.model.Extra;
import cgy.model.Reward;
import cgy.service.EmployeeService;
import cgy.service.ExtraService;
import cgy.utils.CheckType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class ExtraController {
    @Resource
    private ExtraService extraService;
    @Resource
    private EmployeeService employeeService;

    //添加一条加班申请
    @RequestMapping("addExtra")
    public String addExtra(Extra extra, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        String start__date = request.getParameter("start_date");
        String end__date = request.getParameter("end_date");
        String replace1 = start__date.replace("T", " ");
        String replace2 = end__date.replace("T", " ");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date dateStart = null;
        Date dateEnd = null;
        try {
            dateStart = sdf.parse(replace1 + ":00");
            dateEnd = sdf.parse(replace2 + ":00");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        extra.setEx_e_id(employee.getE_id());
        extra.setEx_e_state(1);
        extra.setEx_start_date(dateStart);
        extra.setEx_end_date(dateEnd);
        boolean insertExtra = extraService.insert(extra);
        request.setAttribute("insertExtra", insertExtra);
        return "employee/index";
    }

    @RequestMapping("extralook")
    public String extralook(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        List<Extra> list = extraService.getList();
        List<Extra> extraList = new ArrayList<>();
        for (Extra extra : list) {
            if (extra.getEx_e_id() == employee.getE_id()) {
                extraList.add(extra);
            }
        }
        request.setAttribute("extraList", extraList);
        List<Employee> employeeList = employeeService.getEmployeeAll();
        request.setAttribute("employeeList", employeeList);
        return "employee/extralist";
    }

    @RequestMapping("extralookAll")
    public String extralookAll(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        List<Extra> list = extraService.getList();
        request.setAttribute("extraList", list);
        List<Employee> employeeList = employeeService.getEmployeeAll();
        request.setAttribute("employeeList", employeeList);
        return "employee/extralist";
    }

    @RequestMapping("updateExtra")
    public String updateExtra(Extra extra, Reward reward, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        extra.setEx_e_state(0);
        reward.setR_date(new Date());
        boolean updateExtra = extraService.update(extra, reward);
        request.setAttribute("updateExtra", updateExtra);
        return "employee/extralist";
    }

    @RequestMapping("defExtra")
    public String defExtra(Extra extra, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        boolean defExtra = extraService.update(extra, null);
        request.setAttribute("defExtra", defExtra);
        return "employee/extralist";
    }
}
