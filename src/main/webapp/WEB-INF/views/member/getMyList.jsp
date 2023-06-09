<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go Seoul</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<style>
* {
	font-family: 'Title_Medium';
	font-weight: lighter;
	witdh: 100%;
}

html, body {
	height: 100%;
}

body .wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 105px;
}

body #content {
	padding-bottom: 105px;
}

.footerBox {
	width: 100%;
	height: 105px;
	position: absolute;
	bottom: 0;
	left: 0;
}

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
	z-index: 1000;
	background: #fff;
	border-right: 1px solid rgba(0, 0, 0, .1);
	overflow-y: auto;
	min-width: 160px;
	max-width: 25% !important;
}

.bd-sidebar .nav {
	display: block;
	margin: 20px auto;
}

.bd-sidebar .nav>li>a {
	display: block;
	padding: .25rem 1.5rem;
	font-size: 120%;
}
</style>


</head>
<body>
	<div class="wrap">
		<c:import url="../header.jsp" />
		<div class="container" id="content">
			<div class="row flex-nowrap">
				<div class="col-3 bd-sidebar">
					<ul class="nav">
						<li><a href="memberInfo.do">회원정보</a></li>
						<li><a href="getMyList.do">작성글 확인</a></li>
						<li><a href="getMyReserve.do">동행예약 확인</a></li>
						<li><a href="member_delete.do">회원탈퇴</a></li>
					</ul>
					<br>
				</div>

				<main class="col-9 py-md-3 pl-md-5 bd-content" role="main">

					<h2>내가쓴 작성글</h2>
					<!-- <table class="table table-striped"> -->
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">글번호</th>
								<th scope="col">카테고리</th>
								<th scope="col">작성자</th>
								<th scope="col">글제목</th>
								<th scope="col">조회수</th>
								<th scope="col">좋아요</th>
								<th scope="col">싫어요</th>
								<th scope="col">작성시간</th>
							</tr>
						</thead>

						<c:if test="${empty list}">
							<tr>
								<td colspan="13">데이터가 없습니다</td>
							</tr>
						</c:if>
						<c:if test="${not empty list}">
							<c:forEach var="FreeBean" items="${list}">
								<tr>
									<td>${FreeBean.free_no}</td>
									<td>${FreeBean.free_category}</td>
									<td>${FreeBean.free_nick}</td>
									<td><a
										href="freeContent.do?num=${FreeBean.free_no}&pageNum=${pp.currentPage}">${FreeBean.free_title}</a></td>
									<td>${FreeBean.free_hit}</td>
									<td>${FreeBean.free_like}</td>
									<td>${FreeBean.free_dislike}</td>
									<td>${FreeBean.free_date}</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</main>
			</div>
		</div>

		<div class="footerBox">
			<c:import url="../footer.jsp" />
		</div>
	</div>
</body>

</html>