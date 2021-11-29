<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String seller_id = request.getParameter("seller");

	String role = (String) session.getAttribute("role");
	String userId = (String) session.getAttribute("userID");
	
	if (userId == null || role == null || !role.equals("customer"))
		response.sendRedirect("NoPermission.jsp");
	else {
		//seller id가 존재하는지 확인
		ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute(userId + "_cart");
		
		boolean cartFlag = true;
		if (cartList != null) {
			int size = cartList.size();
			for (int i = 0; i < size; i++) {
				Product product = cartList.get(i);
				if (product.getSeller().equals(seller_id)) {
					cartFlag = false;
					break;
				}
			}
		}
		
		if (cartFlag) {
			response.sendRedirect("errorPage.jsp");
		} else {
			// cookie 검사
			String shipping_name = "";
			String shipping_zipcode = "";
			String shipping_address = "";
			
			// cookie
			boolean flag = true;
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					Cookie thisCookie = cookies[i];
					String n = thisCookie.getName();
					
					if (n.equals("shipping_name"))
						shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
					if (n.equals("shipping_zipcode"))
						shipping_zipcode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
					if (n.equals("shipping_address"))
						shipping_address = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				}
			} else flag = false;
			
			if (shipping_name.equals("") || shipping_zipcode.equals("") || shipping_address.equals(""))
				flag = false;
			
			if (flag == false)
				response.sendRedirect("errorPage.jsp");
			else {
			
			// insert information in order table %>
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				try {
					for (int i = 0; i < cartList.size(); i++) {
						Product product = cartList.get(i);
						if (product.getSeller().equals(seller_id)) {
							String sql ="insert into orderform(customer_id, seller_id, product_id, product_cnt, ship_name, ship_zipcode, ship_address, status_c, status_s) " +
										"value(?, ?, ?, ?, ?, ?, ?, ?, ?)";
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, userId);
							pstmt.setString(2, seller_id);
							pstmt.setInt(3, product.getId());
							pstmt.setInt(4, product.getCnt());
							pstmt.setString(5, shipping_name);
							pstmt.setString(6, shipping_zipcode);
							pstmt.setString(7, shipping_address);
							pstmt.setString(8, "주문 확인 중");
							pstmt.setString(9, "주문 확인");
							pstmt.executeUpdate();
						}
					}
					
				} catch (SQLException ex) {
					out.print("Orderform 테이블 삽입이 실패했습니다.<br/>");
					out.print("SQLException: " + ex.getMessage());
				} finally {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				}
			
				// delete information in arraylist
				for (int i = 0; i < cartList.size(); i++) {
					Product product = cartList.get(i);
					if (product.getSeller().equals(seller_id)) {
						cartList.remove(i);
						i--;					
					}
				}
			 	response.sendRedirect("cart.jsp");
			}
		}
	}
	
%>