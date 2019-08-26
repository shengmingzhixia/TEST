package cgy.service;

import cgy.model.Page;
import cgy.model.Position;

import java.util.List;

public interface PositionService {
    //查询
    List<Position> getPositions(Position position);

    //修改
    boolean updatePosition(Position position);

    //插入
    boolean insertPosition(Position position);

    //删除
    boolean deletePosition(int pos_id);

    //查询部门信息
    Page<Position> getPositionByPage(int pageNo,int dep_id);

    Position getPosition(Integer e_pos_id);

    boolean repetition(String pos_name);

    List<Position> getPositionByDep_id(Integer dep_id);

    Position getPositionByName(String pos_name);
}
