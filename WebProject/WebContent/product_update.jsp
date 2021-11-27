<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
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
	<%
		request.setCharacterEncoding("utf-8");
		String check_role = (String) session.getAttribute("role");
		String userId = (String) session.getAttribute("userID");
		String id = request.getParameter("id");
	
		if (check_role == null || userId == null || !check_role.equals("seller"))
			response.sendRedirect("NoPermission.jsp");
		else if (id == null)
			response.sendRedirect("errorPage.jsp");
		else {
    %>
    <%@ include file="dbconn.jsp" %>
    <%
    	boolean flag = false;
    	ResultSet rs = null;
    	Statement stmt = null;
    	try {
    		String sql = "select * from product where id="+id + " and seller_id = '" + userId + "'";
    		stmt = conn.createStatement();
    		rs = stmt.executeQuery(sql);
    		
    		if (rs.next()){
    			String name = rs.getString("name");
    			int price = rs.getInt("price");
    			int unitsInStock = rs.getInt("unitsInStock");
    			String description = rs.getString("description");
    %>
    <jsp:include page="nav.jsp"/>
    <header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">Update Product</div>
        	<div class="masthead-heading text-uppercase">제품 정보 수정</div>
        </div>
    </header>
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-4" style="margin:40px">
			<form class="form-signin" name="productForm" action="product_update_process.jsp?id=<%= id %>" method="post" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">제품명</label>
					<div class="col-sm-8">
						<input type="text" id="name" name="name" value="<%= name %>" class="form-control" autocomplete="off" required autofocus/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">가격</label>
					<div class="col-sm-8">
						<input type="text" id="price" name="price" value="<%= price %>" class="form-control" autocomplete="off" required/>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 align-self-center mb-0">재고</label>
					<div class="col-sm-8">
						<input type="text" id="unitsInStock" name="unitsInStock" value="<%= unitsInStock %>" class="form-control" autocomplete="off" required/>
					</div>
				</div>
				<div class="form-group row">
				    <label class="col-sm-3 align-self-center mb-0">상세 정보</label>
				    <div class="col-sm-8">
					    <textarea class="form-control" id="description" name="description" placeholder="description" rows="3" style="height: 121px;"><%= description %></textarea>
				    </div>
			    </div>
			    <div class="form-group row">
					<label class="col-sm-3">이미지</label>
					<div class="col-sm-8">
						<input type="file" accept="image/*" name="productImage" class="form-control"/>
					</div>
				</div>
				<input type="button" value="등록하기" class="btn btn btn-lg btn-success btn-block" id="submit_btn" onclick="checkList()"/>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
    <%
    		} else flag = true;
    	} catch (SQLException ex) {
    		out.print("Product 테이블 호출이 실패했습니다.<br/>");
			out.print("SQLException: " + ex.getMessage());
    	} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
    	
    	if (flag)
    		response.sendRedirect("errorPage.jsp");
		}
    %>
</body>
</html>