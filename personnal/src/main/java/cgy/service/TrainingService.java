package cgy.service;

import cgy.model.Page;
import cgy.model.Training;

import java.util.List;

public interface TrainingService {
    Page<Training> getTrainsByPage(Integer pageNo);

    boolean updateState(Training training);

    boolean delete(Integer t_id);

    boolean addTrain(Training training);

    //获得某个员工的全部训练记录
    List<Training> getEmployeeTrain(Integer e_id);
}
