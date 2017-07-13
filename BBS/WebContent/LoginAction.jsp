<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.shdev.user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %> <!-- javascript를 사용할 수 있게 함 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class = "com.shdev.user.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userID"/>
<jsp:setProperty name = "user" property = "userPassword"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>BBS</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		PrintWriter script = response.getWriter();
		
		
		// 재 로그인 방지//////////////////////////////////////////
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){
			script.println("<script>");
			script.println("alert('로그인상태 입니다.');");
			script.println("location.href('main.jsp')");
			script.println("</script>");
		}
		//////////////////////////////////////////////////////
		
		if(result == 1){
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}else if(result == 0){
			script.println("<script>");
			script.println("alert('Check your Password')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			script.println("<script>");
			script.println("alert('Check your ID')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			script.println("<script>");
			script.println("alert('Database err')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>
