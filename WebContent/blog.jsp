<%@include file="connection.jsp" %><%

String user = (String) session.getAttribute( "user" );
String username = (String) session.getAttribute( "username" );
int adminPriviledge = Integer.parseInt((String) session.getAttribute("admin"));
if (user == null) {
	//response.sendRedirect("register.html"); 
	out.println("the user is " + user);
}

//Check user
String sqlStr = "SELECT blog_id, username, title, content from blog";
PreparedStatement stmt = con.prepareStatement(sqlStr);
//stmt.setString(1, user);
ResultSet rs = stmt.executeQuery(); 
%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</head>
<body>
<%
	if (username == null) {
		response.sendRedirect("index.jsp");
	}
%>
<hr>
<%
	String cookie = "";
	Cookie[] cookies = request.getCookies();
		for(int i = 0; i < cookies.length; i++) { 
    		Cookie c = cookies[i];
    		if (c.getName().equals("loginTime")) {
    			cookie = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
    }
}  
	request.getParameter("loginTime"); %>
<h1>The Security Blog Application <span style="float:right"> Welcome <%= username %> &nbsp;&nbsp;&nbsp;&nbsp;<a href="logout_action.jsp" title="Click on it to kill the user session">logout</a> &nbsp;&nbsp;&nbsp;&nbsp;</span></h1>
<h2>Your last login time was <%= cookie %> 
</h2>
<div class="alert alert-info">
	The statement above uses cookies to display the login time to the application. 
</div>
<hr>
<h1>Blog entries</h1>
		<div class="column">
			<div class="col-md-12 alert alert-danger">
 				<strong>Danger!</strong> Any user can delete posts of another user. <i>Not anymore!</i>
			</div>
		</div>


<%	
 while ( rs.next() ) {
	//int blogId = Integer.parseInt(rs.getString(1));
	out.print("<div class='blogitem'><h3>" + rs.getString(3) + "</h3>");
	out.print(rs.getString(4) + "</div>");
	if (adminPriviledge == 1) {
		out.print("<a href=\"delete.jsp?blogId=" + rs.getString(1) + "\">Delete item as an admin</a>");
	}
	else {
		if (user.equals(rs.getString(2))) {
			out.print("<a href=\"delete.jsp?blogId=" + rs.getString(1) + "\">Delete item</a>");
		}
	}
	out.print("<div>Added by " + rs.getString(2) + "</div>");
	
}

String csrf = "" + System.currentTimeMillis() + Math.random() * 10000000;
session.setAttribute("csrf", csrf);
%>

<%-- <h3>Add a blog item</h2>
<form  method="post" action="blog_action.jsp"> <!--  logic will be here to add entry to the blog -->
Blog Title: <input name="blogtitle" size=100/><br>
<textarea name="blogcontent" rows="10" cols="100"></textarea><br>
<input type="submit" value="Add Blog"/>

<input type="hidden" name="csrftoken" value=<% out.print(csrf); %> />
</form> --%>

<div class="card my-4">
	<h5 class="card-header">Add a blog item</h5>
		<div class="card-body">
			<form method="post" action="blog_action.jsp">
				<div class="form-control">
					Blog title: <input name="blogtitle" size=100/><br>
				</div>
				<div class="form-group">
					<textarea name="blogcontent" class="form-control" rows="3" placeholder="Blog content"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Add entry</button>
				<input type="hidden" name="csrftoken" value=<% out.print(csrf); %> />
			</form>
		</div>
</div>

<div>
	Privacy statement: 
</div>