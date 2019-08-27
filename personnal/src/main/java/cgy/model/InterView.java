package cgy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class InterView {
    private Integer in_id;
    private Integer in_cv_id;
    private Integer in_rct_id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date in_date;
    private Integer in_is_read;
    private Integer in_is_accept;//0 初始值（一开始显示未邀请）
    // 1 邀请来面试 2 已完成面试  3 录用 4 不录用 5.结束
    private Integer in_is_agree;//0 未反馈  1 同意 2 拒绝
    private Integer in_read_account;

    public Integer getIn_id() {
        return in_id;
    }

    public void setIn_id(Integer in_id) {
        this.in_id = in_id;
    }

    public Integer getIn_cv_id() {
        return in_cv_id;
    }

    public void setIn_cv_id(Integer in_cv_id) {
        this.in_cv_id = in_cv_id;
    }

    public Integer getIn_rct_id() {
        return in_rct_id;
    }

    public void setIn_rct_id(Integer in_rct_id) {
        this.in_rct_id = in_rct_id;
    }

    public Date getIn_date() {
        return in_date;
    }

    public void setIn_date(Date in_date) {
        this.in_date = in_date;
    }

    public Integer getIn_is_read() {
        return in_is_read;
    }

    public void setIn_is_read(Integer in_is_read) {
        this.in_is_read = in_is_read;
    }

    public Integer getIn_is_accept() {
        return in_is_accept;
    }

    public void setIn_is_accept(Integer in_is_accept) {
        this.in_is_accept = in_is_accept;
    }

    public Integer getIn_is_agree() {
        return in_is_agree;
    }

    public void setIn_is_agree(Integer in_is_agree) {
        this.in_is_agree = in_is_agree;
    }

    public Integer getIn_read_account() {
        return in_read_account;
    }

    public void setIn_read_account(Integer in_read_account) {
        this.in_read_account = in_read_account;
    }

    @Override
    public String toString() {
        return "InterView{" +
                "编号=" + in_id +
                ", 简历编号=" + in_cv_id +
                ", 招聘信息编号=" + in_rct_id +
                ", 面试时间=" + in_date +
                ", 是否已读=" + in_is_read +
                ", 是否允许面试=" + in_is_accept +
                ", 是否来面试=" + in_is_agree +
                ", 被查阅次数=" + in_read_account +
                '}';
    }
}
