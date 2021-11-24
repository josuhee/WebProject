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
	<section class="page-section" id="about">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">About</h2>
				<h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
			</div>
			<ul class="timeline">
				<li>
					<div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/1.jpg" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
								<h4>2009-2011</h4>
								<h4 class="subheading">Our Humble Beginnings</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.jpg" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>March 2011</h4>
							<h4 class="subheading">An Agency is Born</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
					</div>
				</li>
				<li>
					<div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.jpg" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>December 2015</h4>
							<h4 class="subheading">Transition to Full Service</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/4.jpg" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>July 2020</h4>
							<h4 class="subheading">Phase Two Expansion</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image">
						<h4>Be Part<br />Of Our<br />Story!</h4>
					</div>
				</li>
			</ul>
		</div>
	</section>
       
	<%-- footer --%>
	<jsp:include page="footer.jsp"/>
	
	<%-- script --%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/scripts.js"></script>
	
</body>
</html>