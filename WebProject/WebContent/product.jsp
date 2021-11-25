<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
	<title>Details</title>
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
		String id = request.getParameter("id");
		
		if (id == null)
			response.sendRedirect("errorPage.jsp");
	%>
	<jsp:include page="nav.jsp"/>
    <header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">Details of the product ...</div>
        	<div class="masthead-heading text-uppercase">상세 정보</div>
        </div>
    </header>
    <section class="page-section pt-0">    
    <%@ include file="dbconn.jsp"%>
    <%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "select * from product where id=" + id;
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) {
					String name = rs.getString("name");
					String seller = rs.getString("seller_id");
					int price = rs.getInt("price");
					int unitsInStock = rs.getInt("unitsInStock");
					String description = rs.getString("description");
					String filename = rs.getString("filename");
					java.util.Date d = rs.getTimestamp("currDate");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					if (filename == null)
						filename = "resources/image/empty.PNG";
					else
						filename = "upload/" + filename;
					
	%>
		<div class="container p-4" align="center">
			<div class="col-md row">
				<img class="col-md-3 align-self-center" style="height: 300px;" src="<%= filename%>"/>
				<div class="col-md-7 p-4" align="left">
					<h2 class="section-heading"><%= name %> <small>| <%= seller %> |</small> <span style="font-size: 1.0rem;"><%= sdf.format(d) %></span> </h2>
					<p><%= description %></p>
					<h3 class="section-subheading text-muted my-1" style="font-size: 1.5rem;">Price : <%= price %></h3>
					<h3 class="section-subheading text-muted my-1" style="font-size: 1.5rem;">Stock : <%= unitsInStock %></h3>
					<div class="mt-3">
						<a href="cart.jsp" class="btn btn-warning m-1"> 담기 &raquo;</a>
						<a href="products.jsp" class="btn btn-secondary m-1"> 둘러보기 &raquo;</a>				
					</div>
				</div>
			</div>
		</div>
	<%
				} else {
					//없는 페이지!!!!!!
					response.sendRedirect("errorPage.jsp");
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
    </section>
	<jsp:include page="footer.jsp"/>
	<!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="./resources/js/scripts.js"></script>
</body>
</html>