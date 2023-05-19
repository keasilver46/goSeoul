<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 공유 상세정보</title>

<meta name="viewport" content="width=device-width, initial-scale=1">



<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>








<!-- <link href="./css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="./js/jquery.js"></script>
<script src="./js/bootstrap.min..js"></script> -->


<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> -->
<style>
.container {
	text-align: center;
}
*{
        font-family: 'Title_Medium';
        font-weight: lighter;
        witdh: 100%;
    }

</style>



</head>
<%@include file="../header.jsp"%>

<body>
	<div class="container" align="center" style="margin-bottom: 50px">
		<h2 class="text-primary" style="margin: 50px 0">정보 공유 상세정보</h2>
		<table class="table table-bordered">
			<tr>
				<td>글번호</td>
				<td>${board.free_no}</td>
			</tr>
			<tr>
				<td>지역번호</td>
				<td>${board.local_no}</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>${board.free_title}</td>
			</tr>
			<tr>
				<td>유저번호</td>
				<td>${board.user_no}</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>${board.free_content}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${board.free_category}</td>
			</tr>
			<tr>
				<td>키워드</td>
				<td>${board.free_tag}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${board.free_hit}</td>
			</tr>
			
			
			
			
			
			<c:set var="id" value="${id }" scope="session"/>
			<c:if test="${id != null }">
			<tr>
				<td>좋아요</td>
				<td>
					<span id="add-goodRp-btn"
					class="btn btn-outline">좋아요👍
				</span>
				</td>
			</tr>
			<tr>
				<td>싫어요</td>
				<td>
					<span id="add-badRp-btn"
					class="btn btn-outline">싫어요👎 
					</span>
				</td>
			</tr>
			</c:if>
			
			
			
			
			
			<tr>
				<td>작성시간</td>
				<td><pre>${board.free_date}</pre></td>
			</tr>

		</table>
		<a href="freeList.do?pageNum=${pageNum}"
			class="btn btn-outline-primary">목록</a> <a
			href="updateForm?num=${board.free_no}&pageNum=${pageNum}"
			class="btn btn-outline-primary">수정</a> <a
			href="deleteForm?num=${board.free_no}&pageNum=${pageNum}"
			class="btn btn-outline-danger">삭제</a>

	</div>

	<script>
    document.getElementById("add-goodRp-btn").onclick = function () {
      alert("좋아요 +1");
      location.href="freeLikeUpdate.do?num=${board.free_no}&pageNum=${pageNum}";
    };
    
    document.getElementById("add-badRp-btn").onclick = function () {
        alert("싫어요 +1");
        location.href="freeDislikeUpdate.do?num=${board.free_no}&pageNum=${pageNum}";
      };
    
    
  </script>



</body>
<%@include file="../footer.jsp"%>
<footer> </footer>
</html>