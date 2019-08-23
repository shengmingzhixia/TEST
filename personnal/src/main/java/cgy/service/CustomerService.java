package cgy.service;

import cgy.model.Customer;

public interface CustomerService {
    //账号查重(true 是重复）
    boolean repetition(String account);

    //注册
    boolean register(Customer customer);

    //登录
    Customer login(Customer customer);
}
