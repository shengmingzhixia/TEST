package cgy.dao;

import cgy.model.Department;

public interface DepartmentDao {
    //添加部门信息
    boolean insertDepart(Department department);
    //查看部门信息（分页）
}
