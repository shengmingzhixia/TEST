package cgy.controller;

import cgy.model.*;
import cgy.service.*;
import cgy.service.impl.InterViewServiceImpl;
import cgy.utils.CheckType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

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
    @Resource
    private TrainingEmployeeService trainingEmployeeService;

    @Resource
    private LiZhiService liZhiService;

    @RequestMapping("getEmployees")
    public String getEmployees(Employee employee, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
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
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        Employee employee1 = employeeService.getEmployee(employee);
        request.setAttribute("employee1", employee1);
        Position position = positionService.getPosition(employee1.getE_pos_id());
        request.setAttribute("posName", position.getPos_name());
        Department department = departmentService.getDepartment(position.getPos_dep_id());
        request.setAttribute("department", department);
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
        employee.setE_state(2); //试用期一个月
        employee.setE_salary(cv1.getCv_salary());
        Recruit recruit = recruitService.getRecruit(interView.getIn_rct_id());
        employee.setE_pos_id(recruit.getRct_pos_id());
        interView.setIn_is_accept(5);//已经结束
        interViewService.updateInterView(interView);
        boolean insert = employeeService.insertEmployee(employee);
        request.setAttribute("insertNewEmployee", insert);
        return "../index";
    }

    //管理员管理员工
    @RequestMapping("toEmployeeManage")
    public String toEmployeeManage(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
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
    public String updateEmployee(Employee employee, Integer method, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        System.out.println(employee);
        boolean updateEmployee = employeeService.updateEmployee(employee);
        request.setAttribute("updateEmployee", updateEmployee);
        if (method != null && method == 1) {
            Employee employee1 = (Employee) request.getSession().getAttribute("employeeNow");
            employee1.setE_debit(employee.getE_debit());
            employee1.setE_password(employee.getE_password());
            employee1.setE_phone(employee.getE_phone());
            employee1.setE_address(employee.getE_address());
            request.getSession().setAttribute("employeeNow", employee1);
            return "forward:toinformation";
        }
        return "forward:getEmployee";
    }

    //通过姓名查看员工的具体信息
    @RequestMapping("getEmployeeByName")
    public String getEmployeeByName(Employee employee, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
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

    //换岗操作
    @RequestMapping("toChangePosition")
    public String toChangePosition(int e_id, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        List<Department> departs = departmentService.getDeparts();
        request.setAttribute("departs", departs);
        List<Position> positions = positionService.getPositionByDep_id(null);
        request.setAttribute("positions", positions);
        Employee employee = new Employee();
        employee.setE_id(e_id);
        employeeService.getEmployee(employee);
        request.setAttribute("employee", employee);
        return "admin/employee/changepos";
    }

    //换岗操作
    @RequestMapping("updatePos")
    public String updatePos(int e_id, String pos_name, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        Employee employee = new Employee();
        employee.setE_id(e_id);
        if (pos_name == null || "".equals(pos_name) || "null".equals(pos_name)) {
            request.setAttribute("updateEmployee", false);
            return "main/main";
        }
        Position positionByName = positionService.getPositionByName(pos_name);
        employee.setE_pos_id(positionByName.getPos_id());
        boolean updateEmployee = employeeService.updateEmployee(employee);
        request.setAttribute("updateEmployee", updateEmployee);
        return "main/main";
    }

    //培训
    @RequestMapping("addtrainandemployee")
    public String addtrainandemployee(int t_id, String pos_name, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        boolean insertTrainEmployee = trainingEmployeeService.insert(t_id, pos_name);
        request.setAttribute("insertTrainEmployee", insertTrainEmployee);
        return "forward:totrain";
    }

    @RequestMapping("tofindothers")
    public String tofindothers(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        List<Department> departs = departmentService.getDeparts();
        List<Position> positions = positionService.getPositionByDep_id(null);
        request.setAttribute("departs", departs);
        request.setAttribute("positions", positions);
        return "employee/findothers";
    }

    @RequestMapping("findothers")
    public String findothers(Employee employee, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        String pos_name = request.getParameter("pos_name");
        if (pos_name == null || "".equals(pos_name) || "null".equals(pos_name)) {
            request.setAttribute("employeePage", null);
            List<Department> departs = departmentService.getDeparts();
            List<Position> positions = positionService.getPositionByDep_id(null);
            request.setAttribute("departs", departs);
            request.setAttribute("positions", positions);
            return "employee/findothers";
        }
        Position position = positionService.getPositionByName(request.getParameter("pos_name"));
        Page<Employee> employeePage = employeeService.getEmployeeByPage(pageNo, position.getPos_id());
        request.setAttribute("pos_name", position.getPos_name());
        request.setAttribute("e_pos_id", position.getPos_id());
        request.setAttribute("employeePage", employeePage);
        List<Department> departs = departmentService.getDeparts();
        List<Position> positions = positionService.getPositionByDep_id(null);
        request.setAttribute("departs", departs);
        request.setAttribute("positions", positions);
        return "employee/findothers";
    }

    //查看员工的具体信息
    @RequestMapping("toinformation")
    public String toinformation(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        Employee employee1 = (Employee) request.getSession().getAttribute("employeeNow");
        request.setAttribute("employee1", employee1);
        Position position = positionService.getPosition(employee1.getE_pos_id());
        request.setAttribute("posName", position.getPos_name());
        Department department = departmentService.getDepartment(position.getPos_dep_id());
        request.setAttribute("department", department);
        return "employee/employeedetail";
    }

    //转正
    @RequestMapping("changestate")
    public String changestate(Employee employee, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        boolean changeSuccess = employeeService.changeEState(employee);
        request.setAttribute("changeSuccess", changeSuccess);
        return "forward:toEmployeeManage";
    }

    //离职
    @RequestMapping("goAnywhere")
    public String goAnywhere(LiZhi liZhi, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        System.out.println(liZhi);
        boolean goAnywhere = liZhiService.liZhi(liZhi);
        request.setAttribute("goAnywhere", goAnywhere);
        return "forward:toEmployeeManage";
    }
}
