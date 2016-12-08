<%-- Header --%>
<%@ include file="system/header.jsp" %>
<%
if (_userRole != 1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
%>
<title>BJKomputer - Add Product</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-5 col-md-offset-4 bjloginpnl">
			<h2 class="text-center">Add Product</h2>
			<form class="form-horizontal" method="post" action="system/doAddProd.jsp">
				<div class="form-group">
					<label for="txtProductName" class="col-sm-3 control-label">Product Name</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtProductName"
							placeholder="Product Name" name="txtProductName">
					</div>
				</div>
				<div class="form-group">
					<label for="txtPrice" class="col-sm-3 control-label">Price</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtPrice"
							placeholder="Price" name="txtPrice">
					</div>
				</div>
				<div class="form-group">
					<label for="txtStock" class="col-sm-3 control-label">Stock</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtStock"
							placeholder="Stock" name="txtStock">
					</div>
				</div>
				<div class="form-group">
					<label for="txtDesc" class="col-sm-3 control-label">Description</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtDesc"
							placeholder="Description" name="txtDesc">
					</div>
				</div>
				<div class="form-group">
					<label for="ioFile" class="col-sm-3 control-label">Image</label>
					<div class="col-sm-9">
						<input type="file" id="ioFile" name="ioFile">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-9">
						<button type="submit" class="btn btn-primary">Register</button>
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
		</div>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>