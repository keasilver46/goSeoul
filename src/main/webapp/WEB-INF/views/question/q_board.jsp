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

li {
	margin-right: 20px;
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

.nav-link {
	margin: 0 4px;
	text-align: center;
	display: inline-block;
	color: black;
}
</style>
</head>

<body>
	유저번호 : ${user.user_no} 로컬번호 : ${local.local_no}
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<form method="post" action="withWriteResult.do"
		enctype="multipart/form-data">
		<div class="container" style="width: auto; height: auto;">
			<div
				style="width: 1000px; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">

				<div class="form-group title">
					<h3 class="title">FAQ</h3>

				</div>
				<br>
				<input type="hidden" name="user_no" value="${user.user_no}">

			<div class="form-group title" color="black">
              <ul class="nav nav-tabs justify-content-center ">
                <li class="nav-item">
                  <a class="nav-link active" data-toggle="collapse" href="#list-item-1" aria-expanded="true" aria-current="page">로그인/회원정보</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="collapse" href="#list-item-2">투어예약</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="collapse" href="#list-item-3">투어취소/환불</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="collapse" href="#list-item-4">동행이용</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="collapse" href="#list-item-5">일정</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="collapse" href="#list-item-6">도시정보</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="collapse" href="#list-item-7">서비스</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" data-toggle="collapse" href="#list-item-8">기타</a>
                </li>
              </ul>
            </div>

            <!-- 아코디언 -->
            <div class="collapse" id="list-item-1">
              <div class="accordion form-group list-item-1">
                <!-- 아코디언 내용 -->

                <div class="card">
                    <div class="card-header" id="headingOne">
                      <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                          가입한 적이 없는데 이미 가입된 이메일이라고 나와요. 어떻게 하나요?
                        </button>
                      </h2>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                      <div class="card-body">
                        가입한 적이 없는데 이미 가입된 이메일이라고 나오는 경우, 다음과 같은 조치를 취할 수 있습니다.<br>
                                                  1. 비밀번호 복구 옵션을 이용하여 이메일 주소를 확인하고 비밀번호를 변경해 보세요.<br>
                                                  2. 고객 지원팀에 문의하여 이메일 주소에 대한 문제를 해결해야 할 수도 있습니다.<br>
                                                  문제가 지속되는 경우, 고객 지원팀에 문의하여 상세한 도움을 받을 수 있습니다.
                      </div>
                    </div>
                  </div>
                  <div class="card">
                    <div class="card-header" id="heading2">
                      <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                          로그인 시에 잘못된 비밀번호를 입력하면 어떻게 해야 하나요?
                        </button>
                      </h2>
                    </div>
                  </div>

                  <div class="card">
                    <div class="card-header" id="heading3">
                      <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                           회원정보를 수정하고 싶은데 어떻게 해야 하나요?
                        </button>
                      </h2>
                    </div>
                  </div>



              </div>
            </div>

            <div class="collapse" id="list-item-2">
              <div class="accordion form-group list-item-2">
                <!-- 아코디언 내용 -->
                    <div class="card">
                     <div class="card-header" id="heading4">
                       <h2 class="mb-0">
                         <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                           투어 예약을 어떻게 할 수 있나요?
                         </button>
                       </h2>
                     </div>

                     <div id="collapse5" class="collapse show" aria-labelledby="heading5" data-parent="#accordionExample">
                       <div class="card-body">
                         웹사이트 또는 앱을 통해 로그인하거나 회원가입을 진행하세요.<br>
                         메뉴에서 "투어 예약" 또는 "여행"을 선택하세요.<br>
                         원하는 투어를 찾고 투어 상세 페이지로 이동하세요.<br>
                         투어 일정, 인원 수, 날짜 등 예약에 필요한 정보를 입력하세요.<br>
                         결제 방법을 선택하고 예약을 완료하세요. 예약 확인 이메일이 발송됩니다.
                       </div>
                     </div>
                   </div>
                   <div class="card">
                     <div class="card-header" id="heading6">
                       <h2 class="mb-0">
                         <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                           로그인 시에 잘못된 비밀번호를 입력하면 어떻게 해야 하나요?
                         </button>
                       </h2>
                     </div>
                   </div>

                   <div class="card">
                     <div class="card-header" id="heading7">
                       <h2 class="mb-0">
                         <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse7" aria-expanded="false" aria-controls="collapse7">
                            회원정보를 수정하고 싶은데 어떻게 해야 하나요?
                         </button>
                       </h2>
                     </div>
                   </div>

              </div>
            </div>
            <!-- 다른 아코디언들 추가 -->


				<br>
				<div class="write-btn">
					<a href="q_form.do">
					<input type="button" class="btn btn-outline-primary write-btn1 form-control" value="서비스 일반 문의">
					</a>
				</div>

			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>

