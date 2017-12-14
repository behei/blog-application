<%@include file="connection.jsp" %><%

String user = (String) session.getAttribute( "user" );
String username = (String) session.getAttribute( "username" );
int adminPriviledge = 0;
if (session.getAttribute("admin") != null) {
	adminPriviledge = Integer.parseInt((String) session.getAttribute("admin"));
}
if (user == null || username == null) {
	response.sendRedirect("index.jsp"); 
	//out.println("the user is " + user);
}

else {
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
<link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montserrat" rel="stylesheet">
<link rel="shortcut icon" href="/favicon2.ico" type="image/x-icon">
<link rel="icon" href="/favicon2.ico" type="image/x-icon">
<style>
	body { font-family: 'Montserrat', sans-serif; }
	.new-font { font-family: 'Josefin Sans', sans-serif;}
</style>
</head>
<body>

<hr>
<%
	String cookie = "";
	Cookie[] cookies = request.getCookies(); 
		for(int i = 0; i < cookies.length; i++) { 
    		Cookie c = cookies[i];
    		if (c.getName().equals("lastPage")) {
    			cookie = c.getValue();
    			Cookie cookieLastPage = new Cookie("lastPage", "/blog");
    			response.addCookie(cookieLastPage);
    }
}  
	 %>
<h1 class="ml-3">The Security Blog Application <span style="float:right"> Welcome <%= username %> &nbsp;&nbsp;&nbsp;&nbsp;<a type="submit" href="logout_action.jsp" title="Click on it to kill the user session">logout</a></form> &nbsp;&nbsp;&nbsp;&nbsp;</span></h1>
<% if (!cookie.equals("")) out.print("<h2 class=\"ml-3\" style=\"font-size:18px;\">Your last visited page was " + cookie + "</h2>"); %>
<!-- <div class="alert alert-info">
	The statement above uses cookies to display the last visited page in the application (as well as all other pages in the application). 
</div> -->
<hr>
<div style="padding: 24px;">
<h1 style="text-align: center;" class="mb-3">Blog entries</h1>
		

<%	
 while ( rs.next() ) {
	//int blogId = Integer.parseInt(rs.getString(1));
	if (rs.getString(3) !=null)
		out.print("<div class='blogitem new-font mb-3'><h3>" + rs.getString(3) + "</h3>");
	if (rs.getString(4) != null)
		out.print(rs.getString(4) + "</div>");
	if (adminPriviledge == 1) {
		out.print("<a href=\"delete.jsp?blogId=" + rs.getString(1) + "\">Delete item as an admin</a>");
	}
	else {
		if (user.equals(rs.getString(2)) && rs.getString(2) != null)  {
			out.print("<a href=\"delete.jsp?blogId=" + rs.getString(1) + "\">Delete item</a>");
		}
	}
	if (rs.getString(2) != null) 
		out.print("<div class=\"mb-3\">Added by " + rs.getString(2) + "</div>");
	
}

String csrf = "" + System.currentTimeMillis() + Math.random() * 10000000;
session.setAttribute("csrf", csrf);
%>
</div>

<%-- <h3>Add a blog item</h2>
<form  method="post" action="blog_action.jsp"> <!--  logic will be here to add entry to the blog -->
Blog Title: <input name="blogtitle" size=100/><br>
<textarea name="blogcontent" rows="10" cols="100"></textarea><br>
<input type="submit" value="Add Blog"/>

<input type="hidden" name="csrftoken" value=<% out.print(csrf); %> />
</form> --%>

<div class="card mt-3 ml-3 mr-3 mb-3">
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

<div class="ml-3 mr-3 mb-3">
	Privacy statement: While using this site, you agree to accept cookie usage (we store last visited page and last login time) and privacy statement. Copyright by Mykhailo Behei, 2017. All Rights Reserved.
</div>
<% } %>