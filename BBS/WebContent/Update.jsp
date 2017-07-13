<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter"  %>
<%@ page import = "com.shdev.bbs.Bbs"  %>
<%@ page import = "com.shdev.bbs.BbsDAO"  %>

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
		if(bbsID ==0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 접근입니다.');");
			script.println("history.back();");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('글을 수정할 권한이 없습니다.');");
			script.println("history.back();");
			script.println("</script>");
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
	  		</div>
		</nav>
		<!-- navigation bar end -->
		<!-- Write Form start -->
		<div class = "container">
			<div class = "row">
				<form method = "post" action="UpdateAction.jsp">
					<table class = "table table-striped" style = "text-align :center; border : 1px solid #dddddd;">
						<thead>
							<tr>
								<th colspan = "2" style = "backgroun=color: #eeeeee; text-align : center ">UPDATE FORM</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type = "text" class = "form-control" placeholder = "title" name = "bbsTitle" maxlength = "50" value = <%=bbs.getBbsTitle() %>></td>
							</tr>
							<tr>
								<td><textarea class = "form-control" placeholder = "content" name = "bbsContent" maxlength = "2048" style = "height : 350px;"><%=bbs.getBbsContent() %></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type = "hidden" name = "bbsID" value = <%=bbs.getBbsID() %>>
					<input type = "submit" class = "btn btn-primary pull-right" value = "REGISTER">				
				</form>
			</div>
		</div>
		<!-- Write Form end -->
	

</body>
</html>












