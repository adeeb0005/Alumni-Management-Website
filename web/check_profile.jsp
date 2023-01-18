<%@page import="com.Data.entities.Category"%>
<%@page import="com.Data.dao.PostDao"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<%@page errorPage="error_page.jsp" %>
<%
  String student_id = request.getParameter("student_id");
  PostDao d = new PostDao(ConnectionProvider.getConnection());
  Category p = d.getDetailsById(student_id);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getName() %></title>
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
        <%@include file="admin_navbar.jsp" %>
        <div class="container-fluid primary-background text-white">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card-header">
                        <img class="card-img-top" style="width: 50%" src="img/<%= p.getProfile() %>" alt="Card image cap">
                        <h4 class="mt-2"><%= p.getName() %></h4>
                    </div>
                    <div class="card-body">
                        <table class="table-hover">
                            <tbody>
                                <tr>
                                    <th class="text-left" scope="row">Contact No  </th>
                                    <td class="text-center">|</td>
                                    <td class="text-right">    <%= p.getContact_no() %></td>
                                </tr>
                                <tr>
                                    <th class="text-left" scope="row">Email Address   </th>
                                    <td class="text-center">|</td>
                                    <td class="text-right">    <%= p.getEmail() %></td>
                                </tr>
                                <tr>
                                    <th class="text-left" scope="row">Session </th>
                                    <td class="text-center">|</td>
                                    <td class="text-right">    <%= p.getSession() %></td>
                                </tr>
                            </tbody>
                        </table>
                    <a type="button" class="btn btn-primary btn-lg" href="accepting.jsp?student_id=<%= p.getStudent_id() %>">Accept</a>
                    <a type="button" class="btn btn-primary btn-lg" href="rejecting.jsp?student_id=<%= p.getStudent_id() %>">Reject</a>
                    <a type="button" class="btn btn-primary btn-lg" href="request_user.jsp">Back</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- javaScript -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            function getPosts(ids, temp){
                $("#loader").show();
                $("#post-container").hide();
                
                $(".c-link").removeClass('active');
                $.ajax({
                   url: "load_post.jsp",
                   data:{sid: ids},
                   success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                });
            }
            $(document).ready(function(){
                let allPostRef=$('.c-link')[0]
                getPosts(0, allPostRef);
            });
        </script>
    </body>
</html>
