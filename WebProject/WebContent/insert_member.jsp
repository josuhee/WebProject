<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>Add Member</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String role = request.getParameter("role");
		
		Statement stmt = null;
		try {
			String sql = "insert into "+ role + " values('" + id +"', '" + passwd + "')";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			//out.print("Member 테이블 삽입이 성공했습니다.");
		} catch (SQLException ex) {
			out.print("Member 테이블 삽입이 실패했습니다.<br/>");
			out.print("SQLException: " + ex.getMessage());
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		response.sendRedirect("welcome.jsp");
	%>
	
</body>
</html>