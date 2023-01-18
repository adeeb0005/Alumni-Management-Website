/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.entities;

/**
 *
 * @author adeeb
 */
public class Project {
    private String idea;
    private String feature;
    private String link;
    private String repoName;
    private String student_id;
    private String username;
    private int sid;
    private int id;
    Project(){
        
    }
    public Project(String idea, String feature, String link, String repoName, String student_id, String username, int sid, int id) {
        this.idea = idea;
        this.feature = feature;
        this.link = link;
        this.repoName = repoName;
        this.student_id = student_id;
        this.username = username;
        this.sid = sid;
        this.id = id;
    }
    public Project(String idea, String feature, String link, String repoName, String student_id, String username, int sid) {
        this.idea = idea;
        this.feature = feature;
        this.link = link;
        this.repoName = repoName;
        this.student_id = student_id;
        this.username = username;
        this.sid = sid;
    }

    public String getIdea() {
        return idea;
    }

    public void setIdea(String idea) {
        this.idea = idea;
    }

    public String getFeature() {
        return feature;
    }

    public void setFeature(String feature) {
        this.feature = feature;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getRepoName() {
        return repoName;
    }

    public void setRepoName(String repoName) {
        this.repoName = repoName;
    }

    public String getStudent_id() {
        return student_id;
    }

    public void setStudent_id(String student_id) {
        this.student_id = student_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
}
