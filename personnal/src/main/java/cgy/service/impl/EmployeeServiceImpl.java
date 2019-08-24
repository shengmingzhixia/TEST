package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.model.Employee;
import cgy.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
    @Resource
    private EmployeeDao employeeDao;

    @Override   //登录
    public Employee login(Employee employee) {
        if (employee == null || employee.getE_account() == null ||
                employee.getE_password() == null || employee.getE_type() == null)
            return null;
        return employeeDao.getE(employee);
    }
}
