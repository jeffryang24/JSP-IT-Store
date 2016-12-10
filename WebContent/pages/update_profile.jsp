<%-- Header --%>
<%@ include file="system/header.jsp"%>
<%
if (_userRole != 2){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
%>
<title>BJKomputer - Update Profile</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp"%>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-5 col-md-offset-4 bjloginpnl">
			<%
			String _userID = (String)session.getAttribute("BJ_USERID");
			sql = "select BJ_userFullName, BJ_userPhone, BJ_userAddr, BJ_userEmail from BJ_User " +
				"where BJ_userID = '" + _userID + "' and BJ_userStatus = 1";
			ResultSet rsProfile = stmt.executeQuery(sql);
			
			rsProfile.next();
			%>
			<h2 class="text-center">Update Profile</h2>
			<form class="form-horizontal" name="frmUpdateProf" id="frmUpdateProf"
				method="post" action="system/doUpdateProfile.jsp">
				<div class="form-group">
					<label for="txtPassword" class="col-sm-5 control-label">New
						Password</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" id="txtPassword"
							name="txtPassword" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<label for="txtPassword2" class="col-sm-5 control-label">Confirm
						New Password</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" id="txtPassword2"
							name="txtPassword2" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<label for="txtFullname" class="col-sm-5 control-label">Full
						Name</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="txtFullname"
							name="txtFullname" placeholder="Full Name"
							value="<%= rsProfile.getString("BJ_userFullName") %>">
					</div>
				</div>
				<div class="form-group">
					<label for="txtPhonenumber" class="col-sm-5 control-label">Phone
						Number</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="txtPhonenumber"
							name="txtPhonenumber" placeholder="Phone Number"
							value="<%= rsProfile.getString("BJ_userPhone") %>">
					</div>
				</div>
				<div class="form-group">
					<label for="txtAddress" class="col-sm-5 control-label">Address</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="txtAddress"
							name="txtAddress" placeholder="Address"
							value="<%= rsProfile.getString("BJ_userAddr") %>">
					</div>
				</div>
				<div class="form-group">
					<label for="txtEmail" class="col-sm-5 control-label">Email</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" id="txtEmail"
							name="txtEmail" placeholder="Email"
							value="<%= rsProfile.getString("BJ_userEmail") %>">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-5 col-sm-7">
						<button type="submit" class="btn btn-default" name="btnUpdate"
							id="btnUpdate">Update</button>
					</div>
				</div>
				<%
				String error = (String)request.getParameter("e");
				if (error != null){
				%>
				<div class="alert alert-danger" role="alert"><%= error %></div>
				<%
				}
				%>
				<%
				String msg = (String)request.getParameter("msg");
				if (msg != null){
				%>
				<div class="alert alert-success" role="alert"><%= msg %></div>
				<%
				}
				%>
			</form>
			<%
			rsProfile.close();
			%>
		</div>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp"%>