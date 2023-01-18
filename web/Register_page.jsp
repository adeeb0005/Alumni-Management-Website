<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
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
        <%@include file="normal_navbar.jsp" %>
        <main class="primary-background p-5 banner-background">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center">
                            <span class="fa fa-3x fa-user-plus"></span>
                            <br>Register Here
                        </div>
                        <div class="card-body">
                            <form id="reg-form"  action="RegisterServlet" method="POST">
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="mr-sm-2" for="inlineFormCustomSelect">Session</label>
                                        <select name="user_session" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected>Choose...</option>
                                            <option value="2011-12">2011-12</option>
                                            <option value="2012-13">2012-13</option>
                                            <option value="2013-14">2013-14</option>
                                            <option value="2014-15">2014-15</option>
                                            <option value="2015-16">2015-16</option>
                                            <option value="2016-17">2016-17</option>
                                            <option value="2017-18">2017-18</option>
                                            <option value="2018-19">2018-19</option>
                                            <option value="2019-20">2019-20</option>
                                            <option value="2020-21">2020-21</option>
                                        </select>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="student_id">Student ID</label>
                                        <input name="user_student_id" type="text" class="form-control" id="student_id" aria-describedby="emailHelp" placeholder="Enter Student ID">
                                    </div>
                                        
                                    <div class="form-group">
                                        <label for="contact_no">Contact Number</label>
                                        <input name="user_contact_no" type="text\number" class="form-control" id="contact_no" aria-describedby="emailHelp" placeholder="Enter Contact Number With Country Code">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                
                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                                    </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-2x"></span>
                                        <h4>Please wait...</h4>                                        
                                    </div>
                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                                </form>
                            
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function(){
                console.log("loaded...")
                
                $('#reg-form').on('submit', function(){
                    event.preventDefault();
                    
                    let form = new FormData(this);
                    
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    $.ajax({
                       url: "RegisterServlet",
                       type: 'POST',
                       data: form,
                       success: function(data, textStatus, jqXHR){
                           console.log(data)
                           
                            if(data.trim() === 'done'){
                                $("#submit-btn").show();
                                $("#loader").hide();
                                swal("Registered Successfully.. We are going to redirect to login page")
                                 .then((value) => {
                                    window.location = "LogIn_page.jsp"
                                 });
                            }
                            else{
                                $("#submit-btn").show();
                                $("#loader").hide();
                                swal(data);
                            }
                            
                       },
                       error: function(jqXHR, textStatus, errorThrown){
                           $("#submit-btn").show();
                           $("#loader").hide();
                           swal("something went wrong.. try again");
                       },
                       processData: false,
                       contentType: false
                       
                       
                    });
                });
            });
        </script>
    </body>
</html>
