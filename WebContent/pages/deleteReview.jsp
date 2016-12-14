<%@ include file="/utility/dbcontext.jsp" %>
<%
String _userID = (String)session.getAttribute("BJ_USERID");
if (_userID == null){
	response.sendRedirect(application.getContextPath() + "/login.jsp");
}

//get current user role
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");

//parameter uid hanya boleh digunakan oleh admin...
//jika ada akses diluar admin, maka akan diarahkan ke halaman index
String _uid = (String)request.getParameter("uid");

if (_uid != null && _userRole != 1){
	// tolak akses
	response.sendRedirect(application.getContextPath() + "/index.jsp");
}

String rid = (String)request.getParameter("rid");
String pid = (String)request.getParameter("pid");

String sql = "";
if (rid == null || rid.equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid);
}else{
	if (_uid != null){
		sql = "delete from BJ_Review where BJ_reviewID = '" + rid + "' and BJ_reviewerID = '" + _uid + "'";
	}else{
		sql = "delete from BJ_Review where BJ_reviewID = '" + rid + "'";	
	}
	if (stmt.executeUpdate(sql) > 0){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid);
	}else{
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid + "&e=Failed+deleting+review!");
	}
}
%>
