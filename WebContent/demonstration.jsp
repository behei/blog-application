<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Vulnerabilities Demonstration page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="shortcut icon" href="/favicon2.ico" type="image/x-icon">
<link rel="icon" href="/favicon2.ico" type="image/x-icon">
</head>
<body>

<div class="alert alert-danger mt-3 mb-3 ml-3 mr-3" style="text-align: center;">
	MAJOR DANGER! ATTENTION! ACHTUNG! ВНИМАНИЕ! THIS PAGE IS VULNERABLE ATTACKS, PLEASE LEAVE ASAP.
</div>

<div class="mt-3 mb-3 ml-3 mr-3">The parameter to the right is most likely equal to null - <i><%= request.getParameter("user") %></i>. To execute your evil script, add the following to the address bar - /demonstration.jsp?user=&lt;script>alert(2);&lt;/script> </div>
<div class="ml-3">You can read about possible defense against XSS attacks <a href="/xss_defense.html">here</a></div>
<div class="mt-3 mb-3 ml-3 mr-3"><a  href="/index.jsp">return to the home page</a></div>
</body>
</html>