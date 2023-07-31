<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header id="header" class="fixed-top header-inner-pages">
<div class="container d-flex align-items-center justify-content-lg-between">

      <h1 class="logo me-auto me-lg-0"><a href="main.jsp">아숨차<span>.</span></a></h1>
    

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="main.jsp">홈 화면</a></li>
          <li class="dropdown"><a href="#"><span>메뉴</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="map.jsp">지도</a></li>
              <li><a href="challenge.jsp">챌린지</a></li> 
              <li><a href="board.jsp">게시판</a></li>
              <li><a href="#intro">소개</a></li>
              <li class="dropdown"><a href="mypage.jsp"><span>마이페이지</span> <i class="bi bi-chevron-right"></i></a>
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
		
		 if (user_Email != null) { %>
            <a href="logoutAction.jsp" class="get-started-btn scrollto">로그아웃</a>
        <% } else { %>
            <a href="login.jsp" class="get-started-btn scrollto">로그인</a>
        <% } %>
</div>
</header>