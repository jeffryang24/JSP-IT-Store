<%-- Header --%>
<%@ include file="system/header.jsp" %>
<%
if (_userRole != 1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String _PID = (String)request.getParameter("pid");
if (_PID == null){
	response.sendRedirect(application.getContextPath() + "/pages/product.jsp");
	return;
}
%>
<title>BJKomputer - Update Product</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-5 col-md-offset-4 bjloginpnl">
			<h2 class="text-center">Update Product</h2>
			<form class="form-horizontal" method="post" action="system/doUpProd.jsp">
			<%
			sql = "select BJ_productName, BJ_productImage, BJ_productPrice, BJ_productStock, BJ_productDesc from BJ_Product where BJ_productID = '" + _PID + "' and BJ_productStatus = 1";
			ResultSet rsProd = stmt.executeQuery(sql);
			
			if (!rsProd.isBeforeFirst()){
				response.sendRedirect(application.getContextPath() + "/pages/product.jsp");
				return;
			}else{
				rsProd.next();
			%>
				<div class="form-group">
					<label for="txtProductName" class="col-sm-3 control-label">Product Name</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtProductName"
							placeholder="Product Name" name="txtProductName" value="<%= rsProd.getString("BJ_productName") %>">
					</div>
				</div>
				<div class="form-group">
					<label for="txtPrice" class="col-sm-3 control-label">Price</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtPrice"
							placeholder="Price" name="txtPrice" value="<%= rsProd.getString("BJ_productPrice") %>">
					</div>
				</div>
				<div class="form-group">
					<label for="txtStock" class="col-sm-3 control-label">Stock</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtStock"
							placeholder="Stock" name="txtStock" value="<%= rsProd.getString("BJ_productStock") %>">
					</div>
				</div>
				<div class="form-group">
					<label for="txtDesc" class="col-sm-3 control-label">Description</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="txtDesc"
							placeholder="Description" name="txtDesc" value="<%= rsProd.getString("BJ_productDesc") %>">
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
						<input type="hidden" name="pid" value="<%= _PID %>">
						<button type="submit" class="btn btn-primary">Update</button>
					</div>
				</div>
			<%
			}
			%>
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