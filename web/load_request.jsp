<%@page import="java.util.List"%>
<%@page import="com.Data.entities.Category"%>
<%@page import="com.Data.dao.PostDao"%>
<%@page import="com.Data.Helper.ConnectionProvider"%>
<div class="row">
<%
    Thread.sleep(1000);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    int sess = Integer.parseInt(request.getParameter("sid"));
    List<Category> posts = null;
    if(sess==0){
        posts = d.getAll(0);
    }
    else{
        posts=d.getSome(sess,0);
    }
    if(posts.size()==0){
        out.println("<h3 class='display-3 text-center'>No member has this session</h3>");
    }
    for(Category p : posts){
    
%>
<div class="col-md-6 mt-3">
    <div class="card" style="width: 50%"> 
        <img class="card-img-top" src="img/<%= p.getProfile()%>" alt="Card image cap">
        <div class="card-body"> 
            <b> <%= p.getName() %></b>
        </div>
        <div>
            <div class="card-footer primary-background text-center">
                <a href="check_profile.jsp?student_id=<%= p.getStudent_id() %>" class="btn btn-outline-light">View Profile</a>
            </div>
        </div>
    </div>
</div>
<%
    }
%>
</div>