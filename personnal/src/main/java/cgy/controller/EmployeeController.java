package cgy.controller;

import cgy.model.Department;
import cgy.model.Employee;
import cgy.model.Page;
import cgy.model.Position;
import cgy.service.DepartmentService;
import cgy.service.EmployeeService;
import cgy.service.PositionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class EmployeeController {
    @Resource
    private EmployeeService employeeService;
    @Resource
    private PositionService positionService;
    @Resource
    private DepartmentService departmentService;

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
        request.setAttribute("e_pos_id", employee.getE_pos_id());
        request.setAttribute("employeePage", employeePage);
        return "admin/employee/employeelist";
    }

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
}
