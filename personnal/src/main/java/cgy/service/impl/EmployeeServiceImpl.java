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
        if (employee == null || employee.getE_account() == null ||
                employee.getE_password() == null || employee.getE_type() == null)
            return null;
        List<Employee> employees = employeeDao.getE(employee);
        if (employees == null || employees.size() == 0) return null;
        return employees.get(0);
    }

    @Override
    public Page<Employee> getEmployeeByPage(int pageNo, Integer pos_id) {
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
        if (employee == null || employee.getE_id() == null) {
            if (employee.getE_name() == null) {
                return null;
            }
        }
        List<Employee> e = employeeDao.getE(employee);
        if (e == null || e.size() == 0) return null;
        return e.get(0);
    }

    @Override
    public boolean insertEmployee(Employee employee) {
        return employeeDao.insert(employee);
    }

    @Override
    public Page<Employee> getEmployeeByPage2(int pageNo) {
        Page page = new Page<>();
        int totalRows = employeeDao.getTotalRows(null);
        List<Employee> employees = employeeDao.getEmployeeByPage2((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize());
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(employees);
        return page;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        if (employee == null || employee.getE_id() == null) return false;
        if (employee.getE_pos_id() != null) return employeeDao.update2(employee);
        return employeeDao.update(employee);
    }

    @Override
    public List<Employee> getEmployees(Employee employee) {
        if (employee == null) return null;
        return employeeDao.getE(employee);
    }
}
