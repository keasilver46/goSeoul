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

<script>
$(function() {
    // 쿠키값을 가져온다.
    var cookie_user_id = getLogin();

    // 쿠키값이 존재하면 id에서 쿠키에서 가져온 Id를 할당 한뒤
    // 체크박스를 체크상태로 변경
    if(cookie_user_id != "") {
    $("#id").val(cookie_user_id);
    $("#cb_saveId").attr("checked", true);
  }

    // 아이디 저장 체크 시
    $("#cb_saveId").on("click", function() {
    var _this = this;
    var isRemember;
    if ($(_this).is(":checked")) {
      isRemember = confirm("아이디 저장");

      if (!isRemember) {
        $(_this).attr("checked", false);
      }
  });

    // 로그인 버튼 클릭 시
    $("#btn_login").on("click", function() {
    if($("#cb_saveId").is(":checked")) {
      saveLogin($("#virtual_id").val());
    }else { // 체크 해제 시 공백으로 처리
      saveLogin("");
    }
  });
});

// 로그인 정보 저장 @param id
function saveLogin(id) {
  if (id != "") {
    // id쿠키에 id값을 7일간 저장
    setSave("id", id, 7);
  } else {
    // id쿠키 삭제
    setSave("id", id, -1);
  }
}

// cookie에 id를 저장
// @param name, value, expiredays
function setSave(name, value, expiredays) {
  var today = new Date();
  today.setDate(today.getDate() + expiredays);
  document.cookie = name + "=" + escape(value) + "; path=/; expires=" + today.toGMTString() + ";"
}

// getLogin 쿠키값을 가져온다
// @return{String}
function getLogin() {
  // id쿠키에서 id값을 가져온다.
  var cook = document.cookie + ";";
  var idx = cook.indexOf("id", 0);
  var val = "";

  if (idx != -1) {
    cook = cook.substring(idx, cook.length);
    begin = cook.indexOf("=", 0) + 1;
    end = cook.indexOf(";", begin);
    val = unescape(cook.substring(begin, end));
  }
  return val;
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

            <!-- 아이디 저장여부 -->
			<div class="checkbox mb-3" align="left">
				<input type="checkbox" id="cb_saveId">아이디 저장
			</div>

			<!-- 로그인 -->
			<input class="w-100 btn btn-lg btn-primary" type="submit" id="btn_login" value="로그인">

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
			<img src="images/kakao.png" width="60px" />
		</a>
		<br><br>

	</form>
	</main>

	<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>