<%@page errorPage="error_page.jsp" %>
<%@page import="com.Data.entities.User"%>
<%
User user = (User)session.getAttribute("adminUser");
if(user == null){
    response.sendRedirect("LogIn_page.jsp");
}
%>
<%@page errorPage="error_page.jsp" %>

<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"><span class="fa fa-home"></span> Alumni Database</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="#"><span class="fa fa-heart"></span> Sponsors and Donors</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="https://www.bsmrstu.edu.bd/dev/dept/?id=cse"><span class="fa fa-graduation-cap"></span> BSRMSTU CSE</a>
      </li>
      <li class="nav-item active">
          <a class="nav-link" href="#"> <span class="fa fa-paper-plane-o"></span> Contact Us</a>
      </li>
    </ul>
        <ul class="navbar-nav mr-right">
            <li class="nav-item active">
                <a class="nav-link"> <span class="fa fa-user-circle-o"></span> <%= user.getName() %></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="AdminLogOutServlet"> <span class="fa fa-sign-out"></span> Log Out</a>
            </li>
        </ul>
    </div>
</nav>