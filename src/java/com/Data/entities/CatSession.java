/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.entities;

/**
 *
 * @author adeeb
 */
public class CatSession {
    private String session;
    private int id;
    public CatSession(String session, int id) {
        this.session = session;
        this.id = id;
    }

    public CatSession() {
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
