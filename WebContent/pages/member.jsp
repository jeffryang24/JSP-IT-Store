<%-- Header --%>
<%@ include file="system/header.jsp" %>
<%
// prevent privilege escalation,
// only admin can access this page
if (_userRole != 1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String memberSearch = (String)request.getParameter("txtSearch");
%>
<title>BJKomputer - Member</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<h2 class="text-center">Member</h2>
			<form class="form-inline text-center" method="get">
				<div class="form-group">
					<label class="sr-only" for="inSearch">Search Member</label>
					<input type="text" class="form-control" id="inSearch" name="txtSearch" placeholder="Search Here..." value="<%= memberSearch == null ? "" : memberSearch %>">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>
		</div>
	</div>
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-10 col-md-offset-1 bjpnlnoborder">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>Full Name</th>
						<th>Phone Number</th>
						<th>Address</th>
						<th>Email</th>
						<th>Rolename</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
			<%
			if (memberSearch != null && !memberSearch.equalsIgnoreCase("")){
				sql = "select a.BJ_userID as UID, a.BJ_userName as Username, a.BJ_userFullName as FullName, a.BJ_userPhone as Phone, a.BJ_userAddr as Address, a.BJ_userEmail as Email, b.BJ_roleDescription as Role " + 
						"from BJ_User a join BJ_Role b on a.BJ_userRole = b.BJ_roleID " +
						"where a.BJ_userStatus = 1 and (a.BJ_userName like '%" + memberSearch + "%' " +
						"or a.BJ_userFullName like '%" + memberSearch + "%') order by a.BJ_userID";
			}else{
				sql = "select a.BJ_userID as UID, a.BJ_userName as Username, a.BJ_userFullName as FullName, a.BJ_userPhone as Phone, a.BJ_userAddr as Address, a.BJ_userEmail as Email, b.BJ_roleDescription as Role " + 
						"from BJ_User a join BJ_Role b on a.BJ_userRole = b.BJ_roleID order by a.BJ_userID";
			}
			ResultSet rsMember = stmt.executeQuery(sql);
			
			if (rsMember.isBeforeFirst()){
				while(rsMember.next()){
			%>
					<tr>
						<td><%= rsMember.getString("UID") %></td>
						<td><%= rsMember.getString("Username") %></td>
						<td><%= rsMember.getString("FullName") %></td>
						<td><%= rsMember.getString("Phone") %></td>
						<td><%= rsMember.getString("Address") %></td>
						<td><%= rsMember.getString("Email") %>@sad</td>
						<td><%= rsMember.getString("Role") %></td>
						<td style="width: 200px;">
						<%
						// if the role is admin,
						// then admin can only delete account
						if (rsMember.getString("Role").equalsIgnoreCase("Admin")){
						%>
							<a href="#" onclick="redirectTo('<%= application.getContextPath() + "/pages/system/admDeleteMember.jsp?uid=" + rsMember.getString("UID") %>','Are you sure want to delete this user?')" class="btn btn-danger" role="button">Delete</a>
						<%
						}else{	// else admin can change non-admin role
						%>
							<a href="#" onclick="redirectTo('<%= application.getContextPath() + "/pages/system/admDeleteMember.jsp?uid=" + rsMember.getString("UID") %>','Are you sure want to delete this user?')" class="btn btn-danger" role="button">Delete</a>
							<a href="#" onclick="redirectTo('<%= application.getContextPath() + "/pages/system/admChangeRole.jsp?uid=" + rsMember.getString("UID") %>','Are you sure want to change this user role?')" class="btn btn-warning" role="button">Change Role</a>
						<%
						}
						%>
						</td>
					</tr>
			<%
				}
			}else{
			%>
					<tr>
						<td colspan="8" class="text-center">No member available</td>
					</tr>
			<%
			}
			rsMember.close();
			%>
				</tbody>
			</table>
			<%
			String error = (String)request.getParameter("e");
			if (error != null){
			%>
			<div class="alert alert-danger" role="alert"><%= error %></div>
			<%
			}
			%>
		</div>
	</div>
	<script type="text/javascript">
		// script untuk konfirmasi aksi
		function redirectTo(link,msg){
			var askUser = confirm(msg);
			if (askUser){
				document.location = link;
			}
		}
	</script>	
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>