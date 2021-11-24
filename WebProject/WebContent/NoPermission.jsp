<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
	<title>Product</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <script src="resources/js/addProduct.js"></script>
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
	       	<div class="masthead-subheading text-uppercase">You don't have any permission.</div>
		</div>
   	</header>
    <div class="container" align="center">
		<div class="col-md-6 col-md-offset-4" style="margin:40px">
			<h2 align="center" style="margin:40px;">접근 권한이 없습니다.</h2>
			<a class="btn btn-xl btn-warning btn-block text-uppercase" href="home.jsp">홈으로</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
</body>
</html>