<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
 integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
 integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
 
 <script src="./js/tripDetail.js"></script>
 
 <title>여행 상세내용</title>

<!-- 날씨 -->
<script src="./js/weather.js"></script>

<style>

	 @font-face {
	    font-family: 'Title_Medium';
	    src: url('fonts/Title_Medium.woff') format('woff');
	}
	*{
	font-family: 'Title_Medium';
	

#div {
  display: flex;
  justify-content: center;
  align-items: center;
}

#wrap{
 margin: 0 auto;
 max-width:800px;
 }
 
#title {
	font-size: 34px;
	font-weight: bold;
	position: static;
	text-align:center;
	margin: 0 auto;
	bottom: 20px;
}
#thumb {
	text-align: center;
	margin: 0;
	width: 100%;
}
#overview{
	text-align: center;
	margin: 0 auto;
	max-width: 800px;
}
#map {
	position: static;
	top: 10px;
	margin: 0 auto;
	width: 100%;
}

</style>
  <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=	8968d8e89aaef36c89ab8e913a241a26"></script>
 </head>
<body>
	<c:import url="../header.jsp"/>
<br>
<div class="wrap">
<br>
			<div id="title"></div><br><br><br>	<!-- 여행지명 -->
	<div class="container-fluid">
			<div id="thumb"></div><br>		<!-- 여행지이미지 -->	
			<div id="overview"></div><br>	<!-- 상세설명 -->
			<div style="text-align:center;"><br>
			<div id="website"></div><br>	<!-- 홈페이지url -->
			</div>
			<div id="map" style="max-width:800px; width:800px; height:400px;"></div> <!-- mapx,mapy -->
				<div style="text-align:center;"><br>
					<div id="address"></div>	<!-- addr1 -->
					<div id="contact"></div><br>	<!-- tel,telname -->
				</div>
		</div>
	</div>
	<c:import url="../footer.jsp"/>
</body>