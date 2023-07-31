<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="en">
 
<head>

  <!-- ======= Header_css ======= -->
<jsp:include page = "header_css.jsp"></jsp:include>
  <!-- ======= Header_css End======= -->

</head>
<body>

  <!-- ======= Header ======= -->
<jsp:include page = "header.jsp"></jsp:include>
  <!-- ======= Header End======= -->
  
  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h2>게시판 </h2>
          <ol>
            <li><a href="main.jsp">Home</a></li>
            <li>아숨차 게시판- 글쓰기 </li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      	<div class= "container">
    	<div class= "row">
    		<form method="post" action="boardAction.jsp">
    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
	    	    	<thead>
		    	    	<tr>
		    	    		<th colspan= "2" style= "background-color: #ffc451; text-align: center;">게시물 작성</th>
		    	    	</tr>
	    	    	</thead>
			    	<tbody>
			    		<tr>
			    			<td><input type="text" class="form-control" placeholder="제목"  name="boardTitle" maxlength="50" ></td>
			    		</tr>
			    		<tr>
			    			<td><textarea class="form-control" placeholder="내용"  name="boardContent" maxlength="2048" style= "height:350px" ></textarea></td>
			    		</tr>
			    	</tbody>
    	    	</table>
    	    	<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
    		</form>
    	    </div>
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