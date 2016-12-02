<%@page import="java.sql.*,java.math.*"%>
<%@ include file="../../config/global.jsp" %>
<%@ include file="../../utility/dbcontext.jsp" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
            <a class="navbar-brand" href="#">BJKomputer</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
            	<%
            	String _userRole = (String)session.getAttribute("BJ_USER_ROLE");
        		Statement stmt = conn.createStatement();
        		String sql = "";
        		if (_userRole == null){		// berarti belum login, masih guest
        			sql = "SELECT BJ_menuName, BJ_menuLink FROM BJ_Menu WHERE BJ_menuRoleID = 3 AND BJ_menuStatus = 1";
        		}else if (_userRole.equalsIgnoreCase("admin")){
        			sql = "SELECT BJ_menuName, BJ_menuLink FROM BJ_Menu WHERE BJ_menuRoleID = 1 AND BJ_menuStatus = 1";
        		}else{
        			sql = "SELECT BJ_menuName, BJ_menuLink FROM BJ_Menu WHERE BJ_menuRoleID = 2 AND BJ_menuStatus = 1";
        		}
        		
        		ResultSet rsMenu = stmt.executeQuery(sql);
        		
        		while(rsMenu.next()){
        			String pageName = rsMenu.getString("BJ_menuName");
        			String pageLink = rsMenu.getString("BJ_menuLink");
        			String template = "<li><a href='" + pageLink + "'>" + pageName + "</a></li>";
        			out.print(template);
        		}
        		
        		rsMenu.close();
            	%>
                <%--<li><a href="#">Home <span class="sr-only">(current)</span></a></li>
                <li><a href="#">Product</a></li>--%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<%
            	String userid = (String)session.getAttribute("BJ_USERID");
            	if (userid == null){
            		out.print("<li><a href='#''>Login</a></li>");
            		out.print("<li><a href='#'>Register</a></li>");
            	}else{
            		out.print("<li>Welcome, User</li>");
            		out.print("<li><a href='#'>Logout</a></li>");
            	}
            	%>
                <%--<li><a href="#">Login</a></li>
                <li><a href="#">Register</a></li>--%>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>