<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행정보 공유</title>
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

label {
	font-weight: bold;
}

.warning {
	color: red;
	text-align: center;
}

.write-btn {
	text-align: center;
}

.write-btn1 {
	display: inline-block;
}
</style>

</head>

<body>
	<div class="wrap">
		<c:import url="../header.jsp" />
		<br>
		<h4 class="mb-3" align="center">여행정보 삭제</h4>
		<form method="post" action="freeDeleteResult.do">
			<div class="container" style="width: auto; height: auto;">
				<div
					style="width: 100%; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">
					<input type="hidden" name="free_no" value="${freeBean.free_no}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<div class="warning">
						<h5>해당 글과 작성된 댓글이 모두 삭제됩니다. 삭제하시겠습니까?</h5>
					</div>
					<br>
					<div class="write-btn">
						<button type="submit" class="btn btn-outline-primary write-btn1">네</button>
						<a
							href="freeContent.do?num=${freeBean.free_no}&pageNum=${pageNum}"
							class="btn btn-outline-secondary write-btn1">아니요</a>
					</div>

				</div>
			</div>
		</form>
		<div class="footerBox">
			<c:import url="../footer.jsp" />
		</div>
	</div>
</body>
</html>
