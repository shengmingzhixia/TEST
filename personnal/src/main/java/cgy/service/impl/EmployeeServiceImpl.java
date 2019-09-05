package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.model.Employee;
import cgy.model.Page;
import cgy.service.EmployeeService;
import com.sun.org.apache.bcel.internal.generic.DADD;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
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
        if (employee.getE_password() != null) return employeeDao.update3(employee);
        return employeeDao.update(employee);
    }

    @Override
    public List<Employee> getEmployees(Employee employee) {
        if (employee == null) return null;
        return employeeDao.getE(employee);
    }

    @Override
    public List<Employee> getEmployeeAll() {
        return employeeDao.getE(null);
    }

    @Override
    public boolean changeEState(Employee employee) {
        List<Employee> e = employeeDao.getE(employee);
        employee = e.get(0);
        Date date = employee.getE_enroll_date();
        Date now = new Date();
        long time = (now.getTime() - date.getTime()) / 1000 / 60 / 60 / 24;
        System.out.println("已入职" + time + "天");
        if (time >= 31) {
            employee.setE_state(1);
            employee.setE_salary(employee.getE_salary() * 10 / 8);
            return employeeDao.update(employee);
        }
        return false;
    }
}
