package cgy.service;

import cgy.model.Cv;
import cgy.model.Page;

import java.util.List;

public interface CvService {
    //添加简历信息
    boolean insertCv(Cv cv);

    //查询简历信息
    Page<Cv> getCvByPage(int pageNo, int c_id);


    //根据简历id 查看单个简历
    Cv getCv(int cv_id);

    boolean updateCv(Cv cv);

    boolean delete(int id1);

    //通过c_id查找简历
    List<Cv> getCvs(int cid);
}
