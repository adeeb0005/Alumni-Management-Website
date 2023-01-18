<%@page errorPage="error_page.jsp" %>
<%@page import="com.Data.entities.Message"%>
<%@page import="com.Data.entities.User"%>
<%
User user = (User)session.getAttribute("currentUser");
if(user == null){
    response.sendRedirect("LogIn_page.jsp");
}
%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span> Alumni Database</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="noticeforall.jsp"><span class="fa fa-bell"></span> Notice For All</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-heart"></span> Sponsors and Donors</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="https://www.bsmrstu.edu.bd/dev/dept/?id=cse"><span class="fa fa-graduation-cap"></span> BSRMSTU CSE</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="contact_us.jsp"> <span class="fa fa-paper-plane-o"></span> Contact Us</a>
      </li>
    </ul>
      <ul class="navbar-nav mr-right">
            <li class="nav-item active">
                <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle-o"></span> <%= user.getName() %></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="LogOutServlet"> <span class="fa fa-sign-out"></span> Log Out</a>
            </li>
      </ul>
  </div>
</nav>


<!-- Modal -->

<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white text-center">
                <h5 class="modal-title" id="exampleModalLongTitle"> Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="img/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px">
                    <br> 
                    <h5 class="modal-title m-3"><%= user.getName() %></h5>
                    <div id="profile-details">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Session</th>
                                    <td><%= user.getSession()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Contact Number</th>
                                    <td><%= user.getContact_number()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                            <!-- Profile edit -->
                    <div id="profile-edit" style="display: none;">
                        <h3 class="mt-2">Please Edit Carefully</h3>
                        <form action = "EditServlet" method="POST" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>Student ID:</td>
                                    <td><%= user.getStudent_id() %></td>
                                </tr>
                                <tr>
                                    <td>Name:</td>
                                    <td><input type="text" name="user_name" class="form-control" value="<%= user.getName() %>"></td>
                                </tr>
                                <tr>
                                    <td>Email:</td>
                                    <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail() %>"></td>
                                </tr>
                                <tr>
                                    <td>Session:</td>
                                    <td><select name="user_session" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                                            <option selected><%= user.getSession() %></option>
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
                                        </select></td>
                                </tr>
                                <tr>
                                    <td>New Profile Pic:</td>
                                    <td>
                                        <input type="file" name="image" class="form-control">
                                    </td>
                                </tr>
                            </table>
                            <div class="container">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>
                    </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
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
    $(document).ready(function(){
        let editStatus = false;
        $('#edit-profile-button').click(function(){
            if(editStatus == false){
                $("#profile-details").hide()
                $("#profile-edit").show()
                editStatus = true;
                $(this).text("back")
            }
            else{
                $("#profile-details").show()
                $("#profile-edit").hide()
                editStatus = false;
            }
            
        });
    });
</script>

<%
    Message m =(Message)session.getAttribute("msg");
    if(m!=null){
%>
<div class="alert alert-primary" role="alert">
    <%= m.getContent() %>
</div>
<%
    session.removeAttribute("msg");
    }
%>