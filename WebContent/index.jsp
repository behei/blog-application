<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up for the awesome blog here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
	<div class="container">
	<div class="column">
		<hr>

		<!-- <img src="http://www.myvalleynational.com/security-wordcloud.jpg" class="img-fluid" alt="Responsive image"> -->
		
		<div class="alert alert-danger">
 			<strong>Danger!</strong> This page has SQL injection vulnerability because PreparedStatements are not used.
		</div>
		
		<div class="alert alert-info">
  			<strong>Info!</strong> To create admin account, use login "administrator" name with password of your choice.
		</div>
		<!-- <h2>The Awesome Web Security Blog. Sign up now!</h2> -->
		<form class="form-horizontal" action="register.jsp">
			<fieldset>
				<legend>Register</legend>
			
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="fullname">Full Name:</label>
					<div class="col-md-12">
						<input id="fullname" name="fullname" class="form-control input-md" placeholder="Enter your Full Name">
						<span class="help-block"> </span>
					</div>
				</div>
				
				<% if (request.getParameter("error") != null && Integer.parseInt(request.getParameter("error")) == 4) {
					out.print("<div class=" + "alert alert-danger" + "> <strong>Must have a space between first and last name</strong> </div>");	
}

				 %>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="user">Username:</label>
					<div class="col-md-12">
						<input id="user" name="user" class="form-control input-md" placeholder="Enter your username">
						<span class="help-block"> </span>
					</div>
				</div>
				
				<% if (request.getParameter("error") != null && Integer.parseInt(request.getParameter("error")) == 1) {
					out.print("<div class=" + "alert alert-danger" + "> <strong>User already exists</strong> </div>");	
}

				 %>
				 
				<% if (request.getParameter("error") != null && Integer.parseInt(request.getParameter("error")) == 3) {
					out.print("<div class=" + "alert alert-danger" + "> <strong>Username has to be at least 6 characters</strong> </div>");	
}

				 %>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="email">Email:</label>
					<div class="col-md-12">
						<input id="email" name="email" class="form-control input-md" placeholder="Enter your email">
						<span class="help-block"> </span>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="pass">Password:</label>
					<div class="col-md-12">
						<input id="pass" name="pass" type="password" class="form-control input-md" placeholder="Enter your password">
						<span class="help-block"> </span>
					</div>
					
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="passCopy">Repeat password:</label>
					<div class="col-md-12">
						<input id="passCopy" name="passCopy" type="password" class="form-control input-md" placeholder="Enter your password again">
						<span class="help-block"> </span>
					</div>
					
				</div>
				
				<% if (request.getParameter("error") != null && Integer.parseInt(request.getParameter("error")) == 5) {
					out.print("<div class=" + "alert alert-danger" + "> <strong>Your passwords do not match.</strong> </div>");	
}

				 %>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="captcha">Captcha:</label>
					<div class="col-md-12">
					<!-- <div class="g-recaptcha" data-sitekey="6LfnjDoUAAAAADPxwbN-lnyNS7j7CdZzq1lUTKrz"></div> -->
					<%
          				ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LfnjDoUAAAAADPxwbN-lnyNS7j7CdZzq1lUTKrz", "6LfnjDoUAAAAAOhu_jOLqAfB5CVGEZkZ9tsC9TxL", false);
          				out.print(c.createRecaptchaHtml(null, null));
					%>
					
					<% if (request.getParameter("error") != null && Integer.parseInt(request.getParameter("error")) == 2) {
					out.print("<div class=" + "alert alert-danger" + "> <strong>Incorrect captcha</strong> </div>");	
}

				 %>
					</div>
				</div>
				<div class="form-group">
  					<label class="col-md-4 control-label" for="singlebutton"></label>
  					<div class="col-md-12">
    						<button id="singlebutton" name="singlebutton" class="btn btn-primary">Submit</button>
    						<!-- <button class="btn btn-secondary" onclick="location.href = 'login_page.html'">Log in</button> -->
  					</div>
  					
				</div>		
			</fieldset>
			</form>
			<div>
				
				<div class="alert alert-info">
					Already registered? <a href="login_page.jsp">Log in here</a>
					Forgot password? Reset it <a href="">here</a>
				</div>
			</div>
	</div>
	</div>
</body>
</html>