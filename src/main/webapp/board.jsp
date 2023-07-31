<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import = "board.Board" %>
<%@ page import = "board.BoardDAO" %>
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

    <%
		int pageNumber = 1;
	    if (request.getParameter("pageNumber") != null){
	    	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	    }
		
	%>
<!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-betw	een align-items-center">
          <h2>게시판</h2>
          <ol>
            <li><a href="index.jsp">Home</a></li>
            <li>아숨차 게시판</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    
  <%--   //Bbs와 BbsDAO 클래스 import <%@.... %>

import java.util.ArrayList <%@.... %>
멤버변수 pageNumber 선언 body부 시작시 <% %> 내 선언 
조회한 테이블 목록 출력 <tbody>.. 
테이블 아래 이전 or 다음 버튼 생성 </table> 아래
게시판 링크 태그가 붙은 값(ex. 제목 컬럼값)은 색상 변경 <style>...
     --%>

    <section id="portfolio-details" class="portfolio-details">
      	<div class= "container">
    	<div class="row">
    	    <table class= "table table-stripped" style= "text-align: center; border: 1px solid #dddddd">
    	    	<thead>
    	    	<tr>
    	    		<th style= "background-color: #ffc451; text-align: center;">번호</th>
    	    		<th style= "background-color: #ffc451; text-align: center;">제목</th>
    	    		<th style= "background-color: #ffc451; text-align: center;">작성자</th>
    	    		<th style= "background-color: #ffc451; text-align: center;">작성일</th>
    	    	</tr>
    	    	</thead>
    	    	<tbody>
    	    		<tr>
    	    			<%
    	    				BoardDAO boardDAO = new BoardDAO();
    	    				ArrayList<Board> list = boardDAO.getlist(pageNumber);
    	    				for(int i =0; i<list.size(); i++){
    	    			%>
    	    			<tr>
    	    				<td><%= list.get(i).getPost_Num() %></td>
    	    				<td><a href ="board_view.jsp?post_Num=<%=list.get(i).getPost_Num()%>"><%=list.get(i).getPost_Title() %></a></td>
    	    				<td><%= list.get(i).getPost_Nickname() %></td>
    	    				<td><%= list.get(i).getPost_Date().substring(0, 11) + list.get(i).getPost_Date().substring(11, 13) + "시" + list.get(i).getPost_Date().substring(14, 16) + "분" %></td>
    	    			</tr>
    	    			<% } %>
    	    		</tr>
    	    	</tbody>
    	    </table>    	    
    	</div>
    	<a href= "board_Write.jsp" class= "btn btn-primary pull-right" style= "background-color: #ffc451; border-color: black;" >글쓰기</a>
    	 <%
    	    	if(pageNumber != 1){
    	    %>		
    	    		<a href= "board.jsp?pageNumber=<%=pageNumber -1%>" class="btn float-left" style ="background-color: black; color : white;">이전</a>
    	    <% 
    	   	 	}if(boardDAO.nextPage(pageNumber + 1)){
    	    %>		
    	    	<a href= "board.jsp?pageNumber=<%=pageNumber +1%>" class="btn float-left" style ="background-color: black; color : white;" >다음</a>
    	    <% 
    	    	}
    	    %>
    	</div>      
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->
  

  <!-- ======= Footer ======= -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="asset/js/bootstrap.js"></script>

<jsp:include page = "footer.jsp"></jsp:include>
  <!-- ======= Footer End======= -->
</body>
</html>