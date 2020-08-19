package dao;

import model.Contract;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContractDAO implements IContractDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "heobong142";

    private static final String INSERT_CONTRACT_SQL ="INSERT INTO contract VALUES (?,?,?,?,?,?,?,?);";

    public ContractDAO(){

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
    public void insertContract(Contract contract) {
        System.out.println(INSERT_CONTRACT_SQL);
        try(Connection connection = getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT_SQL);

            preparedStatement.setInt(1,contract.getId());
            preparedStatement.setString(2,contract.getStartDate());
            preparedStatement.setString(3,contract.getEndDate());
            preparedStatement.setDouble(4,contract.getDeposit());
            preparedStatement.setDouble(5,contract.getTotalMoney());
            preparedStatement.setInt(6,contract.getEmployeeId());
            preparedStatement.setInt(7,contract.getCustomerId());
            preparedStatement.setInt(8,contract.getServiceId());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
