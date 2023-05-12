<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>

<style>
body {
  padding-top: 40px;
  padding-bottom: 40px;
}

.form-signin {
  max-width: 330px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="text"] {
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
		if ($.trim($("#id").val()) == "") {
			alert("아이디를 입력해주세요.");
			$("#id").val("").focus();
			return false;
		}
		if ($.trim($("#pass").val()) == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pass").val("").focus();
			return false;
		}
	}
</script>

</head>
	<!-- Custom styles for this template -->
	<link href="signin.css" rel="stylesheet">
</head>
<body class="text-center">
<%@ include file="/WEB-INF/views/header.jsp" %>

	<main class="form-signin w-100 m-auto">
		<form id="loginform" method="post" action="memberLoginOk.do" onsubmit="return check()">

            <br><br>
			<h3 class="h3 mb-3 fw-normal">가봤서울</h3>

			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id" placeholder="아이디">
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호">
			</div>

			<!--<div class="checkbox mb-3" align="left">
				<label><input type="checkbox" value="remember-me">
					아이디 저장
				</label>
			</div>-->
			<input class="w-100 btn btn-lg btn-primary" type="submit" value="로그인">
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
			<img src="images/kakao.png" width="200px" />
		</a>
		<br><br>
		</div>
		</div>
		</div>
	</main>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>