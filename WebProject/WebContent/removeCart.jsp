<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%
	String id = request.getParameter("id");
	String user_id = (String) session.getAttribute("userID");
	String role = (String) session.getAttribute("role");
	boolean flag = true;
	
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("cart.jsp");
		return;
	}
	else if (user_id == null || role == null || role.equals("seller")){
		response.sendRedirect("NoPermission.jsp");
		return ;		
	}
	else {%>
		<%@ include file="dbconn.jsp" %>
		<%
		// db에 해당 product가 존재하는 지 확인할 것.
		ResultSet rs = null;
		Statement stmt = null;
		try {
			String sql = "select * from product where id="+id;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (!rs.next()){
				flag = false;
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
		
		if (flag) {
			ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute(user_id + "_cart");
			Product goodsQnt = new Product();
			for (int i = 0; i < cartList.size(); i++) {
				goodsQnt = cartList.get(i);
				if (String.valueOf(goodsQnt.getId()).equals(id)) {
					cartList.remove(goodsQnt);
					break;
				}
			}
		}		
		response.sendRedirect("cart.jsp");
		%>
	<%}%>