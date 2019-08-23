package cgy.dao;

import cgy.model.Cv;

import java.util.List;

public interface CvDao {
    //查看简历信息（分页）
    List<Cv> getCvByPage(int firstPageNo, int endPageNo,int c_id);

    //得出简历的记录数
    int getTotalRows();

    //添加新的简历
    boolean insertCv(Cv cv);

    //根据简历id 查看单个简历
    Cv getCv(int cv_id);

    boolean updateCv(Cv cv);

    boolean delete(int id1);

    List<Cv> getCvs(int cid);
}
