<%@page import="com.Data.entities.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.dao.PostDao"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Notice</title>
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
        <%@include file="logged_navbar.jsp" %>
        <% if(user.getPermission() == 0){
                response.sendRedirect("waiting.jsp");
            }
        %>
        <main class="container text-center">
            <h2> Notice</h2>
                <%
                    PostDao dao = new PostDao(ConnectionProvider.getConnection());
                    ArrayList<Notice> list1 = dao.getAllNotice();
                    for(Notice cc: list1){
                %>
                <div class="container-fluid primary-background text-center text-white mt-3">
                <p><%= cc.getNote() %></p>
                </div>
                <%
                    }
                %>
                <a style="color: edf5f6" href="user_home.jsp" class="text-center mt-3"> home</a>
        </main>
        <!-- javaScript -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
