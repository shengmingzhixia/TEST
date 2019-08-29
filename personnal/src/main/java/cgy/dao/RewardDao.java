package cgy.dao;

import cgy.model.Reward;

import java.util.List;

public interface RewardDao {
    //添加一条奖惩记录
    boolean insertReward(Reward reward);

    //结算工资使用 查看奖惩记录 找出所有 然后业务层判断时间
    //判断MM等于现在时间的月份的
    //查询奖惩也使用了该方法
    List<Reward> getRewards(Reward reward);
}
