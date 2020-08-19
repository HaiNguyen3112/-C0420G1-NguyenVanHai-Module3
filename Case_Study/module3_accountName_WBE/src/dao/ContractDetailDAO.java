package dao;

import model.ContractDetail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContractDetailDAO implements IContractDetailDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/case_study?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "heobong142";

    private static final String INSERT_CONTRACT_DETAIL_SQL = "INSERT INTO contract_detail VALUES(?,?,?,?);";

    public ContractDetailDAO (){

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
    public void insertContractDetail(ContractDetail contractDetail) {
        System.out.println(INSERT_CONTRACT_DETAIL_SQL);

        try(Connection connection = getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CONTRACT_DETAIL_SQL);
            preparedStatement.setInt(1,contractDetail.getId());
            preparedStatement.setInt(2,contractDetail.getContractId());
            preparedStatement.setInt(3,contractDetail.getAttachServiceId());
            preparedStatement.setInt(4,contractDetail.getQuantity());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
