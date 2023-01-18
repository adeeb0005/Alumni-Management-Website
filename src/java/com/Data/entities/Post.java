/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.entities;

/**
 *
 * @author adeeb
 */
public class Post {
    private String ps;
    private int id;
    private String username;
    private int userid;
    private String student_id;
    public Post(){
        
    }

    public Post(String ps, int id, String username, int userid, String student_id) {
        this.ps = ps;
        this.id = id;
        this.username = username;
        this.userid = userid;
        this.student_id = student_id;
    }

    public Post(String ps) {
        this.ps = ps;
    }

    public Post(String ps, String username, int userid, String student_id) {
        this.ps = ps;
        this.username = username;
        this.userid = userid;
        this.student_id = student_id;
    }

    public String getPs() {
        return ps;
    }

    public void setPs(String ps) {
        this.ps = ps;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }
}
