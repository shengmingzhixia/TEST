package cgy.model;


import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

//职员表
public class Employee {
    private Integer e_id;
    private String e_account;
    private String e_password;
    private Integer e_type;
    private String e_name;
    private String e_gender;
    private String e_address;
    private long e_phone;
    private long e_debit;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date e_enroll_date;
    private Integer e_state; //0 离职 1 在职 2 试用期
    private double e_salary;
    private Integer e_pos_id;

    public Employee() {
    }

    public Employee(String e_account, String e_password, int e_type) {
        this.e_account = e_account;
        this.e_password = e_password;
        this.e_type = e_type;
    }

    public Integer getE_id() {
        return e_id;
    }

    public void setE_id(Integer e_id) {
        this.e_id = e_id;
    }

    public String getE_account() {
        return e_account;
    }

    public void setE_account(String e_account) {
        this.e_account = e_account;
    }

    public String getE_password() {
        return e_password;
    }

    public void setE_password(String e_password) {
        this.e_password = e_password;
    }

    public Integer getE_type() {
        return e_type;
    }

    public void setE_type(Integer e_type) {
        this.e_type = e_type;
    }

    public String getE_name() {
        return e_name;
    }

    public void setE_name(String e_name) {
        this.e_name = e_name;
    }

    public String getE_gender() {
        return e_gender;
    }

    public void setE_gender(String e_gender) {
        this.e_gender = e_gender;
    }

    public String getE_address() {
        return e_address;
    }

    public void setE_address(String e_address) {
        this.e_address = e_address;
    }

    public long getE_phone() {
        return e_phone;
    }

    public void setE_phone(long e_phone) {
        this.e_phone = e_phone;
    }

    public long getE_debit() {
        return e_debit;
    }

    public void setE_debit(long e_debit) {
        this.e_debit = e_debit;
    }

    public Date getE_enroll_date() {
        return e_enroll_date;
    }

    public void setE_enroll_date(Date e_enroll_date) {
        this.e_enroll_date = e_enroll_date;
    }

    public Integer getE_state() {
        return e_state;
    }

    public void setE_state(Integer e_state) {
        this.e_state = e_state;
    }

    public double getE_salary() {
        return e_salary;
    }

    public void setE_salary(double e_salary) {
        this.e_salary = e_salary;
    }

    public Integer getE_pos_id() {
        return e_pos_id;
    }

    public void setE_pos_id(Integer e_pos_id) {
        this.e_pos_id = e_pos_id;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "编号=" + e_id +
                ", 账号='" + e_account + '\'' +
                ", 密码='" + e_password + '\'' +
                ", 类型=" + e_type +
                ", 姓名='" + e_name + '\'' +
                ", 性别='" + e_gender + '\'' +
                ", 地址='" + e_address + '\'' +
                ", 电话='" + e_phone + '\'' +
                ", 银行卡号=" + e_debit +
                ", 入职时间=" + e_enroll_date +
                ", 状态=" + e_state +
                ", 薪资=" + e_salary +
                ", 职位ID=" + e_pos_id +
                '}';
    }
}
