package cgy.service.impl;

import cgy.dao.EmployeeDao;
import cgy.dao.PositionDao;
import cgy.model.Employee;
import cgy.model.Page;
import cgy.model.Position;
import cgy.service.EmployeeService;
import cgy.service.PositionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("positionService")
public class PositionServiceImpl implements PositionService {
    @Resource
    private PositionDao positionDao;
    @Resource
    private EmployeeDao employeeDao;

    @Override
    public List<Position> getPositions(Position position) {
        if (position == null || position.getPos_dep_id() == null) return null;
        return positionDao.getPositions(position);
    }

    @Override
    public boolean updatePosition(Position position) {
        if (position == null || position.getPos_dep_id() == null) return false;
        return positionDao.updatePosition(position);
    }

    @Override
    public boolean insertPosition(Position position) {
        return positionDao.insertPosition(position);
    }

    @Override
    public boolean deletePosition(int pos_id) {
        Employee employee = new Employee();
        employee.setE_pos_id(pos_id);
        List<Employee> employees = employeeDao.getE(employee);
        if (employees == null || employees.size() == 0){
            return positionDao.deletePosition(pos_id);
        }
        return false;
    }

    @Override
    public Page<Position> getPositionByPage(int pageNo, int dep_id) {
        Page page = new Page<>();
        int totalRows = positionDao.getTotalRows(dep_id);
        List<Position> positions = positionDao.getPositionByPage((pageNo - 1) * page.getPageSize(), pageNo * page.getPageSize(), dep_id);
        page.setPageNo(pageNo);
        page.setTotalRows(totalRows);
        page.setList(positions);
        return page;
    }

    @Override
    public Position getPosition(Integer e_pos_id) {
        Position p = new Position();
        p.setPos_id(e_pos_id);
        List<Position> positions = positionDao.getPositions(p);
        if (positions == null || positions.size() == 0) return null;
        return positions.get(0);
    }

    @Override
    public boolean repetition(String pos_name) {
        if (pos_name == null) return false;
        Position p = new Position();
        p.setPos_name(pos_name);
        List<Position> positions = positionDao.getPositions(p);
        if (positions == null || positions.size() == 0) return false;
        return true;
    }
}
