<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="encryption.Password" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Encryption Playground</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="shortcut icon" href="/favicon2.ico" type="image/x-icon">
<link rel="icon" href="/favicon2.ico" type="image/x-icon">
</head>
<body style="font-family: 'Montserrat', sans-serif;">
<h1 style="text-align: center;" class="mt-2">Encrypt your text here with our BCrypt library</h1>
<div class="row" style="padding: 24px;">
	<form class="form-horizontal" action="encrypting_action.jsp">
		<fieldset>
			<legend>Encrypt your string here (you can see how your hashed password will look like too!)</legend>
			
			<div class="form-group">
					<label class="col-md-4 control-label" for="fullname">Your string:</label>
					<div class="col-md-12">
						<input id="playground" name="playground" class="form-control input-md" placeholder="Enter your string here">
						<span class="help-block"> </span>
					</div>
			</div>
			<div class="form-group">
  					<label class="col-md-4 control-label" for="singlebutton"></label>
  					<div class="col-md-12">
    						<button class="btn btn-primary mr-2">Submit</button>
    						<a href="/">return to the index page</a>
  					</div>
  					
				</div>	
		</fieldset>
	</form>
</div>

<div>
	<%
	String hashedCookie = "";
	Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for(int i = 0; i < cookies.length; i++) { 
    				Cookie c = cookies[i];
    	
    				if (c.getName().equals("hashedPlayground")) {
    					hashedCookie = c.getValue();
    				}
			}  
		}
		
		if (!hashedCookie.equals("")) {
			out.print("<div class=\"ml-2\">Your last hashed string is " + hashedCookie + "</div>");
		}
	%>
</div>
</body>
</html>