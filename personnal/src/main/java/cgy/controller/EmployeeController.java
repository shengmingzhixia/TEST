package cgy.controller;

import cgy.model.*;
import cgy.service.*;
import cgy.service.impl.InterViewServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class EmployeeController {
    @Resource
    private EmployeeService employeeService;
    @Resource
    private PositionService positionService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    CvService cvService;
    @Resource
    RecruitService recruitService;
    @Resource
    private InterViewService interViewService;

    @RequestMapping("getEmployees")
    public String getEmployees(Employee employee, HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Page<Employee> employeePage = employeeService.getEmployeeByPage(pageNo, employee.getE_pos_id());
        Position position = positionService.getPosition(employee.getE_pos_id());
        request.setAttribute("pos_name", position.getPos_name());
        request.setAttribute("e_pos_id", employee.getE_pos_id());
        request.setAttribute("employeePage", employeePage);
        return "admin/employee/employeelist";
    }

    //查看员工的具体信息
    @RequestMapping("getEmployee")
    public String getEmployee(Employee employee, HttpServletRequest request) {
        Employee employee1 = employeeService.getEmployee(employee);
        request.setAttribute("employee1", employee1);
        Position position = positionService.getPosition(employee1.getE_pos_id());
        request.setAttribute("posName", position.getPos_name());
        Department department = departmentService.getDepartment(position.getPos_dep_id());
        request.setAttribute("depName", department.getDep_name());
        return "admin/employee/employeedetail";
    }

    //游客确定入职后，添加该员工的账号信息
    @RequestMapping("addnewemployee")
    public String addnewemployee(InterView interView, Cv cv, HttpServletRequest request) {
        Cv cv1 = cvService.getCv(cv.getCv_id());
        Employee employee = new Employee();
        Customer customer = (Customer) request.getSession().getAttribute("cust");
        employee.setE_account(customer.getC_account());
        employee.setE_password(customer.getC_pass());
        employee.setE_type(1);
        employee.setE_name(cv1.getCv_name());
        employee.setE_gender(cv1.getCv_gender());
        employee.setE_address(cv1.getCv_address());
        employee.setE_phone(cv1.getCv_phone());
        employee.setE_enroll_date(new Date());
        employee.setE_state(1);
        employee.setE_salary(cv1.getCv_salary());
        Recruit recruit = recruitService.getRecruit(interView.getIn_rct_id());
        employee.setE_pos_id(recruit.getRct_pos_id());
        interView.setIn_is_accept(5);//已经结束
        interViewService.updateInterView(interView);
        boolean insert = employeeService.insertEmployee(employee);
        request.setAttribute("insert", insert);
        return "../head";
    }

    //管理员管理员工
    @RequestMapping("toEmployeeManage")
    public String toEmployeeManage(HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Page<Employee> employeePage = employeeService.getEmployeeByPage2(pageNo);
        request.setAttribute("employeePage", employeePage);
        return "admin/employee/employeelist2";
    }

    //更新员工的部分信息
    @RequestMapping("updateEmployee")
    public String updateEmployee(Employee employee, HttpServletRequest request) {
        boolean updateEmployee = employeeService.updateEmployee(employee);
        request.setAttribute("updateEmployee",updateEmployee);
        return "forward:getEmployee";
    }

    //通过姓名查看员工的具体信息
    @RequestMapping("getEmployeeByName")
    public String getEmployeeByName(Employee employee, HttpServletRequest request) {
        System.out.println(employee);
        Employee employee1 = employeeService.getEmployee(employee);
        System.out.println(employee1);
        request.setAttribute("employee1", employee1);
        Position position = positionService.getPosition(employee1.getE_pos_id());
        request.setAttribute("posName", position.getPos_name());
        Department department = departmentService.getDepartment(position.getPos_dep_id());
        request.setAttribute("depName", department.getDep_name());
        return "admin/employee/employeedetail";
    }
}
