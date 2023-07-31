<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <!--    여유공간-->
    </section><!-- End Breadcrumbs -->

    <!-- ======= Services Section ======= -->
    <section id="add" class="services">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>아숨차</h2>
                <p id="intro">내 챌린지</p>
            </div>
            <section id="counts" class="counts">
                <div class="container" data-aos="fade-up">
                    <div class="row no-gutters">
                        <div class="col-xl-7 ps-0 ps-lg-5 pe-lg-1 d-flex align-items-stretch" data-aos="fade-left"
                             data-aos-delay="100">
                            <div class="content d-flex flex-column justify-content-center">
                                <h3 class="mb-4">달성 정도</h3>
                                <div class="row">
                                    <div class="col-md-12 d-md-flex align-items-md-stretch">
                                        <div class="count-box">
                                            <i class="bi bi-emoji-smile"></i>
                                            <span data-purecounter-start="0" data-purecounter-end="17"
                                                  data-purecounter-duration="2" class="purecounter"></span>
                                            <p>일일 챌린지</p>
                                        </div>
                                    </div>
                                    <div class="col-md-12 d-md-flex align-items-md-stretch">
                                        <div class="count-box">
                                            <i class="bi bi-journal-richtext"></i>
                                            <span data-purecounter-start="0" data-purecounter-end="9"
                                                  data-purecounter-duration="2" class="purecounter"></span>
                                            <p>주간 챌린지</p>
                                        </div>
                                    </div>

                                    <div class="col-md-12 d-md-flex align-items-md-stretch">
                                        <div class="count-box">
                                            <i class="bi bi-clock"></i>
                                            <span data-purecounter-start="0" data-purecounter-end="4"
                                                  data-purecounter-duration="2" class="purecounter"></span>
                                            <p>월간 챌린지</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End .content-->
                        </div>
                    </div>

                </div>
            </section>
        </div>
    </section>
</main><!-- End #main -->
  <!-- ======= Footer ======= -->
<jsp:include page = "footer.jsp"></jsp:include>
<!-- ======= Footer End======= -->

</body>

</html>