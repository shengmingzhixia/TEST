package cgy.service;

import cgy.model.InterView;
import cgy.model.InterView2;
import cgy.model.Page;

import java.util.List;

public interface InterViewService {
    //添加一条面试信息（投递简历后，就会产生）
    boolean insertInterView(InterView interView);

    //分页找面试信息
    //accept在3以下的
    Page<InterView2> getInterViewByPage(int pageNo);

    //找面试信息
    List<InterView2> getInterViews(int c_id);

    //更新面试信息
    boolean updateInterView(InterView interView);

    List<InterView2> getInterView(int rct_id);

}
