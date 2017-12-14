
<%@include file="connection.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse" %>
<%@ page import="encryption.Password" %>
<%
//get form input
String fullname = request.getParameter( "fullname" );
if (!fullname.contains(" ")) {
	response.sendRedirect("index.jsp?error=4");
}
String user = request.getParameter( "user" );
if (user.length() <= 6) {
	response.sendRedirect("index.jsp?error=3");
}
String pass = request.getParameter( "pass" );
String email = request.getParameter("email");
String passCopy = request.getParameter("passCopy");
String remoteAddr = request.getRemoteAddr();
ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
reCaptcha.setPrivateKey("6LfnjDoUAAAAAOhu_jOLqAfB5CVGEZkZ9tsC9TxL");

String challenge = request.getParameter("recaptcha_challenge_field");
String uresponse = request.getParameter("recaptcha_response_field");
ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

Password password = new Password();
String hashedPassword = password.hashPassword(pass);




if (!password.checkPassword(passCopy, hashedPassword)) {
	response.sendRedirect("index.jsp?error=5");
}

else {
	int isAdmin = 0;
	if (reCaptchaResponse.isValid()) {
		
		if (user.equals("administrator")) {
			//this has PreparedStatement to not have SQL injection attack
			String sqlStr = "INSERT INTO registered_users(name, username, password, isAdmin) VALUE (?, ?, ?, ?, ?)";
			isAdmin = 1;
			PreparedStatement stmt = con.prepareStatement(sqlStr);
			stmt.setString(1, fullname);
			stmt.setString(2, user);
			stmt.setString(3, hashedPassword);
			stmt.setInt(4, isAdmin);
			stmt.setString(5, email);
			try {
				int rs = stmt.executeUpdate();
				Cookie cookiePage = new Cookie("lastPage", "/register");
				cookiePage.setMaxAge(60*60);
				response.addCookie(cookiePage);
				response.sendRedirect("login_page.jsp");
			}
			catch (SQLException ex) {
				response.sendRedirect("index.jsp?error=1");
			}
			
		}
		
		else {
		// this statement has a potential for SQL injection attack 
			String sqlStr = "INSERT INTO registered_users(name, username, password, isAdmin, email) VALUES ('" + fullname + "', '" + user + "', '" + hashedPassword + "', '" + isAdmin + "', '"+ email + "')";
			Statement stmt = con.createStatement();
			/* try { */
				boolean result = stmt.execute(sqlStr);
				Cookie cookiePage = new Cookie("lastPage", "/register");
				cookiePage.setMaxAge(60*60);
				response.addCookie(cookiePage);
				response.sendRedirect("login_page.jsp");
			/* }
			catch (SQLException ex) {
				out.print(ex);
			} */
		//out.println(password.hashPassword(pass));
		}
	}
	else {
		response.sendRedirect("index.jsp?error=2");
	}
}

%>
