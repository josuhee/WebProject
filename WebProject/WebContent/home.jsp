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
			<a class="btn btn-primary btn-xl text-uppercase" href="#about">Tell Me More</a>
		</div>
	</header>

	<%-- main --%>
	<section class="page-section" id="about">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Hand Made Market</h2>
				<h3 class="section-subheading text-muted">세상에서 제일 작은 나만의 상점</h3>
			</div>
			<ul class="timeline">
				<li>
					<div class="timeline-image bg-secondary"><img class="rounded-circle img-fluid" src="resources/image/home/2.PNG" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
								<h4>Open this Market</h4>
								<h4 class="subheading">Welcome Come !</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">당신의 작은 상점이 오픈하였습니다 ! 고객으로써 가지각색의 다양한 물품들도 살펴보고, 때론 판매자로써 자신이 만든 가치있는 물건을 판매해 보는 건 어떤가요 ?</p></div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image bg-secondary"><img class="rounded-circle img-fluid" src="resources/image/home/1.PNG" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>왜 필요한가 ?</h4>
							<h4 class="subheading">An Agency is Born</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">너무 소량의 제품은 주문 제작하기도 힘들고, 그렇다고 공장에서 찍어내는 제품들은 메리트가 없는 법이죠. 이곳은 멋진 작가님들이 자신들이 직접 만드는 제품들을 올리고 고객들은 자신의 마음에 쏙 드는 제품을 찾을 수 있도록 해주는 상점입니다.</p></div>
					</div>
				</li>
				<li>
					<div class="timeline-image bg-secondary"><img class="rounded-circle img-fluid" src="resources/image/home/4.PNG" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>고객은 ...</h4>
							<h4 class="subheading">Transition to Full Service</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">고객은 원하는 제품의 재고 수량을 확인하고 추가 요청사항을 첨부함으로써 원하는 제품을 손쉽게 획득할 수 있습니다. 세상에 딱 하나만 있는 자신만의 물건을 소유해 보는 것은 어떨까요 ?</p></div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image bg-secondary"><img class="rounded-circle img-fluid" src="resources/image/home/3.PNG" alt="..." /></div>
					<div class="timeline-panel">
						<div class="timeline-heading">
							<h4>판매자는 ...</h4>
							<h4 class="subheading">Phase Two Expansion</h4>
						</div>
						<div class="timeline-body"><p class="text-muted">자신이 만든 물건을 판매해보고 싶지 않으신가요? 너무 소량이어도 걱정마세요. 이 곳, 당신의 작은 상점은 그 어떤 것이라도 판매할 준비가 되어있답니다.</p></div>
					</div>
				</li>
				<li class="timeline-inverted">
					<div class="timeline-image bg-secondary">
						<h4>Start<br />Of Your<br />Market !</h4>
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