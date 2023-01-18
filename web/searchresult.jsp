<%@page import="com.Data.entities.Project"%>
<%@page import="com.Data.entities.Post"%>
<%@page import="com.Data.entities.UserProfile"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Data.entities.Category"%>
<%@page import="com.Data.dao.PostDao"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp" %>
<%
  String student_name = request.getParameter("name");
  String idea = request.getParameter("idea");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result</title>
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
        <!-- navbar -->
        <%@include file="logged_navbar.jsp" %>
        <% if(user.getPermission() == 0){
                response.sendRedirect("waiting.jsp");
            }
        %>
        <main>
            <div class="container">
                <%
                        if(student_name!=""){
                     %>
                <div class="card-columns m-3">
                         <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<UserProfile> list1 = d.getAllProfileMatch(student_name);
                                for(UserProfile cc: list1){
                                    %>
                                    <div class="card"> 
                                        <img class="card-img-top" style="width: 10rem" src="img/<%= cc.getProfile()%>" alt="Card image cap">
                                        <div class="card-body"> 
                                           <b> <%= cc.getName() %></b>
                                        </div>
                                        <div>
                                            <div class="card-footer primary-background text-center" style="width:13rem">
                                                <a href="show_profile.jsp?student_id=<%= cc.getStudent_id() %>" class="btn btn-outline-light">View Profile</a>
                                            </div>
                                        </div>
                                    </div>
                            <%    }
                            %>
                </div>
                <%
                    }
                %>
                <!<!-- idea -->
                <%
                        if(idea!=""){
                     %>
                <div class="card-columns">
                         <%
                                PostDao d = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Project> list1 = d.getAllProjectMatch(idea);
                                for(Project cc: list1){
                                    %>
                                    <div class="card"> 
                                        <div class="card" style="width: 18rem;">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= cc.getIdea() %></h5>
                                                <p class="card-text">By <a href="show_profile.jsp?student_id=<%= cc.getStudent_id() %>"> <%= cc.getUsername() %> </a> </p>
                                                <a href="show_project.jsp?project_id=<%= cc.getId() %>" class="card-link">View</a>                                         
                                            </div>
                                        </div>
                                    </div>
                            <%    }
                            %>
                </div>
                <%
                    }
                %>
                <a type="button" class="btn btn-primary btn-lg m-3 text-center" href="search.jsp"> Back</a>
            </div>
        </main>
        <!-- javaScript -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
