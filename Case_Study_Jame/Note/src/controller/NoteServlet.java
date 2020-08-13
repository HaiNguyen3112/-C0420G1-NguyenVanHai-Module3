package controller;

import dao.NoteDAO;
import model.Note;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "NoteServlet", urlPatterns = "/notes")
public class NoteServlet extends HttpServlet {

    private NoteDAO noteDao;
    public void init(){
        noteDao = new NoteDAO();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action ="";
        }
        try {
            switch (action){
                case "create":
                    addNewNote(request,response);
                    break;
                case "edit":
                    editNote(request,response);
                    break;
                default:
                    listNote(request,response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action ="";
        }
        try{
            switch (action){
                case "create":
                    showCreatForm(request,response);
                    break;
                case "delete":
                    deleteNote(request,response);
                    break;
                case "edit":
                    showEditForm(request,response);
                    break;
                default:
                    listNote(request,response);
                    break;

            }
        } catch (SQLException ex){
            throw new ServletException(ex);
        }

    }

    public void listNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Note> noteList = noteDao.selectAllNote();

        request.setAttribute("listNote",noteList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request,response);
    }

    public void deleteNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
         noteDao.deleteNote(id);

        List<Note> noteList = noteDao.selectAllNote();
        request.setAttribute("listNote", noteList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        dispatcher.forward(request,response);
    }
    public void editNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Note newNote = new Note(id,typeId,title,content);
        noteDao.updateNote(newNote);
        RequestDispatcher dispatcher =request.getRequestDispatcher("user/edit.jsp");
        dispatcher.forward(request,response);
    }

    public void addNewNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Note newNote = new Note(id,typeId,title,content);

        noteDao.insertNote(newNote);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request,response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException,IOException{
        int id = Integer.parseInt(request.getParameter("id"));

        Note existingNote = noteDao.selectNote(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
        request.setAttribute("note",existingNote);
        dispatcher.forward(request,response);
    }

    private void showCreatForm(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request,response);
    }

    public List<Note> searchNotes(String keyword){
        List<Note> noteList = new ArrayList<>();

        return noteList;
    }

    public void addNote(int id, String title, String content){

    }

    public void removeNote(int noteId){

    }
}
