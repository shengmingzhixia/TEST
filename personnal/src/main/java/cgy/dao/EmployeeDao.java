package cgy.dao;

import cgy.model.Employee;

public interface EmployeeDao {
    //获取职员信息（登录用）
    Employee getE(Employee employee);
}
