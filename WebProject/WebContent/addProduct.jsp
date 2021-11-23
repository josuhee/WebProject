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
	<%
		String check_role = (String) session.getAttribute("role");
	
		if (check_role == null || !check_role.equals("seller")) {
	%>
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
    <%
		} else {
    %>
    <header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">Upload Product</div>
        	<div class="masthead-heading text-uppercase">제품 등록</div>
        </div>
    </header>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-4" style="margin:40px">
			<h2 class="form-signin-heading" style="margin-bottom:40px">Upload Product</h2>

			<form class="form-signin" name="productForm" action="addProdcut_process.jsp" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">제품명</label>
					<div class="col-sm-8">
						<input type="text" id="name" name="name" class="form-control" placeholder="name" autocomplete="off" required autofocus/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">가격</label>
					<div class="col-sm-8">
						<input type="text" id="price" name="price" class="form-control" placeholder="price" autocomplete="off" required/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">재고</label>
					<div class="col-sm-8">
						<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" placeholder="units in stock" autocomplete="off" required/>
					</div>
				</div>
				<div class="form-group row">
				    <label class="col-sm-3 align-self-center mb-0">상세 정보</label>
				    <div class="col-sm-8">
					    <textarea class="form-control" id="exampleTextarea" placeholder="description" rows="3" style="height: 121px;"></textarea>
				    </div>
			    </div>
			    <div class="form-group row">
					<label class="col-sm-3">이미지</label>
					<div class="col-sm-8">
						<input type="file" name="productImage" class="form-control"/>
					</div>
				</div>
				<input type="button" value="등록하기" class="btn btn btn-lg btn-success btn-block" id="submit_btn" onclick="checkList()"/>
			</form>
		</div>
	</div>
    <%} %>
	<jsp:include page="footer.jsp"/>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
</body>
</html>