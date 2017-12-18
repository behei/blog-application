<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Website defacing demonstration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat|Josefin+Sans" rel="stylesheet">
<link rel="shortcut icon" href="/favicon2.ico" type="image/x-icon">
<link rel="icon" href="/favicon2.ico" type="image/x-icon">
<link href="./style_defense.css" rel="stylesheet">
</head>
<body>
<div class="new-font alert alert-danger mt-3 mb-3 ml-3 mr-3" style="text-align: center;">
	<h1 style="font-size: 24px;">MAJOR DANGER! ATTENTION! ACHTUNG! ВНИМАНИЕ! THIS PAGE IS VULNERABLE TO ATTACKS.</h1>
</div>
<%
	String imageURL = "https://www.cats.org.uk/uploads/images/featurebox_sidebar_kids/grief-and-loss.jpg";
%>
<div class="new-font ml-3 mr-3 ">
		The website defacing can be performed using different tools and techniques. Basically, what website defacing is, a replacing of some content
		on the website with some other image, text etc. Therefore, the website defacing can also be performed through XSS attack that was discussed here <a href="demonstration.jsp">here</a>.
		Therefore, similar issues might arise while trying to perform the attack such as Chrome blocking the code execution.
		The image below is vulnerable to the website defacing through XSS, therefore if user would like to deface my website, they can perform 
		so by doing the following query - defacing.jsp?imageURL=&lt;img src="link to evil website">. To get to know how to protect your website against
		possible attacks, go <a href="xss_defense.html">here to learn about XSS</a> and <a href="prevent_sql.html">here to learn about SQL prevention here</a>.
</div>
<div >
	<img class="mt-5 mb-5" style="display: block; margin : 0px auto;" src="<% if (request.getParameter("imageURL") != null) request.getParameter("imageURL"); else out.print(imageURL);  %>" alt="cat photo"/>
</div>
<div style="text-align: center;" class="mb-5 mt-5"><a  href="index.jsp">return to the safety</a></div>
</body>
</html>