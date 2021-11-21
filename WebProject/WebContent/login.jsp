<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="./resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<jsp:include page="nav.jsp"/>
	<header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">Please login</div>
        	<div class="masthead-heading text-uppercase">로그인</div>
        </div>
    </header>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-4" style="margin:40px">
			<h2 class="form-signin-heading" style="margin-bottom:20px">Please sign in</h2>
			<%
				String error=request.getParameter("error");
				if(error!=null) {
					out.print("<div class='alert alert-danger'>");
					out.print("아이디와 비밀번호를 확인해주세요.");
					out.print("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" name="j_username" required autofocus/>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control"	placeholder="Password" name="j_password" required/>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
			<hr/>
			<div class="d-grid gap-2">
				<button class="btn btn-lg btn-danger btn-block" type="submit">회원가입</button>
			</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
</body>
</html>