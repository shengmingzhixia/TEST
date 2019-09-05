package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.dao.LiZhiDao;
import cgy.model.Employee;
import cgy.model.LiZhi;
import cgy.service.LiZhiService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("liZhiService")
public class LiZhiServiceImpl implements LiZhiService {
    @Resource
    private EmployeeDao employeeDao;
    @Resource
    private LiZhiDao liZhiDao;

    @Override
    public boolean liZhi(LiZhi liZhi) {
        Employee employee = new Employee();
        employee.setE_id(liZhi.getE_id());
        System.out.println(employee);
        List<Employee> e = employeeDao.getE(employee);
        employee = e.get(0);
        employee.setE_state(0);
        employeeDao.update(employee);
        return liZhiDao.insertliZhi(liZhi);
    }
}
