<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<%@ page import="java.net.URLEncoder"%>
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
			Cookie s_zipcode = new Cookie("shipping_name", URLEncoder.encode(zipcode, "utf-8")); 
			Cookie s_address = new Cookie("shipping_name", URLEncoder.encode(address, "utf-8")); 
			
			// 5 hour
			s_name.setMaxAge(5 * 60 * 60);
			s_zipcode.setMaxAge(5 * 60 * 60);
			s_address.setMaxAge(5 * 60 * 60);
			
			//쿠키 삽입은 sql문 잘 작동하는거 보고 넣을까?
			response.addCookie(s_name);
			response.addCookie(s_zipcode);
			response.addCookie(s_address);
			
			// insert information in order table
			
			
			// delete information in arraylist
			int size = cartList.size();
			for (int i = 0; i < size; i++) {
				Product product = cartList.get(i);
				if (product.getSeller().equals(seller_id))
					cartList.remove(i);
			}
		}
	}
%>
<%-- 
	1. seller id가 cart에 존재하는지 확인 !
	2. 파라미터들이 잘 넘어왔는지 확인 !
	3. 쿠키에 삽입. !
	4. order 테이블에 정보 삽입
	5. cart에서 해당 seller id가 같은 목록 삭제하기 !
	
--%>