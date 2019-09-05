package cgy.service.impl;

import cgy.dao.TrainingDao;
import cgy.dao.TrainingEmployeeDao;
import cgy.model.Page;
import cgy.model.Training;
import cgy.model.TrainingEmployee;
import cgy.service.TrainingService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service("trainingService")
public class TrainingServiceImpl implements TrainingService {
    @Resource
    private TrainingDao trainingDao;
    @Resource
    private TrainingEmployeeDao trainingEmployeeDao;

    @Override
    public Page<Training> getTrainsByPage(Integer pageNo) {
        Page page = new Page<>();
        int totalRows = trainingDao.getTotalRows();
        List<Training> recruits = trainingDao.getTrainsByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize());
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(recruits);
        return page;
    }

    @Override
    public boolean updateState(Training training) {
        if (training.getT_id() == null) return false;
        return trainingDao.updateState(training);
    }

    @Override
    public boolean delete(Integer t_id) {
        Date date = trainingDao.getEndTime(t_id);
        Date dateNow = new Date();
        long a = dateNow.getTime() - date.getTime();
        if (a >= 0) {
            return trainingDao.delete(t_id);
        }
        return false;
    }

    @Override
    public boolean addTrain(Training training) {
        if (training == null || training.getT_is_publish() == null) return false;
        return trainingDao.addTrain(training);
    }

    @Override
    public List<Training> getEmployeeTrain(Integer e_id) {
        List<TrainingEmployee> trainingEmployees = trainingEmployeeDao.getTID(e_id);
        List<Training> trainings = new ArrayList<>();
        for (TrainingEmployee trainingEmployee : trainingEmployees) {
            Training training = trainingDao.getTrain(trainingEmployee.getT_id());
            trainings.add(training);
        }
        trainings.sort(((o1, o2) -> Long.compare(o2.getT_start_time().getTime(),o1.getT_start_time().getTime())));
        return trainings;
    }

    @Override
    public Training getTrain(int t_id) {
        return trainingDao.getTrain(t_id);
    }

    @Override
    public boolean updateState2(Training training) {
        if (training == null || training.getT_id() == null) return false;
        return trainingDao.updateState2(training);
    }
}
