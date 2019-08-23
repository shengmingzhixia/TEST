package cgy.model;


import java.util.Date;

//招聘信息表
public class Recruit {
    private int rct_id;
    private int rct_pos_id;
    private String rct_title;
    private String rct_introduaction;
    private Date rct_publish_time;
    private String rct_address;
    private double rct_salary;
    private int rct_e_id;
    private int rct_is_draft; // 0 不是草稿  1 是草稿
    private int rct_is_publish; // 0 未发布  1 已发布

    public int getId() {
        return rct_id;
    }

    public void setId(int rct_id) {
        this.rct_id = rct_id;
    }

    public int getPosId() {
        return rct_pos_id;
    }

    public void setPosId(int rct_pos_id) {
        this.rct_pos_id = rct_pos_id;
    }

    public String getTitle() {
        return rct_title;
    }

    public void setTitle(String rct_title) {
        this.rct_title = rct_title;
    }

    public String getIntroduaction() {
        return rct_introduaction;
    }

    public void setIntroduaction(String rct_introduaction) {
        this.rct_introduaction = rct_introduaction;
    }

    public Date getPublishtime() {
        return rct_publish_time;
    }

    public void setPublishtime(Date rct_publish_time) {
        this.rct_publish_time = rct_publish_time;
    }

    public String getAddress() {
        return rct_address;
    }

    public void setAddress(String rct_address) {
        this.rct_address = rct_address;
    }

    public double getSalary() {
        return rct_salary;
    }

    public void setSalary(double rct_salary) {
        this.rct_salary = rct_salary;
    }

    public int geEid() {
        return rct_e_id;
    }

    public void setEid(int rct_e_id) {
        this.rct_e_id = rct_e_id;
    }

    public int getIsDraft() {
        return rct_is_draft;
    }

    public void setIsDraft(int rct_is_draft) {
        this.rct_is_draft = rct_is_draft;
    }

    public int getIsPublish() {
        return rct_is_publish;
    }

    public void setIsPublish(int rct_is_publish) {
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
