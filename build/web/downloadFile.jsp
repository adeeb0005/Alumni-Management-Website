<%-- 
    Document   : downloadFile
    Created on : May 16, 2022, 4:48:51 AM
    Author     : adeeb
--%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.Data.entities.User"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.Data.entities.Project"%>
<%@page import="com.Data.dao.PostDao"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<%
  int project_id = Integer.parseInt(request.getParameter("project_id"));
  PostDao d = new PostDao(ConnectionProvider.getConnection());
  Project p = d.getDetailsById(project_id);
%>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("LogIn_page.jsp");
    }
%>
<%
    response.setContentType("APPLICATION/OCTET-STREAM");
    String filename= p.getRepoName();
    String filepath= request.getRealPath("/")+"img"+File.separator;
    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
    FileInputStream fileInputStream=new FileInputStream(filepath+filename);
    int i;
    while((i=fileInputStream.read())!=-1){
        out.write(i);
    }
    fileInputStream.close();
    out.close();
%>
