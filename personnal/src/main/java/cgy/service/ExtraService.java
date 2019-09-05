package cgy.service;

import cgy.model.Extra;
import cgy.model.Reward;

import java.util.List;

public interface ExtraService {
    //插入一条申请加班记录  初始状态为1 有效
    boolean insert(Extra extra);

    //更新状态 即审批完成 不管通过不通过 都变为0

    boolean update(Extra extra, Reward reward);

    //查看全部的加班申请

    List<Extra> getList();
}
