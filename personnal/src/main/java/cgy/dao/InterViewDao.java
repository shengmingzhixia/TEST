package cgy.dao;

import cgy.model.InterView;

import java.util.List;

public interface InterViewDao {
    //添加一条面试信息（投递简历后，就会产生）
    boolean insertInterView(InterView interView);

    //查看面试信息（分页）
    List<InterView> getInterViewByPage(int firstPageNo, int endPageNo);

    //得出面试的记录数
    int getTotalRows();

    //更新面试信息
     boolean updateInterView(InterView interView);

    InterView getInterViews(int cv_id);

    List<InterView> getInterView(int rct_id);
}
