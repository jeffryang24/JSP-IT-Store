<%-- Header --%>
<%
String _userID = (String)session.getAttribute("BJ_USERID");

if (_userID == null){
	response.sendRedirect(application.getContextPath() + "/login.jsp");
	return;
}

String _rid = (String)request.getParameter("rid");
String _pid = (String)request.getParameter("pid");

if (_rid == null || _rid.equalsIgnoreCase("")){
	response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + _pid);
	return;
}
%>
<%@ include file="system/header.jsp" %>
<%
/*
 * Processing own post request
 */
String post_PID = (String)request.getParameter("hidPID");
String post_review = (String)request.getParameter("inReview");

// get current user role
int userRole = session.getAttribute("BJ_USERROLE") == null ? 3 : (Integer)session.getAttribute("BJ_USERROLE");

// parameter uid hanya boleh digunakan oleh admin...
// jika ada akses diluar admin, maka akan diarahkan ke halaman index
String _uid = (String)request.getParameter("uid");

if (_uid != null && userRole != 1){
	// tolak akses
	response.sendRedirect(application.getContextPath() + "/index.jsp");
	return;
}


String sqlUpdate = "";
if (post_PID != null){
	
	if (post_review.trim().equalsIgnoreCase("")){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + post_PID + "&e=Review+is+required!");
		return;
	}
	
	if (post_review.length() < 6){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + post_PID + "&e=Review+must+contains+more+than+5+characters!");
		return;
	}
	
	if (_uid != null){
		sqlUpdate = "update BJ_Review set BJ_reviewDesc = '" + post_review + "' where BJ_reviewerID = '" + _uid + "' and BJ_productID = '" + post_PID + "'";
	}else{
		sqlUpdate = "update BJ_Review set BJ_reviewDesc = '" + post_review + "' where BJ_reviewerID = '" + _userID + "' and BJ_productID = '" + post_PID + "'";	
	}
	
	if (stmt.executeUpdate(sqlUpdate) > 0){
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + post_PID);
		return;
	}else{
		response.sendRedirect(application.getContextPath() + "/pages/detail_product.jsp?pid=" + post_PID + "&e=Failed+editing+review!");
		return;
	}
}
%>
<title>BJKomputer - Update Review</title>
</head>

<body>
	<%-- Main Menu --%>
	<%@ include file="system/mainmenu.jsp" %>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-4 col-md-offset-4" style="margin-bottom: 150px;">
			<h2 class="text-center">Edit Review</h2>
			<form class="form-inline text-center" method="post">
				<%
				if (_userRole != 1){
					sql = "select BJ_reviewDesc from BJ_Review where BJ_reviewerID = '" + _userID + "' and BJ_productID = '" + _pid + "'";	
				}else{
					sql = "select BJ_reviewDesc from BJ_Review where BJ_reviewerID = '" + _uid + "' and BJ_productID = '" + _pid + "'";
				}
				ResultSet rsRvw = stmt.executeQuery(sql);
				rsRvw.next();
				%>
				<div class="form-group">
					<label class="sr-only" for="txtReview">Review</label>
					<input type="text" class="form-control" id="txtReview" name="inReview" placeholder="Insert review here..." value="<%= rsRvw.getString("BJ_reviewDesc") %>">
				</div>
				<input type="hidden" name="hidPID" value="<%= _pid %>">
				<button type="submit" class="btn btn-default">Submit</button>
				<%
				rsRvw.close();
				%>
			</form>
		</div>
	</div>
	<%-- Footer --%>
	<%@ include file="system/footer.jsp" %>