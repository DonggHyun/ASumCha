<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- ======= Header_css ======= -->
<jsp:include page = "header_css.jsp"></jsp:include>
  <!-- ======= Header_css End======= -->
</head>

<body>
<%
	String user_Email = null;
	if(session.getAttribute("user_Email") != null){
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
<!-- ======= Header ======= -->
<jsp:include page = "header.jsp"></jsp:include>
<!-- ======= Header End======= -->



<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
        <!--    여유공간-->
    </section><!-- End Breadcrumbs -->

    <!-- ======= Services Section ======= -->
    <section id="add" class="services">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>아숨차</h2>
                <p id="intro">마이페이지(내 정보)</p>
            </div>

            <div class="row">
                <a href="edit_Password.jsp" class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in"
                   data-aos-delay="100">
                    <div class="icon-box w-100">
                        <div class="icon"><i class="bx bxl-dribbble"></i></div>
                        <h4 style="color: black">회원 정보 수정</h4>
                    </div>
                </a>

                <a href = "edit_Info.jsp"class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon-box w-100">
                        <div class="icon"><i class="bx bx-file"></i></div>
                        <h4 style="color: black">내 정보 수정</h4>
                    </div>
                </a>

                <a href = "sample.jsp"class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon-box w-100">
                        <div class="icon"><i class="bx bx-tachometer"></i></div>
                        <h4 style="color: black">내 등급</h4>
                    </div>
                </a>

                <a href = "sample.jsp" class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon-box w-100">
                        <div class="icon"><i class="bx bx-world"></i></div>
                        <h4 style="color: black">내 게시물</h4>
                    </div>
                </a>

                <a href = "sample.jsp"class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon-box w-100">
                        <div class="icon"><i class="bx bx-slideshow"></i></div>
                        <h4 style="color: black">내 댓글</h4>
                    </div>
                </a>

                <a href = "my_challenge.jsp"class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon-box w-100">
                        <div class="icon"><i class="bx bx-arch"></i></div>
                        <h4 style="color: black">내 챌린지</h4>
                    </div>
                </a>
            </div>
        </div>
    </section>
</main><!-- End #main -->

<script src="assets/js/main.js"></script>
      <!-- ======= footer ======= -->
<jsp:include page = "footer.jsp"></jsp:include>
  <!-- ======= footer End======= -->
</body>

</html>