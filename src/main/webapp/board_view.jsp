<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<!DOCTYPE html>
<html lang="en">
 
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>아숨차 - 게시물</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: Gp
    * Updated: Mar 10 2023 with Bootstrap v5.2.3
    * Template URL: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>
<%
    String user_Email = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
    if (session.getAttribute("user_Email") != null)
    {
    	user_Email = (String)session.getAttribute("user_Email");
    }
    int post_Num = 0;
    if (request.getParameter("post_Num") != null)
    {
    	post_Num = Integer.parseInt(request.getParameter("post_Num"));
    }
    if (post_Num == 0)
    {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다')");
        script.println("location.href = 'board.jsp'");
        script.println("</script>");
    }
    Board board = new BoardDAO().getBoard(post_Num);
%>



<!-- ======= Header ======= -->
<header id="header" class="fixed-top header-inner-pages">
    <div class="container d-flex align-items-center justify-content-lg-between">

        <h1 class="logo me-auto me-lg-0"><a href="main.jsp">아숨차<span>.</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

        <nav id="navbar" class="navbar order-last order-lg-0">
            <ul>
                <li><a class="nav-link scrollto active" href="main.jsp">홈 화면</a></li>
                <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li><a href="map.jsp">지도</a></li>
                        <li><a href="challenge.jsp">챌린지</a></li>
                        <li><a href="board.jsp">게시판</a></li>
                        <li class="dropdown"><a href="mypage.jsp"><span>마이페이지</span> <i
                                class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">내 정보 수정</a></li>
                                <li><a href="#">내 챌린지</a></li>
                                <li><a href="#">비밀번호 변경</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
        <%
			if (user_Email != null) { %>
            <a href="logoutAction.jsp" class="get-started-btn scrollto">로그아웃</a>
        <% } else { %>
            <a href="login.jsp" class="get-started-btn scrollto">로그인</a>
        <% } %>

    </div>
</header><!-- End Header -->

<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
<!--    여유공간-->
    </section><!-- End Breadcrumbs -->
    
    
    

    <!-- ======= Services Section ======= -->
  <section id="portfolio-details" class="portfolio-details">
    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th colspan="3" style="background-color:#eeeeee; text-align:center;">게시판 글 보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width:20%;">글 제목</td>
                        <td colspan="2"><%= board.getPost_Title().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>                  
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= board.getPost_Nickname().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>
                    </tr>
                    <tr>
                        <td>작성일자</td>
                        <td colspan="2"><%= board.getPost_Date()%></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="2" style="min-height:200px; text-align:left;">
                        <!-- 특수문자를 제대로 출력하기위해 & 악성스크립트를 방지하기위해 -->
                        <%= board.getPost_Content().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n","<br>") %></td>    
                    </tr>
                </tbody>
            </table>
            
            <div>
            <a href="board.jsp" style="background-color: #ffc451;" class="btn btn-primary float-right">업로드</a>
			<% 
			if (user_Email != null && user_Email.equals(board.getPost_Email())) 
			{ 
			%>	
			    <a href="update.jsp?post_Num=<%=post_Num%>" class="btn btn-primary float-left">수정</a>
			    
			    <a href="deleteAction.jsp?post_Num=<%=post_Num%>" class="btn btn-success float-left">삭제</a>
			    </div>
			<% } %>
            
            
            
            
        	</div>
       </div>
    </section>
</main><!-- End #main -->
  <!-- ======= Footer ======= -->
<jsp:include page = "footer.jsp"></jsp:include>


</body>
</html>