<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<html>
<head>
<title>update product process</title>
</head>
<body>
	 <%
		request.setCharacterEncoding("utf-8");
		String check_role = (String) session.getAttribute("role");
		String userId = (String) session.getAttribute("userID");
		
		// multi request
		String path = request.getSession().getServletContext().getRealPath("/");
		path = path + "upload/";
		MultipartRequest multi = new MultipartRequest(request, path,
			5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
		Enumeration params = multi.getParameterNames();
		
		String p_name = multi.getParameter("name");
		String p_price = multi.getParameter("price");
		String p_units = multi.getParameter("unitsInStock");
		String p_description = multi.getParameter("description");
		String id = multi.getParameter("id");

		Enumeration files = multi.getFileNames();
		
		String filename = "";
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			filename = multi.getFilesystemName(name);
		}

		if (check_role == null || userId == null || !check_role.equals("seller"))
			response.sendRedirect("NoPermission.jsp");
		else if (id == null)
			response.sendRedirect("errorPage.jsp");
		else {
    %>
	 
	<%@ include file="dbconn.jsp"%>
	<%
		boolean flag = false;
		ResultSet rs = null;
		Statement stmt = null;
		try {
			String sql = "select * from product where id="+id + " and seller_id = '" + userId + "'";
    		stmt = conn.createStatement();
    		rs = stmt.executeQuery(sql);
    		
    		// 수정하려는 곳이 실제로 있는지 확인
    		if (rs.next()){
    			// 만약 filename이 null이 아니라면 파일 삭제 진행
    			String p_filename = rs.getString("filename");
    			if (p_filename != null) {
    				path = request.getSession().getServletContext().getRealPath("/");
					path = path + "upload/" + p_filename;
					
					File f = new File(path);
					if (f.exists()) {
						f.delete();
					}
    			}
    			
    			// update용 sql 작성하기
    			sql = "update product set name='" + p_name + "', price = " + p_price + ", unitsInStock = " + p_units + ", description = '" + p_description + "', filename = '" + filename + "' "
    					+ "where id = " + id;
    			stmt = conn.createStatement();
    			stmt.executeUpdate(sql);
    		} else flag = true;		
		} catch (SQLException ex) {
			out.print("Product 테이블 수정이 실패했습니다.<br/>");
			out.print("SQLException: " + ex.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		response.sendRedirect("productManagement.jsp");
		}
	%>
</body>
</html>