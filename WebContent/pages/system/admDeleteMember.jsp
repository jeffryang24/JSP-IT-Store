<%@ include file="/utility/dbcontext.jsp" %>
<%
// prevent privilege escalation
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");

if (_userRole != 1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String uid = (String)request.getParameter("uid");

if (uid != null && !uid.trim().equalsIgnoreCase("")){
	String sql = "delete from BJ_User where BJ_userID='" + uid + "'";
	if (stmt.executeUpdate(sql) > 0){
		response.sendRedirect(application.getContextPath() + "/pages/member.jsp");
		return;
	}else{
		response.sendRedirect(application.getContextPath() + "/pages/member.jsp?e=Error+while+deleting+user!");
		return;
	}
}else{
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
%>