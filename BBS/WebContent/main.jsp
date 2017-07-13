<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"  %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>BBS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>

	<!-- navigation bar start -->
		<nav class="navbar navbar-default">
	  		<div class = "navbar-header">
	  			<button type = "button" class = "navbar-toggle collapsed" 
	  				data-toggle = "collapse" 
	  				data-target="#bs-example-navbar-collapse-1" 
	  				aria-expanded = "false">
	  				<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
				</button>
				<a class = "navbar-brand" href = "main.jsp">BBS</a>
	  		</div>
	  		<div class = "collapse navbar-collapse" id = "bs-example-navbar-collapse-1">
	  			<ul class = "nav navbar-nav">
	                <li class = "active"><a href = "main.jsp">MAIN</a></li>
	  				<li><a href = "BBS.jsp">BOARD</a></li>
	  			</ul>
	  			<% if(userID == null){%>
	  				<ul class = "nav navbar-nav navbar-right">
	  				<li class = "dropdown">
	  					<a href = "#" class = "dropdown-toggle" 
	  					 	data-toggle="dropdown" role = "button"
	  					 	aria-hashpopup = "true" 
	  					 	aria-expanded = "false">접속하기<span class = "caret"></span></a>
	  		            <ul class = "dropdown-menu">
	  		                <li><a href = "login.jsp">Sign In</a></li>
	  		                <li><a href = "join.jsp">Sign Up</a></li>
	  		            </ul>
	  				</li>
	  			</ul>
	  			<%}else{ %>
	  				<ul class = "nav navbar-nav navbar-right">
	  				<li class = "dropdown">
	  					<a href = "#" class = "dropdown-toggle" 
	  					 	data-toggle="dropdown" role = "button"
	  					 	aria-hashpopup = "true" 
	  					 	aria-expanded = "false">회원관리<span class = "caret"></span></a>
	  		            <ul class = "dropdown-menu">
	  		                <li><a href = "LogoutAction.jsp">Log Out</a></li>
	  		            </ul>
	  				</li>
	  			</ul>
	  			
	  			<%} %>
	  		</div>
		</nav>
	<!-- navigation bar end -->
	
	<div class = "container">
		<div class = "jumbotron">
			<div class = "container">
				<h1>BBS</h1>
				<p>
					이 페이지는 부트스트랩으로 만든 간단한 JSP 웹 게시판입니다.
				</p>
				<a class = "btn btn-primary btn-pull" href = "#" role = "button">알아보기</a>
			</div>
		</div>
	</div>
	
	<div class = "container">
		<div id = "myCarousel" class = "carousel slide" data-ride = "carousel">
			<ol class = "carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class = "active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class = "carousel-inner">
				<div class = "item active">
					<img src = "images/1.jpg">
				</div>
				<div class = "item">
					<img src = "images/2.jpg">
				</div>
				<div class = "item">
					<img src = "images/3.jpg">
				</div>
			</div>
			<a class = "left carousel-control" href = "#myCarousel" data-slide = "prev">
				<span class = "glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class = "right carousel-control" href = "#myCarousel" data-slide = "next">
				<span class = "glyphicon glyphicon-chevron-right"></span>
			</a>	
		</div>
	</div>

</body>
</html>








