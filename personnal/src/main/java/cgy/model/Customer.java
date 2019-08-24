package cgy.model;
//游客的账号信息
public class Customer {
    private int c_id;
    private String c_account;
    private String c_pass;

    public Customer() {
    }

    public Customer(String c_account, String c_pass) {
        this.c_account = c_account;
        this.c_pass = c_pass;
    }

    public int getC_id() {
        return c_id;
    }

    public void setC_id(int c_id) {
        this.c_id = c_id;
    }

    public String getC_account() {
        return c_account;
    }

    public void setC_account(String c_account) {
        this.c_account = c_account;
    }

    public String getC_pass() {
        return c_pass;
    }

    public void setC_pass(String c_pass) {
        this.c_pass = c_pass;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "编号=" + c_id +
                ", 账号='" + c_account + '\'' +
                ", 密码='" + c_pass + '\'' +
                '}';
    }
}
