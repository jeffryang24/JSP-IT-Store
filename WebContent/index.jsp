<%-- Header --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ include file="config/global.jsp" %>
<jsp:include page="<%= GLOBAL_HEADER_PAGES %>"></jsp:include>
<body>
	<%-- Main Menu --%>
	<jsp:include page="<%= GLOBAL_MENU_PAGES %>"></jsp:include>
	<%-- Content --%>
	<div class="row" style="margin-top: 60px;">
		<div class="col-md-3 col-md-offset-1 text-center">
			<img src="assets/images/gtx1080.png" class="img-responsive img-rounded" alt="gtx_1080" width="300">
		</div>
		<div class="col-md-4 text-center">
			<img src="assets/images/rogmonitor.png" class="img-responsive img-rounded" width="400" alt="rog_monitor">
			</div>
		<div class="col-md-3 text-center">
			<img src="assets/images/corsairvengeance.png" class="img-responsive img-rounded" width="300" alt="corsair_vengeance">
		</div>
	</div>
	<div class="row" style="margin-top: 20px;">
		<h3 class="text-center">Welcome to BJComputer</h3>
		<p class="text-center">We are the best computer shop in the world, and known for our great quality of product and service.</p>
		<p class="text-center">We will guarantee your satisfaction here.</p>
	</div>
<%-- Footer --%>
<jsp:include page="<%= GLOBAL_FOOTER_PAGES %>"></jsp:include>