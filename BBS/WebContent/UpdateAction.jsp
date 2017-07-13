<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.shdev.bbs.BbsDAO" %>
<%@ page import = "java.io.PrintWriter" %> <!-- javascript를 사용할 수 있게 함 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class = "com.shdev.bbs.Bbs" scope = "page"/>
<jsp:setProperty name = "bbs" property = "bbsTitle"/>
<jsp:setProperty name = "bbs" property = "bbsContent"/>

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
 		String userID = null;
 		PrintWriter script = response.getWriter();
		BbsDAO bbsDAO = new BbsDAO();
		
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		String bbsTitle = request.getParameter("bbsTitle");
		String bbsContent = request.getParameter("bbsContent");
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
			bbs.setUserID(userID);
		}
		
		
		if(userID == null){
			script.println("<script>");
			script.println("alert('Please, Log in.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}else{
			if(!userID.equals(bbs.getUserID())){
				script.println("<script>");
				script.println("alert('글을 수정할 권한이 없습니다.');");
				script.println("history.back();");
				script.println("</script>");
			}
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null||bbs.getBbsTitle() == " " || bbs.getBbsContent() == " "){
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.');");
				script.println("</script>");
			}else{
				bbs.setUserID(userID);
				int result = bbsDAO.update(bbsID, bbsTitle, bbsContent);
				if(result == 1){
					script.println("<script>");
					script.println("location.href = 'BBS.jsp'");
					script.println("</script>");
				}else if(result == -2){
					script.println("<script>");
					script.println("alert('DATABASE ERROR')");
					script.println("history.back();");
					script.println("</script>");
				}
				
			}
		}
		/* if(result == 1){ 
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}else{
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");

 */		
 		/* if(result == 1){
 			script.println("<script>");
 			script.println("location.href = 'BBS.jsp'");
 			script.println("</script>");
 		}else if(result == -2){
 			script.println("<script>");
 			script.println("alert('DATABASE ERROR');");
 			script.println("history.back();");
 			script.println("</script>");
 		} */
	%>
</body>
</html>
