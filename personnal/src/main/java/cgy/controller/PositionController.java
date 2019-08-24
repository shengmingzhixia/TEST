package cgy.controller;

import cgy.model.Page;
import cgy.model.Position;
import cgy.service.PositionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
public class PositionController {
    @Resource
    private PositionService positionService;

    @RequestMapping("getPositions")
    public String getPositions(Position position, HttpServletRequest request){
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = 1;
        if (pageNoStr != null && !"".equals(pageNoStr)) {
            pageNo = Integer.parseInt(pageNoStr);
            if (pageNo < 1) {
                pageNo = 1;
            }
        }
        Page<Position> positionByPage = positionService.getPositionByPage(pageNo, position.getPos_dep_id());
        request.setAttribute("pos_dep_id",position.getPos_dep_id());
        request.setAttribute("positionByPage",positionByPage);
        return "admin/positionlist";
    }

    @RequestMapping("checkPosName")
    @ResponseBody
    protected void checkPosName(String pos_name, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        boolean repetition = positionService.repetition(pos_name);
        if (repetition) {
            pw.write("职位名重复！");
        }
    }
}
