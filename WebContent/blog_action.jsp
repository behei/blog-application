<%@include file="connection.jsp" %>

<%
	String title = request.getParameter("blogtitle");
	String text = request.getParameter("blogcontent");
	String username = (String) session.getAttribute( "user" );
	String csrfSession = (String) session.getAttribute("csrf");
	String csrfTokenForm = request.getParameter("csrftoken");
	//out.println(csrfSession);
	//out.println(csrfTokenForm);
	if (title != "" && text != "" && csrfSession.equals(csrfTokenForm)) {
		out.println(username);
		out.println(title);
		out.println(text);
		String sqlStr = "insert into blog(username, title, content) values (?, ?, ?)";
		PreparedStatement stmt = con.prepareStatement(sqlStr);
		stmt.setString(1, username);
		stmt.setString(2, title);
		stmt.setString(3, text);
		int rs = stmt.executeUpdate();
		response.sendRedirect("blog.jsp");
	}
	else {
		response.sendRedirect("blog.jsp");
	}
	
%>