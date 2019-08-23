package cgy.service.impl;

import cgy.dao.CvDao;
import cgy.model.Cv;
import cgy.model.Page;
import cgy.service.CvService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("cvService")
public class CvServiceImpl implements CvService {
    @Resource
    private CvDao cvDao;

    @Override
    public boolean insertCv(Cv cv) {
        if (cv == null) return false;
        return cvDao.insertCv(cv);
    }

    @Override
    public Page<Cv> getCvByPage(int pageNo, int c_id) {
        Page page = new Page<>();
        int totalRows = cvDao.getTotalRows();
        List<Cv> cvList = cvDao.getCvByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize(), c_id);
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(cvList);
        return page;
    }

    @Override
    public Cv getCv(int cv_id) {
        return cvDao.getCv(cv_id);
    }

    @Override
    public boolean updateCv(Cv cv) {
        if (cv == null) return false;
        return cvDao.updateCv(cv);
    }

    @Override
    public boolean delete(int id1) {
        return cvDao.delete(id1);
    }
}
