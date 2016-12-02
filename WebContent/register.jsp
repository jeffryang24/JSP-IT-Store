<jsp:include page="pages/system/header.jsp"></jsp:include>
<title>BJKomputer - Register</title>
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/overload.css">
</head>

<body>
    <jsp:include page="pages/system/mainmenu.jsp"></jsp:include>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 bjloginpnl">
            <h3 class="text-center">Login</h3>
            <form class="form-horizontal" name="frmLogin" id="frmLogin" method="post" action="system/loginp.jsp">
                <div class="form-group">
                    <label for="txtUsername" class="col-sm-2 control-label">Username</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="txtUsername" name="txtUsername" placeholder="Username">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPassword" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="txtPassword" name="txtPassword" placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPassword2" class="col-sm-2 control-label">Confirm Password</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" id="txtPassword2" name="txtPassword2" placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtFullname" class="col-sm-2 control-label">Full Name</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="txtFullname" name="txtFullname" placeholder="Full Name">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtPhonenumber" class="col-sm-2 control-label">Phone Number</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="txtPhonenumber" name="txtPhonenumber" placeholder="Phone Number">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtAddress" class="col-sm-2 control-label">Address</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="txtAddress" name="txtAddress" placeholder="Address">
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtEmail" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-6">
                        <input type="email" class="form-control" id="txtEmail" name="txtEmail" placeholder="Email">
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
    <jsp:include page="pages/system/footer.jsp"></jsp:include>