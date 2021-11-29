<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<%@ page import="java.util.Collections"%>
<html>
<head>
	<title>주문 현황</title>
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
		String userId = (String) session.getAttribute("userID");
		
		if (role == null || userId == null || !role.equals("customer"))
			response.sendRedirect("NoPermission.jsp");
	%>
	<jsp:include page="nav.jsp"/>
    <header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">Order Status ...</div>
        	<div class="masthead-heading text-uppercase">주문 현황</div>
        </div>
    </header>
	<div class="container" align="center" style="margin-top:50px">
		<div class="row">
			<div class="col-md-2">
				<div class="btn-group-vertical col-md">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='myInfo_customer.jsp?id=<%= userId %>'" style="padding: 10px 20px;">계정</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='cart.jsp'" style="padding: 10px 20px;">장바구니</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='order_customer.jsp'" style="padding: 10px 20px;">주문현황</button>
				</div>
			</div>
			<div class="col-md">
				<div class="card text-black bg-white mb-3 border-dark" style="width: 100%; min-height : 300px;">
					<div class="card-header border-dark">
						<h3 class="align-self-center m-0">주문 현황</h3>
					</div>
					<div class="card-body p-4">
						<div class="container p-0" align="left">
							<table class="table table-striped table-bordered text-center">
								<tr class="border border-1 border-dark">
									<th class="col-md-3">판매자</th>
									<th class="col-md-3">제품명</th>
									<th class="col-md-3">가격</th>
									<th class="col-md-2">개수</th>
									<th class="col-md-3">상태</th>
								</tr>
								<%@ include file="dbconn.jsp"%>
								<%
									ResultSet rs = null;
									Statement stmt = null;
									try {
										String sql = "select a.seller_id, b.name, b.price, a.product_cnt, a.status_c from orderform a, product b where a.product_id = b.id and customer_id = '"+ userId+"'" +
													" order by a.id desc";
										stmt = conn.createStatement();
										rs = stmt.executeQuery(sql);
										
										while (rs.next()) {
											String seller = rs.getString("seller_id");
											String name = rs.getString("name");
											int price = rs.getInt("price");
											int cnt = rs.getInt("product_cnt");
											String status = rs.getString("status_c"); 
											
											String badge_color = "badge-primary";
											if (status.equals("배송 준비 중"))
												badge_color = "badge-success";
											if (status.equals("배송 중"))
												badge_color = "badge-info";
											if (status.equals("배송 완료"))
												badge_color = "badge-dark";
											%>
									
									<tr>
										<td><%= seller %></td>
										<td><%= name %></td>
										<td><%= price %></td>
										<td><%= cnt %></td>
										<td><p class="badge <%= badge_color %> m-0"><%= status %></p></td>
									</tr>
									
											
								<%
										}
									} catch (SQLException ex) {
										out.print("OrderForm 테이블 호출이 실패했습니다.<br/>");
										out.print("SQLException: " + ex.getMessage());
									} finally {
										if (rs != null)
											rs.close();
										if (stmt != null)
											stmt.close();
										if (conn != null)
											conn.close();
									}
								%>
							</table>
						</div>
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