package cgy.controller;

import cgy.model.Department;
import cgy.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;

    //管理员添加部门信息
    @RequestMapping("insertDepart")
    public String insertDepart(Department department, HttpServletRequest request) {
        boolean insertDepart = departmentService.insertDepart(department);
        //给出是否添加成功的判别信息
        request.setAttribute("insertDepart", insertDepart);
        return "admin/index";
    }

    //查看部门信息
    @RequestMapping("getDepart")
    public String getDepart(HttpServletRequest request) {
        return "admin/index";
    }
}
