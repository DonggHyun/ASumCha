const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.querySelector('.container');

signUpButton.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

signInButton.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});


// 회원가입 폼
const signUpForm = document.querySelector('#signUpForm');
const nameInput = signUpForm.querySelector('input[name="username"]');
const signUpEmailInput = signUpForm.querySelector('input[name="email"]');
const signUpPasswordInput = signUpForm.querySelector('input[name="password1"]');


// 로그인 폼
const signInForm = document.querySelector('#signInForm');
const signInEmailInput = signInForm.querySelector('input[name="login_email"]');
const signInPasswordInput = signInForm.querySelector('input[name="login_password"]');


// submit 이벤트 리스너 등록
signInForm.addEventListener("submit", (event) => {
  event.preventDefault(); // 폼이 서버로 전송되는 것을 막음 

  const signInEmail = signInEmailInput.value; //로그인 한 id 입력값 
  const signInPassword = signInPasswordInput.value; //로그인 한 password 입력값 

  // 회원가입 폼의 입력값
  const signUpEmail = signUpEmailInput.value; //회원가입 한 이메일 입력값
  const signUpPassword = signUpPasswordInput.value; //회원가입 한 비밀번호 입력값

  console.log(signUpEmail);
  console.log(signInEmail);

  if (signInEmail === signUpEmail && signInPassword === signUpPassword) {
    alert("로그인 성공하셨습니다.");
    location.href = "index.html"; //메인 페이지로 이동
  } else {
    alert("이메일 또는 비밀번호가 일치하지 않습니다.");
  }
});