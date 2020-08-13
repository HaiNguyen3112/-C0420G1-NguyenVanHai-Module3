package model;

public class Note {
    protected int id;
    protected   int typeId;
    protected String title;
    protected String content;

    public Note() {
    }

    public Note(int id, int typeId, String title, String content) {
        this.id = id;
        this.typeId = typeId;
        this.title = title;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public boolean save(){
        return false;
    }

    public boolean delete(){
        return false;
    }
}

