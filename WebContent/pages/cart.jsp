<%-- Header --%>
<%@ include file="system/header.jsp" %>
<%
// prevent privilege escalation,
// only member can access this page
if (_userRole != 2){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
String _userID = (String)session.getAttribute("BJ_USERID") == null ? "" : (String)session.getAttribute("BJ_USERID");
%>
<title>BJKomputer - Cart</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-10 col-md-offset-1 bjloginpnl">
			<h2 class="text-center">Cart</h2>
			<table class="table">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Subtotal</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<%
				sql = "select a.BJ_cartID as CID, b.BJ_productName as Product, b.BJ_productPrice as Price, a.BJ_cartQty as Qty, a.BJ_cartSubPrice as SubPrice," + 
						"(select SUM(aa.BJ_cartSubPrice) from BJ_Cart aa where aa.BJ_cartUserID = a.BJ_cartUserID and aa.BJ_cartStatus = 1) as TotalPrice " +
						"from BJ_Cart a join BJ_Product b on a.BJ_cartProductID = b.BJ_productID and b.BJ_productStatus = 1 " + 
						"where a.BJ_cartUserID = '" + _userID + "' and a.BJ_cartStatus = 1";
				ResultSet rsCart = stmt.executeQuery(sql);
				
				// cart is not empty
				if (rsCart.isBeforeFirst()){
					while(rsCart.next()){
				%>
					<tr>
						<td><%= rsCart.getString("Product") %></td>
						<td><%= rsCart.getString("Price") %></td>
						<td><%= rsCart.getInt("Qty") %></td>
						<td>Rp. <%= rsCart.getInt("SubPrice") %></td>
						<td><a href="<%= application.getContextPath() + "/pages/system/cartDelete.jsp?cid=" + rsCart.getString("CID") %>" class="btn btn-danger" role="button">Delete</a></td>
					</tr>
				<%
					}
				%>
				</tbody>
				<tfoot>
					<tr>
						<%
						rsCart.first();	// set to first row for fetching total price
						%>
						<td></td>
						<td></td>
						<td><b>Total Price</b></td>
						<td><b>Rp. <%= rsCart.getInt("TotalPrice") %></b></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="<%= application.getContextPath() + "/pages/system/cartCheckout.jsp?uid=" + _userID %>" class="btn btn-primary" role="button">Checkout</a></td>
						<td></td>
					</tr>
				</tfoot>
				<%
				}else{	// else cart is empty
				%>
					<tr>
						<td colspan="5" class="text-center">Cart is empty</td>
					</tr>
				</tbody>
				<%
				}
				%>
			</table>
		</div>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>