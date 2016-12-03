<%@ include file="/utility/dbcontext.jsp" %>
<%
String username = (String)request.getParameter("txtUsername");
String password = (String)request.getParameter("txtPassword");
String chkRemember = (String)request.getParameter("chkRemember");

// validate user request
if (username.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/login.jsp?e=Username+is+required!");
	return;
}

if (password.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/login.jsp?e=Password+is+required!");
	return;
}

Statement stmt = conn.createStatement(1004,1008);
ResultSet rs = null;
String sql = "";

// check user
sql = "SELECT BJ_userID, BJ_userName, BJ_userFullName, BJ_userRole, BJ_userEmail from BJ_User where BJ_userName = '" + username.trim() + "' and BJ_userPWD = '" + password + "' and BJ_userStatus = 1";
rs = stmt.executeQuery(sql);

if (rs.isBeforeFirst()){
	rs.next();
	// buat session untuk user
	session.setAttribute("BJ_USERID", rs.getString("BJ_userID"));
	session.setAttribute("BJ_USERNAME", rs.getString("BJ_userName"));
	session.setAttribute("BJ_USERFULLNAME", rs.getString("BJ_userFullName"));
	session.setAttribute("BJ_USERROLE", rs.getInt("BJ_userRole"));
	session.setAttribute("BJ_USEREMAIL", rs.getString("BJ_userEmail"));
	
	// set user online ditambah satu
	int onlineUser = 0;
	if (application.getAttribute("appBJ_USERONLINE") == null){
		onlineUser = 1;
		application.setAttribute("appBJ_USERONLINE", onlineUser);
	}else{
		onlineUser = (Integer)application.getAttribute("appBJ_USERONLINE");
		application.setAttribute("appBJ_USERONLINE", onlineUser + 1);
	}
	
	// jika remember dicentang, maka
	// buat cookie satu jam untuk username dan password itu
	
	Cookie ckUsername = new Cookie("ckBJ_USERNAME", username.trim());
	Cookie ckPassword = new Cookie("ckBJ_PASSWORD", password);
	
	ckUsername.setMaxAge(60 * 60);	// 3600 sec = 1 hour
	ckPassword.setMaxAge(60 * 60);
	ckUsername.setPath(application.getContextPath());
	ckPassword.setPath(application.getContextPath());
	
	response.addCookie(ckUsername);
	response.addCookie(ckPassword);
	
	response.sendRedirect(application.getContextPath() + "/index.jsp");
}else{
	response.sendRedirect(application.getContextPath() + "/login.jsp?msg=failed");
	return;
}

%>