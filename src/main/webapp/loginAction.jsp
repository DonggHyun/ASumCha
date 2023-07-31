<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="user_Email"/>
<jsp:setProperty name="user" property="user_Password"/>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
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
        UserDAO userDAO = new UserDAO();
        int result = userDAO.login(user.getUser_Email(), user.getUser_Password());
        if (result == 1){
        	session.setAttribute("user_Email", user.getUser_Email());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        else if (result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
        else if (result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB 오류가 발생했습니다.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
        }
    %>
 
</body>
</html>