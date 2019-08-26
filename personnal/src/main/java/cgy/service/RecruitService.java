package cgy.service;

import cgy.model.Page;
import cgy.model.Recruit;

import java.util.List;

public interface RecruitService {
    //查询招聘信息
    Page<Recruit> getRecruitByPage(int pageNo,int isPublish);

    List<Recruit> getRecruits(Integer e_id);

    Recruit getRecruit(Integer in_rct_id);

    boolean insertRecruit(Recruit recruit);

    Page<Recruit> getRecruitByPage2(int pageNo);

    boolean deleteRecruit(int rct_id);

    boolean updateRecruit(Recruit recruit);
}
