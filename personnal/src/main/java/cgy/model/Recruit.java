package cgy.model;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//招聘信息表
public class Recruit {
    private Integer rct_id;
    private Integer rct_pos_id;
    private String rct_title;
    private String rct_introduaction;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date rct_publish_time;
    private String rct_address;
    private double rct_salary;
    private Integer rct_e_id;
    private Integer rct_is_draft; // 0 不是草稿  1 是草稿
    private Integer rct_is_publish; // 0 未发布  1 已发布


    public Integer getRct_id() {
        return rct_id;
    }

    public void setRct_id(Integer rct_id) {
        this.rct_id = rct_id;
    }

    public Integer getRct_pos_id() {
        return rct_pos_id;
    }

    public void setRct_pos_id(Integer rct_pos_id) {
        this.rct_pos_id = rct_pos_id;
    }

    public String getRct_title() {
        return rct_title;
    }

    public void setRct_title(String rct_title) {
        this.rct_title = rct_title;
    }

    public String getRct_introduaction() {
        return rct_introduaction;
    }

    public void setRct_introduaction(String rct_introduaction) {
        this.rct_introduaction = rct_introduaction;
    }

    public Date getRct_publish_time() {
        return rct_publish_time;
    }

    public void setRct_publish_time(Date rct_publish_time) {
        this.rct_publish_time = rct_publish_time;
    }

    public String getRct_address() {
        return rct_address;
    }

    public void setRct_address(String rct_address) {
        this.rct_address = rct_address;
    }

    public double getRct_salary() {
        return rct_salary;
    }

    public void setRct_salary(double rct_salary) {
        this.rct_salary = rct_salary;
    }

    public Integer getRct_e_id() {
        return rct_e_id;
    }

    public void setRct_e_id(Integer rct_e_id) {
        this.rct_e_id = rct_e_id;
    }

    public Integer getRct_is_draft() {
        return rct_is_draft;
    }

    public void setRct_is_draft(Integer rct_is_draft) {
        this.rct_is_draft = rct_is_draft;
    }

    public Integer getRct_is_publish() {
        return rct_is_publish;
    }

    public void setRct_is_publish(Integer rct_is_publish) {
        this.rct_is_publish = rct_is_publish;
    }

    @Override
    public String toString() {
        return "Recruit{" +
                "编号=" + rct_id +
                ", 招聘职位id=" + rct_pos_id +
                ", 招聘标题='" + rct_title + '\'' +
                ", 招聘介绍='" + rct_introduaction + '\'' +
                ", 发布时间=" + rct_publish_time +
                ", 公司地址='" + rct_address + '\'' +
                ", 薪资=" + rct_salary +
                ", 发布人id=" + rct_e_id +
                ", 是否是草稿=" + rct_is_draft +
                ", 是否发布=" + rct_is_publish +
                '}';
    }
}
