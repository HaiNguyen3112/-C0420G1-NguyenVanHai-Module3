package dao;

import model.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO implements IEmployeeDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "heobong142";

    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employee VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM employee WHERE employee_id =?;";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE employee SET employee_name =?,employee_birthday=?,employee_id_card=?,employee_salary=?,employee_phone=?," +
            "employee_email=?,employee_address=?,position_id=?,education_degree_id=?,division_id=?,username=? WHERE employee_id=?;";
    private static final String  SELECT_ALL_EMPLOYEE ="SELECT * FROM employee;";
    private static final String SELECT_EMPLOYEE_SQL ="SELECT * FROM employee WHERE employee_id=?;";

    public EmployeeDAO(){

    }

    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return  connection;
    }

    @Override
    public List<Employee> selectAllEmployee() {
        List<Employee> employeeList = new ArrayList<>();

        try (Connection connection = getConnection();) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String birthday = rs.getString(3);
                String idCard = rs.getString(4);
                double salary = rs.getDouble(5);
                String phone = rs.getString(6);
                String email = rs.getString(7);
                String address = rs.getString(8);
                int position = rs.getInt(9);
                int educationDegreeId = rs.getInt(10);
                int divisonId = rs.getInt(11);
                String username = rs.getString(12);

                employeeList.add(new Employee(id,name,birthday,idCard,salary,phone,email,address,position,educationDegreeId,divisonId,username));

            }


        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeeList;
    }

    @Override
    public void updateEmployee(Employee employee) {
        try {
            try(Connection connection = getConnection()){
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL);

                preparedStatement.setInt(12,employee.getId());
                preparedStatement.setString(1,employee.getName());
                preparedStatement.setString(2,employee.getBirthday());
                preparedStatement.setString(3,employee.getIdCard());
                preparedStatement.setDouble(4,employee.getSalary());
                preparedStatement.setString(5,employee.getPhone());
                preparedStatement.setString(6,employee.getEmail());
                preparedStatement.setString(7,employee.getAddress());
                preparedStatement.setInt(8,employee.getPosition());
                preparedStatement.setInt(9,employee.getEducationDegreeId());
                preparedStatement.setInt(10,employee.getDivisionId());
                preparedStatement.setString(11,employee.getUsername());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteEmployee(int id) {
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE_SQL);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertEmployee(Employee employee) {
        System.out.println(INSERT_EMPLOYEE_SQL);
        try(Connection connection = getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL);

            preparedStatement.setInt(1,employee.getId());
            preparedStatement.setString(2,employee.getName());
            preparedStatement.setString(3,employee.getBirthday());
            preparedStatement.setString(4,employee.getIdCard());
            preparedStatement.setDouble(5,employee.getSalary());
            preparedStatement.setString(6,employee.getPhone());
            preparedStatement.setString(7,employee.getEmail());
            preparedStatement.setString(8,employee.getAddress());
            preparedStatement.setInt(9,employee.getPosition());
            preparedStatement.setInt(10,employee.getEducationDegreeId());
            preparedStatement.setInt(11,employee.getDivisionId());
            preparedStatement.setString(12,employee.getUsername());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employee selectEmployee(int id) {
        Employee employee = null;
        try(Connection connection = getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_SQL);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                String name = rs.getString(2);
                String birthday = rs.getString(3);
                String idCard = rs.getString(4);
                double salary = rs.getDouble(5);
                String phone = rs.getString(6);
                String email = rs.getString(7);
                String address = rs.getString(8);
                int position = rs.getInt(9);
                int educationDegreeId = rs.getInt(10);
                int divisonId = rs.getInt(11);
                String username = rs.getString(12);

                employee = new Employee(id,name,birthday,idCard,salary,phone,email,address,position,educationDegreeId,divisonId,username);

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }
}
