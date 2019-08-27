package cgy.service;

import cgy.model.Employee;
import cgy.model.Page;

public interface EmployeeService {
    //职员登录
    Employee login(Employee employee);

    //员工分页查询显示
    //查询部门信息
    Page<Employee> getEmployeeByPage(int pageNo,Integer pos_id);

    Employee getEmployee(Employee employee);

    boolean insertEmployee(Employee employee);

    //员工管理界面 先分页查出全部员工
    Page<Employee> getEmployeeByPage2(int pageNo);

    boolean updateEmployee(Employee employee);
}
