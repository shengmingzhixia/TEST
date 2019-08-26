package cgy.service.impl;

import cgy.dao.RecruitDao;
import cgy.model.Page;
import cgy.model.Recruit;
import cgy.service.RecruitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("recruitService")
public class RecruitServiceImpl implements RecruitService {
    @Resource
    private RecruitDao recruitDao;

    @Override
    public Page<Recruit> getRecruitByPage(int pageNo,int isPublish) {
        Page page = new Page<>();
        int totalRows = recruitDao.getTotalRows();
        List<Recruit> recruits = recruitDao.getRecruitByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize(),isPublish);
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(recruits);
        return page;
    }

    @Override
    public List<Recruit> getRecruits(Integer e_id) {
        return recruitDao.getRecruitById(e_id);
    }

    @Override
    public Recruit getRecruit(Integer in_rct_id) {
        return recruitDao.getRecruit(in_rct_id);
    }

    @Override
    public boolean insertRecruit(Recruit recruit) {
        if (recruit == null) return false;
        return recruitDao.insert(recruit);
    }

    @Override
    public Page<Recruit> getRecruitByPage2(int pageNo) {
        Page page = new Page<>();
        int totalRows = recruitDao.getTotalRows();
        List<Recruit> recruits = recruitDao.getRecruitByPage2((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize());
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(recruits);
        return page;
    }

    @Override
    public boolean deleteRecruit(int rct_id) {
        return recruitDao.delete(rct_id);
    }

    @Override
    public boolean updateRecruit(Recruit recruit) {
        if (recruit == null) return false;
        return recruitDao.update(recruit);
    }
}
