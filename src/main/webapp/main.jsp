<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>    
 
  <!-- ======= Header_css ======= -->
<jsp:include page = "header_css.jsp"></jsp:include>
  <!-- ======= Header_css End======= -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top ">
    <div class="container d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="main.jsp">Asumcha<span>.</span></a></h1>
    

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">홈 화면</a></li>
          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="map">지도</a></li>
              <li><a href="challenge.jsp">챌린지</a></li>
              <li><a href="board.jsp">게시판</a></li>
              <li><a href="#intro">소개</a></li>
              <li class="dropdown"><a href="#"><span>마이페이지</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="edit_Info.jsp">내 정보 수정</a></li>
                  <li><a href="my_challenge.jsp">내 챌린지</a></li>
                  <li><a href="edit_Password.jsp">비밀번호 변경</a></li>
                </ul>
              </li> 
            </ul>
          </li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <%
		String user_Email = null;
		if (session.getAttribute("user_Email") != null){
		    user_Email = (String) session.getAttribute("user_Email");
			}
		
		int pageNumber = 1;
	    if (request.getParameter("pageNumber") != null){
	    	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	    }
		 
		 if (user_Email != null) { %>
            <a href="logoutAction.jsp" class="get-started-btn scrollto">Logout</a>
        <% } else { %>
            <a href="login.jsp" class="get-started-btn scrollto">Login</a>
        <% } %>
</div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
    <div class="container" data-aos="fade-up">

      <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
        <div class="col-xl-6 col-lg-8">
          <h1>Asumcha</h1><br>
          <h2></h2>
        </div>
      </div>

      <div class="row gy-4 mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
        
        <div class="col-xl-2 col-md-4">
        	<a href="map">
	          <div class="icon-box">
	            <i class="ri-store-line"></i>
	            <h3>map </h3>
	          </div>
	        </a>
        </div>
        
        <div class="col-xl-2 col-md-4">
        <a href="challenge.jsp">
          <div class="icon-box">
            <i class="ri-bar-chart-box-line"></i>
            <h3>challenge</h3>
          </div>
          </a>
        </div>
        
        <div class="col-xl-2 col-md-4">
        <a href="board.jsp">
          <div class="icon-box">
            <i class="ri-calendar-todo-line"></i>
            <h3>board</h3>
          </div>
          	</a>
        </div>
        <div class="col-xl-2 col-md-4">
        <a href="#intro">
          <div class="icon-box">
            <i class="ri-paint-brush-line"></i>
            <h3>intro</h3>
          </div>
          </a>
        </div>
        <div class="col-xl-2 col-md-4">
          <a href="mypage.jsp">
          <div class="icon-box">
            <i class="ri-database-2-line"></i>
            <h3 style="color =white"> mypage</h3>
          </div>
        </div>
        </a>
      </div>

    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Services Section ======= -->
    <section id="add" class="services">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>아숨차</h2>
          <p  id ="intro" >아숨차 기능 소개</p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box w-100">
              <div class="icon"><i class="bx bxl-dribbble"></i></div>
              <h4>경로 탐색</h4>
              <p>지도 탭에서 산을 클릭하면 난이도 별 경로를 제공합니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box w-100">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4>범죄 방지</h4>
              <p>무분별한 광고글 삭제하고, 등산 외 다른 목적은 제지합니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box w-100">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4>챌린지</h4>
              <p>&nbsp;목적 달성시 뱃지를 부여합니다. (경로 추가 기능 제공)</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box w-100">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4>정보를 공유하세요.</h4>
              <p>게시판을 통해 서로의 등산 꿀팁 또는 관광지를 공유하세요.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box w-100">
              <div class="icon"><i class="bx bx-slideshow"></i></div>
              <h4>난이도 알고리즘</h4>
              <p>많은 경로 제공시 내가 설정한 연령, 신체능력, 숙련도에 따라<br> 우선 경로를 보여줍니다.</p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box w-100">
              <div class="icon"><i class="bx bx-arch"></i></div>
              <h4>네비게이션 & 안심 등산(추가 예정)</h4>
              <p>등반시 경로 휴대폰에 보여줍니다. (출발시 안전팀 알림)</p>
            </div>
          </div>
        </div>
      </div>
    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container" data-aos="fade-up">

        <div class="row no-gutters">
          <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start" data-aos="fade-right" data-aos-delay="100" style="position: relative;">
            <img src="./assets/img/9.jpg" alt="" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0; z-index: -1;">
          </div>
          
          <div class="col-xl-7 ps-0 ps-lg-5 pe-lg-1 d-flex align-items-stretch" data-aos="fade-left" data-aos-delay="100">
            <div class="content d-flex flex-column justify-content-center">
              <h3>아숨차가 갖는 정보량</h3>
              <p>
                서울에 있는 모든 산의 경로를 담았습니다.
              </p>
              <div class="row">
                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-emoji-smile"></i>
                    <span data-purecounter-start="0" data-purecounter-end="32" data-purecounter-duration="2" class="purecounter"></span>
                    <p><strong>32</strong>개의 서울의 산에 있는 경로</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-journal-richtext"></i>
                    <span data-purecounter-start="0" data-purecounter-end="160" data-purecounter-duration="2" class="purecounter"></span>
                    <p><strong>160</strong>가지의 경로 수</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-clock"></i>
                    <span data-purecounter-start="0" data-purecounter-end="7" data-purecounter-duration="4" class="purecounter"></span>
                    <p><strong>7</strong>등급의 난이도. 적절한 난이도 경로 선택 가능</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-award"></i>
                    <span data-purecounter-start="0" data-purecounter-end="30" data-purecounter-duration="4" class="purecounter"></span>
                    <p><strong>18</strong>가지의 다양한 기능</p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End Counts Section -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container" data-aos="zoom-in">

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                
                <h3>광고를 제발 주세요.</h3>
                <h4>광고 &amp; 원해요</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  광고원해광고원해광고원해광고원해광고원해광고원해광고원해광고원해
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->
            <div class="swiper-slide">
              <div class="testimonial-item">
                
                <h3>광고를 제발 주세요.</h3>
                <h4>광고 &amp; 원해요</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  광고원해광고원해광고원해광고원해광고원해광고원해광고원해광고원해
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                
                <h3>광고를 제발 주세요.</h3>
                <h4>광고 &amp; 원해요</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  광고원해광고원해광고원해광고원해광고원해광고원해광고원해광고원해
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->


           
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
  </main> <!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>아숨차<span>.</span></h3>
              <p>
                 <br>
                Seoul , Korea<br><br>
                <strong>Phone:</strong> +82 10-1234-5678<br>
                <strong>Email:</strong> kmcpyj0@gmail.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          
        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>아숨차</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>