<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
	<title>Products</title>
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
			<div class="masthead-subheading">your small store ...</div>
        	<div class="masthead-heading text-uppercase">세상에서 제일 작은 상점</div>
        </div>
    </header>
    <section class="page-section pt-0">    
    <%@ include file="dbconn.jsp"%>
    <%
    		request.setCharacterEncoding("utf-8");
			ResultSet rs = null;
			Statement stmt = null;
			
			String color;
			int idx = 0;
			try {
				String sql = "select * from product order by id desc";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String seller = rs.getString("seller_id");
					int price = rs.getInt("price");
					int unitsInStock = rs.getInt("unitsInStock");
					String filename = rs.getString("filename");
					if (filename == null || filename.equals("null"))
						filename = "resources/image/empty.PNG";
					else
						filename = "upload/" + filename;
					
					if (idx % 2 == 0)
						color = "#ffe0b92b";
					else
						color = "#fff";
		%>
		<div class="container" align="center" style="min-height: 300px;">
			<div class="col-md row p-4" style="background:<%=color%>">
				<img class="col-md-3" style="height: 250px;" src="<%= filename%>"/>
				<div class="col-md-7 p-4" align="left">
					<h2 class="section-heading"><%= name %> <small>| <%= seller %></small></h2>
					<h3 class="section-subheading text-muted my-1" style="font-size: 1.5rem;">Price : <%= price %></h3>
					<h3 class="section-subheading text-muted my-1" style="font-size: 1.5rem;">Stock : <%= unitsInStock %></h3>
				</div>
				<div class="col-md-2 align-self-end">
					<a class="btn btn-lg btn-warning btn-block text-white" href="product.jsp?id=<%=id%>">상세보기</a>
				</div>
			</div>
		</div>
		<%
				idx++;
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