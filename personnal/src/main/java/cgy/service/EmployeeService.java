package cgy.service;

import cgy.model.Employee;
import cgy.model.Page;

public interface EmployeeService {
    //职员登录
    Employee login(Employee employee);

    //员工分页查询显示
    //查询部门信息
    Page<Employee> getEmployeeByPage(int pageNo,int pos_id);

    Employee getEmployee(Employee employee);
}
