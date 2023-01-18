<%@page import="com.Data.Helper.ConnectionProvider"%>
<%@page import="com.Data.dao.UserDao"%>
<%@page import="com.Data.entities.User"%>
<%
User user = (User)session.getAttribute("adminUser");
if(user == null){
    response.sendRedirect("LogIn_page.jsp");
}
%>
<%@page errorPage="error_page.jsp" %>
<%
  String student_id = request.getParameter("student_id");
  UserDao d = new UserDao(ConnectionProvider.getConnection());
  boolean res = d.deleteUser(student_id);
  response.sendRedirect("request_user.jsp");
%>