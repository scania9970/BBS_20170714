<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.shdev.bbs.Bbs" %>
<%@ page import = "com.shdev.bbs.BbsDAO" %>
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
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.');");
			script.println("location.href = 'BBS.jsp';");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
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
					<table class = "table table-striped" style = "text-align :center; border : 1px solid #dddddd;">
						<thead>
							<tr>
								<th colspan = "3" style = "backgroun=color: #eeeeee; text-align : center ">content</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style = "width : 20%;"> TITLE</td>
								<td colspan = "2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
							</tr>
							<tr>
								<td>WRITER</td>
								<td colspan = "2"><%=bbs.getUserID() %></td>
							</tr>
							<tr>
								<td>DATE</td>
								<td colspan = "2"><%=bbs.getBbsDate() %></td>
							</tr>
							<tr>
								<td>CONTENT</td>
								<td colspan = "2" style = "min-height : 200px; text-align : left">
									<%=bbs.getBbsContent().replaceAll(" ", "&nbsp").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>")%>
								</td>
							</tr>
							
						</tbody>
					</table>
					<a href = "BBS.jsp" class = "btn btn-primary pull-right">LIST</a>
					<%
						if(userID != null && userID.equals(bbs.getUserID())){%>
							<a href = "Update.jsp?bbsID=<%=bbsID %>" class = "btn btn-primary pull-right">EDIT</a>
							<a onclick = "return confirm('정말로 삭제하시겠습니까?')" href = "DeleteAction.jsp?bbsID=<%=bbsID %>" class = "btn btn-primary pull-right">DELETE</a>
					<%}%>
									
			</div>
		</div>
		<!-- Write Form end -->
	

</body>
</html>












