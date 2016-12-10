<%-- Header --%>
<%@ include file="system/header.jsp" %>
<%
if (_userRole != 2){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
%>
<title>BJKomputer - Profile</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-4 col-md-offset-4 bjloginpnl">
			<%
			String _userID = (String)session.getAttribute("BJ_USERID");
			sql = "select BJ_userFullName, BJ_userPhone, BJ_userAddr, BJ_userEmail from BJ_User " +
				"where BJ_userID = '" + _userID + "' and BJ_userStatus = 1";
			ResultSet rsProfile = stmt.executeQuery(sql);
			
			rsProfile.next();
			%>
			<h2 class="text-center">Profile</h2>
			<div class="row">
				<div class="col-md-4"><b>Full Name</b></div>
				<div class="col-md-8">: <%= rsProfile.getString("BJ_userFullName") %></div>
			</div>
			<div class="row">
				<div class="col-md-4"><b>Phone Number</b></div>
				<div class="col-md-8">: <%= rsProfile.getString("BJ_userPhone") %></div>
			</div>
			<div class="row">
				<div class="col-md-4"><b>Address</b></div>
				<div class="col-md-8">: <%= rsProfile.getString("BJ_userAddr") %></div>
			</div>
			<div class="row">
				<div class="col-md-4"><b>Email</b></div>
				<div class="col-md-8">: <%= rsProfile.getString("BJ_userEmail") %></div>
			</div>
			<div class="row" style="margin-top: 25px;">
				<p class="text-center"><a href="<%= application.getContextPath() + "/pages/update_profile.jsp" %>" class="btn btn-default" role="button">Update Profile</a></p>
			</div>
			<%
			rsProfile.close();
			%>
		</div>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>