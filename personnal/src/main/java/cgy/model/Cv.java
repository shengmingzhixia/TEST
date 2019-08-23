package cgy.model;


import java.util.Date;

//简历表
public class Cv {
    private int cv_id;
    private String cv_title;
    private int cv_c_id;
    private String cv_name;
    private String cv_gender;
    private Date cv_birth;
    private String cv_address;
    private long cv_phone;
    private String cv_school;
    private String cv_education;
    private String cv_major;
    private Date cv_enroll_date;
    private Date cv_graduation_date;
    private double cv_salary;
    private String cv_exprience;

    public Cv() {
    }

    public String getTitle() {
        return cv_title;
    }

    public void setTitle(String cv_title) {
        this.cv_title = cv_title;
    }

    public int getId() {
        return cv_id;
    }

    public void setId(int cv_id) {
        this.cv_id = cv_id;
    }

    public int getCid() {
        return cv_c_id;
    }

    public void setCid(int cv_c_id) {
        this.cv_c_id = cv_c_id;
    }

    public String getName() {
        return cv_name;
    }

    public void setName(String cv_name) {
        this.cv_name = cv_name;
    }

    public String getGender() {
        return cv_gender;
    }

    public void setGender(String cv_gender) {
        this.cv_gender = cv_gender;
    }

    public Date getBirth() {
        return cv_birth;
    }

    public void setBirth(Date cv_birth) {
        this.cv_birth = cv_birth;
    }

    public String getAddress() {
        return cv_address;
    }

    public void setAddress(String cv_address) {
        this.cv_address = cv_address;
    }

    public long getPhone() {
        return cv_phone;
    }

    public void setPhone(long cv_phone) {
        this.cv_phone = cv_phone;
    }

    public String getSchool() {
        return cv_school;
    }

    public void setSchool(String cv_school) {
        this.cv_school = cv_school;
    }

    public String getEducation() {
        return cv_education;
    }

    public void setEducation(String cv_education) {
        this.cv_education = cv_education;
    }

    public String getMajor() {
        return cv_major;
    }

    public void setMajor(String cv_major) {
        this.cv_major = cv_major;
    }

    public Date getEnrollDate() {
        return cv_enroll_date;
    }

    public void setEnrollDate(Date cv_enroll_date) {
        this.cv_enroll_date = cv_enroll_date;
    }

    public Date getGraduationDate() {
        return cv_graduation_date;
    }

    public void setGraduationDate(Date cv_graduation_date) {
        this.cv_graduation_date = cv_graduation_date;
    }

    public double getSalary() {
        return cv_salary;
    }

    public void setSalary(double cv_salary) {
        this.cv_salary = cv_salary;
    }

    public String getExprience() {
        return cv_exprience;
    }

    public void setExprience(String cv_exprience) {
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
