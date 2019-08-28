package cgy.dao;

import cgy.model.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
    //获取职员信息
    List<Employee> getE(Employee employee);

    //查看员工信息（分页）
    List<Employee> getEmployeeByPage(int firstPageNo, int endPageNo,Integer pos_id);

    //得出员工的记录数
    int getTotalRows(@Param(value="pos_id")Integer pos_id);

    boolean insert(Employee employee);

    List<Employee> getEmployeeByPage2(int firstPageNo, int endPageNo);

    boolean update(Employee employee);

    boolean update2(Employee employee);
}
