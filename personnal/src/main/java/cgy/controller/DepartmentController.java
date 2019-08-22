package cgy.controller;

import cgy.model.Department;
import cgy.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;

    @RequestMapping("insertDepart")  //管理员添加部门信息
    public String insertDepart(Department department, HttpServletRequest request) {
        boolean insertDepart = departmentService.insertDepart(department);
        request.setAttribute("insertDepart", insertDepart);
        return "admin/index";
    }
}
