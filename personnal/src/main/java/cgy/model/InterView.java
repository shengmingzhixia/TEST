package cgy.model;

import java.util.Date;

public class InterView {
    private int in_id;
    private int in_cv_id;
    private int in_rct_id;
    private Date in_date;
    private int in_is_read;
    private int in_is_accept;
    private int in_is_agree;
    private int in_read_account;

    public int getId() {
        return in_id;
    }

    public void setId(int in_id) {
        this.in_id = in_id;
    }

    public int getCvId() {
        return in_cv_id;
    }

    public void setCvId(int in_cv_id) {
        this.in_cv_id = in_cv_id;
    }

    public int getRctId() {
        return in_rct_id;
    }

    public void setRctId(int in_rct_id) {
        this.in_rct_id = in_rct_id;
    }

    public Date getDate() {
        return in_date;
    }

    public void setDate(Date in_date) {
        this.in_date = in_date;
    }

    public int getIsRead() {
        return in_is_read;
    }

    public void setIsRead(int in_is_read) {
        this.in_is_read = in_is_read;
    }

    public int getIsAccept() {
        return in_is_accept;
    }

    public void setIsAccept(int in_is_accept) {
        this.in_is_accept = in_is_accept;
    }

    public int getIsAgree() {
        return in_is_agree;
    }

    public void setIsAgree(int in_is_agree) {
        this.in_is_agree = in_is_agree;
    }

    public int getReadAccount() {
        return in_read_account;
    }

    public void setReadAccount(int in_read_account) {
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
