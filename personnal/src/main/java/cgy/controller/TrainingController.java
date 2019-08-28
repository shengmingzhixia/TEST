package cgy.controller;

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

@Controller
public class TrainingController {
    @Resource
    private TrainingService trainingService;

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
        Page<Training> trainingPage = trainingService.getTrainsByPage(pageNo);
        System.out.println(trainingPage.getList());
        request.setAttribute("trainingPage", trainingPage);
        return "admin/training/traininglist";
    }

    @RequestMapping("addtrain")
    public String addtrain(Training training, HttpServletRequest request) {
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
        request.setAttribute("addTrain",addTrain);
        return "forward:totrain";
    }

    @RequestMapping("updatetrain")
    public String updatetrain(Training training, HttpServletRequest request) {
        boolean updateState = trainingService.updateState(training);
        request.setAttribute("updateState", updateState);
        return "forward:totrain";
    }

    @RequestMapping("deletetrain")
    public String deletetrain(Training training, HttpServletRequest request) {
        boolean deletetrain = trainingService.delete(training.getT_id());
        request.setAttribute("deletetrain", deletetrain);
        return "forward:totrain";
    }
}
