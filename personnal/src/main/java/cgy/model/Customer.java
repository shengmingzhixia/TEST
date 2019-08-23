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

    public int getId() {
        return c_id;
    }

    public void setId(int c_id) {
        this.c_id = c_id;
    }

    public String getAccount() {
        return c_account;
    }

    public void setAccount(String c_account) {
        this.c_account = c_account;
    }

    public String getPass() {
        return c_pass;
    }

    public void setPass(String c_pass) {
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
