<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="/utility/dbcontext.jsp" %>
<%
String uid = (String)request.getParameter("uid");
if (uid == null || uid.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/cart.jsp");
	return;
}else{
	/* insert into TransactionHeader */
	
	// check if current transaction table is empty or not
	String sql = "select BJ_transID from BJ_TransactionHeader order by BJ_transID";
	ResultSet rsCart = stmt.executeQuery(sql);
	
	if (!rsCart.isBeforeFirst()){
		// if current table is empty
		// insert new id
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// set to pending
		sql = "insert into BJ_TransactionHeader values (1, '" + sdf.format(dt) + "', '" + uid + "', 1)";
		stmt.executeUpdate(sql);
		
		// now insert cart to TransactionDetail
		sql = "insert into BJ_TransactionDetail " +
				"select 1,a.BJ_cartProductID,a.BJ_cartQty from BJ_Cart a " +
				"where a.BJ_cartUserID = '" + uid + "' and a.BJ_cartStatus = 1";
		stmt.executeUpdate(sql);
		
		// Update available stock
		sql = "update BJ_Product a " +
				"join BJ_Cart b on a.BJ_productID = b.BJ_cartProductID and b.BJ_cartStatus = 1 " +
				"set a.BJ_productStock = a.BJ_productStock - b.BJ_cartQty " +
				"where b.BJ_cartUserID = '" + uid + "'";
		stmt.executeUpdate(sql);
		
		// delete cart
		sql = "delete from BJ_Cart where BJ_cartUserID = '" + uid + "'";
		stmt.executeUpdate(sql);
	}else{
		// else just calculate transID from last ID
		rsCart.next();
		Integer newID = rsCart.getInt("BJ_transID") + 1;
		
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// set to pending
		sql = "insert into BJ_TransactionHeader values (1, '" + sdf.format(dt) + "', '" + uid + "', 1)";
		stmt.executeUpdate(sql);
		
		// now insert cart to TransactionDetail
		sql = "insert into BJ_TransactionDetail " +
				"select " + newID + ",a.BJ_cartProductID,a.BJ_cartQty from BJ_Cart a " +
				"where a.BJ_cartUserID = '" + uid + "' and a.BJ_cartStatus = 1";
		stmt.executeUpdate(sql);
		
		// Update available stock
		sql = "update BJ_Product a " +
				"join BJ_Cart b on a.BJ_productID = b.BJ_cartProductID and b.BJ_cartStatus = 1 " +
				"set a.BJ_productStock = a.BJ_productStock - b.BJ_cartQty " +
				"where b.BJ_cartUserID = '" + uid + "'";
		stmt.executeUpdate(sql);
		
		// delete cart
		sql = "delete from BJ_Cart where BJ_cartUserID = '" + uid + "'";
		stmt.executeUpdate(sql);
	}
	
	response.sendRedirect(application.getContextPath() + "/pages/cart.jsp");
	return;
}
%>