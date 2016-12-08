<%
	String userID = (String)session.getAttribute("BJ_USERID");
	if (userID != null) response.sendRedirect(application.getContextPath() + "/index.jsp");
%>
<%@ include file="pages/system/header.jsp"%>
<title>BJKomputer - Register</title>
</head>

<body>
	<%@ include file="pages/system/mainmenu.jsp"%>
	<div class="row">
		<div class="col-md-4 col-md-offset-4 bjloginpnl">
			<h2 class="text-center">Register</h2>
			<form class="form-horizontal" name="frmRegister" id="frmRegister"
				method="post" action="pages/system/registerp.jsp">
				<div class="form-group">
					<label for="txtUsername" class="col-sm-2 control-label">Username</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="txtUsername"
							name="txtUsername" placeholder="Username">
					</div>
				</div>
				<div class="form-group">
					<label for="txtPassword" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="txtPassword"
							name="txtPassword" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<label for="txtPassword2" class="col-sm-2 control-label">Confirm
						Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="txtPassword2"
							name="txtPassword2" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<label for="txtFullname" class="col-sm-2 control-label">Full
						Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="txtFullname"
							name="txtFullname" placeholder="Full Name">
					</div>
				</div>
				<div class="form-group">
					<label for="txtPhonenumber" class="col-sm-2 control-label">Phone
						Number</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="txtPhonenumber"
							name="txtPhonenumber" placeholder="Phone Number">
					</div>
				</div>
				<div class="form-group">
					<label for="txtAddress" class="col-sm-2 control-label">Address</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="txtAddress"
							name="txtAddress" placeholder="Address">
					</div>
				</div>
				<div class="form-group">
					<label for="txtEmail" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="txtEmail"
							name="txtEmail" placeholder="Email">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default" name="btnRegister"
							id="btnRegister">Register</button>
					</div>
				</div>
			</form>
			<%
            	String error = request.getParameter("e");
              	if (error != null && !error.toString().equalsIgnoreCase("")){
              		out.print("<div class='alert alert-danger' role='alert'>" + error + "</div>");
              	}
              	
              	String msg = request.getParameter("msg");
              	if (msg != null && !msg.toString().equalsIgnoreCase("")){
              		if (msg.equalsIgnoreCase("success")){
              			out.print("<div class='alert alert-success' role='alert'>Registration Success!</div>");	
              		}else if (msg.equalsIgnoreCase("failed")){
              			out.print("<div class='alert alert-danger' role='alert'>Registration Failed! Please try again!</div>");
              		}
              	}
            %>
		</div>
	</div>
	<%@ include file="pages/system/footer.jsp"%>