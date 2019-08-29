package cgy.dao;

import cgy.model.TrainingEmployee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TrainingEmployeeDao {
    boolean insert(TrainingEmployee trainingEmployee);

    //查看培训信息
    List<TrainingEmployee> getTID(@Param(value = "e_id") Integer e_id);
}
