package cgy.dao;

import cgy.model.Attendence;
import cgy.model.Employee;

import java.util.List;

public interface AttendenceDao {
    //插入新的打卡记录
    boolean insert(Attendence attendence);

    //获取到某员工的所有打卡记录
    List<Attendence> getAtd(Attendence attendence);

    //根据id 更新下班打卡时间
    boolean update(Attendence attendence);

    List<Attendence> getAllAtd();

}
