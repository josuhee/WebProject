<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product" %>
<html>
<head>
<title>Check Cookie</title>
<script type="text/javascript">
	function checkInfo(name, zipcode, address) {
		if (!confirm("성함 : " + name + "\n우편번호 : " + zipcode + "\n주소 : " + address + "\n\n 해당 주소가 맞습니까?")) {
			alert('아니요');
		} else {
			alert('예');
		}
	}
</script>
</head>
<body>
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
			
			if (flag) {%>
				<script>checkInfo('<%= shipping_name %>', '<%=shipping_zipcode%>', '<%=shipping_address%>')</script>
			<%
			} else {
				response.sendRedirect("shippingInfo.jsp?seller=" + seller_id);
			}					
		}
	}
%>
</body>
</html>