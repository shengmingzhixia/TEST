package cgy.controller;

import cgy.model.Department;
import cgy.model.Page;
import cgy.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;

    //管理员添加部门信息
    @RequestMapping("insertDepart")
    public String insertDepart(Department department, HttpServletRequest request) {
        System.out.println(department.getDep_name());
        boolean insertDepart = departmentService.insertDepart(department);
        //给出是否添加成功的判别信息
        request.setAttribute("insertDepart", insertDepart);
        return "forward:getDepart";
    }

    //查看部门信息
    @RequestMapping("getDepart")
    public String getDepart(HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Page<Department> departmentPage = departmentService.getDepByPage(pageNo);
        request.setAttribute("departmentPage", departmentPage);
        return "admin/departmentlist";
    }
}
