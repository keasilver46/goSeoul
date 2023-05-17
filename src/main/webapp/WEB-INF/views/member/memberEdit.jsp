<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정보 수정</title>
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.2/css/bootstrap.min.css'>
<style>
.bd-navbar {
	position: sticky;
	top: 0;
	z-index: 1071;
	min-height: 4rem;
	box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .05), inset 0 -1px 0
		rgba(0, 0, 0, .1);
}

.bd-sidebar {
	position: sticky;
	top: 4rem;
	z-index: 1000;
	height: calc(100vh - 4rem);
	background: #eee;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 220px;
}

.bd-sidebar .nav {
	display: block;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: .25rem 1.5rem;
	font-size: 90%;
}
</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous">
	
</script>

</head>
<body>

<c:import url="../header.jsp" />

	<div class="container-fluid">
		<div class="row flex-nowrap">
			<div class="col-3 bd-sidebar">
				<ul class="nav">
					<li><a href="#">회원정보</a></li>
					<li><a href="">받은 쪽지함</a></li>
					<li><a href="reserveList.do">예약글 확인</a></li>
					<li><a href="withList.do">동행글 확인</a></li>
					<li><a href="">좋아요</a></li>
					<!-- 	<li><a href="#" onClick="delete">탈퇴</a></li> -->
				</ul>
				<br>
			</div>

			<h1 align="center">회원정보수정</h1>
			<div class="">
				<form action="memberEdit.do" method="post">
					<table>
						<tr>
							<td>* 아이디</td>
							<td><input type="text" name="id" value="${edit.id }"
								readonly></td>
						</tr>
						<tr>
							<td>* 닉네임</td>
							<td><input type="text" name="nick" value="${edit.nick }">
							</td>
						</tr>
						<tr>
							<td>* 바꿀 비밀번호</td>
							<td><input type="password" name="pass" value="${edit.pass }"></td>
						</tr>
						<tr>
							<td>* 비밀번호 확인</td>
							<td><input type="password" name="pass" value="${edit.pass }"></td>
						</tr>
						<tr>
							<td>* 이름</td>
							<td><input type="text" name="name" value="${edit.name }"
								readonly></td>
						</tr>
						<tr>
							<td>* 생일</td>
							<td><input type="text" name="birth" value="${edit.birth }"
								readonly></td>
						</tr>

						<tr>
							<td>* 번호 앞자리</td>
							<td><input type="text" name="tel2" value="${edit.tel2 }"></td>
						</tr>
						<tr>
							<td>* 번호 뒷자리</td>
							<td><input type="text" name="tel3" value="${edit.tel3 }"></td>
						</tr>
						<tr>
							<td>* 이메일</td>
							<td><input type="text" name="email" value="${edit.email }"></td>
						</tr>
						<tr>
							<td>* 도메인</td>
							<td><input type="text" name="domain" value="${edit.domain }"></td>
						</tr>
						<tr>
							<td>* 선호지역</td>
							<td><input type="text" name="region" value="${edit.region }"></td>
							<!-- 배열로 값을 받았다면 ${addreess[0]}으로 표기하여 출력할수 있다-->
						</tr>
						<tr>
							<td>* 성별</td>
							<td><input type="text" name="gender" value="${edit.gender }"
								readonly></td>
						</tr>
						<tr>
							<td>* MBTI</td>
							<td><input type="text" name="MBTI" value="${edit.MBTI }"></td>
						</tr>
						<tr>
							<td>* 관심사</td>
							<td><input type="checkbox" name="interests"
								value="${edit.interests }"> <input type="checkbox"
								name="interests" value="액티비티" checked>액티비티&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="interests" value="게임">게임&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="interests" value="등산">등산&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="interests" value="맛집">맛집&nbsp;&nbsp;&nbsp;
								<input type="checkbox" name="interests" value="쇼핑">쇼핑&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
						<tr>
							<td>* 자기소개&nbsp;(필수 아님)</td>
							<td><input type="text" name="intro" rows="5" cols="50"
								value="${edit.intro }"></td>
						</tr>

						<!-- //type을 button으로 꼭 적어줘야! submit이 되지 않는다!! 꼭 기억하기-->
						<!-- 			<button type="button" onclick="delete();">탈퇴하기</button>  -->

					</table>
						<input type="submit" value="수정하기" />

				</form>
			</div>

<c:import url="../footer.jsp" />
</body>
</html>