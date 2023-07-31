<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>아숨차 로그인</title>
  <link rel="stylesheet" href="./assets/css/login.css" />
</head>

<body>
  <div class="wrapper"> 
    <div class="container">
      <div class="sign-up-container">
        <form id="signUpForm" method="post" action="joinAction.jsp">
          <h1>회원가입</h1>
          <input type="text" placeholder="이름" name="user_Name" />
          <input type="email" placeholder="이메일" name="user_Email" />
          <input type="password" placeholder="비밀번호" name="user_Password" />
          
          <button id="signIn" class="overlay2_btn">회원가입 완료하기</button>
        </form>
      </div>
      <div class="sign-in-container">
        <form id="signInForm" method = "post" action ="loginAction.jsp">
          <h1>로그인</h1>
          <span>다른 계정으로 로그인</span>
          <input type="email" placeholder="이메일 주소" name="user_Email" />
          <input type="password" placeholder="비밀번호" name="user_Password" />
          <button type="submit" class="form_btn">로그인</button>
        </form>
      </div>
      <div class="overlay-container">
        <div class="overlay-left">
          <h1>환영합니다</h1>
        </div>
        <div class="overlay-right">
          <h2>회원가입을 안하셨나요?
            <h3>아래 버튼을 누르세요.</h3>
            <button id="signUp" class="overlay_btn">회원가입 하기</button>
          </h2>
        </div>
      </div>
    </div>
  </div>
  	<script type="text/javascript" src="./assets/js/login.js"></script>
</body>

</html>