<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String role = request.getParameter("role");
		boolean flag = true;
		
		ResultSet rs = null;
		Statement stmt = null;
		try {
			String sql = "select id, passwd from " + role + " where id = '" + id + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				String r_id = rs.getString("id");
				String r_pw = rs.getString("passwd");
				if (!passwd.equals(r_pw)) flag = false;
			} else flag = false;
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
		
		if (flag)
		{
			session.setAttribute("userID", id);
			session.setAttribute("role", role);
			response.sendRedirect("home.jsp");
		}
		else
			response.sendRedirect("login.jsp?error=1");
	%>
</body>
</html>