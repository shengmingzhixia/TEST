package cgy.model;


import java.util.Date;

//职员表
public class Employee {
    private int e_id;
    private String e_account;
    private String e_password;
    private Integer e_type;
    private String e_name;
    private String e_gender;
    private String e_address;
    private String e_phone;
    private long e_debit;
    private Date e_enroll_date;
    private int e_state;
    private double e_salary;
    private int e_pos_id;

    public Employee() {
    }

    public Employee(String e_account, String e_password, int e_type) {
        this.e_account = e_account;
        this.e_password = e_password;
        this.e_type = e_type;
    }

    public int getId() {
        return e_id;
    }

    public void setId(int e_id) {
        this.e_id = e_id;
    }

    public String getAccount() {
        return e_account;
    }

    public void setAccount(String e_account) {
        this.e_account = e_account;
    }

    public String getPassword() {
        return e_password;
    }

    public void setPassword(String e_password) {
        this.e_password = e_password;
    }

    public Integer getType() {
        return e_type;
    }

    public void setType(int e_type) {
        this.e_type = e_type;
    }

    public String getName() {
        return e_name;
    }

    public void setName(String e_name) {
        this.e_name = e_name;
    }

    public String getGender() {
        return e_gender;
    }

    public void setGender(String e_gender) {
        this.e_gender = e_gender;
    }

    public String getAddress() {
        return e_address;
    }

    public void setAddress(String e_address) {
        this.e_address = e_address;
    }

    public String getPhone() {
        return e_phone;
    }

    public void setPhone(String e_phone) {
        this.e_phone = e_phone;
    }

    public long getDebit() {
        return e_debit;
    }

    public void setDebit(long e_debit) {
        this.e_debit = e_debit;
    }

    public Date getEnrollDate() {
        return e_enroll_date;
    }

    public void setEnrollDate(Date e_enroll_date) {
        this.e_enroll_date = e_enroll_date;
    }

    public int getState() {
        return e_state;
    }

    public void setState(int e_state) {
        this.e_state = e_state;
    }

    public double getSalary() {
        return e_salary;
    }

    public void setSalary(double e_salary) {
        this.e_salary = e_salary;
    }

    public int getPosId() {
        return e_pos_id;
    }

    public void setPosId(int e_pos_id) {
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
