/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Data.Helper;

import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        try{
            if(con == null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/alumnid","root", "3819209");
            }
        }catch(Exception e){
            e.printStackTrace();
            
        }
        return con;
    }
}
