package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.model.Employee;
import cgy.model.Page;
import cgy.service.EmployeeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
    @Resource
    private EmployeeDao employeeDao;

    @Override   //登录
    public Employee login(Employee employee) {
        System.out.println(employee+"yewy1");
        if (employee == null || employee.getE_account() == null ||
                employee.getE_password() == null || employee.getE_type() == null)
            return null;
        List<Employee> employees = employeeDao.getE(employee);
        System.out.println(employees);
        if (employees == null || employees.size() == 0) return null;
        return employees.get(0);
    }

    @Override
    public Page<Employee> getEmployeeByPage(int pageNo, int pos_id) {
        Page page = new Page<>();
        int totalRows = employeeDao.getTotalRows(pos_id);
        List<Employee> employees = employeeDao.getEmployeeByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize(), pos_id);
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(employees);
        return page;
    }

    @Override
    public Employee getEmployee(Employee employee) {
        if (employee == null || employee.getE_id() == null) return null;
        List<Employee> e = employeeDao.getE(employee);
        if (e == null || e.size() == 0) return null;
        return e.get(0);
    }

    @Override
    public boolean insertEmployee(Employee employee) {
        return employeeDao.insert(employee);
    }
}
