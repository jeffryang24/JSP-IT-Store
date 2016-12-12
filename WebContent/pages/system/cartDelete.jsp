<%@ include file="/utility/dbcontext.jsp" %>
<%
String cid = (String)request.getParameter("cid");
if (cid == null || cid.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/cart.jsp");
	return;
}else{
	String sql = "delete from BJ_Cart where BJ_cartID='" + cid + "'";
	stmt.executeUpdate(sql);
}
response.sendRedirect(application.getContextPath() + "/pages/cart.jsp");
return;
%>