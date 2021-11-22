<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>hand made</title>
	<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <link href="resources/css/styles.css" rel="stylesheet" />    
</head>
<body>
	<%-- navigation bar --%>
	<jsp:include page="nav.jsp"/>
	
	<%-- header --%>
	<header class="masthead main-size">
		<div class="container">
			<div class="masthead-subheading">Welcome To Hand Made Market!</div>
			<div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
			<a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
		</div>
	</header>

	<%-- main --%>
	<main role="main">
		<h1>Hello World</h1>
	</main>
	<%-- footer --%>
	<jsp:include page="footer.jsp"/>
	
	<%-- script --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/scripts.js"></script>
	
</body>
</html>