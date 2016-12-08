<%
	String userID = (String)session.getAttribute("BJ_USERID");
	if (userID != null) response.sendRedirect(application.getContextPath() + "/index.jsp");
	
	Cookie[] cookieList = request.getCookies();
	
	String username = "", password = "";
	if (cookieList != null){
		for(int i=0; i<cookieList.length; i++){
			Cookie tmp = cookieList[i];
			if (tmp.getName().equals("ckBJ_USERNAME")){
				username = tmp.getValue();
			}else if (tmp.getName().equals("ckBJ_PASSWORD")){
				password = tmp.getValue();
			}
		}
	}
%>
<%@include file="pages/system/header.jsp" %>
<title>BJKomputer - Login</title>
</head>

<body>
    <%@ include file="pages/system/mainmenu.jsp" %>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 bjloginpnl">
            <h2 class="text-center">Login</h2>
            <form class="form-horizontal" name="frmLogin" id="frmLogin" method="post" action="pages/system/loginp.jsp">
                <div class="form-group">
                    <label for="txtUsername" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="txtUsername" name="txtUsername" placeholder="Username" value="<%= username %>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Password" value="<%= password %>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">
                            <label><input type="checkbox" name="chkRemember" id="chkRemember"> Remember me
							</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default" name="btnLogin" id="btnLogin">Login</button>
                    </div>
                </div>
            </form>
            <%
            	String error = request.getParameter("e");
              	if (error != null && !error.toString().equalsIgnoreCase("")){
              		out.print("<div class='alert alert-danger' role='alert'>" + error + "</div>");
              	}
              	
              	String msg = request.getParameter("msg");
              	if (msg != null && !msg.toString().equalsIgnoreCase("")){
              		if (msg.equalsIgnoreCase("failed")){
              			out.print("<div class='alert alert-danger' role='alert'>Login Failed! Please check your username or password!</div>");
              		}
              	}
            %>
        </div>
    </div>
	<%@ include file="pages/system/footer.jsp" %>