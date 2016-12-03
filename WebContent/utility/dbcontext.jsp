<%@ page import="java.sql.*,java.math.*" %>
<%@ include file="../config/db.jsp" %>
<%
	Connection conn = null;
	try{
		// register jdbc driver
		Class.forName("com.mysql.jdbc.Driver");
		// connecting to database
		conn = DriverManager.getConnection(DB_CONNECTION_STRING, DB_USER, DB_PASS);
	}catch(Exception ex){
		out.println("Exception caught: " + ex.getStackTrace());
	}
%>