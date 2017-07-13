<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"  %>
<%@ page import = "com.shdev.bbs.BbsDAO" %>
<%@ page import = "com.shdev.bbs.Bbs" %>
<%@ page import = "java.util.ArrayList" %>
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
  <style type = "text/css">
  		a, a:hover {
  			color : #000000;
  			text-decoration : none;
  		}
  </style>
</head>
<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
		<!-- board start -->
		<div class = "container">
			<div class = "row">
				<table class = "table table-striped" style = "text-align :center; border : 1px solid #dddddd;">
					<thead>
						<tr>
							<th style = "backgroun=color: #eeeeee; text-align : center ">NO</th>
							<th style = "backgroun=color: #eeeeee; text-align : center ">TITLE</th>
							<th style = "backgroun=color: #eeeeee; text-align : center ">WRITER</th>
							<th style = "backgroun=color: #eeeeee; text-align : center ">DATE</th>
						</tr>
					</thead>
					<tbody>
						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for(int i = 0; i < list.size(); i++ ){%>
								<tr>
									<td><%= list.get(i).getBbsID() %></td>
									<td><a href = "View.jsp?bbsID=<%=list.get(i).getBbsID()%>"> <%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%></a></td>
									<td><%= list.get(i).getUserID() %></td>
									<td><%= list.get(i).getBbsDate()%></td>
								</tr>
							<%}%>
					</tbody>
				</table>
				<%
					if(pageNumber != 1){%>
						<a href="BBS.jsp?pageNumber=<%=pageNumber-1%>" class ="btn btn-success btn-arrow-Left">prev</a>
						
					<%}%>
				<%
					if(bbsDAO.nextPage(pageNumber+1)){%>
						<a href="BBS.jsp?pageNumber=<%=pageNumber+1%>" class ="btn btn-success btn-arrow-Left">next</a>
						
					<%}%>
					
				<a href = "Write.jsp" class = "btn btn-primary pull-right">NEW</a>
			</div>
		</div>
		<!-- board start -->
	

</body>
</html>












