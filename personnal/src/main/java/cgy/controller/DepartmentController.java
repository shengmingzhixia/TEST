package cgy.controller;

import cgy.model.Department;
import cgy.model.Page;
import cgy.model.Position;
import cgy.service.DepartmentService;
import cgy.service.PositionService;
import cgy.utils.CheckType;
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
import java.util.List;

@Controller
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;
    @Resource
    private PositionService positionService;

    //管理员添加部门信息
    @RequestMapping("insertDepart")
    public String insertDepart(Department department, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        department.setDep_date(new Date());
        boolean insertDepart = departmentService.insertDepart(department);
        //给出是否添加成功的判别信息
        request.setAttribute("insertDepart", insertDepart);
        return "forward:getDepart";
    }

    //查看部门信息
    @RequestMapping("getDepart")
    public String getDepart(HttpServletRequest request) {
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
        Page<Department> departmentPage = departmentService.getDepByPage(pageNo);
        request.setAttribute("departmentPage", departmentPage);
        return "admin/departmentlist";
    }

    //去更新界面
    @RequestMapping("toupdateDepart")
    public String toupdateDepart(Department department, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        //给出是否添加成功的判别信息
        request.setAttribute("department", department);
        return "admin/departmentupdate";
    }

    //管理员更新部门信息
    @RequestMapping("updateDepart")
    public String updateDepart(Department department, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        boolean updateDepart = departmentService.updateDepart(department);
        //给出是否添加成功的判别信息
        request.setAttribute("updateDepart", updateDepart);
        return "forward:getDepart";
    }

    //管理员删除部门信息
    @RequestMapping("deleteDepart")
    public String deleteDepart(int dep_id, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        boolean deleteDepart = departmentService.deleteDepart(dep_id);
        request.setAttribute("deleteDepart", deleteDepart);
        return "forward:getDepart";
    }

    @RequestMapping("checkDepName")
    @ResponseBody
    protected void checkDepName(String dep_name, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();

        boolean repetition = false;
        try {
            repetition = departmentService.repetition(dep_name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (repetition) {
            pw.write("部门名重复！");
        }
    }


    @RequestMapping("toaddrecruit")
    public String toaddrecruit(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        List<Department> departs = departmentService.getDeparts();
        request.setAttribute("departs", departs);
        List<Position> positions = positionService.getPositionByDep_id(null);
        request.setAttribute("positions",positions);
        return "admin/recruit/recruitadd";
    }
}
