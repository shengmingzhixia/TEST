package cgy.dao;

import cgy.model.Recruit;

import java.util.List;

public interface RecruitDao {
    //查看招聘信息（分页）
    List<Recruit> getRecruitByPage(int firstPageNo, int endPageNo, int isPublish);

    //得出招聘信息的记录数
    int getTotalRows();

    //查看某条招聘信息的具体内容
    Recruit getRecruit(int Rct_id);

    //根据发布人的信息来查询出发布的招聘信息
    List<Recruit> getRecruitById(Integer e_id);

    boolean insert(Recruit recruit);

    List<Recruit> getRecruitByPage2(int firstPageNo, int endPageNo);

    boolean delete(int rct_id);

    boolean update(Recruit recruit);
}
