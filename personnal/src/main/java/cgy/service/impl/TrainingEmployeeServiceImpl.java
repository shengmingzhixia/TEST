package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.dao.PositionDao;
import cgy.dao.TrainingEmployeeDao;
import cgy.model.Employee;
import cgy.model.Position;
import cgy.model.TrainingEmployee;
import cgy.service.TrainingEmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("trainingEmployeeService")
public class TrainingEmployeeServiceImpl implements TrainingEmployeeService {
    @Resource
    private TrainingEmployeeDao trainingEmployeeDao;
    @Resource
    private EmployeeDao employeeDao;
    @Resource
    private PositionDao positionDao;

    @Override
    public boolean insert(int t_id, String pos_name) {
        Position position = positionDao.getPosition(pos_name);
        Employee employee = new Employee();
        employee.setE_pos_id(position.getPos_id());
        List<Employee> employeeList = employeeDao.getE(employee);
        boolean a = false;
        for (Employee employee1 : employeeList) {
            TrainingEmployee trainingEmployee = new TrainingEmployee(t_id, employee1.getE_id());
            a = trainingEmployeeDao.insert(trainingEmployee);
        }
        return a;
    }
}
