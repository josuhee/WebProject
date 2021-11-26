<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.text.SimpleDateFormat"%>
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
		
		if (role == null || s_id == null || !role.equals("seller"))
			response.sendRedirect("NoPermission.jsp");
	%>
	<jsp:include page="nav.jsp"/>
    <header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">My Information</div>
        	<div class="masthead-heading text-uppercase">내 정보</div>
        </div>
    </header>
	<div class="container" align="center" style="margin-top:50px">
		<div class="row">
			<%-- 왼쪽 바 --%>
			<div class="col-md-2">
				<div class="btn-group-vertical col-md">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='myInfo_seller.jsp?id=<%= s_id %>'" style="padding: 10px 20px;">계정</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='productManagement.jsp'">글 관리</button>
					<button type="button" class="btn btn-outline-dark" style="padding: 10px 20px;">주문현황</button>
				</div>
			</div>
			
			<%-- 본문 --%>
			<div class="col-md">
				<div class="card text-black bg-white mb-3 border-dark" style="width: 100%; min-height: 500px;">
					<div class="card-header border-dark">
						<h3 class="align-self-center m-0">글 관리</h3>
					</div>
					<div class="card-body p-4">
						<%@ include file="dbconn.jsp"%>
				    	<%
							ResultSet rs = null;
							Statement stmt = null;
							
							try {
								String sql = "select * from product where seller_id=" + s_id + " order by id desc";
								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								
								while (rs.next()) {
									int id = rs.getInt("id");
									String name = rs.getString("name");
									String seller = rs.getString("seller_id");
									int price = rs.getInt("price");
									int unitsInStock = rs.getInt("unitsInStock");
									String filename = rs.getString("filename");
									java.util.Date d = rs.getTimestamp("currDate");
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									if (filename == null)
										filename = "resources/image/empty.PNG";
									else
										filename = "upload/" + filename;
						%>
						<div class="container" align="center" style="height: 250px;">
							<div class="col-md row p-4">
								<img class="col-md-3" style="height: 200px;" src="<%= filename%>"/>
								<div class="col-md-6 p-4" align="left">
									<h2 class="section-heading"><%= name %> <small>| <%= seller %></small></h2>
									<p class="m-0" style="font-size: 1.0rem;"><b>Date : <%= sdf.format(d) %></b></p>
									<h3 class="section-subheading text-muted my-1" style="font-size: 1.5rem;">Price : <%= price %></h3>
									<h3 class="section-subheading text-muted my-1" style="font-size: 1.5rem;">Stock : <%= unitsInStock %></h3>
								</div>
								<div class="col-md-3  align-self-end">
									<a href="#" class="btn btn-warning m-1"> 수정 &raquo;</a>
									<a href="delete_product.jsp?id=<%= id %>" class="btn btn-danger m-1"> 삭제 &raquo;</a>	
								</div>
							</div>
						</div>
						<hr/>
						<%
								}
							} catch (SQLException ex) {
								out.print("Member 테이블 호출이 실패했습니다.<br/>");
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