<%@include file="connection.jsp" %>
<%@ page import="encryption.Password" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

//Check user
String user = request.getParameter( "user" );
if (user == null) 
	out.println("user is null");
//out.println("string user is " + user);
String pass = request.getParameter( "pass" );
Password password = new Password();
//String hashedPassword = password.hashPassword(pass);

String passwordString = "SELECT password FROM registered_users WHERE username='" + user + "'";
PreparedStatement statement = con.prepareStatement(passwordString);
ResultSet result = statement.executeQuery();

if (result.next()) {
	String receivedPassword = result.getString(1);
	/* out.println(pass);
	out.println(receivedPassword);
	out.println(password.checkPassword(pass, receivedPassword)); */
	if(password.checkPassword(pass, receivedPassword))
	{
		String sqlStr = "SELECT name, isAdmin FROM registered_users WHERE username='" + user + "' and password='" + receivedPassword + "'";
		PreparedStatement stmt = con.prepareStatement(sqlStr);
		ResultSet rs = stmt.executeQuery();
		if ( rs.next() ) {
			//Locale locale = request.getLocale();
			//java.text.DateFormat dateFormat = java.text.DateFormat.getDateTimeInstance( java.text.DateFormat.LONG, java.text.DateFormat.LONG, locale);
			java.util.Date date = new java.util.Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateStr = sdf.format(date);
			Cookie cookie = new Cookie("loginTime", java.net.URLEncoder.encode(new java.util.Date().toString(), "UTF-8"));//java.net.URLEncoder.encode(new java.util.Date().toString(), "UTF-8"));
			cookie.setMaxAge(60*60*48);
			response.addCookie(cookie);
			Cookie cookiePage = new Cookie("lastPage", "/login");
			cookiePage.setMaxAge(60*60*48);
			response.addCookie(cookiePage);
			session.setAttribute( "user", user );
			session.setAttribute( "username", rs.getString(1));
			session.setAttribute("admin", rs.getString(2));
			session.setMaxInactiveInterval(60*60); // this session lasts one hour
			response.sendRedirect("blog.jsp");	
		}
	}
	else {
		response.sendRedirect("login_page.jsp?error=1");
	}
}
else {
	response.sendRedirect("login_page.jsp?error=1");
}
%>