<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
	<title>Welcome</title>
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
			<div class="masthead-subheading">My Information</div>
        	<div class="masthead-heading text-uppercase">내 정보</div>
        </div>
    </header>
	<div class="container" align="center" style="margin-top:50px">
		<div class="row">
			<div class="col-md-2">
				<div class="btn-group-vertical col-md">
					<button type="button" class="btn btn-outline-dark" style="padding: 10px 20px;">계정</button>
					<button type="button" class="btn btn-outline-dark" style="padding: 10px 20px;">주문현황</button>
				</div>
			</div>
			<div class="col-md">
				<div class="card text-black bg-white mb-3 border-dark" style="width: 100%; height: 500px;">
					<div class="card-header border-dark">
						<h3 class="align-self-center m-0">개인 정보</h3>
					</div>
					<div class="card-body ml-5">
						<hr/>
						<h4 class="card-title">ID</h4>
						<hr/>
						<p class="card-text">name</p>
						<br/>
						<hr/>
						<h4 class="card-title">Category</h4>
						<hr/>
						<p class="card-text">판매자</p>
					</div>
				</div>
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