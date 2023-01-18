package com.Data.entities;

import java.sql.*;

public class User {
    private String name;
    private String session;
    private String student_id;
    private String contact_number;
    private String email;
    private String password;
    private Timestamp dateTime;
    private String profile;
    private int permission;
    private int id;
    public User(String name, String session, String student_id, String contact_number, String email, String password, int id){
        this.name = name;
        this.session = session;
        this.student_id = student_id.toUpperCase();
        this.contact_number = contact_number;
        this.email = email;
        this.password = password;
        this.id = id;
    }
    public User(String name, String session, String student_id, String contact_number, String email, String password){
        this.name = name;
        this.session = session;
        this.student_id = student_id.toUpperCase();
        this.contact_number = contact_number;
        this.email = email;
        this.password = password;
    }
    //getter and setter

    public User() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id.toUpperCase();
    }

    public String getContact_number() {
        return contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
