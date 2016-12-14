<%@ include file="/utility/dbcontext.jsp" %>
<%
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");

// prevent privilege escalation
// only admin can access this page
if (_userRole != 1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

Integer _transID = request.getParameter("transID") != null ? Integer.parseInt(request.getParameter("transID").toString()) : -1;

if (_transID == -1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String sql = "update BJ_TransactionHeader set BJ_transStatusID = 2 where BJ_transID=" + _transID;
stmt.executeUpdate(sql);

response.sendRedirect(application.getContextPath() + "/pages/transaction.jsp");
%>