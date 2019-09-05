package cgy.controller;

import cgy.model.*;
import cgy.service.PositionService;
import cgy.service.RecruitService;
import cgy.utils.CheckType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
public class RecruitController {
    @Resource
    private RecruitService recruitService;
    @Resource
    private PositionService positionService;

    //获得所有的招聘信息
    @RequestMapping("getRecruits")
    public String getRecruits(HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        if (request.getSession().getAttribute("employeeNow") != null) {
            Page<Recruit> recruitPage = recruitService.getRecruitByPage2(pageNo);
            request.setAttribute("recruitPage", recruitPage);
            return "admin/recruit/recruitlist";
        }
        Page<Recruit> recruitPage = recruitService.getRecruitByPage(pageNo, 1);
        request.setAttribute("recruitPage", recruitPage);
        return "jsp/index";
    }
    //添加一条草稿
    @RequestMapping("addRecruit")
    public String addRecruit(Recruit recruit, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        recruit.setRct_e_id(employee.getE_id());
        if ("null".equals(recruit.getRct_title())){
            request.setAttribute("insertRct",false);
        }else {
            Position position = positionService.getPositionByName(recruit.getRct_title());
            recruit.setRct_pos_id(position.getPos_id());
            recruit.setRct_is_draft(1); //是草稿
            recruit.setRct_is_publish(0); //未发布
            boolean insertRct = recruitService.insertRecruit(recruit);
            request.setAttribute("insertRct",insertRct);
        }
        return "admin/recruit/recruitlist";
    }

    //删除一条草稿
    @RequestMapping("deleteRct")
    public String deleteRct(Recruit recruit, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        boolean deleteRct = recruitService.deleteRecruit(recruit.getRct_id());
        request.setAttribute("deleteRct",deleteRct);
        return "admin/recruit/recruitlist";
    }

    //更新一条草稿的状态
    @RequestMapping("updateRct")
    public String updateRct(Recruit recruit, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        recruit.setRct_publish_time(new Date());
        boolean updateRct = recruitService.updateRecruit(recruit);
        request.setAttribute("updateRct",updateRct);
        if (updateRct == true){
            if (recruit.getRct_is_draft() == 0)
                request.setAttribute("mark", "上架成功");
            else
                request.setAttribute("mark", "下架成功");
        }

        return "admin/recruit/recruitlist";
    }

    //修改一条草稿
    @RequestMapping("updateRct2")
    public String updateRct2(Recruit recruit, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        boolean updateRct2 = recruitService.updateRecruit(recruit);
        request.setAttribute("updateRct",updateRct2);
        request.setAttribute("mark","");
        return "admin/recruit/recruitlist";
    }
}
