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
	<%-- 
	1. 물품id와 seller id를 select하여 존재하는지 확인
	2. 있다면 update 준비 고
	3. 없다면 errorpage로 고
	
	4. 업데이트 과정에 file이 바뀌면 기존 파일 삭제해주기
	
	 --%>
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
    			
    			// update 진행하기
    			String p_name;
    			String p_price;
    			String p_units;
    			String p_description;
    			
    			// 변수 삽입
    			for (int i = 0; i < 4; i++){
    				if (key[i].equals("name")){
    					p_name = value[i];
    					break;
    				}
    			}
    			for (int i = 0; i < 4; i++){
    				if (key[i].equals("price")){
    					p_price = value[i];
    					break;
    				}
    			}
    			for (int i = 0; i < 4; i++){
    				if (key[i].equals("unitsInStock")){
    					p_units = value[i];
    					break;
    				}
    			}
    			for (int i = 0; i < 4; i++){
    				if (key[i].equals("description")){
    					p_description = value[i];
    				}
    			}
    			
    			
    			// update용 sql 작성하기
    			
    		} else flag = true;		
		} catch (SQLException ex) {
			out.print("Product 테이블 삽입이 실패했습니다.<br/>");
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
	%>
	<% } %>
</body>
</html>