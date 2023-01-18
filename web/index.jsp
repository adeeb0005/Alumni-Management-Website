<%-- 
    Document   : index
    Created on : May 7, 2022, 9:44:28 AM
    Author     : adeeb
--%>

<%@page import="com.Data.entities.User"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
User user = (User)session.getAttribute("currentUser");
if(user != null){
    response.sendRedirect("user_home.jsp");
}
%>
<%
User user2 = (User)session.getAttribute("adminUser");
if(user2 != null){
    response.sendRedirect("admin_home.jsp");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <!--<!-- css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 94%, 68% 91%, 31% 96%, 0 89%, 0 0);
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <%@include file="normal_navbar.jsp" %>
        
        <!-- Banner -->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background banner-background text-white">
                <div class="container">
                    <h4 class="display-3">Welcome to BSMRSTU CSE Alumni</h4>
                    <p>This is a database of alumni of Computer Science and Engineering Department of Bangabandhu Sheikh Mujibur Rahman Science and Technology University, Gopalganj.</p>
                    <a href="Register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Registration</a>
                    <a href="LogIn_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-sign-in"></span> Log In</a>
                </div>
            </div>
        </div>
        <!-- javaScript -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
