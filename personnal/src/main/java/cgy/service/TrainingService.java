package cgy.service;

import cgy.model.Page;
import cgy.model.Training;

import java.util.List;

public interface TrainingService {
    Page<Training> getTrainsByPage(Integer pageNo);

    boolean updateState(Training training);

    boolean delete(Integer t_id);

    boolean addTrain(Training training);
}
