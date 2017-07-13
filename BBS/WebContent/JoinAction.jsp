<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.shdev.user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %> <!-- javascript를 사용할 수 있게 함 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class = "com.shdev.user.User" scope = "page"/>
<jsp:setProperty name = "user" property = "userID"/>
<jsp:setProperty name = "user" property = "userPassword"/>
<jsp:setProperty name = "user" property = "userName"/>
<jsp:setProperty name = "user" property = "userEmail"/>
<jsp:setProperty name = "user" property = "userGender"/>

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
		int result = userDAO.join(user);
		PrintWriter script = response.getWriter(); // javascript를 사용함.
		
		
		// 회원가입 페이지 접근 시에 세션을 확인하여 재가입 방지
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
		
		
		if(user.getUserID() ==null || user.getUserPassword() == null || user.getUserName() == null || user.getUserEmail() == null || user.getUserEmail() == null){
			script.println("<script>");
			script.println("alert('입력하지 않은 사항이 있습니다.')");
			script.println("</script>");
		}else{
			if(result == 1){ 
				session.setAttribute("userID", user.getUserID());
				script.println("<script>");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}else{
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디 입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
