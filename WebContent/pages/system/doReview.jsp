<%@page import="java.util.Date"%>
<%@ include file="/utility/dbcontext.jsp" %>
<%
String review = (String)request.getParameter("inReview");
String PID = (String)request.getParameter("hidPID");
String UID = (String)request.getParameter("hidUID");

if (review == null || review.equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + PID + "&e=Review+must+be+filled!");
	return;
}else{
	
	if (review.length() < 6){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + PID + "&e=Review+must+contains+more+than+5+characters!");
		return;
	}
	
	Date dt = new Date();
	String timeStamp = String.valueOf(dt.getTime());
	String sql = "insert into BJ_Review VALUES ('" + timeStamp + "', '" + UID +  "', '" + PID +  "', '" + review + "')";
	if (stmt.executeUpdate(sql) > 0){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + PID);
		return;
	}else{
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + PID + "&e=Failed+saving+review!+Please+try+again+later!");
		return;
	}
}
%>