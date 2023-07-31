<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "user.User" %>
<%@ page import = "user.UserDAO" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- ======= Header ======= -->
<jsp:include page = "header_css.jsp"></jsp:include>
<!-- ======= Header End======= -->
</head>

<body>

<!-- ======= Header ======= -->
<jsp:include page = "header.jsp"></jsp:include>
<!-- ======= Header End======= -->

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <!--        추가 공간-->
    </section><!-- End Breadcrumbs -->

    <!-- ======= Services Section ======= -->
    <section id="add" class="services">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>아숨차</h2>
                <p id="intro">회원정보 수정</p>
            </div>
            <div class = "edit_password">
                <form id="edit_Pw" action="edit_Password_Action.jsp" method="post">
                    <h3>내 이메일</h3>
                    <span>${user_Email}</span><br><br>
                    <h3>비밀번호 변경</h3>
                    <input class="input-style" type="password" placeholder="현재 비밀번호" name="now_password"/>
                    <input class="input-style" type="password" placeholder="바꿀 비밀번호" name="change_password1"/>
                    <input class="input-style" type="password" placeholder="바꿀 비밀번호 확인" name="change_password2"/>
                    <button id="signIn" class="overlay2_btn">비밀번호 변경</button>
                </form>
            </div>
        </div>
    </section>
</main><!-- End #main -->

<!-- ======= footer======= -->
<jsp:include page = "footer.jsp"/>
<!-- ======= footer End======= -->
</body>

</html>