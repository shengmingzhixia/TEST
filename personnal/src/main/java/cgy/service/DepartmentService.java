package cgy.service;

import cgy.model.Department;
import cgy.model.Page;

import java.util.List;

public interface DepartmentService {
    //添加部门信息
    boolean insertDepart(Department department);

    //查询部门信息
    Page<Department> getDepByPage(int pageNo);

    //更新部门名称
    boolean updateDepart(Department department);

    boolean deleteDepart(int id);

    boolean repetition(String dep_name);

    Department getDepartment(Integer pos_dep_id);

    List<Department> getDeparts();
}
