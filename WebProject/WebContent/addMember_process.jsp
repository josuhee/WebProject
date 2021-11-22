<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Check</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String role = request.getParameter("role");
		boolean flag = true;
		
		ResultSet rs = null;
		Statement stmt = null;
		try {
			String sql = "select count(*) as cnt from " + role + " where id = '" + id + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				int cnt = rs.getInt("cnt");
				if (cnt != 0) flag = false;
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
			out.print("사용 가능한 아이디 입니다.");
		else
			out.print("중복된 아이디 입니다.");
	%>
</body>
</html>