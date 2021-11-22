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
	<%
		String check_role = (String) session.getAttribute("role");
	
		if (check_role != null) {
	%>
	<header class="masthead else-size">
		<div class="container">
        	<div class="masthead-subheading text-uppercase">Already Login ...</div>
        </div>
    </header>
    <%
		} else {
    %>
    <header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">Please login</div>
        	<div class="masthead-heading text-uppercase">로그인</div>
        </div>
    </header>
    <%} %>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-4" style="margin:40px">
		<%
			if (check_role != null) {
				out.print("<h2 align=\"center\" style=\"margin:40px;\">이미 로그인 된 계정입니다.</h2>");
				out.print("<a class=\"btn btn-xl btn-warning btn-block text-uppercase\" href=\"home.jsp\">홈으로</a>");
			} else {
		%>
			<h2 class="form-signin-heading" style="margin-bottom:20px">Please sign in</h2>
			<%
				String error=request.getParameter("error");
				if(error!=null) {
					out.print("<div class='alert alert-danger'>");
					out.print("아이디와 비밀번호를 확인해주세요.");
					out.print("</div>");
				}
			%>
			<form class="form-signin" action="login_process.jsp" method="post">
				<div class="form-group">
					<input type="text" name="id" class="form-control" placeholder="ID" required autofocus/>
				</div>
				<div class="form-group">
					<input type="password" name="passwd" class="form-control"	placeholder="Password" required/>
				</div>
				<div class="form-group">
					<input type="radio" name="role" value="customer" checked/> 고객
					<input type="radio" name="role" value="seller" /> 판매자
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
			<hr/>
			<div class="d-grid gap-2">
				<button class="btn btn-lg btn-danger btn-block" type="submit">회원가입</button>
			</div>
			<%} %>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
</body>
</html>