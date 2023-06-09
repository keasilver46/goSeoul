<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<!-- <script src="./js/tripBoard.js"></script>
<script src="./js/tripBoard1_1.js"></script>
<script src="./js/tripDetail.js"></script>
<script src="./js/tripBoard2.js"></script>
<script src="./js/tripBoard3.js"></script> -->
<style>
header {
	font-family: 'Title_Medium';
}

.headerLogo {
	width: 150px;
	left: 30px;
	top: 36px;
	position: relative;
}

.weather {
	margin-right: 10px;
}

.navbar-nav>li {
	padding-left: 40px;
	padding-right: 40px;
}

.dropdown:hover>.dropdown-menu {
	display: block;
	margin-top: 0;
}

.dropdown-submenu {
	position: relative;
}

.dropdown-submenu>a:after {
	content: ">";
	float: right;
}

.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: 0px;
	margin-left: 0px;
	display: none;
}

.dropdown-submenu:hover>.dropdown-menu {
	display: block;
	margin-top: 0;
}

#myPage, #logout {
	display: block;
}

.dropdown-menu {
	z-index: 200000;
}
</style>
</head>
<body>
	<script>
		let sessionId = "<c:out value='${sessionScope.id}' />";

		$(function() {
			if (sessionId != "<c:out value='' />") {
				$("#myPage").css("display", "block");
				$("#logout").css("display", "block");
				$("#login").css("display", "none");
				$("#signUp").css("display", "none");

			} else {
				$("#myPage").css("display", "none");
				$("#logout").css("display", "none");
				$("#login").css("display", "block");
				$("#signUp").css("display", "block");
			}
		});
	</script>
	<header class="border-bottom">
		<div>
			<a href="main.do"> <img class="headerLogo"
				src="./images/goseoul_01.jpg">
			</a>
			<div class="d-flex"
				style="display: inline-block; margin: 0 5px; float: right;">
				<form class="form-inline my-2 my-md-0" style="margin-right: 10px;">
					<input class="form-control" type="text" placeholder="검색어를 입력하세요."
						aria-label="Search">
					<button class="btn btn-outline-primary" type="submit">검색</button>
				</form>

				<span class="weather"> <span class="weather_icon"></span> <span
					class="weather_temp"></span>
				</span>

				<ul class="nav">
					<li class="nav-item"><a href="memberInfo.do" id="myPage"
						class="nav-link text-dark">마이페이지</a></li>
					<li class="nav-item"><a href="MemberLogin.do" id="login"
						class="nav-link text-dark">로그인</a></li>
					<li class="nav-item"><a href="member_form.do" id="signUp"
						class="nav-link text-dark">회원가입</a></li>
					<li class="nav-item"><a href="logout.do" id="logout"
						class="nav-link text-dark">로그아웃</a></li>
				</ul>
			</div>


			<div class="my-2">
				<nav class="navbar navbar-expand-lg">
					<div class="container-fluid">
						<div class="navbar-collapse justify-content-center"
							id="navbarSupportedContent">
							<ul class="navbar-nav">
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle text-dark" href="#"
									role="button" aria-expanded="false"> 같이서울 </a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="with_list.do">동행구하기</a></li>
										<li><a class="dropdown-item" href="freeList.do">여행정보공유</a></li>
									</ul></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle text-dark" href="#"
									role="button" aria-expanded="false"> 해봤서울 </a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="event.do">행사캘린더</a></li>
										<li><a class="dropdown-item" href="eventList.do">행사리스트</a></li>
									</ul></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle text-dark" href="#"
									role="button" aria-expanded="false"> 가봤서울 </a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="tripBoard3_form.do">테마추천코스</a></li>
										<li class="nav-item dropdown-submenu"><a
											class="dropdown-item" href="tripBoard2_form.do" role="button"
											aria-expanded="false"> 종류별 </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="travel_board.do">관광지</a></li>
												<li><a class="dropdown-item" href="culture_board.do">문화시설</a></li>
												<li><a class="dropdown-item" href="leisure_board.do">레포츠</a></li>
												<li><a class="dropdown-item" href="hotel_board.do">숙박시설</a></li>
												<li><a class="dropdown-item" href="shopping_board.do">쇼핑</a></li>
												<li><a class="dropdown-item" href="restaurant_board.do">음식점</a></li>
											</ul></li>
										<li class="dropdown-submenu"><a class="dropdown-item"
											href="tripBoard_form.do"> 지역별 </a>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item" href="gangnam_board.do">강남구</a></li>
												<li><a class="dropdown-item" href="#">관악구</a></li>
												<li><a class="dropdown-item" href="#">동대문구</a></li>
												<li><a class="dropdown-item" href="mapo_board.do">마포구</a></li>
												<li><a class="dropdown-item" href="#">서대문구</a></li>
												<li><a class="dropdown-item" href="#">서초구</a></li>
												<li><a class="dropdown-item" href="yungdeung_board.do">영등포구</a></li>
												<li><a class="dropdown-item" href="#">용산구</a></li>
												<li><a class="dropdown-item" href="eunpeong_board.do">은평구</a></li>
												<li><a class="dropdown-item" href="jongro_board.do">종로구</a></li>
											</ul></li>
									</ul></li>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle text-dark" href="#"
									role="button" aria-expanded="false"> 정보서울 </a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item"
											href="https://www.seoulcitybus.com">서울시티투어버스</a></li>
										<li><a class="dropdown-item" href="q_notice.do">공지사항</a></li>
										<li><a class="dropdown-item" href="q_board.do">FAQ</a></li>
										<li><a class="dropdown-item" href="q_privacy.do">개인정보처리방침</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</header>
</body>
</html>