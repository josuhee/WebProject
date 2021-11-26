<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ include file = "dbconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String user_id = (String) session.getAttribute("userID");
		
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			String sql = "select id, seller_id, filename from product where id=" + id;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				String filename = rs.getString("filename");
				if (String.valueOf(id).equals(rs.getString("id")) && user_id.equals(rs.getString("seller_id"))) {
					sql = "delete from product where id ="+id;
					stmt = conn.createStatement();
					stmt.executeUpdate(sql);
					
					if (filename != null){
						String path = request.getSession().getServletContext().getRealPath("/");
						path = path + "upload/" + filename;
						
						File f = new File(path);
						if (f.exists()) {
							f.delete();
						}
						
					}
				}
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
		response.sendRedirect("productManagement.jsp");
	%>