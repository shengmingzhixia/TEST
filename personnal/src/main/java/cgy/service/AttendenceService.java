package cgy.service;

import cgy.model.Attendence;

import java.util.List;

public interface AttendenceService {
    //插入新的打卡记录
    boolean insert(Attendence attendence);

    //获取到某员工的所有打卡记录
    List<Attendence> getAtd(Attendence attendence);

    //根据用户的id 更新下班打卡时间
    boolean update(Attendence attendence);
}
