/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.entities;

/**
 *
 * @author adeeb
 */
public class Notice {
    private String note;
    private int id;
    Notice(){
        
    }
    public Notice(String note, int id) {
        this.note = note;
        this.id = id;
    }

    public Notice(String note) {
        this.note = note;
    }
    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
}
