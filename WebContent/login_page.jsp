<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log into your blog application here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
</head>
<body>
<hr>
<div class="container">
	<div class="column">
		<form class="form-horizontal" action="login.jsp">
			<fieldset>
				<% 
					if (request.getParameter("error") != null && Integer.parseInt(request.getParameter("error")) == 1) {
						out.print("<div class=" + "alert alert-danger" + "> <strong>Password is incorrect</strong> </div>");	
						}
					
				%>
				<div class="form-group">
					<label class="col-md-4 control-label" for="user">Username:</label><input id="user" name="user" />
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="pass">Password:</label> <input id="pass" name="pass" type="password" />
				</div>
				
				<div class="form-group">
					<label class="col-md-4 control-label" for="singlebutton"> </label>
				  	<div class="col-md-4">
				    		<button id="singlebutton" name="singlebutton" class="btn btn-primary">Submit</button>
				    		<button id="resetbutton" name="resetbutton" class="btn btn-secondary">Reset password</button>
				  	</div>
				  	
				</div>
			</fieldset>
		</form>
	</div>
<hr>
</div>
</body>
</html>