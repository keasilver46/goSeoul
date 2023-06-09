<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/sky.css">
<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
<script src="./js/mymother.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<style>
* {
	font-family: 'Title_Medium';
}

html, body {
	height: 100%;
}

body .wrap {
	min-height: 100%;
	position: relative;
	padding-bottom: 105px;
}

.footerBox {
	width: 100%;
	height: 105px;
	position: absolute;
	bottom: 0;
	left: 0;
}
</style>
</head>
<body>
	<div class="wrap">
		<c:import url="header.jsp" />
		<div id="content">
			<div class="d-flex justify-content-center"></div>
			<section>
				<h1>
					환영합니다.<br>GO SEOUL 홈페이지 입니다.
				</h1>
			</section>

			<div class="gallerylist">
				<ul class="youtubelist">
					<li><a href="with_list.do">
							<div class="screen">
								<div class="top">동행</div>
								<div class="bottom">구하기</div>
								<img class="on" src="./images/one.gif"> <img
									src="./images/sumnail1.png">
							</div>
					</a></li>
					<li><a href="freeList.do">
							<div class="screen">
								<div class="top">여행정보</div>
								<div class="bottom">공유</div>
								<img class="on" src="./images/two.gif"> <img
									src="./images/sumnail2.png">
							</div>
					</a></li>
					<li><a href="eventList.do">
							<div class="screen">
								<div class="top">행사</div>
								<div class="bottom">리스트</div>
								<img class="on" src="./images/three.gif"> <img
									src="./images/sumnail3.png">
							</div>

					</a></li>
					<li><a href="tripBoard3_form.do">
							<div class="screen">
								<div class="top">테마</div>
								<div class="bottom">추천코스</div>
								<img class="on" src="./images/four.gif"> <img
									src="./images/sumnail4.png">
							</div>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="footerBox">
			<c:import url="footer.jsp" />
		</div>
	</div>

</body>
</html>