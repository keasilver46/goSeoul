<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>동행 구하기</title>
<!-- External CSS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>

<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form method="post" action="withWriteResult.do">
		<h4 class="mb-3">동행 구하기</h4>

		<div>
			<input type="text" id="with_title" name="with_title"
				placeholder="ex) 5월 11일 경복궁 관람할 동행 3명 구해요.">
		</div>

		<div>
			<div class="mb-3 row">
				<label for="gender" >성별</label>
				<input type="text" id="gender" name="gender" >

				<label for="with_age">나이</label>
				<input type="text" id="with_age" name="with_age">
			</div>
		</div>

		<div>
			<label for="local_no">지역</label>
			<input type="text" id="local_no" name="local_no">
		</div>

		<div>
<label for="customRange2" class="form-label">모집 인원</label>
<input type="range" class="form-range" min="0" max="8" id="with_maxto" name="with_maxto">
		</div>

			<div>
				<label for="with_date">날짜 선택</label>
				<input type="date" name="with_start" id="with_start">-
				<input type="date" name="with_end"
					id="with_end">
			</div>

		<div>
			<label for="with_content">상세 설명</label>
			<textarea id="with_content" name="with_content" rows="10" cols="50"
				placeholder="1. 현재 동행이 있나요?&#13;&#10;ex) 네. 동행 3명 있습니다.&#13;&#10&#13;&#10;&#13;&#10;2. 어떤 동행을 찾고 있나요?&#13;&#10;ex) 전시회 관람을 좋아하는 30대 동행을 찾습니다!&#13;&#10;&#13;&#10;&#13;&#10;3. 원하는 여행 코스를 적어주세요.&#13;&#10;"></textarea>
		</div>

<div class="mb-3">
  <label for="with_filename" class="form-label">첨부 파일</label>
  <input class="form-control" type="file" id="with_filename" name="with_filename">
</div>

		<br>
		<div>
			<button type="submit">작성</button>
			<button type="reset">취소</button>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>