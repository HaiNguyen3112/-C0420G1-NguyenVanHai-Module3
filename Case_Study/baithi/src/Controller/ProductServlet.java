package Controller;

import Model.Product;
import dao.ProductDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/product")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO;
    public void init(){
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "createproduct":
                addNewProduct(request,response);
                break;
            case "editproduct":
                editProduct(request,response);
                break;
            case "product":
                listProduct(request,response);
                break;
            case "findproduct":
                showProductByName(request,response);
                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "createproduct":
                showAddNewProduct(request,response);
                break;
            case "editproduct":
                showEditProductForm(request,response);
                break;
            case "deleteproduct":
                deleteProduct(request,response);
                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productDAO.selectAllProduct();

        request.setAttribute("listProduct",productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/listProduct.jsp");
        dispatcher.forward(request,response);
    }
    private void showAddNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/createProduct.jsp");
        dispatcher.forward(request,response);
    }

    public void addNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String descriptions = request.getParameter("descriptions");
        String category = request.getParameter("category");

        Product product = new Product(id,name,price,quantity,color,descriptions,category);
        productDAO.insertProduct(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/createProduct.jsp");
        dispatcher.forward(request,response);
    }

    private void showEditProductForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Product existingProduct = productDAO.selectProduct(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/editProduct.jsp");
        request.setAttribute("product",existingProduct);
        dispatcher.forward(request,response);
    }
    public void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String color = request.getParameter("color");
        String descriptions = request.getParameter("descriptions");
        String category = request.getParameter("category");

        Product product = new Product(id,name,price,quantity,color,descriptions,category);
        productDAO.updateProduct(product);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/editProduct.jsp");
        dispatcher.forward(request,response);
    }
    private void showProductByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameFind");
        name = "%"+name+"%";
        List<Product> productList = productDAO.findProductByName(name);

        request.setAttribute("listProduct",productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/listProduct.jsp");
        dispatcher.forward(request,response);
    }

    public void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        productDAO.deleteProduct(id);

        List<Product> productList = productDAO.selectAllProduct();
        request.setAttribute("listProduct",productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/listProduct.jsp");
        dispatcher.forward(request,response);
    }
}
