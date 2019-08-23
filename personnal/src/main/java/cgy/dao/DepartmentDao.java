package cgy.dao;

import cgy.model.Department;

import java.util.List;

public interface DepartmentDao {
    //添加部门信息
    boolean insertDepart(Department department);

    //查看部门信息（分页）
    List<Department> getDepByPage(int firstPageNo, int endPageNo);

    //得出部门的记录数
    int getTotalRows();
}
