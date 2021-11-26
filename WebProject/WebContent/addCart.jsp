<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String userId = (String) session.getAttribute("userID");
	String role = (String) session.getAttribute("role");
	String redirect_url = "product.jsp?id="+id;
	if (id == null)
		redirect_url="errorPage.jsp";
	else if (userId == null || role == null || role.equals("seller"))
		redirect_url = "NoPermission.jsp";
	else {
		ResultSet rs = null;
		Statement stmt = null;
		try {
			String sql = "select * from product where id =" + id;
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				int p_id = rs.getInt("id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String seller_id = rs.getString("seller_id");
				
				Product goods = new Product(p_id, name, price, 0, seller_id);
				ArrayList<Product> list = (ArrayList<Product>) session.getAttribute(userId + "_cart");
				// 리스트가 없다면 새로 생성하여 세션에 삽입
				if (list == null) {
					list = new ArrayList<Product>();
					session.setAttribute(userId + "_cart", list);
				}
				
				// 기존 리스트에 해당 물건이 존재한다면 수량 늘려주기
				int cnt = 0;
				int size = list.size();
				Product tmp = new Product();
				for (int i = 0; i < size; i++) {
					tmp = list.get(i);
					if (tmp.getId() == p_id) {
						cnt++;
						int orderCnt = tmp.getCnt() + 1;
						tmp.setCnt(orderCnt);
						break;
					}
				}
				
				// 기존 리스트에 없다면 새로 추가
				if (cnt == 0) {
					goods.setCnt(1);
					list.add(goods);
				}
				
			} else redirect_url="errorPage.jsp";
		} catch (SQLException ex) {
			out.print("Product 테이블 호출이 실패했습니다.<br/>");
			out.print("SQLException: " + ex.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	}
	response.sendRedirect(redirect_url);
%>