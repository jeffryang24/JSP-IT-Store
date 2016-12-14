<%@ include file="/utility/dbcontext.jsp" %>
<%
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");
if (_userRole != 1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String _PID = (String)request.getParameter("pid");

if (_PID != null){
	String sql = "delete from BJ_Product where BJ_productID = '" + _PID + "'";
	if (stmt.executeUpdate(sql) > 0){
		response.sendRedirect(application.getContextPath() + "/pages/product.jsp?msg=Product+was+successfully+deleted!");
		return;
	}else{
		response.sendRedirect(application.getContextPath() + "/pages/product.jsp?e=Product+was+not+successfully+deleted!");
		return;
	}
}
%>