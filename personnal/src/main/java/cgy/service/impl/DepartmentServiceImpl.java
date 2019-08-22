package cgy.service.impl;

import cgy.dao.DepartmentDao;
import cgy.model.Department;
import cgy.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
    @Resource
    private DepartmentDao departmentDao;

    @Override
    public boolean insertDepart(Department department) {
        if (department == null || department.getName() == null || department.getDate() == null)
            return false;
        return departmentDao.insertDepart(department);
    }
}
