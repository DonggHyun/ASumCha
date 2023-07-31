<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>
    
<%@ page import = "java.io.PrintWriter" %>
<jsp:useBean id="user" class ="user.User" scope ="page"></jsp:useBean>
<jsp:useBean id="userDAO" class ="user.UserDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>	
	<%
	request.setCharacterEncoding("utf-8");
    // JSP 파일에서 파라미터 값 가져오기
    String user_Email = (String)session.getAttribute("user_Email");
    String nickName = request.getParameter("nickName");
    String age = request.getParameter("age");
    String gender = request.getParameter("gender");
    String skill = request.getParameter("skill");
    
    User updateUser = new User();
    updateUser.setUser_Email(user_Email);
    updateUser.setNick_Name(nickName);
    updateUser.setUser_Age(age);
    updateUser.setUser_Gender(gender);
    updateUser.setUser_Skill(skill);
    
    int result = userDAO.editInfo(age, gender, skill, nickName,user_Email); 
    
    if (result > 0) {
        // 비밀번호 변경 성공 시 처리할 내용
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원정보가 변경되었습니다.')");
        script.println("location.href = 'mypage.jsp'");    // 마이페이지로 이동
        script.println("</script>");
    } else {
        // 비밀번호 변경 실패 시 처리할 내용
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('회원정보 변경에 실패했습니다.')");
        script.println("history.back()");    // 이전 페이지로 이동
        script.println("</script>");
    }
	%>

</body>
</html>