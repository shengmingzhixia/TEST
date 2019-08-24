package cgy.dao;

import cgy.model.Customer;

public interface CustomerDao {


    //注册
    boolean register(Customer customer);

    //账号查重(true 是重复）
    //登录
    Customer getCustomer(Customer customer);
}
