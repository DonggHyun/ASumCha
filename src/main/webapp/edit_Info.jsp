<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
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
		<%
		String user_Email = null;
		if (session.getAttribute("user_Email") != null){
		    user_Email = (String) session.getAttribute("user_Email");
			}
		if(user_Email == null){
			PrintWriter script = response.getWriter();
			script.print("<script>");
			script.print("alert('로그인 하세요');");
			script.print("location.href = 'login.jsp';");
			script.print("</script>");
		}
	 %>

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
            <div class="wrapper">
                <form id="editInfo" action ="edit_Info_Action.jsp" method ="post">
                    <h4 class="mt-2">닉네임</h4>
                    <input type="text" placeholder="닉네임" name="nickName"/>

                    <h4  class="mt-2">생년월일</h4>
                    <input type="text" placeholder="생년월일 (ex.19980114)" name="age"/>

                    <h4 class="mt-2">성별</h4>
                    <label class="pe-2"><input type="radio" value="남" name="gender"/>남</label>
                    <label class="pe-2"><input type="radio" value="여" name="gender"/>여</label>

                    <h4 class="mt-2">등산 실력</h4>
                    <label class="pe-2"><input type="radio" value="상" name="skill"/>상</label>
                    <label class="pe-2"><input type="radio" value="중" name="skill"/>중</label>
                    <label class="pe-2"><input type="radio" value="하" name="skill"/>하</label>

                    <button class id="signIn" class="mr-2 overlay2_btn">입력 완료</button>
                </form>
            </div>
        </div>
    </section>
</main><!-- End #main -->

  <!-- ======= Footer ======= -->
<jsp:include page = "footer.jsp"></jsp:include>
<!-- ======= Footer End ======= -->

</body>

</html>