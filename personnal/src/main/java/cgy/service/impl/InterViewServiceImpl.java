package cgy.service.impl;

import cgy.dao.CvDao;
import cgy.dao.InterViewDao;
import cgy.dao.RecruitDao;
import cgy.model.*;
import cgy.service.InterViewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("interViewService")
public class InterViewServiceImpl implements InterViewService {
    @Resource
    private InterViewDao interViewDao;
    @Resource
    private CvDao cvDao;
    @Resource
    private RecruitDao recruitDao;

    @Override
    public boolean insertInterView(InterView interView) {
        if (interView == null) return false;
        return interViewDao.insertInterView(interView);
    }

    @Override
    public Page<InterView2> getInterViewByPage(int pageNo) {
        Page page = new Page<>();
        int totalRows = interViewDao.getTotalRows();
        List<InterView> interViews = interViewDao.getInterViewByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize());
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        List<InterView2> interView2s = new ArrayList<>();
        for (InterView interView : interViews) {
            Cv cv = cvDao.getCv(interView.getIn_cv_id());
            Recruit recruit = recruitDao.getRecruit(interView.getIn_rct_id());
            InterView2 interView2 = new InterView2(interView, cv.getCv_name(), recruit.getRct_title());
            interView2s.add(interView2);
        }
        page.setList(interView2s);
        return page;
    }

    @Override
    public List<InterView2> getInterViews(int c_id) {
        List<Cv> cvs = cvDao.getCvs(c_id);
        List<InterView2> list = new ArrayList<>();
        for (Cv cv : cvs) {
            InterView interView = interViewDao.getInterViews(cv.getCv_id());
            Recruit recruit = recruitDao.getRecruit(interView.getIn_rct_id());
            InterView2 interView2 = new InterView2(interView, cv.getCv_name(), recruit.getRct_title());
            list.add(interView2);
        }
        return list;
    }

    @Override
    public boolean updateInterView(InterView interView) {
        if (interView == null) return false;
        return interViewDao.updateInterView(interView);
    }

    @Override
    public List<InterView2> getInterView(int rct_id) {
        List<InterView> interViews = interViewDao.getInterView(rct_id);
        List<InterView2> interView2s = new ArrayList<>();
        for (InterView interView : interViews) {
            Cv cv = cvDao.getCv(interView.getIn_cv_id());
            Recruit recruit = recruitDao.getRecruit(rct_id);
            InterView2 interView2 = new InterView2(interView, cv.getCv_name(), recruit.getRct_title());
            interView2s.add(interView2);
        }

        return interView2s;
    }
}
