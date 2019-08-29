package cgy.dao;

import cgy.model.Training;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface TrainingDao {
    List<Training> getTrainsByPage(Integer first, Integer end);

    boolean updateState(Training training);

    boolean delete(@Param(value="t_id")Integer t_id);

    int getTotalRows();

    boolean addTrain(Training training);

    Date getEndTime(@Param(value="t_id")Integer t_id);

    Training getTrain(@Param(value="t_id")Integer t_id);
}
