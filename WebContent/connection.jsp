
<%@ page import = "java.sql.*, java.util.*, java.io.*" %>

<%		
Connection con = null;
try {
    String connectionURL = "jdbc:mysql://localhost:3306/users";
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection(connectionURL, "root", "");
    if(!con.isClosed()) {
    	
         //out.println("Successfully connected to " + "MySQL server using TCP/IP...");
         //response.sendRedirect("register.html"); 
    }
    //con.close();
}catch(Exception ex){
	ex.printStackTrace(new java.io.PrintWriter(out));
}   

%>