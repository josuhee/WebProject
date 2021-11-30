<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>hand made</title>
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <script src="resources/js/addMember.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <link href="resources/css/styles.css" rel="stylesheet" />    
</head>
<body>
	<%-- navigation bar --%>
	<jsp:include page="nav.jsp"/>
	
	<%-- header --%>
	<header class="masthead else-size">
		<div class="container">
			<div class="masthead-subheading">Welcome to HM !</div>
        	<div class="masthead-heading text-uppercase">회원가입</div>
        </div>
    </header>

	<%-- bundle --%>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:setBundle basename="bundle.myBundle" var="resourceBundle"/>
	
	<%-- main --%>
	<div class="container" align="center">
		<div class="col-md-7 col-md-offset-3" style="margin:40px">
			<p><a href="?language=ko" >Korean</a> | <a href="?language=en">English</a>
			<form class="form-signin" name="memberForm" action="insert_member.jsp" method="post">
				<div class="form-group">
					<input type="radio" class="form-check-input" id="role" name="role" value="customer" checked/> 고객
					<input type="radio" class="form-check-input" id="role" name="role" value="seller" /> 판매자
				</div>
				<div class="form-group row" style="margin: 20px 0;">
					<label class="col-md-2 align-self-center ml-0"><fmt:message key="login" bundle="${resourceBundle}"/></label>
					<div class="col-md-6">
						<input type="text" id="id" name="id" class="form-control" placeholder="ID" autocomplete="off" onkeyup="before_id()" required autofocus/>					
					</div>
					<div class="col-md-3 align-self-center">
						<button type="button" class="btn btn-outline-dark btn-sm" onclick="checkDuplicateId()"><fmt:message key="duplicate" bundle="${resourceBundle}"/></button>
					</div>
				</div>
				<div class="form-group row" style="margin: 20px 0;">
					<label class="col-md-2 align-self-center ml-0"><fmt:message key="passwd" bundle="${resourceBundle}"/></label>
					<div class="col-md-9">
						<input type="password" id="passwd" name="passwd" class="form-control"	placeholder="Password" required/>					
					</div>
				</div>
				<div class="form-group row" style="margin: 20px 0;">
					<label class="col-md-2 align-self-center ml-0"><fmt:message key="passwd_check" bundle="${resourceBundle}"/></label>
					<div class="col-md-9">
						<input type="password" id="passwd_check" name="passwd_check" class="form-control"	placeholder="Password Check" required/>					
					</div>
				</div>
				<input type="button" value='<fmt:message key="signup" bundle="${resourceBundle}"/>' class="btn btn btn-lg btn-success btn-block" id="submit_btn" onclick="checkPasswd()" disabled/>
			</form>
		</div>
	</div>
	
	<%-- footer --%>
	<jsp:include page="footer.jsp"/>
	
	<%-- script --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/scripts.js"></script>
</body>
</html>