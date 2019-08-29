package cgy.controller;

import cgy.model.*;
import cgy.service.InterViewService;
import cgy.service.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class InterViewController {
    @Resource
    private InterViewService interViewService;
    @Resource
    private RecruitService recruitService;

    //游客投递简历
    @RequestMapping("insertInterView")
    public String insertInterView(InterView interView, HttpServletRequest request) {
        interView.setIn_is_read(0);//0代表未读
        interView.setIn_is_accept(0);//0代表管理员未接受该简历
        interView.setIn_is_agree(0);//0代表该游客尚未同意来面试
        interView.setIn_read_account(0);//代表尚未看过  所以阅读次数是0
        interView.setIn_date(new Date());
        boolean view = interViewService.insertInterView(interView);
        request.setAttribute("view", view);
        return "forward:getRecruits";
    }

    //获得所有的面试信息
    @RequestMapping("getInter")
    public String getInter(HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Page<InterView2> interViewPage = interViewService.getInterViewByPage(pageNo);
        request.setAttribute("interViewPage", interViewPage);
        return "admin/interview/interviewlist";
    }

    //游客查看自己的面试信息
    @RequestMapping("getInter2")
    public String getInter2(HttpServletRequest request) {
        Customer customer = (Customer) request.getSession().getAttribute("cust");
        List<InterView2> interViews = interViewService.getInterViews(customer.getC_id());
        request.setAttribute("interViews", interViews);
        return "jsp/interviewlist2";
    }


    //发送面试邀请
    @RequestMapping("sendInterView")
    public String sendInterView(InterView interView, HttpServletRequest request) {
        String f_date = request.getParameter( "in_date" );
        String replace = f_date.replace( "T", " " );
        SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date=null;
        try {
            date=sdf.parse( replace+":00" );
        } catch (ParseException e) {
            e.printStackTrace();
        }
        interView.setIn_date(date);
        interView.setIn_is_read(1);//0代表未读
        interView.setIn_is_accept(1);//0代表管理员未接受该简历
        interView.setIn_read_account(1);//代表尚未看过  所以阅读次数是0
        boolean view = interViewService.updateInterView(interView);
        request.setAttribute("view", view);
        return "forward:getInter";
    }

    //接受面试或拒绝
    @RequestMapping("sendInterView2")
    public String sendInterView2(InterView interView, HttpServletRequest request) {
        interView.setIn_is_agree(interView.getIn_is_agree());
        boolean view = interViewService.updateInterView(interView);
        if (interView.getIn_is_agree() == 0) view = false;
        request.setAttribute("view2", view);
        return "jsp/index";
    }

    //面试过程跳过
    @RequestMapping("sendInterView3")
    public String sendInterView3(InterView interView, HttpServletRequest request) {
        interView.setIn_is_accept(interView.getIn_is_accept());
        boolean view = interViewService.updateInterView(interView);
        request.setAttribute("view3", view);
        return "admin/head";
    }

    //录用
    @RequestMapping("sendInterView4")
    public String sendInterView4(InterView interView, HttpServletRequest request) {
        boolean view = interViewService.updateInterView(interView);
        if (interView.getIn_is_accept() == 4)
            view = false;
        request.setAttribute("view4", view);
        return "admin/head";
    }

    @RequestMapping("sendInterView5")
    public String sendInterView5(InterView interView, HttpServletRequest request) {
        boolean view = interViewService.updateInterView(interView);
        request.setAttribute("view5", view);
        return "../head";
    }

    //员工查看自己发布的招聘信息下所有的面试通知
    @RequestMapping("getMyInter")
    public String getMyInter(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        List<Recruit> recruits = recruitService.getRecruits(employee.getE_id());
        List<InterView2> list = new ArrayList<>();
        for (Recruit recruit : recruits) {
            List<InterView2> interView2s = interViewService.getInterView(recruit.getRct_id());
            for (InterView2 interView2 : interView2s) {
                if (interView2.getIn_is_agree() == 1 && interView2.getIn_is_accept() == 1)
                    list.add(interView2);
            }

        }
        request.setAttribute("list", list);
        return "admin/employee/interviewlist3";
    }
}
