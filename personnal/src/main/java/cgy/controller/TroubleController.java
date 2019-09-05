package cgy.controller;

import cgy.model.Salary;
import cgy.model.Trouble;
import cgy.model.Trouble2;
import cgy.service.SalaryService;
import cgy.service.TroubleService;
import cgy.utils.CheckType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TroubleController {
    @Resource
    private TroubleService troubleService;
    @Resource
    private SalaryService salaryService;

    @RequestMapping("getTroubles")
    public String getTroubles(HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        List<Trouble2> troubles = troubleService.getTroubles();
        request.setAttribute("troubles", troubles);
        return "admin/reward/troublelist";
    }

    @RequestMapping("refuck")
    public String refuck(int s_id, HttpServletRequest request) {
        boolean type = CheckType.getType(request);
        if (type == false) return "jsp/login";
        Trouble trouble = new Trouble();
        trouble.setT_state(0);
        trouble.setS_id(s_id);
        troubleService.updateState(trouble);
        Salary salary = new Salary();
        salary.setS_is_trouble(2);
        salary.setS_id(s_id);
        boolean a = salaryService.update2(salary);
        request.setAttribute("update22",a);
        return "admin/reward/troublelist";
    }
}
