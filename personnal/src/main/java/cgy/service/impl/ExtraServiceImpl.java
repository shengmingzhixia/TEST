package cgy.service.impl;

import cgy.dao.ExtraDao;
import cgy.dao.RewardDao;
import cgy.model.Extra;
import cgy.model.Reward;
import cgy.service.ExtraService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("extraService")
public class ExtraServiceImpl implements ExtraService {
    @Resource
    private ExtraDao extraDao;
    @Resource
    private RewardDao rewardDao;

    @Override
    public boolean insert(Extra extra) {
        return extraDao.insert(extra);
    }

    @Override
    public boolean update(Extra extra,Reward reward) {
        if (extra == null) return false;
        //更新加班表 使其失效 变为数字2：驳回  数字0：同意 并添加一条奖励记录
        if (extra.getEx_e_state() == 0) {
            rewardDao.insertReward(reward);
        }
        return extraDao.update(extra);
    }

    @Override
    public List<Extra> getList() {
        return extraDao.getList();
    }
}
