package cgy.service;

import cgy.model.Reward;

import java.util.Date;
import java.util.List;

public interface RewardService {
    List<Reward> getRewards(String name, Date date);
}
