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
	                <li><a href = "main.jsp">MAIN</a></li>
	  				<li class = "active"><a href = "bbs.jsp">BOARD</a></li>
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
		<!-- Write Form start -->
		<div class = "container">
			<div class = "row">
				<form method = "post" action="WriteAction.jsp">
					<table class = "table table-striped" style = "text-align :center; border : 1px solid #dddddd;">
						<thead>
							<tr>
								<th colspan = "2" style = "backgroun=color: #eeeeee; text-align : center ">WRITE FORM</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type = "text" class = "form-control" placeholder = "title" name = "bbsTitle" maxlength = "50">
							</tr>
							<tr>
								<td><textarea class = "form-control" placeholder = "content" name = "bbsContent" maxlength = "2048" style = "height : 350px;"></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type = "submit" class = "btn btn-primary pull-right" value = "REGISTER">				
				</form>
			</div>
		</div>
		<!-- Write Form end -->
	

</body>
</html>












