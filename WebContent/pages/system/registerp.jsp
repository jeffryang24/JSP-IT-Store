<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="/utility/dbcontext.jsp" %>
<%@ include file="/utility/helper.jsp"%>
<%
/*
 * Register Processing Page
 * @author: Jeffry Angtoni
 */

String username = (String)request.getParameter("txtUsername");
String password1 = (String)request.getParameter("txtPassword");
String password2 = (String)request.getParameter("txtPassword2");
String fullname = (String)request.getParameter("txtFullname");
String phone = (String)request.getParameter("txtPhonenumber");
String address = (String)request.getParameter("txtAddress");
String email = (String)request.getParameter("txtEmail");

// validate username
if (username.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Username+is+required!");
	return;
}

if (username.length() < 5 || username.length() > 15){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Username+must+between+5+and+15+characters!");
	return;
}

// validate password
if (password1.trim().equalsIgnoreCase("") || password2.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Password+is+required!");
	return;
}
//check alphanumeric using function in helper.jsp
if (!isAlphaNumeric(password1) || !isAlphaNumeric(password2)){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Password+must+be+an+alphanumeric+type!");
	return;
}

if (password1.length() < 5 || password2.length() < 5){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Password+minimum+5+characters!");
	return;
}

if (password1.trim().compareTo(password2.trim()) != 0){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Password+must+be+same!");
	return;
}

// validate full name
if (fullname.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Full+name+is+required!");
	return;
}

if (!isFullnameValid(fullname)){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Full+name+must+only+contains+alphabet!");
	return;
}
if (fullname.length() < 5){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Full+name+minimum+5+characters!");
	return;
}

// validate phone number
// using isNumeric function from helper.jsp
if (phone.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Phone+number+is+required!");
	return;
}

if (!isNumeric(phone)){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Phone+number+must+be+a+number!");
	return;
}

if (phone.length() < 8){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Phone+number+minimum+8+digits!");
	return;
}

// validate address
if (address.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Address+is+required!");
	return;
}

if (!address.contains("Street")){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Address+must+contains+'Street'+word!");
	return;
}

// validate email using regex
if (email.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Email+address+is+required!");
	return;
}
if (!isValidEmail(email)){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Email+address+must+be+valid!");
	return;
}

// processing request
// check current username is registered or not?
Statement stmt = conn.createStatement(1004,1008);
String sql = "";
ResultSet rs = null;

sql = "SELECT 1 from BJ_User where BJ_userName like '%" + username + "%' and BJ_userStatus = 1";
rs = stmt.executeQuery(sql);

if (rs.isBeforeFirst()){
	response.sendRedirect(application.getContextPath() + "/register.jsp?e=Username+is+not+available!");
	return;
}
rs.close();

sql = "SELECT BJ_userID from BJ_User where BJ_userStatus = 1 order by BJ_userRegisterDate desc LIMIT 1";
rs = stmt.executeQuery(sql);

if (rs.isBeforeFirst()){
	// set cursor to first position
	rs.next();
	// brarti ada data
	String userID = rs.getString("BJ_userID");
	// get id number
	String[] userID_split = userID.split("US");
	int lastID = Integer.parseInt(userID_split[1]);
	
	// new ID
	int newID = lastID + 1;
	String strID = "";
	
	if (newID > 9) strID = "US0" + newID;
	else if (newID > 99) strID = "US" + newID;
	else strID = "US00" + newID;
	
	Date dt = new Date();
	SimpleDateFormat curDt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	sql = "INSERT INTO BJ_User (BJ_UserID, BJ_userName, BJ_userPWD, BJ_userFullName, BJ_userPhone, BJ_userAddr, BJ_userEmail, BJ_userRole, BJ_userStatus, BJ_userRegisterDate) " +
			"VALUES ('" + strID + "', '" + username.trim() + "', '" + password1 + "','" + fullname.trim() + "', '" + phone.trim() + "', '" + address.trim() + "', '" + email.trim() + "', '2', '1', '" + curDt.format(dt) + "')";
	
	int affected = stmt.executeUpdate(sql);
	
	if (affected > 0){
		response.sendRedirect(application.getContextPath() + "/register.jsp?msg=success");
		return;
	}else{
		response.sendRedirect(application.getContextPath() + "/register.jsp?msg=failed");
		return;
	}	
}else{
	// data di tabel masih kosong
	Date dt = new Date();
	SimpleDateFormat curDt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	sql = "INSERT INTO BJ_User (BJ_UserID, BJ_userName, BJ_userPWD, BJ_userFullName, BJ_userPhone, BJ_userAddr, BJ_userEmail, BJ_userRole, BJ_userStatus, BJ_userRegisterDate) " +
	"VALUES ('US001', '" + username.trim() + "', '" + password1 + "','" + fullname.trim() + "', '" + phone.trim() + "', '" + address.trim() + "', '" + email.trim() + "', '2', '1', '" + curDt.format(dt) + "')";
	
	int affected = stmt.executeUpdate(sql);
	
	if (affected > 0){
		response.sendRedirect(application.getContextPath() + "/register.jsp?msg=success");
		return;
	}else{
		response.sendRedirect(application.getContextPath() + "/register.jsp?msg=failed");
		return;
	}
}
%>