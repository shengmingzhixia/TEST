package cgy.controller;

import cgy.model.Employee;
import cgy.model.Page;
import cgy.model.Training;
import cgy.service.TrainingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class TrainingController {
    @Resource
    private TrainingService trainingService;

    //分页查询到所有的培训记录
    @RequestMapping("totrain")
    public String totrain(HttpServletRequest request) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        Page<Training> trainingPage = trainingService.getTrainsByPage(pageNo);
        request.setAttribute("trainingPage", trainingPage);
        return "admin/training/traininglist";
    }

    //添加一条培训记录
    @RequestMapping("addtrain")
    public String addtrain(Training training, HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        String s_date = request.getParameter("t_start_time");
        String e_date = request.getParameter("t_end_time");
        String replace1 = s_date.replace("T", " ");
        String replace2 = e_date.replace("T", " ");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date1 = null;
        Date date2 = null;
        try {
            date1 = sdf.parse(replace1 + ":00");
            date2 = sdf.parse(replace2 + ":00");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        training.setT_start_time(date1);
        training.setT_end_time(date2);
        training.setT_is_publish(0);
        boolean addTrain = trainingService.addTrain(training);
        request.setAttribute("addTrain", addTrain);
        return "forward:totrain";
    }

    //更新培训的状态（发布或下架）
    @RequestMapping("updatetrain")
    public String updatetrain(Training training, HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        boolean updateState = trainingService.updateState(training);
        request.setAttribute("updateState", updateState);
        return "forward:totrain";
    }

    //删除一条培训记录
    @RequestMapping("deletetrain")
    public String deletetrain(Training training, HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        boolean deletetrain = trainingService.delete(training.getT_id());
        request.setAttribute("deletetrain", deletetrain);
        return "forward:totrain";
    }

    //获得培训记录
    @RequestMapping("gertOwnerTrain")
    public String gertOwnerTrain(HttpServletRequest request) {
        Employee employee = (Employee) request.getSession().getAttribute("employeeNow");
        if (employee == null){
            request.setAttribute("message","请先登录");
            return "../index";
        }
        List<Training> trains = trainingService.getEmployeeTrain(employee.getE_id());
        request.setAttribute("trains", trains);
        return "employee/traininglist";
    }
}
