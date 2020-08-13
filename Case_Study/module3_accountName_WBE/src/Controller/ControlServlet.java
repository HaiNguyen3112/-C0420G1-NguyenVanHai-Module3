package Controller;

import dao.CustomerDAO;
import model.Customer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ControlServlet", urlPatterns = "/furama")
public class ControlServlet extends HttpServlet {
    private CustomerDAO customerDAO;
    public void init(){
        customerDAO = new CustomerDAO();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action ="";
        }
        switch (action){
            case "createcustomer":

                break;
            case "editcustomer":
                editCustomer(request,response);
                break;
            default:
                showHome(request,response);
                break;

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action ="";
        }
        switch (action){
            case "createcustomer":
                showAddNewCustomerForm(request,response);
                break;
            case "customer":
                listCustomer(request,response);
                break;
            case "editcustomer":
                showEditCustomerForm(request,response);
                break;
            case "delete":
                deleteCustomer(request,response);
                break;
            default:
                showHome(request,response);
                break;
        }
    }


    private void showAddNewCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/createCustomer.jsp");
        dispatcher.forward(request,response);
    }
    private void showHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/index.jsp");
        dispatcher.forward(request,response);
    }
    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerDAO.selectAllCustomer();

        request.setAttribute("listCustomer",customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/listCustomer.jsp");
        dispatcher.forward(request,response);
    }
    public void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("id"));
        customerDAO.deleteCustomer(id);

        List<Customer> customerList = customerDAO.selectAllCustomer();
        request.setAttribute("listCustomer",customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/listCustomer.jsp");
        dispatcher.forward(request,response);
    }

    private void showEditCustomerForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Customer existingCustomer = customerDAO.selectCustomer(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/editCustomer.jsp");
        request.setAttribute("customer",existingCustomer);
        dispatcher.forward(request,response);
    }

    public void editCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        Customer newCustomer = new Customer(id,typeId,name,birthday,gender,idCard,phone,email,address);
        customerDAO.updateCustomer(newCustomer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/editCustomer.jsp");
        dispatcher.forward(request,response);
    }

}
