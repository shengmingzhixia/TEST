package cgy.controller;

import cgy.model.Customer;
import cgy.model.Cv;
import cgy.model.Page;
import cgy.service.CvService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class CvController {
    @Resource
    private CvService cvService;

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
        Page<Cv> cvByPage = cvService.getCvByPage(pageNo, cust.getId());
        request.setAttribute("cvByPage", cvByPage);
        return "jsp/cv";
    }

    @RequestMapping("cvadd")
    public String cvadd(HttpServletRequest request) {
        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String birth = request.getParameter("birth");
        String enroll = request.getParameter("enroll");
        String graduation = request.getParameter("graduation");
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Date birth1 = null;
        Date enroll1 = null;
        Date graduation1 = null;
        try {
            birth1 = sd.parse(birth);
            enroll1 = sd.parse(enroll);
            graduation1 = sd.parse(graduation);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        String address = request.getParameter("address");
        String school = request.getParameter("school");
        String education = request.getParameter("education");
        String major = request.getParameter("major");
        String salary = request.getParameter("salary");
        double salary2 = Double.parseDouble(salary);
        String exprience = request.getParameter("exprience");
        String phone = request.getParameter("phone");
        long phone2 = Long.parseLong(phone);
        if (title == null || name == null || gender == null ||
                birth == null || address == null || school == null || education == null ||
                major == null || enroll == null || graduation == null || phone == null) {
            System.out.println("标题"+title+"名字"+name +"性别"+gender+"出生日期"+birth
            +"地址" + address+"学校" + school + "education" +education + "major" + major
            +"enroll" + enroll+"graduation" + graduation + "电话" + phone);
            request.setAttribute("addCv", false);
        } else {
            Cv cv = new Cv();
            Customer customer = (Customer) request.getSession().getAttribute("cust");
            cv.setCid(customer.getId());
            cv.setName(name);
            cv.setGender(gender);
            cv.setBirth(birth1);
            cv.setAddress(address);
            cv.setSchool(school);
            cv.setEducation(education);
            cv.setMajor(major);
            cv.setEnrollDate(enroll1);
            cv.setGraduationDate(graduation1);
            cv.setSalary(salary2);
            cv.setExprience(exprience);
            cv.setPhone(phone2);
            cv.setTitle(title);
            System.out.println(cv);
            boolean b = cvService.insertCv(cv);
            request.setAttribute("addCv", b);
        }
        return "forward:getCv";
    }

    @RequestMapping("cvdetail")
    public String cvDetail(int id,HttpServletRequest request){
        System.out.println("进来了");
        Cv cv = cvService.getCv(id);
        request.setAttribute("cv",cv);
        return "jsp/cvdetail";
    }
}
