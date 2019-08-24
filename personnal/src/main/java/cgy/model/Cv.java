package cgy.model;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//简历表
public class Cv {
    private int cv_id;
    private String cv_title;
    private int cv_c_id;
    private String cv_name;
    private String cv_gender;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date cv_birth;
    private String cv_address;
    private long cv_phone;
    private String cv_school;
    private String cv_education;
    private String cv_major;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date cv_enroll_date;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date cv_graduation_date;
    private double cv_salary;
    private String cv_exprience;

    public Cv() {
    }

    public int getCv_id() {
        return cv_id;
    }

    public void setCv_id(int cv_id) {
        this.cv_id = cv_id;
    }

    public String getCv_title() {
        return cv_title;
    }

    public void setCv_title(String cv_title) {
        this.cv_title = cv_title;
    }

    public int getCv_c_id() {
        return cv_c_id;
    }

    public void setCv_c_id(int cv_c_id) {
        this.cv_c_id = cv_c_id;
    }

    public String getCv_name() {
        return cv_name;
    }

    public void setCv_name(String cv_name) {
        this.cv_name = cv_name;
    }

    public String getCv_gender() {
        return cv_gender;
    }

    public void setCv_gender(String cv_gender) {
        this.cv_gender = cv_gender;
    }

    public Date getCv_birth() {
        return cv_birth;
    }

    public void setCv_birth(Date cv_birth) {
        this.cv_birth = cv_birth;
    }

    public String getCv_address() {
        return cv_address;
    }

    public void setCv_address(String cv_address) {
        this.cv_address = cv_address;
    }

    public long getCv_phone() {
        return cv_phone;
    }

    public void setCv_phone(long cv_phone) {
        this.cv_phone = cv_phone;
    }

    public String getCv_school() {
        return cv_school;
    }

    public void setCv_school(String cv_school) {
        this.cv_school = cv_school;
    }

    public String getCv_education() {
        return cv_education;
    }

    public void setCv_education(String cv_education) {
        this.cv_education = cv_education;
    }

    public String getCv_major() {
        return cv_major;
    }

    public void setCv_major(String cv_major) {
        this.cv_major = cv_major;
    }

    public Date getCv_enroll_date() {
        return cv_enroll_date;
    }

    public void setCv_enroll_date(Date cv_enroll_date) {
        this.cv_enroll_date = cv_enroll_date;
    }

    public Date getCv_graduation_date() {
        return cv_graduation_date;
    }

    public void setCv_graduation_date(Date cv_graduation_date) {
        this.cv_graduation_date = cv_graduation_date;
    }

    public double getCv_salary() {
        return cv_salary;
    }

    public void setCv_salary(double cv_salary) {
        this.cv_salary = cv_salary;
    }

    public String getCv_exprience() {
        return cv_exprience;
    }

    public void setCv_exprience(String cv_exprience) {
        this.cv_exprience = cv_exprience;
    }

    @Override
    public String toString() {
        return "Cv{" +
                "简历编号=" + cv_id +
                ", 简历名称=" + cv_title +
                ", 游客编号=" + cv_c_id +
                ", 简历名称='" + cv_name + '\'' +
                ", 性别='" + cv_gender + '\'' +
                ", 出生日期=" + cv_birth +
                ", 地址='" + cv_address + '\'' +
                ", 电话=" + cv_phone +
                ", 学校='" + cv_school + '\'' +
                ", 学历='" + cv_education + '\'' +
                ", 专业='" + cv_major + '\'' +
                ", 入学时间=" + cv_enroll_date +
                ", 毕业时间=" + cv_graduation_date +
                ", 期望薪资" + cv_salary +
                ", 就业经验='" + cv_exprience + '\'' +
                '}';
    }
}
