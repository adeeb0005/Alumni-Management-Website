<%-- 
    Document   : viewproject
    Created on : May 15, 2022, 10:05:49 AM
    Author     : adeeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Project</title>
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
                <div class="row mt-4">
                    <!-- first col -->
                    <div class="col-md-4">
                        <!-- categories -->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">
                                All Project
                            </a>
                         
                            <a href="#" onclick="getPosts(<%= user.getId() %>, this)" class="c-link list-group-item list-group-item-action"> My Project</a>

                        </div>
                    </div>
                    <!-- second col -->
                    <div class="col-md-8">
                        <!-- post -->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">
                        
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
                   url: "load_project.jsp",
                   data:{dis: ids},
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
