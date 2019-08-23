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
}
