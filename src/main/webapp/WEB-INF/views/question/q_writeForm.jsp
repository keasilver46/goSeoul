<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FAQ</title>
<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

<!-- External CSS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js">
</script>

<style>
* {
	font-family: 'Title_Medium';
}

label {
	font-weight: bold;
}

ul {
	list-style-type: '#';
	padding-inline-start: 1ch;
}

li {
	float: left;
	margin-right: 25px;
}

.write-btn {
	text-align: center;
}

.write-btn1 {
	display: inline-block;
}

.title {
	text-align: center;
}

.q_category {
	margin: 0 7px;
	text-align: center;
}
</style>
</head>

<body>
    유저번호 : ${user.user_no}
    로컬번호 : ${local.local_no}
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form method="post" action="withWriteResult.do" enctype="multipart/form-data">
		<div class="container" style="width: auto; height: auto;">
			<div style="width: 1000px; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">

            <div class="form-group title">
	        <h4 class="title">FAQ</h4>
	        </div>
				<input type="hidden" name="user_no" value="${user.user_no}">

				<div class="form-group row">
					<label for="gender" class="col-sm-2 col-form-label">자주묻는 질문</label>

					<!--<div class="col-sm-10">-->
					 <ul class="nav nav-tabs">
                       <li class="nav-item">
                         <a class="nav-link active" aria-current="page" href="#">로그인 관련</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link" href="#">회원 정보</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link" href="#">투어 예약</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link disabled">투어 취소 및 환불</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link disabled">동행 이용</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link disabled">서비스</a>
                       </li>
                       <li class="nav-item">
                         <a class="nav-link disabled">기타</a>
                       </li>
                     </ul>

<!--
						<input type="button" name="q_category" class="btn btn-outline-primary" value="전체">
						<input type="button" name="q_category" class="btn btn-outline-primary" value="로그인">
						<input type="button" name="q_category" class="btn btn-outline-primary" value="회원 정보">
						<input type="button" name="q_category" class="btn btn-outline-primary" value="투어 예약">
						<input type="button" name="q_category" class="btn btn-outline-primary" value="투어 취소 및 환불">
						<input type="button" name="q_category" class="btn btn-outline-primary" value="동행 이용">
						<input type="button" name="q_category" class="btn btn-outline-primary" value="서비스">
						<input type="button" name="q_category" class="btn btn-outline-primary" value="기타">
					</div>-->



				</div>
				<br>
				<div class="write-btn">
					<input type="button" class="btn btn-outline-primary write-btn1 form-control" value="서비스 일반 문의">
				</div>

                </div>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>

