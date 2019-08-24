package cgy.dao;

import cgy.model.Position;

import java.util.List;

public interface PositionDao {
    //查询
    List<Position> getPositions(Position position);

    //修改
    boolean updatePosition(Position position);

    //插入
    boolean insertPosition(Position position);

    //删除
    boolean deletePosition(int pos_id);

    //分页查看职位信息
    List<Position> getPositionByPage(int firstPageNo, int endPageNo,int dep_id);

    //获取职位数
    int getTotalRows(int dep_id);
}
