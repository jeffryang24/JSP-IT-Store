<%@page import="java.util.Date"%>
<%@ include file="/utility/dbcontext.jsp" %>
<%
// Check if the current requester is a member or not?
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");
if (_userRole != 2){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String _userID = (String)session.getAttribute("BJ_USERID");
if (_userID == null){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}
// Get all parameter from detail_product page
Integer qty = Integer.parseInt(request.getParameter("inQty"));
String pid = request.getParameter("pid");
String sql = "";
ResultSet rs = null;
// Cart input validation
if (qty < 1){
	response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid + "&eProd=Quantity+must+more+than+0!");
	return;
}else{
	// check if the quantity is bigger than available stock
	sql = "select BJ_productStock from BJ_Product where BJ_productID = '" + pid + "' and BJ_productStatus = 1";
	rs = stmt.executeQuery(sql);
	
	// fetch first row
	rs.next();
	
	if (qty > rs.getInt("BJ_productStock")){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid + "&eProd=Quantity+is+bigger+than+current+available+stock(s)!");
		return;
	}
	rs.close();
}

// check if current user has just added same product to the cart
sql = "select a.BJ_cartProductID as PID, a.BJ_cartQty as QTY, a.BJ_cartSubPrice as SUB_TOTAL, b.BJ_productPrice as PRICE from BJ_Cart a " +
		"join BJ_Product b on a.BJ_cartProductID = b.BJ_productID and b.BJ_productStatus = 1 " +
		"where a.BJ_cartUserID='" + _userID + "' and a.BJ_cartProductID='" + pid + "' and a.BJ_cartStatus = 1";
rs = stmt.executeQuery(sql);
// only for checking current operation is update or insert?
// 1 -> insert and 2 -> update
int checkpoint = 0;

// if current product already exists,
// then we will just update the qty and subtotal
if (rs.isBeforeFirst()){
	rs.next();
	sql = "update BJ_Cart set BJ_cartQty=" + qty + ", BJ_cartSubPrice=" + (rs.getInt("PRICE") * qty) + " " +
			"where BJ_cartUserID='" + _userID + "' and BJ_cartProductID = '" + pid + "' and BJ_cartStatus = 1";
	out.print(sql);
	checkpoint = 2;
}else{
	// if nothing,
	// then we need to insert this new product to the cart
	sql = "select BJ_productPrice from BJ_Product where BJ_productID = '" + pid + "' and BJ_productStatus = 1";
	rs = stmt.executeQuery(sql);
	// fetch first row for getting product price
	rs.next();
	Integer curProdPrice = rs.getInt("BJ_productPrice");
	// get current timestamp
	Date dt = new Date();
	// set to String
	String curDt = String.valueOf(dt.getTime());
	sql = "insert into BJ_Cart values ('" + curDt + "', '" + pid + "', '" + _userID + "', " + qty + ", " + (qty * curProdPrice) + ", 1)";
	checkpoint = 1;
}

if (stmt.executeUpdate(sql) > 0){
	if (checkpoint == 1){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid + "&msgProd=Product+was+added+to+the+cart!");
		return;	
	}else{
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid + "&msgProd=Cart+was+updated!");
		return;	
	}
}else{
	response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + pid + "&eProd=Failed+while+updating/inserting+cart!");
	return;
}
%>