package cgy.service;

import cgy.model.InterView;

public interface InterViewService {
    //添加一条面试信息（投递简历后，就会产生）
    boolean insertInterView(InterView interView);
}
