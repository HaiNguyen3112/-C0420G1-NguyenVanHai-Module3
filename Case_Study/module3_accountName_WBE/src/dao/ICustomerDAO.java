package dao;

import model.Customer;

import java.util.List;

public interface ICustomerDAO {
    public List<Customer> selectAllCustomer();

    public void updateCustomer(Customer customer);

    public void deleteCustomer(int id);

    public void insertCustomer(Customer customer);

    public Customer selectCustomer(int id);

    public List<Customer> findCustomerByName(String name);

}
