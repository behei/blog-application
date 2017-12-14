<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Enumeration" %>
<%-- <%@include file="connection.jsp" %>
<%@ page session="false" %> --%>
<%
	session.invalidate();
	response.sendRedirect("index.jsp");
%>