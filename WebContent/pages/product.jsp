<%-- Header --%>
<%@ include file="/config/global.jsp" %>
<%@ include file="system/header.jsp"%>
<style>
.thumbnail img 
{
	min-height:200px; height:200px; 
}

.thumbnail
{
	min-height: 600px;
	height: 600px;	
}
</style>
<title>BJKomputer - Product</title>
</head>
<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp"%>
	<%-- Content --%>
	<%
	// check apakah ada request dari search form atau tidak
	String _searchQuery = (String)request.getParameter("txtSearch");
	String searchTxt = "";
	if (_searchQuery != null){
		searchTxt = _searchQuery;
	}
	%>
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<h2 class="text-center">Our Product</h2>
			<form class="form-inline text-center" method="get">
				<div class="form-group">
					<label class="sr-only" for="inSearch">Search Product</label>
					<input type="text" class="form-control" id="inSearch" name="txtSearch" placeholder="Search..." value="<%= searchTxt %>">
				</div>
				<button type="submit" class="btn btn-default">Search</button>
			</form>
		</div>
	</div>
	<%-- product list --%>
	<div class="row" style="margin-bottom: 30px; margin-top: 50px; padding: 0 30px 0 30px">
		<%
		String sqlProduct = "";
		ResultSet rsProduct = null;
		if (_searchQuery == null || _searchQuery.equalsIgnoreCase("")){
			sqlProduct = "select BJ_productID, BJ_productName, BJ_productImage, BJ_productPrice, BJ_productStock, " +
					"BJ_productDesc from BJ_Product where BJ_productStatus = 1 order by BJ_productName";
		}else{
			sqlProduct = "select BJ_productID, BJ_productName, BJ_productImage, BJ_productPrice, BJ_productStock, " +
					"BJ_productDesc from BJ_Product where BJ_productStatus = 1 and BJ_productName like '%" + _searchQuery + "%' order by BJ_productName";
		}
		
		rsProduct = stmt.executeQuery(sqlProduct);
		int iteration = 0, row = 0, p = 0;
		
		if (!rsProduct.isBeforeFirst()){
			out.print("<p class='text-center'>No data available</p>");
		}else{
			
			// check returned row
			rsProduct.last();
			row = rsProduct.getRow();
			rsProduct.beforeFirst();
			
			iteration = row % MAX_ITEM_PER_PAGE == 0 ? row / MAX_ITEM_PER_PAGE : (row / MAX_ITEM_PER_PAGE) + 1;

			p = request.getParameter("p") == null ? 1 : Integer.parseInt(request.getParameter("p"));
			for(int i=0; i < (p - 1) * MAX_ITEM_PER_PAGE; i++){
				rsProduct.next();
			}
			
			int j = 0;
			
			while(rsProduct.next()){
				if (++j > MAX_ITEM_PER_PAGE) break;
				out.print("<div class='col-sm-6 col-md-4'>");	
				out.print("<div class='thumbnail'>");
				out.print("<img src='" + application.getContextPath() + "/assets/images/" + rsProduct.getString("BJ_productImage") + "' alt='Images not available' height='300'>");
				out.print("<div class='caption'>");
				out.print("<h3>" + rsProduct.getString("BJ_productName") + "</h3>");
				out.print("<p class='text-left'>" + rsProduct.getString("BJ_productDesc") + "</p>");
				out.print("<p class='text-left'><b>Price</b>: IDR " + rsProduct.getInt("BJ_productPrice") + "</p>");
				out.print("<p class='text-left'><b>Stock</b>: " + rsProduct.getInt("BJ_productStock") + "</p>");
				if (_userRole == 1){
					out.print("<p><a href='" + application.getContextPath() + "/pages/detail_product.jsp?pid=" + rsProduct.getString("BJ_productID") + "' class='btn btn-primary' role='button'>View</a>");
					out.print("<a href='" + application.getContextPath() + "/pages/update_product.jsp?pid=" + rsProduct.getString("BJ_productID") + "' class='btn btn-default' role='button'>Update</a>");
					out.print("<a href='" + application.getContextPath() + "/pages/delete_product.jsp?pid=" + rsProduct.getString("BJ_productID") + "' class='btn btn-danger' role='button'>Delete</a></p>");
				}else{
					out.print("<p><a href='" + application.getContextPath() + "/pages/detail_product.jsp?pid=" + rsProduct.getString("BJ_productID") + "' class='btn btn-primary' role='button'>View</a></p>");
				}
				out.print("</div>");	// end of class caption
				out.print("</div>");	// end of class col-sm-6
				out.print("</div>");	// end of class thumbnail
			}
		}
		%>
	</div>
	<%-- pagination --%>
	<div class="row" style="margin-bottom: 100px;">
		<nav aria-label="Page Navigation" class="text-center">
			<ul class="pagination">
				<%
					if (p <= 1) {
						out.print(
								"<li class='disabled'><a href='#' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
					} else {
						if (_searchQuery != null) {
							out.print("<li><a href='" + application.getContextPath() + "/pages/product.jsp?p=" + (p - 1) + "&txtSearch="
									+ _searchQuery
									+ "' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
						} else {
							out.print("<li><a href='" + application.getContextPath() + "/pages/product.jsp?p=" + (p - 1)
									+ "' aria-label='Previous'><span aria-hidden='true'>&laquo;</span></a></li>");
						}
					}
					for (int i = 1; i <= iteration; i++) {
						if (_searchQuery != null) {
							out.print("<li><a href='" + application.getContextPath() + "/pages/product.jsp?p=" + i + "&txtSearch="
									+ _searchQuery + "'>" + i + "</a></li>");
						} else {
							out.print("<li><a href='" + application.getContextPath() + "/pages/product.jsp?p=" + i + "'>" + i
									+ "</a></li>");
						}
					}
					if (p == iteration) {
						out.print(
								"<li class='disabled'><a href='#' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
					} else {
						if (_searchQuery != null) {
							out.print("<li><a href='" + application.getContextPath() + "/pages/product.jsp?p=" + (p + 1) + "&txtSearch="
									+ _searchQuery + "' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
						} else {
							out.print("<li><a href='" + application.getContextPath() + "/pages/product.jsp?p=" + (p + 1)
									+ "' aria-label='Next'><span aria-hidden='true'>&raquo;</span></a></li>");
						}
					}
					
					rsProduct.close();
				%>
			</ul>
		</nav>
		<%
		if (_userRole == 1){
		%>
		<p class="text-center"><a href="<%= application.getContextPath() + "/pages/add_product.jsp" %>" class="btn btn-default" role="button">Add Product</a></p>
		<%
		}
		%>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp"%>