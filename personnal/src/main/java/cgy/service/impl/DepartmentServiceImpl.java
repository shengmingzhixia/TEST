package cgy.service.impl;

import cgy.dao.DepartmentDao;
import cgy.dao.EmployeeDao;
import cgy.dao.PositionDao;
import cgy.model.Department;
import cgy.model.Employee;
import cgy.model.Page;
import cgy.model.Position;
import cgy.service.DepartmentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
    @Resource
    private DepartmentDao departmentDao;
    @Resource
    private PositionDao positionDao;
    @Resource
    private EmployeeDao employeeDao;

    @Override
    public boolean insertDepart(Department department) {
        if (department == null || department.getDep_name() == null || department.getDep_date() == null)
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

    @Override
    public boolean updateDepart(Department department) {
        if (department == null || department.getDep_name() == null || department.getDep_id() == 0) return false;
        return departmentDao.updateDepart(department);
    }

    @Override
    public boolean deleteDepart(int id) {
        Position position = new Position();
        position.setPos_dep_id(id);
        List<Position> positions = positionDao.getPositions(position);
        if (positions == null || positions.size() == 0)
            return departmentDao.deleteDepart(id);
        else {
            for (int i = 0; i < positions.size(); i++) {
                int pos_id = positions.get(i).getPos_id();
                Employee employee = new Employee();
                employee.setE_pos_id(pos_id);
                List<Employee> e = employeeDao.getE(employee);
                if (e != null && e.size() != 0) {
                    return false;
                }
            }
            for (int i = 0; i < positions.size(); i++) {
                int pos_id = positions.get(i).getPos_id();
                positionDao.deletePosition(pos_id);
            }
            return departmentDao.deleteDepart(id);
        }
    }

    @Override
    public boolean repetition(String dep_name) {
        if (dep_name == null) return false;
        List<Department> departs = departmentDao.getDeparts(dep_name);
        if (departs == null || departs.size() == 0) return false;
        return true;
    }

    @Override
    public Department getDepartment(Integer pos_dep_id) {
        return departmentDao.getDepart(pos_dep_id);
    }

    @Override
    public List<Department> getDeparts() {
        return departmentDao.getDepartAll();
    }
}
