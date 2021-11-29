<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");

	//request
	String id = request.getParameter("id");
	String status = request.getParameter("status");
	
	//session
	String userId = (String) session.getAttribute("userID");
	String role = (String) session.getAttribute("role");
	
	if (id == null || status == null || userId == null || role == null || !role.equals("seller"))
		response.sendRedirect("errorPage.jsp");
	else { %>
		<%@ include file = "dbconn.jsp"%>
<%
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			String sql = "select count(*) from orderform where id = " + id;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				String status_c = "";
				String status_s = "";
				if (status.equals("1")) {
					status_c = "배송 준비 중";
					status_s = "배송 시작";
				}
				else if (status.equals("2")) {
					status_c = "배송 중";
					status_s = "배송 완료";
				}
				else if (status.equals("3")) {
					status_c = "배송 완료";
					status_s = "finish";
				}
				sql = "update orderform set status_c='" + status_c + "', status_s = '" + status_s + "' where id = " + id;
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
			}
		} catch (SQLException ex) {
			out.print("SQLException: " + ex.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		response.sendRedirect("order_seller.jsp");
	}
%>