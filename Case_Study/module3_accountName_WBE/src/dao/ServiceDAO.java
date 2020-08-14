package dao;

import model.Service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ServiceDAO implements IServiceDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "heobong142";

    private static final String INSERT_SERVICE_SQL = "INSERT INTO service VALUES (?,?,?,?,?,?,?,?,?,?,?);";
//    private static final String DELETE_CUSTOMER_SQL = " DELETE FROM customer WHERE customer_id =?;";
//    private static final String UPDATE_CUSTOMER_SQL = "UPDATE customer SET customer_type_id=?,customer_name=?,customer_birthday=?,customer_gender=?," +
//            "customer_id_card=?,customer_phone=?,customer_email=?,customer_address=? WHERE customer_id =?;";
//    private static final String SELECT_ALL_CUSTOMER_SQL ="SELECT * FROM customer;";
//    private static final String SELECT_CUSTOMER_BY_ID_SQL = "SELECT * FROM customer WHERE customer_id =?;";


    public ServiceDAO(){

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
    public void insertService(Service service) {
        System.out.println(INSERT_SERVICE_SQL);
        try(Connection connection = getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SERVICE_SQL);

            preparedStatement.setInt(1,service.getId());
            preparedStatement.setString(2,service.getName());
            preparedStatement.setInt(3,service.getArea());
            preparedStatement.setDouble(4,service.getCost());
            preparedStatement.setInt(5,service.getMax_people());
            preparedStatement.setInt(6,service.getRentTypeId());
            preparedStatement.setInt(7,service.getServiceTypeId());
            preparedStatement.setString(8,service.getStandardRoom());
            preparedStatement.setString(9,service.getDescriptionOtherConvenience());
            preparedStatement.setDouble(10,service.getPoolArea());
            preparedStatement.setInt(11,service.getNumberOfFloors());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
