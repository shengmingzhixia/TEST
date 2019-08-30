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

    //更新部门名称
    boolean updateDepart(Department department);

    //删除部门
    boolean deleteDepart(int id);

    //查重使用
    List<Department> getDeparts(String dep_name);

    //根据id找到部门
    Department getDepart(Integer pos_dep_id);

    List<Department> getDepartAll();
}
