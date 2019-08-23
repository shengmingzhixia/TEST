package cgy.service.impl;

import cgy.dao.DepartmentDao;
import cgy.model.Department;
import cgy.model.Page;
import cgy.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public Page<Department> getDepByPage(int pageNo) {
        Page page = new Page<>();
        int totalRows = departmentDao.getTotalRows();
        List<Department> departments = departmentDao.getDepByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize());
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(departments);
        return page;
    }
}
