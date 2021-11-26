<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
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
	<%
		request.setCharacterEncoding("utf-8");
		String role = (String) session.getAttribute("role");
		String s_id = (String) session.getAttribute("userID");
		
		if (role == null || s_id == null || !role.equals("customer"))
			response.sendRedirect("NoPermission.jsp");
	%>
	<jsp:include page="nav.jsp"/>
    <header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">My Cart</div>
        	<div class="masthead-heading text-uppercase">장바구니</div>
        </div>
    </header>
	<div class="container" align="center" style="margin-top:50px">
		<div class="row">
			<div class="col-md-2">
				<div class="btn-group-vertical col-md">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='myInfo_customer.jsp?id=<%= s_id %>'" style="padding: 10px 20px;">계정</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='cart.jsp'" style="padding: 10px 20px;">장바구니</button>
					<button type="button" class="btn btn-outline-dark" style="padding: 10px 20px;">주문현황</button>
				</div>
			</div>
			<div class="col-md">
				<div class="card text-black bg-white mb-3 border-dark" style="width: 100%; height: 500px;">
					<div class="card-header border-dark">
						<h3 class="align-self-center m-0">장바구니</h3>
					</div>
					<div class="card-body ml-5">
						<%
							ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute(s_id + "_cart");
							if (cartList == null)
								cartList = new ArrayList<Product>();
							
							int size = cartList.size();
							for (int i = 0; i < size; i++) {
								Product product = cartList.get(i);
								out.print(product.getP_name() + "<br/>");
							}
						%>
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