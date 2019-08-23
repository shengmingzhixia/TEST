package cgy.dao;

import cgy.model.Customer;

public interface CustomerDao {
    //账号查重(true 是重复）
    Customer repetition(String account);

    //注册
    boolean register(Customer customer);

    //登录
    Customer getCustomer(Customer customer);
}
