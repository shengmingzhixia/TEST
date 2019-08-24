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
        if (account == null) return false;
        Customer customer = new Customer();
        customer.setC_account(account);
        Customer customer1 = customerDao.getCustomer(customer);
        if (customer1 == null) return false;
        return true;
    }

    @Override
    public boolean register(Customer customer) {
        if (customer == null ||
                customer.getC_account() == null ||
                customer.getC_pass() == null)
            return false;
        return customerDao.register(customer);
    }

    @Override
    public Customer login(Customer customer) {
        if (customer == null ||
                customer.getC_account() == null ||
                customer.getC_pass() == null)
            return null;
        return customerDao.getCustomer(customer);
    }
}
