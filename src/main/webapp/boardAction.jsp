<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = 'board.BoardDAO' %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="board" class="board.Board" scope="page" />
<jsp:setProperty name="board" property="post_Title" param="boardTitle" />
<jsp:setProperty name="board" property="post_Content" param="boardContent" />


<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>아숨차 - 게시물 작성</title>
</head>
<body>
	<%
	String user_Email = null;
	if(session.getAttribute("user_Email") != null){
		user_Email = (String) session.getAttribute("user_Email");
	}
	
	
	if(user_Email == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인하세요')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}else{
		if(board.getPost_Title() == null || board.getPost_Content() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('모든 문항을 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.write(board.getPost_Title(), user_Email, board.getPost_Content(), board.getPost_Nickname());
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
			
		}
	}
		
	
		
	
	%>
</body>
</html>