<%@ include file="/utility/dbcontext.jsp" %>
<%@ include file="/utility/helper.jsp" %>
<%
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");
if (_userRole != 2){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String _userID = (String)session.getAttribute("BJ_USERID");
if (_userID == null){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String password1 = (String)request.getParameter("txtPassword");
String password2 = (String)request.getParameter("txtPassword2");
String fullname = (String)request.getParameter("txtFullname");
String phone = (String)request.getParameter("txtPhonenumber");
String address = (String)request.getParameter("txtAddress");
String email = (String)request.getParameter("txtEmail");

/* Validation Section */
// validate password
if (password1.trim().equalsIgnoreCase("") || password2.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Password+is+required!");
	return;
}
//check alphanumeric using function in helper.jsp
if (!isAlphaNumeric(password1) || !isAlphaNumeric(password2)){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Password+must+be+an+alphanumeric+type!");
	return;
}

if (password1.length() < 8 || password2.length() < 8){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Password+minimum+8+characters!");
	return;
}

if (password1.trim().compareTo(password2.trim()) != 0){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Password+must+be+same!");
	return;
}

//validate full name
if (fullname.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Full+name+is+required!");
	return;
}

if (!isFullnameValid(fullname)){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Full+name+must+only+contains+alphabet!");
	return;
}
if (fullname.length() < 5){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Full+name+minimum+5+characters!");
	return;
}

//validate phone number
//using isNumeric function from helper.jsp
if (phone.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Phone+number+is+required!");
	return;
}

if (!isNumeric(phone)){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Phone+number+must+be+a+number!");
	return;
}

if (phone.length() < 8){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Phone+number+minimum+8+digits!");
	return;
}

//validate address
if (address.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Address+is+required!");
	return;
}

if (!address.contains("Street")){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Address+must+contains+'Street'+word!");
	return;
}

//validate email using regex
if (email.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Email+address+is+required!");
	return;
}
if (!isValidEmail(email)){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?e=Email+address+must+be+valid+(only+accept+.com)!");
	return;
}

String sql = "update BJ_User set BJ_userFullName='" + fullname.trim() + "', BJ_userPhone='" + phone + "', BJ_userAddr='" + address.trim() + "', BJ_userEmail='" + email + "', BJ_userPWD='" + password1 + "' " +
			"where BJ_userID = '" + _userID + "' and BJ_userStatus = 1";
if (stmt.executeUpdate(sql) > 0){
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?msg=Profile+was+updated+successfully!");
	return;
}else{
	response.sendRedirect(application.getContextPath() + "/pages/update_profile.jsp?msg=Error+occured+while+updating+profile...+Please+try+again+later!");
	return;
}
%>