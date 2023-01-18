/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.entities;

/**
 *
 * @author adeeb
 */
public class UserProfile {
    private String name;
    private String student_id;
    private String profile;
    public UserProfile(){
        
    }

    public UserProfile(String name, String student_id, String profile) {
        this.name = name;
        this.student_id = student_id;
        this.profile = profile;
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

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
}
