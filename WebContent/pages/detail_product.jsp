<%-- Header --%>
<%
String _pID = (String)request.getParameter("pid");
if (_pID == null){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
%>
<%@ include file="system/header.jsp" %>
<title>BJKomputer - Product Detail </title>
<style>
img
{
	height: 450px;
	min-height: 450px;
	width: 100%;
}
</style>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
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
			<img class="text-center" src="<%= application.getContextPath() + "/assets/images/" + rs.getString("BJ_productImage") %>" alt="Image not available">
			<p style="margin-top: 20px;"><span class="text-left">IDR <%= rs.getInt("BJ_productPrice") %></span><span class="text-right" style="margin-left: 60%;">Stock: <%= rs.getInt("BJ_productStock") %></span></p>
			<hr>
			<h4 class="text-center">Description</h4>
			<hr>
			<p><%= rs.getString("BJ_productDesc") %></p>
			<%
			if (_userRole == 2){
			%>
			<form class="form-inline text-center" method="post" action="system/doCart.jsp">
				<div class="form-group">
					<label class="sr-only" for="inQty">Quantity</label>
					<input type="number" class="form-control" id="inQty" name="inQty" placeholder="Quantity">
				</div>
				<button type="submit" class="btn btn-primary">Add to Cart</button>
			</form>
			<%
			}
			%>
		</div>
	<%
	rs.close();
	%>	
	</div>
	
	<div class="row" style="margin-bottom: 150px; margin-top: 25px;">
	<%
	sql = "select b.BJ_userName, a.BJ_reviewDesc from BJ_Review a join BJ_User b " +
		"on a.BJ_reviewerID = b.BJ_userID and b.BJ_userStatus = 1";
	rs = stmt.executeQuery(sql);
	%>
		<div class="col-md-4 col-md-offset-4" style="border: 1px groove black; border-radius: 5px; padding-bottom: 25px;">
			<h2 class="text-center">Product Review</h2>
			<%
			if (rs.isBeforeFirst()){
				while(rs.next()){
			%>
			<p class="text-left"><label><%= rs.getString("BJ_userName") %>:</label><span style="margin-left: 15px;"><%= rs.getString("BJ_reviewDesc") %></span></p>
			<%
				}
			}else{
			%>
			<p class="text-center"><b>No Review Yet</b></p>
			<%
			}
			%>
			
			<%
			if (_userRole == 2 || _userRole == 1){
			%>
			<form class="form-inline text-center" method="post" action="system/doReview.jsp">
				<div class="form-group">
					<label class="sr-only" for="txtReview">Review</label>
					<input type="text" class="form-control" id="txtReview" name="inReview" placeholder="Insert review here...">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>	
			<%
			}
			%>
		</div>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>