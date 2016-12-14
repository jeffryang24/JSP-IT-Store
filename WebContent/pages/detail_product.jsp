<%-- Header --%>
<%
String _pID = (String)request.getParameter("pid");
if (_pID == null || _pID.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
%>
<%@ include file="system/header.jsp" %>
<title>BJKomputer - Product Detail </title>
<style>
img
{
	height: 200px;
	min-height: 200px;
	width: 100%;
}
</style>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%
	String _userID = "";
	if (_userRole == 1 || _userRole == 2){
		_userID = (String)session.getAttribute("BJ_USERID");
	}
	%>
	<%-- Content --%>
	<div class="row">
	<%
	sql = "select BJ_productName, BJ_productImage, BJ_productPrice, BJ_productStock, " +
		"BJ_productDesc from BJ_Product where BJ_productID = '" + _pID + "' and BJ_productStatus = 1";
	ResultSet rs = stmt.executeQuery(sql);
	
	// set to first row
	rs.next();
	%>
		<div class="col-md-4 col-md-offset-4" style="border: 1px groove black; border-radius: 5px; padding-bottom: 25px;">
			<h2 class="text-center"><%= rs.getString("BJ_productName") %></h2>
			<img class="text-center" src="<%= application.getContextPath() + rs.getString("BJ_productImage") %>" alt="Image not available">
			<p style="margin-top: 20px;"><span class="text-left">IDR <%= rs.getInt("BJ_productPrice") %></span><span class="text-right" style="margin-left: 60%;">Stock: <%= rs.getInt("BJ_productStock") %></span></p>
			<hr>
			<h4 class="text-center">Description</h4>
			<hr>
			<p><%= rs.getString("BJ_productDesc") %></p>
			<%
			if (_userRole == 2){
				if (rs.getInt("BJ_productStock") > 0){	// start of stock checking
			%>
			<form class="form-inline text-center" method="post" action="system/doCart.jsp">
				<div class="form-group">
					<label class="sr-only" for="inQty">Quantity</label>
					<input type="text" class="form-control" id="inQty" name="inQty" placeholder="Quantity">
					<input type="hidden" name="pid" value="<%= _pID %>">
				</div>
				<button type="submit" class="btn btn-primary">Add to Cart</button>
			</form>
				<%
				String errorProd = (String)request.getParameter("eProd");
				String msgProd = (String)request.getParameter("msgProd");
				if (errorProd != null){
				%>
			<div class="alert alert-danger" role="alert"><%= errorProd %></div>
				<%
				}
				%>
				<%
				if (msgProd != null){
				%>
			<div class="alert alert-success" role="alert"><%= msgProd %></div>
				<%
				}
				%>
			<%
				}else{	// else of stock checking
			%>
				<p class="text-center bg-danger">Empty Stock</p>
			<%
				}	// end of stock checking
			}
			%>
		</div>
	<%
	rs.close();
	%>	
	</div>
	
	<div class="row" style="margin-bottom: 150px; margin-top: 25px;">
	<%
	if (_userRole != 1){
		sql = "select b.BJ_userName, a.BJ_reviewDesc from BJ_Review a join BJ_User b " +
				"on a.BJ_reviewerID = b.BJ_userID and b.BJ_userStatus = 1 " +
				"where a.BJ_productID = '" + _pID + "' order by a.BJ_reviewID";	
	}else{
		sql = "select a.BJ_reviewID, b.BJ_userName, a.BJ_reviewerID, a.BJ_reviewDesc from BJ_Review a join BJ_User b " +
				"on a.BJ_reviewerID = b.BJ_userID and b.BJ_userStatus = 1 " +
				"where a.BJ_productID = '" + _pID + "' order by a.BJ_reviewID";
	}
	rs = stmt.executeQuery(sql);
	%>
		<div class="col-md-4 col-md-offset-4" style="border: 1px groove black; border-radius: 5px; padding-bottom: 25px;">
			<h2 class="text-center">Product Review</h2>
			<%
			if (rs.isBeforeFirst()){
				if (_userRole != 1){
					while(rs.next()){	
			%>
			<p class="text-left"><label><%= rs.getString("BJ_userName") %>:</label><span style="margin-left: 15px;"><%= rs.getString("BJ_reviewDesc") %></span></p>
			<%
					}
				}else{
					while(rs.next()){
			%>
			<hr>
			<p class="text-left"><label><%= rs.getString("BJ_userName") %>:</label><span style="margin-left: 15px;"><%= rs.getString("BJ_reviewDesc") %></span></p>
			<p class="text-center">
				<a href="<%= application.getContextPath() + "/pages/updateReview.jsp?rid=" + rs.getString("BJ_reviewID") + "&pid=" + _pID + "&uid=" + rs.getString("BJ_reviewerID") %>" class="btn btn-default" role="button" style="margin-right: 5px;">Edit Review</a>
				<a href="#" onclick="redirectTo('<%= application.getContextPath() + "/pages/deleteReview.jsp?rid=" + rs.getString("BJ_reviewID") + "&pid=" + _pID + "&uid=" + rs.getString("BJ_reviewerID") %>')" class="btn btn-danger" role="button">Delete Review</a>
			</p>
			<hr>
			<%
					}
				}
			}else{
			%>
			<p class="text-center"><b>No Review Yet</b></p>
			<%
			}
			%>
			
			<%
			if (_userRole == 2 || _userRole == 1){
				sql = "SELECT BJ_reviewDesc, BJ_reviewID from BJ_Review where BJ_reviewerID = '" + _userID + "' and BJ_productID = '" + _pID + "'";
				rs = stmt.executeQuery(sql);
				
				if (!rs.isBeforeFirst()){
			%>
			<form class="form-inline text-center" method="post" action="system/doReview.jsp">
				<div class="form-group">
					<label class="sr-only" for="txtReview">Review</label>
					<input type="text" class="form-control" id="txtReview" name="inReview" placeholder="Insert review here...">
				</div>
				<input type="hidden" name="hidPID" value="<%= _pID %>">
				<input type="hidden" name="hidUID" value="<%= _userID %>">
				<button type="submit" class="btn btn-default">Submit</button>
			</form>	
			<%
				}else{
					rs.next();
			%>
			<p class="text-center"><%= rs.getString("BJ_reviewDesc") %></p>
			<p class="text-center">
				<a href="<%= application.getContextPath() + "/pages/updateReview.jsp?rid=" + rs.getString("BJ_reviewID") + "&pid=" + _pID %>" class="btn btn-default" role="button" style="margin-right: 5px;">Edit Review</a>
				<a href="#" onclick="redirectTo('<%= application.getContextPath() + "/pages/deleteReview.jsp?rid=" + rs.getString("BJ_reviewID") + "&pid=" + _pID  %>')" class="btn btn-danger" role="button">Delete Review</a>
			</p>
			<%
					rs.close();
				}
			}
			%>
			<%
			String error = (String)request.getParameter("e");
			if (error != null){
			%>
			<div class='alert alert-danger' role='alert'><%= error %></div>
			<%
			}
			%>
		</div>
	</div>
	<script>
		function redirectTo(link){
			var askUser = confirm("Are you sure want to delete this review?");
			if (askUser){
				document.location = link;
			}
		}
	</script>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>