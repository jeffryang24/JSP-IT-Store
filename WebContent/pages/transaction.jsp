<%-- Header --%>
<%@ include file="system/header.jsp" %>
<%
// only member and admin can access this page
if (_userRole != 1 && _userRole != 2){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

// second level checking
String _userID = (String)session.getAttribute("BJ_USERID");
if (_userID == null){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

ResultSet rsTrans = null;
%>
<title>BJKomputer - Transaction</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-8 col-md-offset-2 bjpnlnoborder">
		<h2 class="text-center" style="margin-bottom: 20px;">History Transaction</h2>			
		<%
		// for user/member
		if (_userRole == 2){
			sql = "select BJ_transID as ID, BJ_transDate as DT, BJ_transStatusID as STATUS_ID from BJ_TransactionHeader where BJ_transUserID = '" + _userID + "' order by BJ_transID";
			rsTrans = stmt.executeQuery(sql);
			
			if (!rsTrans.isBeforeFirst()){	// if data kosong
		%>
			<p class="text-center">No Transaction Available</p>
		<%
			}else{ // end if data kosong
				while(rsTrans.next()){
		%>
			<div class="panel <%= rsTrans.getInt("STATUS_ID") == 1 ? "panel-warning" : "panel-success" %>">
				<div class="panel-heading">
					<h3 class="panel-title pull-left">Transaction ID: <%= rsTrans.getInt("ID") %></h3>
					<h3 class="panel-title pull-right">Status: <%= rsTrans.getInt("STATUS_ID") == 1 ? "Pending" : "Approved" %></h3>
					<div class="clearfix"></div>
				</div>
				<div class="panel-body">
					<%
					SimpleDateFormat fromDB = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					SimpleDateFormat toPanel = new SimpleDateFormat("dd-MM-yyyy");
					
					String panelDate = toPanel.format(rsTrans.getDate("DT"));
					%>
					<p style="font-size: 12px; margin-bottom: 20px;">Date: <%= panelDate %></p>
		<%
					String sqlTrans = "select a.BJ_transProductQty as QTY, b.BJ_productName as PROD_NAME, " +
							"b.BJ_productPrice as PROD_PRICE, (a.BJ_transProductQty * b.BJ_productPrice) as SUBTOTAL, " +
							"(select SUM(aa.BJ_transProductQty * bb.BJ_productPrice) as TOTAL from BJ_TransactionDetail aa " +
							"join BJ_Product bb on aa.BJ_transProductID = bb.BJ_productID and bb.BJ_productStatus = 1 " +
							"where aa.BJ_transID = a.BJ_transID) as TOTAL from BJ_TransactionDetail a " +
							"join BJ_Product b on a.BJ_transProductID = b.BJ_productID and b.BJ_productStatus = 1 " +
							"where a.BJ_transID = " + rsTrans.getInt("ID");
					Statement stmt2 = conn.createStatement(1004,1008);
					ResultSet rsPanel = stmt2.executeQuery(sqlTrans);
					while(rsPanel.next()){
		%>
					<p style="margin-bottom: 2px;"><%= rsPanel.getString("PROD_NAME") + " Rp. " + rsPanel.getString("PROD_PRICE") + " (" + rsPanel.getInt("QTY") + " pcs) = Rp. " + rsPanel.getInt("SUBTOTAL") %></p>
		<%
					}	// end of inside panel generation
					// set rsPanel to first again (only for getting total price)
					rsPanel.first();
		%>
					<hr>
					<p style="margin-top: 5px;"><b>Total: Rp. <%= rsPanel.getInt("TOTAL") %></b></p>
				</div>
			</div>
		<%
				}	// end of trans RS transaction
			}	// else data tidak kosong
		}else if (_userRole == 1){	// else for admin.
			sql = "select a.BJ_transID as ID, a.BJ_transDate as DT, a.BJ_transStatusID as STATUS_ID, b.BJ_userName as USERNAME from BJ_TransactionHeader a " +
					"join BJ_User b on a.BJ_transUserID = b.BJ_userID order by a.BJ_transID";
			rsTrans = stmt.executeQuery(sql);
				
			if (!rsTrans.isBeforeFirst()){	// jika data kosong
		%>
			<p class="text-center">No Transaction Available</p>
		<%
			}else{	// jika ada data
				while(rsTrans.next()){
		%>
			<div class="panel <%= rsTrans.getInt("STATUS_ID") == 1 ? "panel-warning" : "panel-success" %>">
				<div class="panel-heading">
					<h3 class="panel-title pull-left">Transaction ID: <%= rsTrans.getInt("ID") %></h3>
					<h3 class="panel-title pull-right">Status: <%= rsTrans.getInt("STATUS_ID") == 1 ? "Pending" : "Approved" %></h3>
					<div class="clearfix"></div>
				</div>
				<div class="panel-body">
				<%
				SimpleDateFormat fromDB = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat toPanel = new SimpleDateFormat("dd-MM-yyyy");
				
				String panelDate = toPanel.format(rsTrans.getDate("DT"));
				%>
					<p style="font-size: 12px; margin-bottom: 2px;">Date: <%= panelDate %></p>
					<p style="font-size: 12px; margin-bottom: 20px;">By: <%= rsTrans.getString("USERNAME") %></p>
		<%
					String sqlTrans = "select a.BJ_transProductQty as QTY, b.BJ_productName as PROD_NAME, " +
							"b.BJ_productPrice as PROD_PRICE, (a.BJ_transProductQty * b.BJ_productPrice) as SUBTOTAL, " +
							"(select SUM(aa.BJ_transProductQty * bb.BJ_productPrice) as TOTAL from BJ_TransactionDetail aa " +
							"join BJ_Product bb on aa.BJ_transProductID = bb.BJ_productID and bb.BJ_productStatus = 1 " +
							"where aa.BJ_transID = a.BJ_transID) as TOTAL from BJ_TransactionDetail a " +
							"join BJ_Product b on a.BJ_transProductID = b.BJ_productID and b.BJ_productStatus = 1 " +
							"where a.BJ_transID = " + rsTrans.getInt("ID");
					Statement stmt2 = conn.createStatement(1004,1008);
					ResultSet rsPanel = stmt2.executeQuery(sqlTrans);
					while(rsPanel.next()){
		%>
					<p style="margin-bottom: 2px;"><%= rsPanel.getString("PROD_NAME") + " Rp. " + rsPanel.getString("PROD_PRICE") + " (" + rsPanel.getInt("QTY") + " pcs) = Rp. " + rsPanel.getInt("SUBTOTAL") %></p>
		<%
					} // end of rsPanel Integration
					// set cursor back to first for getting Total Price
					rsPanel.first();
		%>
					<hr>
					<p style="margin-top: 5px;"><b>Total: Rp. <%= rsPanel.getInt("TOTAL") %></b></p>
					<%
					if (rsTrans.getInt("STATUS_ID") == 1){
					%>
					<p class="text-center"><a href="<%= application.getContextPath() + "/pages/system/admApproveTrans.jsp?transID=" + rsTrans.getInt("ID") %>" class="btn btn-primary" role="button">Approve</a></p>
					<%
					}
					%>
				</div>
			</div>
		<%
				}	// end of rsTrans
			}	// end of ada data
		}	// end of role select
		%>
		</div>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>