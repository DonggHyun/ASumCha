<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="user_Password"/>
<jsp:setProperty name="user" property="user_Name"/>
<jsp:setProperty name="user" property="user_Email"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; c harset=UTF-8">
<title>JSP BBS</title> 
</head>
<body>
    <%
    	String user_Email = null;
    	if (session.getAttribute("user_Email") != null){
            user_Email = (String) session.getAttribute("user_Email");
    	}
    	if (user_Email != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 로그인되었습니다.')");
            script.println("location.href = 'main.jsp'");    // 메인 페이지로 이동
            script.println("</script>");
    	}
    	if (user.getUser_Password() == null ||user.getUser_Name() == null 
    		|| user.getUser_Email() == null){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든 문항을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
    	}else{
    		UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            if (result == -1){ // 회원가입 실패시
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");    // 이전 페이지로 사용자를 보냄
                script.println("</script>");
            }else{ // 회원가입 성공시
            	session.setAttribute("user_Email", user.getUser_Email()); // 추가
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'main.jsp'");    // 메인 페이지로 이동
                script.println("</script>");
            }
    	}
    %>
 
</body>
</html>