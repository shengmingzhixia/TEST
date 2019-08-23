package cgy.service.impl;

import cgy.dao.CustomerDao;
import cgy.model.Customer;
import cgy.service.CustomerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerDao customerDao;

    @Override
    public boolean repetition(String account) {
        Customer customer = customerDao.repetition(account);
        if (customer == null) return false;
        return true;
    }

    @Override
    public boolean register(Customer customer) {
        if (customer == null ||
                customer.getAccount() == null ||
                customer.getPass() == null)
            return false;
        return customerDao.register(customer);
    }

    @Override
    public Customer login(Customer customer) {
        if (customer == null ||
                customer.getAccount() == null ||
                customer.getPass() == null)
            return null;
        return customerDao.getCustomer(customer);
    }
}
