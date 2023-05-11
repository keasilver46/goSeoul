<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<style>
html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>


<script>
	function check() {
		if ($.trim($("#floatingInput").val()) == "") {
			alert("아이디를 입력해주세요.");
			$("#floatingInput").val("").focus();
			return false;
		}
		if ($.trim($("#floatingPassword").val()) == "") {
			alert("비밀번호를 입력해주세요.");
			$("#floatingPassword").val("").focus();
			return false;
		}
	}
</script>

</head>
<body>

	<!-- Custom styles for this template -->
	<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form id="loginform" method="post" action="memberLoginOk.do" onsubmit="return check()">

			<h3 class="h3 mb-3 fw-normal">가봤서울</h3>

			<div class="form-floating">
				<input type="email" class="form-control" id="floatingInput" placeholder="아이디">
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="floatingPassword" placeholder="비밀번호">
			</div>
            <br>
			<!--<div class="checkbox mb-3" align="left">
				<label><input type="checkbox" value="remember-me">
					아이디 저장
				</label>
			</div>-->
			<button class="w-100 btn btn-lg btn-danger" type="submit">로그인</button>
		</form>

		<div class="my-2 text-center text-small text-decoration: none">
		<a href="" class="text-muted">아이디 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="" class="text-muted">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="" class="text-muted">회원가입</a><br>
        </div>

		<!-- 로그인 api 구글, 네이버, 카톡 작성하기 -->
		<!-- 카카오 로그인 -->
		<br>
		<p class="text-muted">SNS계정으로 간편 로그인/회원가입</p>
		<a class="kakaoLogin"
			href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=53907bf2cc99ddbb1929db25394e8fae&redirect_uri=http://localhost/goSeoul/kakaoLogin.do">
			<img src="images/kakao1.png" width="50px" />
		</a> 구글 네이버
		</div>
		</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mt-5 mb-3 text-muted">&copy; 2023_goSeoul.team</p>
		</footer>
	</main>
	</form>
</body>
</html>