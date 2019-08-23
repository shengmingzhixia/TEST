package cgy.service;

import cgy.model.Page;
import cgy.model.Recruit;

public interface RecruitService {
    //查询招聘信息
    Page<Recruit> getRecruitByPage(int pageNo,int isPublish);
}
