<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String seller_id = request.getParameter("seller");
	String name = request.getParameter("name");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	
	String role = (String) session.getAttribute("role");
	String userId = (String) session.getAttribute("userID");
	
	if (userId == null || role == null || !role.equals("customer"))
		response.sendRedirect("NoPermission.jsp");
	else if (name == null || zipcode == null || address == null)
		response.sendRedirect("errorPage.jsp");
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
			// create and insert cookie
			Cookie s_name = new Cookie("shipping_name", URLEncoder.encode(name, "utf-8")); 
			Cookie s_zipcode = new Cookie("shipping_zipcode", URLEncoder.encode(zipcode, "utf-8")); 
			Cookie s_address = new Cookie("shipping_address", URLEncoder.encode(address, "utf-8")); 
			
			// 5 hour
			s_name.setMaxAge(5 * 60 * 60);
			s_zipcode.setMaxAge(5 * 60 * 60);
			s_address.setMaxAge(5 * 60 * 60);
			
			//쿠키 삽입은 sql문 잘 작동하는거 보고 넣을까?
			response.addCookie(s_name);
			response.addCookie(s_zipcode);
			response.addCookie(s_address);
			
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
							pstmt.setString(5, name);
							pstmt.setString(6, zipcode);
							pstmt.setString(7, address);
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
	
%>