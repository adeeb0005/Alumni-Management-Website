<%@page import="com.Data.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.Data.entities.Project"%>
<%@page import="com.Data.dao.PostDao"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<div class="row">
<%
    Thread.sleep(1000);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    int sess = Integer.parseInt(request.getParameter("dis"));
    List<Post> posts = null;
    if(sess==0){
        posts = d.getAllPost();
    }
    else{
        posts=d.getSomePost(sess);
    }
    if(posts.size()==0){
        out.println("<h3 class='display-6 text-center'>I did not post anything. </h3>");
    }
    for(Post p : posts){
    
%>
    <div class="col-md-6 mt-3">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <p class="card-text"><%= p.getPs() %></p>
                <pre class="card-text">By <a href="show_profile.jsp?student_id=<%= p.getStudent_id() %>"> <%= p.getUsername() %> </a> </pre>
            </div>
        </div>
    </div>
<%
    }
%>
</div>
