<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.sql.*, java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
<title>add product process</title>
<script src="resources/js/addMember.js"></script>
</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		// get request parameter
		request.setCharacterEncoding("utf-8");
		String path = request.getSession().getServletContext().getRealPath("/");
		path = path + "upload/";
		MultipartRequest multi = new MultipartRequest(request, path,
			5 * 1024 * 1024, "utf-8", new DefaultFileRenamePolicy());
	
		String[] key = new String[4];
		String[] value = new String[4];
		
		Enumeration params = multi.getParameterNames();
		
		int idx = 0;
		while (params.hasMoreElements()) {
			key[idx] = (String)params.nextElement();
			value[idx] = multi.getParameter(key[idx]);
			idx++;
		}
		
		Enumeration files = multi.getFileNames();
		
		String filename = "";
		while (files.hasMoreElements()) {
			String name = (String) files.nextElement();
			filename = multi.getFilesystemName(name); // 요자식이 중요
		}
		
		String userId = (String) session.getAttribute("userID");
		java.util.Date d = new java.util.Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//db connect
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into product(name, price, unitsInStock, description, filename, currDate, seller_id)"
					+" values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			for (int i = 0; i < 4; i++){
				if (key[i].equals("name")){
					pstmt.setString(1, value[i]);
				}
			}
			
			for (int i = 0; i < 4; i++){
				if (key[i].equals("price")){
					pstmt.setString(2, value[i]);
				}
			}
			
			for (int i = 0; i < 4; i++){
				if (key[i].equals("unitsInStock")){
					pstmt.setString(3, value[i]);
				}
			}
			
			for (int i = 0; i < 4; i++){
				if (key[i].equals("description")){
					pstmt.setString(4, value[i]);
				}
			}

			pstmt.setString(5, filename);
			pstmt.setString(6, sdf.format(d));
			pstmt.setString(7, userId);
			out.print(pstmt.toString());
			pstmt.executeUpdate();
		} catch (SQLException ex) {
			out.print("Product 테이블 삽입이 실패했습니다.<br/>");
			out.print("SQLException: " + ex.getMessage());
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		response.sendRedirect("addProduct.jsp?success=1");
	%>
	
</body>
</html>