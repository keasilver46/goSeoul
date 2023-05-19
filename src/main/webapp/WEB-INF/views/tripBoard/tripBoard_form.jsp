<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seoul trip</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" 
     integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" 
     integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
     <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700&display=swap" rel="stylesheet">
    
    <script src="./js/tripBoard.js"></script>
    <script src="./js/tripBoard1_1.js"></script>
    <script src="./js/tripDetail.js"></script>

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
	
	.menu {
		display: flex;
		flex-direction: column;
		align-items: left;
		text-shadow: gray 0.1em 0.1em 0.1em;
		width: 100%;
		max-width: 1400px;
		margin: 0 auto;
	}
	
	.card-container {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		gap: 20px;
		margin-top: 50px;
		row-gap: 20px;
	}
	
	.card {
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
		width: 100%;
		height: 400px;
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
	
	</style>
</head>
<body>	
	<div class="container-fluid">
		<div class="menu">
			<div id="trip_button">
				<button type="button" class="btn btn-outline-primary" onClick="location.href='tripBoard2_form.do'">종류별 게시판</button>
				<button type="button" class="btn btn-outline-primary" onClick="location.href='tripBoard3_form.do'">여행코스 게시판</button>
				<button type="button" class="btn btn-outline-primary" id="all1" onClick="all1()"> 서울 전체 여행지 </button>
				<button type="button" class="btn btn-outline-primary" id="gangnam" onClick="gangnam()"> 강남구 </button>
				<button type="button" class="btn btn-outline-primary" id="gangdong" onClick="gangdong()"> 강동구 </button>
				<button type="button" class="btn btn-outline-primary" id="gangbook" onClick="gangbook()"> 강북구 </button>
				<button type="button" class="btn btn-outline-primary" id="gangseo" onClick="gangseo()"> 강서구 </button>
				<button type="button" class="btn btn-outline-primary" id="gwanak" onClick="gwanak()"> 관악구 </button>
				<button type="button" class="btn btn-outline-primary" id="gwangjin" onClick="gwangjin()"> 광진구 </button>
				<button type="button" class="btn btn-outline-primary" id="guro" onClick="guro()"> 구로구 </button>
				<button type="button" class="btn btn-outline-primary" id="geumchon" onClick="geumcheon()"> 금천구 </button>
				<button type="button" class="btn btn-outline-primary" id="nowon" onClick="nowon()"> 노원구 </button>
				<button type="button" class="btn btn-outline-primary" id="dobong" onClick="dobong()"> 도봉구 </button>
				<button type="button" class="btn btn-outline-primary" id="dongdaemun" onClick="dongdaemun()"> 동대문구 </button>
				<button type="button" class="btn btn-outline-primary" id="dongjak" onClick="dongjak()"> 동작구 </button>
				<button type="button" class="btn btn-outline-primary" id="mapo" onClick="mapo()"> 마포구 </button>
				<button type="button" class="btn btn-outline-primary" id="seodaemun" onClick="seodaemun()"> 서대문구 </button>
				<button type="button" class="btn btn-outline-primary" id="seocho" onClick="seocho()"> 서초구 </button>
				<button type="button" class="btn btn-outline-primary" id="sungdong" onClick="sungdong()"> 성동구 </button>
				<button type="button" class="btn btn-outline-primary" id="sungbuk" onClick="sungbuk()"> 성북구 </button>
				<button type="button" class="btn btn-outline-primary" id="songpa" onClick="songpa()"> 송파구 </button>
				<button type="button" class="btn btn-outline-primary" id="yangcheon" onClick="yangcheon()"> 양천구 </button>
				<button type="button" class="btn btn-outline-primary" id="yongdeung" onClick="yongdeung()"> 영등포구 </button>
				<button type="button" class="btn btn-outline-primary" id="yongsan" onClick="yongsan()"> 용산구 </button>
				<button type="button" class="btn btn-outline-primary" id="eunpeung" onClick="eunpeung()"> 은평구 </button>
				<button type="button" class="btn btn-outline-primary" id="jongro" onClick="jongro()"> 종로구 </button>
				<button type="button" class="btn btn-outline-primary" id="joong" onClick="joong()"> 중구 </button>
				<button type="button" class="btn btn-outline-primary" id="joonglang" onClick="joonglang()"> 중랑구 </button>
			</div>
			<div id="trip_check">
				<a href="javascript:" id="culture_id" onclick="culture1()">문화시설</a> &nbsp; || &nbsp;
				<a href="javascript:" id="leisusre_id" onclick="leisure1()">레포츠</a> &nbsp; || &nbsp;
				<a href="javascript:" id="hotel_id" onclick="hotel1()">숙박시설</a> &nbsp; || &nbsp;
				<a href="javascript:" id="shopping_id" onclick="shopping1()">쇼핑</a> &nbsp; || &nbsp;
				<a href="javascript:" id="restaurant_id" onclick="restaurant1()">음식점</a>
			</div>
		
			<!-- 검색창 HTML 코드 예시 -->
			<div class="search-container">
				<label for="searchInput">여행지명 검색</label>
	  			<input id="searchInput" type="text" placeholder="여행지 검색...">
	  			<button type="submit" id="searchButton">검색</button>
			</div>
		</div>	<!-- div class= menu 끝 -->
		
			<div class="card-container">
			</div>	<!-- card 정보 들어갈 곳  -->
			<br>
			<div class="d-flex justify-content-center">
				<nav aria-label="Page navigation example">
					 <ul id="paging" class="pagination">
					 </ul>
				</nav>
			</div>	<!-- 페이지네이션 -->
	</div>
</body>
</html>
