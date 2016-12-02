<%-- Header --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ include file="config/global.jsp" %>
<jsp:include page="<%= GLOBAL_HEADER_PAGES %>"></jsp:include>
<body>
	<%-- Main Menu --%>
	<jsp:include page="<%= GLOBAL_MENU_PAGES %>"></jsp:include>
	<%-- Content --%>
	<div class="row">
		<div class="col-md-4 col-md-offset-10">
			<%
			String user = (String)session.getAttribute("BJ_USERNAME");
			Date dt = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMMM yyyy");
			if (user == null){
				out.print("Hello, Guys<br>");
				out.print(sdf.format(dt));
			}else{
				out.print("Hello, " + user + "<br>");
				out.print(sdf.format(dt));
			}
			%>
		</div>
	</div>
</body>
<%-- Footer --%>
<jsp:include page="<%= GLOBAL_FOOTER_PAGES %>"></jsp:include>