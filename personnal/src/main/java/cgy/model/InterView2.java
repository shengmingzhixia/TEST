package cgy.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class InterView2 {
    private Integer in_id;
    private Integer in_cv_id;
    private String in_cv_name;
    private Integer in_rct_id;
    private String in_rct_name;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date in_date;
    private Integer in_is_read;
    private Integer in_is_accept;//0 初始值（一开始显示未邀请）
    // 1 邀请来面试 2 已完成面试  3 录用 4 不录用
    private Integer in_is_agree;
    private Integer in_read_account;

    public InterView2() {
    }

    public InterView2(InterView interView, String in_cv_name, String in_rct_name) {
        this.in_id = interView.getIn_id();
        this.in_cv_id = interView.getIn_cv_id();
        this.in_cv_name = in_cv_name;
        this.in_rct_id = interView.getIn_rct_id();
        this.in_rct_name = in_rct_name;
        this.in_date = interView.getIn_date();
        this.in_is_read = interView.getIn_is_read();
        this.in_is_accept = interView.getIn_is_accept();
        this.in_is_agree = interView.getIn_is_agree();
        this.in_read_account = interView.getIn_read_account();
    }

    public String getIn_cv_name() {
        return in_cv_name;
    }

    public void setIn_cv_name(String in_cv_name) {
        this.in_cv_name = in_cv_name;
    }

    public String getIn_rct_name() {
        return in_rct_name;
    }

    public void setIn_rct_name(String in_rct_name) {
        this.in_rct_name = in_rct_name;
    }

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
        return "InterView2{" +
                "in_id=" + in_id +
                ", in_cv_id=" + in_cv_id +
                ", in_cv_name='" + in_cv_name + '\'' +
                ", in_rct_id=" + in_rct_id +
                ", in_rct_name='" + in_rct_name + '\'' +
                ", in_date=" + in_date +
                ", in_is_read=" + in_is_read +
                ", in_is_accept=" + in_is_accept +
                ", in_is_agree=" + in_is_agree +
                ", in_read_account=" + in_read_account +
                '}';
    }
}
