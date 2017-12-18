<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<%@include file="connection.jsp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information Security Web Blog</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<style>
	body { font-family: 'Montserrat', sans-serif; }
	#share-buttons img {
		width: 35px;
		padding: 5px;
		border: 0;
		box-shadow: 0;
		display: inline;
	}
</style>
</head>
<body> 
	<div class="container">
	<div class="column">
		
		<%
	String cookie = "";
	String cookieLastPage = "";
	Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for(int i = 0; i < cookies.length; i++) { 
    				Cookie c = cookies[i];
    				if (c.getName().equals("loginTime")) {
    					cookie = java.net.URLDecoder.decode(c.getValue(), "UTF-8");
    		
   				 }
    				if (c.getName().equals("lastPage")) {
    					cookieLastPage = c.getValue();
    				}
			}  
		}
	 %>
	
		<div style="text-align: center;"><% if(!cookie.equals("")) out.print("<div style=\"font-family: 'Montserrat', sans-serif; font-size: 32px;\"> Welcome back! Your last login time was " + cookie + "</div>"); else out.print("<div style=\"font-family: 'Montserrat', sans-serif; font-size:42px;\"> Welcome to Information Security Blog Application</div>");  %></div>
		<hr>
		
		<%
			//String testString = "this text in the database is vulnerable";
			String sqlStr = "select url,text from vulnerable where id='" + request.getParameter("id") + "'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sqlStr);
			String vulnerableText = "";
			if(rs.next()) {
				out.print(rs.getString(1));
			}

		%>
		
		<strong style="color: red;">
		<% if (vulnerableText != null) {
			out.print("    " + vulnerableText);
			}
		 %>
		 </strong>
		<!-- <img src="http://www.myvalleynational.com/security-wordcloud.jpg" class="img-fluid" alt="Responsive image"> -->
		<div class="row">
			<div class="alert alert-danger col-md-3">
	 			<strong>Danger!</strong> This page has SQL injection vulnerability because PreparedStatements are not used. To learn how to prevent it, go <a href="prevent_sql.html">here</a>
			</div>
			
			<div class="alert alert-info col-md-3">
	  			<strong>Info!</strong> To create admin account, use login "administrator" name with password of your choice.
			</div>
			
			<div class="alert alert-info col-md-3">
						<div>Attention! This website uses BCrypt library to encrypt (hash + salt) your password. If you'd like to play with it, visit <a href="encrypting.jsp">here</a></div>
					</div>
			<div class="alert alert-danger col-md-3">
	  			<strong>Info!</strong> XSS attack can be demonstrated <a href="demonstration.jsp">here</a> and the website defacing <a href="defacing.jsp">here</a>
			</div>
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
    						<button id="singlebutton" name="singlebutton" class="btn btn-primary mr-2">Submit</button>
    						Already registered? <a href="login_page.jsp">Log in here</a>
    						<!-- <button class="btn btn-secondary" onclick="location.href = 'login_page.html'">Log in</button> -->
  					</div>
  					
				</div>		
			</fieldset>
			</form>
			
	</div>
	<div class="mt-3 ml-3 mr-3 mb-3">
	<h5 style="text-align: center;">Do you like this blog application? Tell your friends!</h5>
	<div id="share-buttons" style="text-align: center;">
	    <!-- Buffer -->
    <a href="https://bufferapp.com/add?url=http://52.26.234.36/" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/buffer.png" alt="Buffer" />
    </a>
    
    <!-- Digg -->
    <a href="http://www.digg.com/submit?url=http://52.26.234.36/" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/diggit.png" alt="Digg" />
    </a>
    
    <!-- Email -->
    <a href="mailto:?Subject=Awesome Blog App&amp;Body=I%20saw%20this%20and%20thought%20of%20you!%20 http://52.26.234.36/">
        <img src="https://simplesharebuttons.com/images/somacro/email.png" alt="Email" />
    </a>
 
    <!-- Facebook -->
    <a href="http://www.facebook.com/sharer.php?u=http://52.26.234.36/" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/facebook.png" alt="Facebook" />
    </a>
    
    <!-- Google+ -->
    <a href="https://plus.google.com/share?url=http://52.26.234.36/" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/google.png" alt="Google" />
    </a>
    
    <!-- LinkedIn -->
    <a href="http://www.linkedin.com/shareArticle?mini=true&amp;url=http://52.26.234.36/" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/linkedin.png" alt="LinkedIn" />
    </a>
    
    
    <!-- Print -->
    <a href="javascript:;" onclick="window.print()">
        <img src="https://simplesharebuttons.com/images/somacro/print.png" alt="Print" />
    </a>
    
    <!-- Reddit -->
    <a href="http://reddit.com/submit?url=http://52.26.234.36/&amp;title=Security Blog App" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/reddit.png" alt="Reddit" />
    </a>
    
    <!-- StumbleUpon-->
    <a href="http://www.stumbleupon.com/submit?url=http://52.26.234.36/&amp;title=Security Blog App" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/stumbleupon.png" alt="StumbleUpon" />
    </a>
    
    <!-- Tumblr-->
    <a href="http://www.tumblr.com/share/link?url=http://52.26.234.36/&amp;title=Security Blog App" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/tumblr.png" alt="Tumblr" />
    </a>
     
    <!-- Twitter -->
    <a href="https://twitter.com/share?url=http://52.26.234.36/&amp;text=Security%20Blog%20Application&amp;hashtags=securityblogapp" target="_blank">
        <img src="https://simplesharebuttons.com/images/somacro/twitter.png" alt="Twitter" />
    </a>
    
	</div>
</div>
	</div>
</body>
</html>