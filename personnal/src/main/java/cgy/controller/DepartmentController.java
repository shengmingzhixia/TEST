package cgy.controller;

import cgy.model.Department;
import cgy.model.Page;
import cgy.service.DepartmentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@Controller
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;

    //管理员添加部门信息
    @RequestMapping("insertDepart")
    public String insertDepart(Department department, HttpServletRequest request) {
        department.setDep_date(new Date());
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

    //去更新界面
    @RequestMapping("toupdateDepart")
    public String toupdateDepart(Department department, HttpServletRequest request) {
        //给出是否添加成功的判别信息
        request.setAttribute("department", department);
        return "admin/departmentupdate";
    }

    //管理员更新部门信息
    @RequestMapping("updateDepart")
    public String updateDepart(Department department, HttpServletRequest request) {
        boolean updateDepart = departmentService.updateDepart(department);
        //给出是否添加成功的判别信息
        request.setAttribute("updateDepart", updateDepart);
        return "forward:getDepart";
    }

    //管理员删除部门信息
    @RequestMapping("deleteDepart")
    public String deleteDepart(int dep_id, HttpServletRequest request) {
        boolean deleteDepart = departmentService.deleteDepart(dep_id);
        request.setAttribute("deleteDepart", deleteDepart);
        return "forward:getDepart";
    }

    @RequestMapping("checkDepName")
    @ResponseBody
    protected void checkDepName(String dep_name, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        boolean repetition = departmentService.repetition(dep_name);
        if (repetition) {
            pw.write("部门名重复！");
        }
    }
}
