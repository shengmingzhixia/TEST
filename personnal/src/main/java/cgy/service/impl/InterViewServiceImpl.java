package cgy.service.impl;

import cgy.dao.InterViewDao;
import cgy.model.InterView;
import cgy.service.InterViewService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("interViewService")
public class InterViewServiceImpl implements InterViewService {
    @Resource
    private InterViewDao interViewDao;

    @Override
    public boolean insertInterView(InterView interView) {
        if (interView == null) return false;
        return interViewDao.insertInterView(interView);
    }
}
