package com.Data.dao;
import com.Data.entities.User;
import java.sql.*;
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    //method to insert user to database;
    public boolean saveUser(User user){
        boolean f = false;
        try{ 
            String query = "insert into user(name, session, student_id, contact_number, email, password) values (?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getSession());
            pstmt.setString(3, user.getStudent_id());
            pstmt.setString(4, user.getContact_number());
            pstmt.setString(5, user.getEmail());
            pstmt.setString(6, user.getPassword());
            pstmt.executeUpdate();
            f = true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    // get user by useremail and userpassword
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        try{
            String query="select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set=pstmt.executeQuery();
            if(set.next()){
                user = new User();
                String name = set.getString("name");
                user.setName(name);
                user.setSession(set.getString("session"));
                user.setStudent_id(set.getString("student_id"));
                user.setContact_number(set.getString("contact_number"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setPermission(set.getInt("permission"));
                user.setId(set.getInt("id"));
            }
             
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public boolean updateUser(User user){
        boolean f = false;
        try{
            String query = "update user set name=? , session=? , email=?, profile=? where student_id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(3, user.getEmail());
            p.setString(2, user.getSession());
            p.setString(5, user.getStudent_id());
            p.setString(4, user.getProfile());
            p.executeUpdate();
             f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public User getAdminByUsernameAndPassword(String username, String password){
        User user = null;
        try{
            String query="select * from admin where username=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            ResultSet set=pstmt.executeQuery();
            if(set.next()){
                user = new User();
                String name = set.getString("username");
                user.setName(name);
            }
             
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public boolean deleteUser(String student_id){
        boolean f = false;
        try{
            String query = "delete from user where student_id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, student_id);
            p.executeUpdate();
             f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean acceptUser(String student_id){
        boolean f = false;
        try{
            String query = "update user set permission=1 where student_id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, student_id);
            p.executeUpdate();
             f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public boolean deleteNotice(int id){
        boolean f = false;
        try{
            String query = "delete from admin_post where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, id);
            p.executeUpdate();
             f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
