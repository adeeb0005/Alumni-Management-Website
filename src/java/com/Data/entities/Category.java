/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.entities;


/**
 *
 * @author adeeb
 */
public class Category {
    private String session;
    private String name;
    private String student_id;
    private String contact_no;
    private String email;
    private String profile;
    public Category(String session, String name, String student_id, String contact_no, String email, String profile) {
        this.session = session;
        this.name = name;
        this.student_id = student_id;
        this.contact_no = contact_no;
        this.email = email;
        this.profile = profile;
    }
    public Category(){
    }
    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getContact_no() {
        return contact_no;
    }

    public void setContact_no(String contact_no) {
        this.contact_no = contact_no;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
}
