<%@ include file="/utility/dbcontext.jsp" %>
<%@ include file="/config/global.jsp" %>
<%@ include file="/utility/helper.jsp" %>
<%
// prevent privilege escalation
Integer _userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");
if (_userRole != 1){
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}

String txtProductName = (String)request.getParameter("txtProductName");
String txtPrice = (String)request.getParameter("txtPrice");
String txtStock = (String)request.getParameter("txtStock");
String txtDesc = (String)request.getParameter("txtDesc");
String ioFile = (String)request.getParameter("ioFile");
String pid = (String)request.getParameter("pid");

//validation
if (txtProductName.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Product+name+is+required!");
	return;
}

if (txtProductName.length() < 8 || txtProductName.length() > 15){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Product+name+must+contains+8+to+15+characters!");
	return;
}

if (txtPrice.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Price+is+required!");
	return;
}

if (!isNumeric(txtPrice)){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Price+only+contains+number!");
	return;
}

int price = Integer.parseInt(txtPrice);
if (price < 500000 || price > 10000000){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Price+must+between+500000+and+10000000!");
	return;
}

if (txtStock.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Stock+is+required!");
	return;
}

if (!isNumeric(txtStock)){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Stock+only+contains+number!");
	return;
}

int stock = Integer.parseInt(txtStock);
if (stock <= 0){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Stock+must+greater+than+0!");
	return;
}

if (txtDesc.trim().equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Description+is+required!");
	return;
}

if (txtDesc.length() < 10 || txtDesc.length() > 50){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Description+must+contains+between+10+and+50+characters!");
	return;
}

if (ioFile == null || ioFile.equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Image+is+required!");
	return;
}

if (!ioFile.toLowerCase().endsWith("png") && !ioFile.toLowerCase().endsWith("jpg")){
	response.sendRedirect(application.getContextPath() + "/pages/add_product.jsp?e=Image+only+accepts+jpg+or+png!");
	return;
}

txtProductName = txtProductName.replace("'", "''");
txtDesc = txtDesc.replace("'", "''");

String sql = "update BJ_Product set BJ_productName='" + txtProductName + "', BJ_productImage='" + IMAGES_UPLOAD_LOCATION + ioFile + "', BJ_productPrice=" + price + ", BJ_productStock=" + stock + ", BJ_productDesc='" + txtDesc + "' " +
			"where BJ_productID = '" + pid + "'";
if (stmt.executeUpdate(sql) > 0){
	response.sendRedirect(application.getContextPath() + "/pages/product.jsp?msg=Product+added+successfully!");
	return;
}else{
	response.sendRedirect(application.getContextPath() + "/pages/product.jsp?e=Product+failed+to+add!");
	return;
}
%>