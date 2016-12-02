<%@include file="pages/system/header.jsp" %>
<title>BJKomputer - Login</title>
</head>

<body>
    <%@ include file="pages/system/mainmenu.jsp" %>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 bjloginpnl">
            <h3 class="text-center">Login</h3>
            <form class="form-horizontal" name="frmLogin" id="frmLogin" method="post" action="system/loginp.jsp">
                <div class="form-group">
                    <label for="txtUsername" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="txtUsername" name="txtUsername" placeholder="Username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Password">
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
                        <button type="submit" class="btn btn-default" name="btnSubmit" id="btnSubmit">Sign in</button>
                    </div>
                </div>
            </form>
            <div class="alert alert-danger" role="alert">Tes alert.</div>
        </div>
    </div>
	<%@ include file="pages/system/footer.jsp" %>