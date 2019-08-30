package cgy.service;

import cgy.model.Reward;
import cgy.model.Salary;
import cgy.model.Trouble;

import java.util.Date;
import java.util.List;

public interface RewardService {
    List<Reward> getRewards(String name, Date date);

    boolean insert(Reward reward, Salary salary, Trouble trouble);
}
