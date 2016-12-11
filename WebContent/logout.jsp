<%
// check jika tidak ada session, tidak boleh akses
// halaman ini

String userID = (String)session.getAttribute("BJ_USERID");
if (userID != null){
	session.invalidate();
	
	Integer onlineUser = 0;
	if (application.getAttribute("appBJ_USERONLINE") == null){
		application.setAttribute("appBJ_USERONLINE", onlineUser);
	}else{
		onlineUser = (Integer)application.getAttribute("appBJ_USERONLINE");
		application.setAttribute("appBJ_USERONLINE", onlineUser - 1);
	}
	
	response.sendRedirect(application.getContextPath() + "/index.jsp");
}else{
	response.sendRedirect(application.getContextPath() + "/index.jsp");
}
return;
%>