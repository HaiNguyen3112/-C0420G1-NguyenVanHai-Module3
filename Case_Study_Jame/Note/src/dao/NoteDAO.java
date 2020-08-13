package dao;

import model.Note;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class NoteDAO implements INoteDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/inotes?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "heobong142";

    private static final String INSERT_NOTE_SQL = "INSERT INTO note" + "  (id, title, content, type_id) VALUES " +
            " (? , ?, ?, ?);";

    private static final String DELETE_NOTE_SQL = "DELETE FROM note WHERE id =?;";
    private static final String UPDATE_NOTE_SQL = "UPDATE note SET title=?, content =?, type_id=? WHERE id =?;";
    private static final String SELECT_ALL_NOTE_SQL = "SELECT * FROM note;";
    private static final String SELECT_NOTE_BY_ID_SQL = "SELECT id,title,content,type_id FROM note WHERE id =?;";
    public NoteDAO(){

    }

    protected Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public Note selectNote(int id){
        Note note = null;
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NOTE_BY_ID_SQL);
                preparedStatement.setInt(1,id);
                System.out.println(preparedStatement);

                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()){
                    String title = rs.getString(2);
                    String content = rs.getString(3);
                    int type_id = rs.getInt(4);

                    note = new Note(id,type_id,title,content);

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return note;
    }


    public void insertNote(Note note) throws SQLException{
        System.out.println(INSERT_NOTE_SQL);
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement =connection.prepareStatement(INSERT_NOTE_SQL);
                preparedStatement.setInt(1,note.getId());
                preparedStatement.setString(2,note.getTitle());
                preparedStatement.setString(3, note.getContent());
                preparedStatement.setInt(4, note.getTypeId());
                System.out.println(preparedStatement);
                preparedStatement.executeUpdate();

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteNote(int id) throws  SQLException{

        try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_NOTE_SQL);
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            }
         catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateNote (Note note) throws SQLException{
        try(Connection connection = getConnection();){
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_NOTE_SQL);
            preparedStatement.setInt(4, note.getId());
            preparedStatement.setString(1, note.getTitle());
            preparedStatement.setString(2,note.getContent());
            preparedStatement.setInt(3,note.getTypeId());

            preparedStatement.executeUpdate();
        }
    }

    public List<Note> selectAllNote(){
        List<Note> notes = new ArrayList<>();
        try {
            try(Connection connection = getConnection();){
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_NOTE_SQL);
                System.out.println(preparedStatement);

                ResultSet rs = preparedStatement.executeQuery();

                while (rs.next()){
                    int id = rs.getInt(1);
                    String title = rs.getString(2);
                    String content = rs.getString(3);
                    int type_id = rs.getInt(4);

                    notes.add(new Note(id,type_id,title,content));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notes;
    }
    @Override
    public boolean save() {

        return false;
    }

    @Override
    public boolean delete() {
        return false;
    }
}
