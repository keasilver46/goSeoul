<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seoul trip</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<script src="./js/tripBoard2.js"></script>
<script src="./js/tripDetail.js"></script>

<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">

<!-- 날씨 -->
<script src="./js/weather.js"></script>

<style>
* {
	font-family: 'Title_Medium';
}

.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: left;
	align-items: left;
	height: 100vh;
}

.container-fluid {
	width: 1400px !important;
}

.menu {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-shadow: gray 0.1em 0.1em 0.1em;
	width: 100%;
	max-width: 1400px;
	margin: 50px auto;
}

.card-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 20px;
	margin-top: 50px;
	margin-right: 50px;
	margin-left: 50px;
	row-gap: 20px;
}

.card {
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	width: 100%;
	height: 300px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	background-size: cover;
	position: relative;
}

.card h2, .card p {
	padding: 5px;
	margin: 0;
	color: white;
	background-color: rgba(0, 0, 0, 0.3);
	font-size: 14px;
}

.page-link {
	cursor: pointer;
}

.active .page-link {
	background-color: #007bff;
	border-color: #007bff;
}
/* 로고이미지 */
.image {
	position: relative;
}

/* 로고이미지 내부 글씨 */
.image .img_text {
	position: absolute;
	bottom: 10px;
	left: 70px;
	color: #FFF;
	font-size: 80px;
}

/* 로고이미지 사이즈 조절 */
.local {
	width: 100%;
	height: 500px;
	object-fit: cover;
	object-position: left 0px bottom 80%;
	position: relative;
}
/* top 버튼 */
a#topBtn {
	position: fixed; /* 포지션 고정 */
	right: 3%; /* 오른쪽에서 2% - %도 할수 있음*/
	bottom: 5%; /* 밑에서 5px */
	display: none; /* 보여지지 없음 - 기본적으로 안보여지게 */
	z-index: 9999; /* 포지션을 먼저 지정후 z-좌표(레이어) : 9999입니다. */
}
</style>
</head>
<body onLoad="culture()">
	<c:import url="../header.jsp" />
	<div class="form-group image">
		<img class="local" id="main_img" src="images/culture.jpg">
		<div class="img_text" id="img_text">
			<span><p>문화시설</p></span>
		</div>
	</div>
	<div class="container-fluid">
		<div class="menu" align="center">

			<!-- 검색창 HTML 코드 예시 -->
			<div class="form-inline my-2 my-md-0">
				<input id="searchInput" class="form-control" type="text"
					placeholder="검색어를 입력하세요." aria-label="Search">
				<button id="searchButton" class="btn btn-outline-primary"
					type="submit">검색</button>
			</div>
		</div>

		<div class="card-container"></div>
		<a id="topBtn" href="#"><img id="topimg" src="images/arrow.png"
			style="max-width: 50px; max-height: 50px;"></a> <br>
	</div>
	<c:import url="../footer.jsp" />
</body>
</html>
