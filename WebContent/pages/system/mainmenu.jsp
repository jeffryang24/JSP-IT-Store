<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<%= application.getContextPath() %>/index.jsp">BJKomputer</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<%
        		String sql = "";
        		if (_userRole == 3){		// berarti belum register, masih guest
        			sql = "SELECT BJ_menuName, BJ_menuLink FROM BJ_Menu WHERE BJ_menuRoleID = 3 AND BJ_menuStatus = 1";
        		}else if (_userRole == 1){
        			sql = "SELECT BJ_menuName, BJ_menuLink FROM BJ_Menu WHERE BJ_menuRoleID = 1 AND BJ_menuStatus = 1";
        		}else{
        			sql = "SELECT BJ_menuName, BJ_menuLink FROM BJ_Menu WHERE BJ_menuRoleID = 2 AND BJ_menuStatus = 1";
        		}
        		
        		ResultSet rsMenu = stmt.executeQuery(sql);
        		
        		while(rsMenu.next()){
        			String pageName = rsMenu.getString("BJ_menuName");
        			String pageLink = rsMenu.getString("BJ_menuLink");
        			String template = "<li><a href='" + application.getContextPath() + "/" + pageLink + "'>" + pageName + "</a></li>";
        			out.print(template);
        		}
        		
        		rsMenu.close();
            	%>
				<%--<li><a href="#">Home <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Product</a></li>--%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
            	String userName = (String)session.getAttribute("BJ_USERNAME");
            	if (userName == null){
            		out.print("<li><a href='" + application.getContextPath() + "/login.jsp'>Login</a></li>");
            		out.print("<li><a href='" + application.getContextPath() + "/register.jsp'>Register</a></li>");
            	}else{
            		out.print("<li style='padding-bottom: 15px; padding-top: 15px;'>Welcome, " + userName + "</li>");
            		out.print("<li><a href='" + application.getContextPath() + "/logout.jsp'>Logout</a></li>");
            	}
            	%>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
<div class="container-fluid">
	<div class="row">
		<%
		String userFullName = (String)session.getAttribute("BJ_USERFULLNAME");
		java.util.Date dt = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("E, dd MMMM yyyy");
		if (userFullName == null){
			out.print("<p class='text-right' style='margin-top: 70px; margin-right: 20px; margin-bottom: 3px;'>Hello, Guys</p>");
			out.print("<p class='text-right' style='margin-right: 20px;'>" + sdf.format(dt) + "</p>");
		}else{
			Integer onlineUser = (Integer)application.getAttribute("appBJ_USERONLINE");
			String firstName = "";
			if (userFullName.indexOf(' ') == -1) firstName = userFullName;
			else{
				firstName = userFullName.substring(0, userFullName.indexOf(' '));
			}
			out.print("<p class='text-right' style='margin-top: 70px; margin-right: 20px; margin-bottom: 3px;'>Hello, " + firstName + "</p>");
			out.print("<p class='text-right' style='margin-right: 20px;'>" + sdf.format(dt) + "</p>");
			out.print("<p class='text-right' style='margin-right: 20px;'>User Online: " + onlineUser + "</p>");
		}
		%>
	</div>