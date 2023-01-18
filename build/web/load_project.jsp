<%@page import="java.util.List"%>
<%@page import="com.Data.entities.Project"%>
<%@page import="com.Data.dao.PostDao"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<div class="row">
<%
    Thread.sleep(1000);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    int sess = Integer.parseInt(request.getParameter("dis"));
    List<Project> posts = null;
    if(sess==0){
        posts = d.getAllProject();
    }
    else{
        posts=d.getSomeProject(sess);
    }
    if(posts.size()==0){
        out.println("<h3 class='display-6 text-center'>I did not submit any project. </h3>");
    }
    for(Project p : posts){
    
%>
    <div class="col-md-6 mt-3">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title"><%= p.getIdea() %></h5>
                <p class="card-text">By <a href="show_profile.jsp?student_id=<%= p.getStudent_id() %>"> <%= p.getUsername() %> </a> </p>
                <a href="show_project.jsp?project_id=<%= p.getId() %>" class="card-link">View</a>
            </div>
        </div>
    </div>
<%
    }
%>
</div>
