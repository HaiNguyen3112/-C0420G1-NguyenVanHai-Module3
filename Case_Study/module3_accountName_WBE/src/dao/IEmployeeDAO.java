package dao;

import model.Employee;

import java.util.List;

public interface IEmployeeDAO {
    public List<Employee> selectAllEmployee();

    public void updateEmployee(Employee employee);

    public void deleteEmployee(int id);

    public void insertEmployee(Employee employee);

    public Employee selectEmployee(int id);
}
