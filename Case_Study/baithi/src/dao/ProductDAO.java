package dao;

import Model.Product;

import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO implements IProductDAO {


    private String jdbcURL = "jdbc:mysql://localhost:3306/exam?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "heobong142";

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product VALUES (?,?,?,?,?,?,?);";
    private static final String DELETE_PRODUCT_SQL = " DELETE FROM product WHERE id =?;";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE product SET `name`=?,price=?,quantity=?," +
            "color=?,descriptions=?,category=? WHERE id =?;";
    private static final String SELECT_ALL_PRODUCT_SQL ="SELECT * FROM product;";
    private static final String SELECT_PRODUCT_BY_ID_SQL = "SELECT * FROM product WHERE id =?;";
    private static final String SELECT_PRODUCT_BY_NAME_SQL = "SELECT * FROM product WHERE name LIKE ?";

    public ProductDAO(){

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
    public List<Product> selectAllProduct() {

        List<Product> productList = new ArrayList<>();
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCT_SQL);
                System.out.println(preparedStatement);
                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()){
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    double price = rs.getDouble(3);
                    int quantity = rs.getInt(4);
                    String color = rs.getString(5);
                    String descriptions = rs.getString(6);
                    String category =  rs.getString(7);

                    productList.add(new Product(id,name,price,quantity,color,descriptions,category));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public void updateProduct(Product product) {
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PRODUCT_SQL);

                preparedStatement.setInt(7, product.getId());
                preparedStatement.setString(1,product.getName());
                preparedStatement.setDouble(2,product.getPrice());
                preparedStatement.setInt(3,product.getQuantity());
                preparedStatement.setString(4,product.getColor());
                preparedStatement.setString(5,product.getDescriptions());
                preparedStatement.setString(6,product.getCategory());

                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_SQL);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void insertProduct(Product product) {
        System.out.println(INSERT_PRODUCT_SQL);

        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCT_SQL);
                preparedStatement.setInt(1,product.getId());
                preparedStatement.setString(2,product.getName());
                preparedStatement.setDouble(3,product.getPrice());
                preparedStatement.setInt(4,product.getQuantity());
                preparedStatement.setString(5,product.getColor());
                preparedStatement.setString(6,product.getDescriptions());
                preparedStatement.setString(7,product.getCategory());

                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product selectProduct(int id) {
        Product product = null;

        try(Connection connection  = getConnection();) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID_SQL);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){

                String name = rs.getString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                String color = rs.getString(5);
                String descriptions = rs.getString(6);
                String category =  rs.getString(7);

                product = new Product(id,name,price,quantity,color,descriptions,category);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> findProductByName(String name) {
        List<Product> productList = new ArrayList<>();

        try(Connection connection = getConnection()) {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_NAME_SQL);
            preparedStatement.setString(1,name);
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int id = rs.getInt(1);
                String tempname = rs.getString(2);
                double price = rs.getDouble(3);
                int quantity = rs.getInt(4);
                String color = rs.getString(5);
                String descriptions = rs.getString(6);
                String category =  rs.getString(7);

                productList.add(new Product(id,tempname,price,quantity,color,descriptions,category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productList;
    }
}
