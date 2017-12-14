<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="encryption.Password" %>
<% 
	if (request.getParameter("playground") != null) {
		Password password = new Password();
		String encryptedString = password.hashPassword(request.getParameter("playground"));
		//request.setAttribute("hashedPlayground", encryptedString);
		//out.print(request.getAttribute("hashedPlayground"));
		Cookie cookie = new Cookie("hashedPlayground", encryptedString);
		cookie.setMaxAge(60*60);
		response.addCookie(cookie);
		response.sendRedirect("encrypting.jsp");
	}
%>