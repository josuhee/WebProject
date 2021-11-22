
<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="home.jsp"><i class="fa fa-home" style="color:black" aria-hidden="true"></i></a>
		<!-- a class="navbar-brand" href="#page-top"><img src="./resources/image/navbar-logo.svg" alt="..." /></a-->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
        	<i class="fas fa-bars ms-1"></i>
		</button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
        	<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
            	<li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="#portfolio">Portfolio</a></li>
                <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#team">Team</a></li>
                <%
                	String role = (String) session.getAttribute("role");
                	
                	if (role != null)
                		out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"logout.jsp\">Logout</a></li>");
                	else
                		out.print("<li class=\"nav-item\"><a class=\"nav-link\" href=\"login.jsp\">Login</a></li>");
                %>              
            </ul>
        </div>
	</div>
</nav>