<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link rel="stylesheet" href="./css/font.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
<style>
* {
	font-family: 'Title_Medium';
}

main {
	margin: 80px auto 100px;
}
</style>
<script>
	function check() {
		if ($.trim($("#pass").val()) == "") {
			alert("비밀번호를 입력하세요!");
			$("#pass").val("").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<main class="form-signin w-100 text-center container">
		<form method="post" action="member_delete_ok.do"
			onsubmit="return check()">
			<h4 class="h3 mb-3 fw-normal">회원 탈퇴</h4>

			<table class="table">
				<tr>
					<th>회원아이디</th>
					<td>${id}</td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" id="pass" size="14" />
					</td>
				</tr>
			</table>
			<input class="btn btn-outline-danger" type="submit" value="탈퇴" /> <input
				class="btn btn-outline-secondary" type="reset" value="취소"
				onclick="$('#pass').focus();" />
		</form>
	</main>
	<c:import url="../footer.jsp" />
</body>
</html>