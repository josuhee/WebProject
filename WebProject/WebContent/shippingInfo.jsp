<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
	<title>배송 정보</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <script src="resources/js/addShipping.js"></script>
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
			<div class="masthead-subheading">Shipping Information ...</div>
        	<div class="masthead-heading text-uppercase">배송 정보 입력</div>
        </div>
    </header>
    <%
    	String seller_id = request.getParameter("seller");
    	if (seller_id == null)
    		response.sendRedirect("errorPage.jsp");
    %>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-4" style="margin:40px">
			<form class="form-signin" name="shippingForm" action="shippingInfo_process.jsp?seller=<%= seller_id %>" method="post">
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">이름</label>
					<div class="col-sm-8">
						<input type="text" id="name" name="name" class="form-control" placeholder="name" autocomplete="off" required autofocus/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">우편 번호</label>
					<div class="col-sm-8">
						<input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="zip code" autocomplete="off" required/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">주소</label>
					<div class="col-sm-8">
						<input type="text" id="address" name="address" class="form-control" placeholder="address" autocomplete="off" required/>
					</div>
				</div>
				<input type="button" value="등록하기" class="btn btn btn-lg btn-success btn-block" id="submit_btn" onclick="checkShipping()"/>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
</body>
</html>