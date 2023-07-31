<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty property="now_password" name="user" />
<jsp:setProperty property="change_password1" name="user" />
<jsp:setProperty property="change_password2" name="user" />

<jsp:useBean id="userDAO" class="user.UserDAO" scope="page"></jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");
	String user_Email = (String)session.getAttribute("user_Email"); 
	String oldPassword = userDAO.getOldPassword(user_Email); 

	
	// 비밀번호 변경 처리
	String now_password = request.getParameter("now_password"); // 현재 비밀번호
	String change_password1 = request.getParameter("change_password1"); // 변경할 비밀번호
	String change_password2 = request.getParameter("change_password2"); // 변경할 비밀번호 확인
	
	System.out.println("now_password: " + now_password);
	System.out.println("user_Password: " + change_password1);

	// 현재 비밀번호와 변경할 비밀번호가 일치하고, 변경할 비밀번호와 확인 비밀번호가 일치하는 경우에만 업데이트
	if (now_password != null && now_password.equals(oldPassword)) {
	    if (change_password1 != null && change_password1.equals(change_password2)) {
	        User updatedUser = new User();
	        updatedUser.setUser_Password(change_password1);
	        int result = userDAO.editPassword(change_password1, user_Email);
	        
	        
	        if (result > 0) {
	            // 비밀번호 변경 성공 시 처리할 내용
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('비밀번호가 변경되었습니다.')");
	            script.println("location.href = 'mypage.jsp'");    // 마이페이지로 이동
	            script.println("</script>");
	        } else {
	            // 비밀번호 변경 실패 시 처리할 내용
	            PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('비밀번호 변경에 실패했습니다.')");
	            script.println("history.back()");    // 이전 페이지로 이동
	            script.println("</script>");
	        }
	    } else {
	        // 변경할 비밀번호와 확인 비밀번호가 일치하지 않는 경우
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('비밀번호를 다시 확인해주세요.');");
	        script.println("history.back();");    // 이전 페이지로 이동
	        script.println("</script>");
	    }
	} else {
	    // 현재 비밀번호가 일치하지 않는 경우
	    PrintWriter script = response.getWriter();
	    script.println("<script>");
	    script.println("alert('현재 비밀번호를 다시 확인해주세요.');");
	    script.println("history.back();");    // 이전 페이지로 이동
	    script.println("</script>");
	}
%>
