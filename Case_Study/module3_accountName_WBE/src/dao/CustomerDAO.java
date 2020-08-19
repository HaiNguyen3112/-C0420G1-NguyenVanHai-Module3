package dao;

import model.Customer;
import model.Employee;
import sun.applet.AppletResourceLoader;

import javax.servlet.RequestDispatcher;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO implements ICustomerDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "heobong142";

    private static final String INSERT_CUSTOMER_SQL = "INSERT INTO customer (customer_id,customer_type_id,customer_name,customer_birthday,customer_gender,customer_id_card,customer_phone,customer_email,customer_address)" +
            " VALUES (?,?,?,?,?,?,?,?,?);";
    private static final String DELETE_CUSTOMER_SQL = " DELETE FROM customer WHERE customer_id =?;";
    private static final String UPDATE_CUSTOMER_SQL = "UPDATE customer SET customer_type_id=?,customer_name=?,customer_birthday=?,customer_gender=?," +
            "customer_id_card=?,customer_phone=?,customer_email=?,customer_address=? WHERE customer_id =?;";
    private static final String SELECT_ALL_CUSTOMER_SQL ="SELECT * FROM customer;";
    private static final String SELECT_CUSTOMER_BY_ID_SQL = "SELECT * FROM customer WHERE customer_id =?;";
    private static final String SELECT_CUSTOMER_BY_NAME_SQL = "SELECT * FROM customer WHERE customer_name =?;";

    public CustomerDAO(){

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
    public List<Customer> selectAllCustomer() {
        List<Customer> customerList = new ArrayList<>();
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER_SQL);
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()){
                    int id = rs.getInt(1);
                    int typeId = rs.getInt(2);
                    String name = rs.getString(3);

                    String birthday = rs.getString(4);
                    DateFormat from = new SimpleDateFormat("yyyy-MM-dd");
                    DateFormat to = new SimpleDateFormat("dd-MM-yyyy");
                    birthday = to.format(from.parse(birthday));

                    int gender = rs.getInt(5);
                    String idCard = rs.getString(6);
                    String phone = rs.getString(7);
                    String email = rs.getString(8);
                    String address = rs.getString(9);

                    customerList.add(new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address));
                }
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public void updateCustomer(Customer customer) {
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER_SQL);

                preparedStatement.setInt(9, customer.getId());
                preparedStatement.setInt(1,customer.getTypeId());
                preparedStatement.setString(2,customer.getName());
                preparedStatement.setString(3,customer.getBirthday());
                preparedStatement.setInt(4,customer.getGender());
                preparedStatement.setString(5,customer.getIdCard());
                preparedStatement.setString(6,customer.getPhone());
                preparedStatement.setString(7,customer.getEmail());
                preparedStatement.setString(8,customer.getAddress());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCustomer(int id){
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CUSTOMER_SQL);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void insertCustomer(Customer customer) {
        System.out.println(INSERT_CUSTOMER_SQL);

        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER_SQL);
                preparedStatement.setInt(1,customer.getId());
                preparedStatement.setInt(2,customer.getTypeId());
                preparedStatement.setString(3,customer.getName());
                preparedStatement.setString(4,customer.getBirthday());
                preparedStatement.setInt(5,customer.getGender());
                preparedStatement.setString(6,customer.getIdCard());
                preparedStatement.setString(7,customer.getPhone());
                preparedStatement.setString(8,customer.getEmail());
                preparedStatement.setString(9,customer.getAddress());

                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Customer selectCustomer(int id) {
        Customer customer = null;

        try(Connection connection  = getConnection();) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID_SQL);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int typeId= rs.getInt(2);
                String name = rs.getString(3);
                String birthday = rs.getString(4);
                int gender = rs.getInt(5);
                String idCard = rs.getString(6);
                String phone = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);

                customer = new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public List<Customer> findCustomerByName(String name) {
        List<Customer> customerList = new ArrayList<>();

        try(Connection connection = getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_NAME_SQL);
            preparedStatement.setString(1,name);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int id = rs.getInt(1);
                int typeId= rs.getInt(2);
                String birthday = rs.getString(4);
                int gender = rs.getInt(5);
                String idCard = rs.getString(6);
                String phone = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);

                customerList.add (new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address)) ;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerList;
    }


}
