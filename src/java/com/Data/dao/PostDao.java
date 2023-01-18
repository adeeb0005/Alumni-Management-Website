/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.dao;

/**
 *
 * @author adeeb
 */
import com.Data.entities.CatSession;
import com.Data.entities.Category;
import com.Data.entities.Notice;
import com.Data.entities.Post;
import com.Data.entities.Project;
import com.Data.entities.User;
import com.Data.entities.UserProfile;
import java.sql.*;
import java.util.ArrayList;
public class PostDao {
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    public ArrayList<CatSession> getAllCategories(){
        ArrayList<CatSession> list = new ArrayList<>();
        try{
            String q = "select * from session";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                String session = set.getString("session");
                int id = set.getInt("id");
                CatSession c = new CatSession(session, id);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Category> getAll(){
        ArrayList<Category> list = new ArrayList<>();
        try{
            String q = "select * from user where permission=1";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                String session = set.getString("session");
                String name = set.getString("name");
                String student_id = set.getString("student_id");
                String contact_no = set.getString("contact_number");
                String email = set.getString("email");
                String profile = set.getString("profile");
                Category c = new Category(session, name, student_id, contact_no, email, profile);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Category> getSome(int id){
        ArrayList<Category> list = new ArrayList<>();
        try{
            String qq = "select session from session where id=?";
            PreparedStatement ps = con.prepareStatement(qq);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            String sesion = "";
            while(rs.next()){
                sesion = rs.getString("session");
            }
            String q = "select * from user where session=? and permission=1";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, sesion);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                String session = set.getString("session");
                String name = set.getString("name");
                String student_id = set.getString("student_id");
                String contact_no = set.getString("contact_number");
                String email = set.getString("email");
                String profile = set.getString("profile");
                Category c = new Category(session, name, student_id, contact_no, email, profile);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public Category getDetailsById(String student_id){
        Category post = null;
        try{
            String query = "select * from user where student_id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, student_id);
            ResultSet set = p.executeQuery();
            if(set.next()){
                String session = set.getString("session");
                String name = set.getString("name");
                String contact_no = set.getString("contact_number");
                String email = set.getString("email");
                String profile = set.getString("profile");
                post = new Category(session, name, student_id, contact_no, email, profile);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return post;
    }
    public Project getDetailsById(int project_id){
        Project c = null;
        try{
            String query = "select * from project where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, project_id);
            ResultSet set = p.executeQuery();
            if(set.next()){
                String idea = set.getString("idea");
                String feature = set.getString("feature");
                String link = set.getString("link");
                String repoName = set.getString("repo");
                String student_id = set.getString("student_id");
                String username = set.getString("username");
                int sid = set.getInt("sid");
                int id = set.getInt("id");
                c = new Project(idea, feature, link, repoName, student_id, username, sid, id);
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return c;
    }
    public ArrayList<Category> getAll(int sig){
        ArrayList<Category> list = new ArrayList<>();
        try{
            String q = "select * from user where permission=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, sig);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                String session = set.getString("session");
                String name = set.getString("name");
                String student_id = set.getString("student_id");
                String contact_no = set.getString("contact_number");
                String email = set.getString("email");
                String profile = set.getString("profile");
                Category c = new Category(session, name, student_id, contact_no, email, profile);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Category> getSome(int id, int sig){
        ArrayList<Category> list = new ArrayList<>();
        try{
            String qq = "select session from session where id=?";
            PreparedStatement ps = con.prepareStatement(qq);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            String sesion = "";
            while(rs.next()){
                sesion = rs.getString("session");
            }
            String q = "select * from user where session=? and permission=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, sesion);
            pstmt.setInt(2, sig);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                String session = set.getString("session");
                String name = set.getString("name");
                String student_id = set.getString("student_id");
                String contact_no = set.getString("contact_number");
                String email = set.getString("email");
                String profile = set.getString("profile");
                Category c = new Category(session, name, student_id, contact_no, email, profile);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public boolean saveProject(Project project){
        boolean f = false;
        try{ 
            String query = "insert into project(idea, feature, link, repo, student_id, username, sid) values (?,?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, project.getIdea());
            pstmt.setString(2, project.getFeature());
            pstmt.setString(3, project.getLink());
            pstmt.setString(4, project.getRepoName());
            pstmt.setString(5, project.getStudent_id());
            pstmt.setString(6, project.getUsername());
            pstmt.setInt(7, project.getSid());
            pstmt.executeUpdate();
            f = true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public ArrayList<Project> getAllProject(){
        ArrayList<Project> list = new ArrayList<>();
        try{
            String q = "select * from project";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                String idea = set.getString("idea");
                String feature = set.getString("feature");
                String link = set.getString("link");
                String repoName = set.getString("repo");
                String student_id = set.getString("student_id");
                String username = set.getString("username");
                int sid = set.getInt("sid");
                int id = set.getInt("id");
                Project c = new Project(idea, feature, link, repoName, student_id, username, sid, id);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Project> getSomeProject(int sid){
        ArrayList<Project> list = new ArrayList<>();
        try{
            String q = "select * from project where sid=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, sid);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                String idea = set.getString("idea");
                String feature = set.getString("feature");
                String link = set.getString("link");
                String repoName = set.getString("repo");
                String student_id = set.getString("student_id");
                String username = set.getString("username");
                Project c = new Project(idea, feature, link, repoName, student_id, username, sid);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public boolean saveNotice(Notice notice){
        boolean f = false;
        try{ 
            String query = "insert into admin_post(notice) values (?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, notice.getNote());
            pstmt.executeUpdate();
            f = true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public ArrayList<Notice> getAllNotice(){
        ArrayList<Notice> list = new ArrayList<>();
        try{
            String q = "select * from admin_post";
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                String notice = set.getString("notice");
                int id = set.getInt("id");
                Notice c = new Notice(notice, id);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public boolean savePost(Post post){
        boolean f = false;
        try{ 
            String query = "insert into user_post(post, user_id, username, student_id) values (?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, post.getPs());
            pstmt.setInt(2, post.getUserid());
            pstmt.setString(3, post.getUsername());
            pstmt.setString(4, post.getStudent_id());
            pstmt.executeUpdate();
            f = true;
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    public ArrayList<Post> getAllPost(){
        ArrayList<Post> list = new ArrayList<>();
        try{
            String q = "select * from user_post";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                int id = set.getInt("id");
                String post = set.getString("post");
                int user_id = set.getInt("user_id");
                String username = set.getString("username");
                String student_id = set.getString("student_id");
                Post c = new Post(post, id, username, user_id, student_id);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Post> getSomePost(int userid){
        ArrayList<Post> list = new ArrayList<>();
        try{
            String q = "select * from user_post  where user_id=?";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setInt(1, userid);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                int id = set.getInt("id");
                String post = set.getString("post");
                int user_id = set.getInt("user_id");
                String username = set.getString("username");
                String student_id = set.getString("student_id");
                Post c = new Post(post, id, username, user_id, student_id);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<UserProfile> getAllProfileMatch(String name){
        ArrayList<UserProfile> list = new ArrayList<>();
        try{
            String q = "select name,student_id,profile from user where name like '%"+name+"%'";
            PreparedStatement pstmt = con.prepareStatement(q);
            ResultSet set=pstmt.executeQuery();
            while(set.next()){
                String Name = set.getString("name");
                String student_id = set.getString("student_id");
                String profile = set.getString("profile");
                UserProfile c = new UserProfile(Name, student_id, profile);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Project> getAllProjectMatch(String pos){
        ArrayList<Project> list = new ArrayList<>();
        try{
            String q = "select * from project where idea like '%" + pos + "%'";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            while(set.next()){
                String idea = set.getString("idea");
                String feature = set.getString("feature");
                String link = set.getString("link");
                String repoName = set.getString("repo");
                String student_id = set.getString("student_id");
                String username = set.getString("username");
                int sid = set.getInt("sid");
                int id = set.getInt("id");
                Project c = new Project(idea, feature, link, repoName, student_id, username, sid, id);
                list.add(c);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
