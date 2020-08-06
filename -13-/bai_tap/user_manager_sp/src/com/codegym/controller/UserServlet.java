package com.codegym.controller;

import com.codegym.dao.UserDAO;
import com.codegym.model.User;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUserWithStore(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUserWithStore(request, response);
                    break;
                default:
                    listUserWithStore(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

//    private void listUser(HttpServletRequest request, HttpServletResponse response)
//            throws SQLException, IOException, ServletException {
//        List<User> listUser = userDAO.selectAllUsers();
//        request.setAttribute("listUser", listUser);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
//        dispatcher.forward(request, response);
//    }
    private void listUserWithStore(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        //List<User> listUser = userDAO.selectAllUsers();

        List<User> listUser = userDAO.selectAllUserStore();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }


    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
//        User existingUser = userDAO.selectUser(id);
        User existingUser = userDAO.getUserById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(name, email, country);
//        userDAO.insertUser(newUser);
        userDAO.insertUserStore(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }


    private void updateUserWithStore(HttpServletRequest request, HttpServletResponse response){
        User user = new User();
        user.setId(Integer.parseInt(request.getParameter("id")) );
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setCountry(request.getParameter("country"));

        try {
            userDAO.updateUserStore(user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
            dispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void deleteUserWithStore (HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUserStore(id);

        List<User> listUser = userDAO.selectAllUsers();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request, response);
    }
}
