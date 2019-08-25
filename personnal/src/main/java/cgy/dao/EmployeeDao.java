package cgy.dao;

import cgy.model.Employee;

import java.util.List;

public interface EmployeeDao {
    //获取职员信息
    List<Employee> getE(Employee employee);

    //查看员工信息（分页）
    List<Employee> getEmployeeByPage(int firstPageNo, int endPageNo,int pos_id);

    //得出员工的记录数
    int getTotalRows(int pos_id);

    boolean insert(Employee employee);
}
