<%-- 
    Document   : user_home
    Created on : May 14, 2022, 10:35:57 PM
    Author     : adeeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- navbar -->
        <%@include file="logged_navbar.jsp" %>
        <% if(user.getPermission() == 0){
                response.sendRedirect("waiting.jsp");
            }
        %>
        <main>
            <div class="container primary-background banner-background text-center text-white mt-1 p-4">
                <form action="SearchServlet" method="POST">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Search by Keyword</label>
                        <input name="search" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter keyword" required>
                    </div>
                    <div class="form-group">
                        <input type="radio" id="customRadio1" value="1" name="wtd" class="form-group" required>
                        <label class="form-group" for="customRadio1">Search name by keyword</label>
                    </div>
                    <div class="form-group">
                        <input type="radio" id="customRadio2" value="2" name="wtd" class="form-group" required>
                        <label class="form-group" for="customRadio2">Search project idea by keyword </label>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </main>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
