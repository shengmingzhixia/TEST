package cgy.controller;

import cgy.model.*;
import cgy.service.CvService;
import cgy.service.InterViewService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CvController {
    @Resource
    private CvService cvService;

    @Resource
    private InterViewService interViewService;

    //查看游客自己的简历
    @RequestMapping("getCv")
    public String getCv(HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Customer cust = (Customer) request.getSession().getAttribute("cust");
        if (cust == null) {
            request.setAttribute("message", "请先登录");
            return "../index";
        }
        Page<Cv> cvByPage = cvService.getCvByPage(pageNo, cust.getC_id());
        request.setAttribute("cvByPage", cvByPage);
        return "jsp/cv";
    }

    //添加一份简历
    @RequestMapping("cvadd")
    public String cvadd(Cv cv, HttpServletRequest request) {
        System.out.println(cv);
        if (cv == null || cv.getCv_title() == null || cv.getCv_name() == null || cv.getCv_gender() == null ||
                cv.getCv_birth() == null || cv.getCv_address() == null || cv.getCv_school() == null || cv.getCv_education() == null ||
                cv.getCv_major() == null || cv.getCv_enroll_date() == null || cv.getCv_graduation_date() == null || cv.getCv_phone() == 0) {
            request.setAttribute("addCv", false);
        } else {
            Customer customer = (Customer) request.getSession().getAttribute("cust");
            if (customer == null) {
                request.setAttribute("message", "请先登录");
                return "../index";
            }
            cv.setCv_c_id(customer.getC_id());
            System.out.println(cv);
            boolean b = cvService.insertCv(cv);
            request.setAttribute("addCv", b);
        }
        return "forward:getCv";
    }

    //查看简历细节
    @RequestMapping("cvdetail")
    public String cvDetail(int id, HttpServletRequest request) {
        Customer customer = (Customer) request.getSession().getAttribute("cust");
        if (customer == null) {
            request.setAttribute("message", "请先登录");
            return "../index";
        }
        Cv cv = cvService.getCv(id);
        request.setAttribute("cv", cv);
        return "jsp/cvdetail";
    }

    //管理员查看面试信息，查看游客的简历
    @RequestMapping("cvdetail2")
    public String cvDetail2(InterView2 interView2, HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        Cv cv = cvService.getCv(interView2.getIn_cv_id());
        InterView interView = new InterView();
        interView.setIn_is_read(1);
        interView.setIn_read_account(1);
        interView.setIn_id(interView2.getIn_id());
        interViewService.updateInterView(interView);
        request.setAttribute("cv", cv);
        request.setAttribute("interView2", interView2);
        return "admin/interview/interviewdetail";
    }

    @RequestMapping("toCvUpdate")
    public String toCvUpdate(int id, HttpServletRequest request) {
        Customer customer = (Customer) request.getSession().getAttribute("cust");
        if (customer == null) {
            request.setAttribute("message", "请先登录");
            return "../index";
        }
        Cv cv = cvService.getCv(id);
        request.setAttribute("cv", cv);
        return "jsp/cvupdate";
    }

    //更新简历
    @RequestMapping("cvUpdate")
    public String cvUpdate(Cv cv, HttpServletRequest request) {
        if (cv == null || cv.getCv_title() == null || cv.getCv_name() == null || cv.getCv_gender() == null ||
                cv.getCv_birth() == null || cv.getCv_address() == null || cv.getCv_school() == null || cv.getCv_education() == null ||
                cv.getCv_major() == null || cv.getCv_enroll_date() == null || cv.getCv_graduation_date() == null || cv.getCv_phone() == 0) {
            request.setAttribute("updateCv", false);
        } else {
            Customer customer = (Customer) request.getSession().getAttribute("cust");
            if (customer == null){
                request.setAttribute("message","请先登录");
                return "../index";
            }
            cv.setCv_c_id(customer.getC_id());
            System.out.println(cv);
            boolean b = cvService.updateCv(cv);
            request.setAttribute("updateCv", b);
        }
        return "forward:getCv";
    }

    //删除简历
    @RequestMapping("cvDelete")
    public String cvDelete(HttpServletRequest request) {
        Customer customer = (Customer) request.getSession().getAttribute("cust");
        if (customer == null) {
            request.setAttribute("message", "请先登录");
            return "../index";
        }
        String id = request.getParameter("id");
        int id1 = Integer.parseInt(id);
        boolean cvDelete = cvService.delete(id1);
        request.setAttribute("cvDelete", cvDelete);
        return "forward:getCv";
    }

    //选择简历_列出全部简历
    @RequestMapping("toChooseCv")
    public String toChooseCv(HttpServletRequest request) {
        String id = request.getParameter("rctId");
        int rct_id = Integer.parseInt(id);
        request.setAttribute("rct_id", rct_id);
        Customer customer = (Customer) request.getSession().getAttribute("cust");
        if (customer == null) return "jsp/touristlogin";
        List<Cv> cvList = cvService.getCvs(customer.getC_id());
        request.setAttribute("cvList", cvList);
        return "jsp/choosecv";
    }
}
