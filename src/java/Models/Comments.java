package Models;
// Generated Jan 4, 2021 6:34:40 PM by Hibernate Tools 4.3.1



/**
 * Comments generated by hbm2java
 */
public class Comments  implements java.io.Serializable {


     private Integer commentId;
     private Hotels hotels;
     private Users users;
     private String commentContent;

    public Comments() {
    }

    public Comments(Hotels hotels, Users users, String commentContent) {
       this.hotels = hotels;
       this.users = users;
       this.commentContent = commentContent;
    }
   
    public Integer getCommentId() {
        return this.commentId;
    }
    
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }
    public Hotels getHotels() {
        return this.hotels;
    }
    
    public void setHotels(Hotels hotels) {
        this.hotels = hotels;
    }
    public Users getUsers() {
        return this.users;
    }
    
    public void setUsers(Users users) {
        this.users = users;
    }
    public String getCommentContent() {
        return this.commentContent;
    }
    
    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }




}


