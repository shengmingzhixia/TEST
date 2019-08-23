package cgy.service;

import cgy.model.Department;
import cgy.model.Page;

public interface DepartmentService {
    //添加部门信息
    boolean insertDepart(Department department);

    //查询部门信息
    Page<Department> getDepByPage(int pageNo);
}
