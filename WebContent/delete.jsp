<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="connection.jsp"%>
<%
	int adminPriviledge = Integer.parseInt((String) session.getAttribute("admin"));
	String user = (String) session.getAttribute("user");
	if (adminPriviledge == 1) {
		//out.println(request.getParameter("blogId"));
		String sqlStr = "DELETE FROM blog WHERE blog_id=?";
		PreparedStatement stmt = con.prepareStatement(sqlStr);
		stmt.setString(1, request.getParameter("blogId"));
		int rs = stmt.executeUpdate();
		if (rs == 1)
			response.sendRedirect("blog.jsp");
		else
			throw new Exception("Post does not exist");
	}
	else if (adminPriviledge == 0) {
		String sqlStr = "DELETE FROM blog WHERE blog_id=? AND username=?";
		PreparedStatement stmt = con.prepareStatement(sqlStr);
		stmt.setString(1, request.getParameter("blogId"));
		stmt.setString(2, user);
		int rs = stmt.executeUpdate();
		if (rs == 1)
			response.sendRedirect("blog.jsp");
		else {
			throw new Exception("Trying to delete non-existing blog post or no granted priviledge");
		}
	}
	else {
		throw new Exception("Permission not granted");
	}
%>
