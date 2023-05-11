<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>동행 구하기</title>
<!-- External CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
     integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<style>
</style>
</head>

<body>
<form method="post" action="withWriteResult.do">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">동행 구하기</h4>
<!--
				<input type="hidden" name="with_no" value="${with_no}">
				<input type="hidden" name="with_tag" value="${with_tag}">
				<input type="hidden" name="with_hit" value="${with_hit}">
				<input type="hidden" name="with_category" value="${with_category}">
				<input type="hidden" name="with_filepath" value="${with_filepath}">
-->

				<div class="mb-3">
					<input type="text" class="form-control" autofocus="autofocus" id="with_title" name="with_title"
						placeholder="ex) 5월 11일 경복궁 관람할 동행 3명 구해요.">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="gender">성별</label>
						<input type="text" class="form-control" id="gender" name="gender">
					</div>
					<div class="form-group col-md-6">
						<label for="with_age">나이</label>
						<input type="text" class="form-control" id="with_age" name="with_age">
					</div>
				</div>
				<div class="form-group">
					<label for="local_no">지역</label>
					<input type="text" class="form-control" id="local_no" name="local_no">
				</div>
				<div class="form-group">
					<label for="with_maxto">모집 인원</label>
					<input type="text" class="form-control" id="with_maxto" name="with_maxto">
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="with_start">시작일</label>
						<input type="date" class="form-control" name="with_start" id="with_start" required>
					</div>
					<div class="form-group col-md-6">
						<label for="with_end">종료일</label>
						<input type="date" class="form-control" name="with_end" id="with_end" required>
					</div>
				</div>
				<div class="form-group">
					<label for="with_content">상세 설명</label>
						<textarea id="with_content" name="with_content" class="form-control" rows="10" cols="50"
							placeholder="1. 현재 동행이 있나요?&#13;&#10;ex) 네. 동행 3명 있습니다.&#13;&#10&#13;&#10;&#13;&#10;2. 어떤 동행을 찾고 있나요?&#13;&#10;ex) 전시회 관람을 좋아하는 30대 동행을 찾습니다!&#13;&#10;&#13;&#10;&#13;&#10;3. 원하는 여행 코스를 적어주세요.&#13;&#10;"></textarea>
					</div>
				<div class="form-group">
					<label for="with_filename">첨부 파일</label>
					<input type="text" class="form-control" id="with_filename" name="with_filename1">
					</div>

					<br>
					<div class="mx-auto text-center">
						<button class="btn btn-primary" type="submit" onClick="location.href='withWriteResult.jsp'">작성</button>
						<button class="btn btn-primary" type="reset">취소</button>
					</div>
			</div>
		</div>

		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; 2023_goSeoul.team</p>
		</footer>
		</form>
</body>
</html>