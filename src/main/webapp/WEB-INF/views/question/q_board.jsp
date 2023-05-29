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
<script>
// 로고 이미지 처리
	$(function() {
		// 탭 메뉴 클릭 이벤트 처리
		$('.nav-link').on('click', function(e) {
			e.preventDefault();
			var target = $(this).attr('href'); // 클릭한 탭 메뉴의 href 속성값 (아코디언의 id와 동일)
			$(target).collapse('show'); // 클릭한 탭 메뉴에 해당하는 아코디언 확장

			// 다른 아코디언은 닫기
			$('.collapse').not(target).collapse('hide');
		});
	});
</script>
<style>

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

/* 네비게이션 바 */
.nav-link {
	margin: 0 4px;
	text-align: center;
	display: inline-block;
	color: black;
}

.btn {
	margin: 0 4px;
	text-align: center;
	display: inline-block;
	color: black;
}

.collapse {
line-height:20px
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
				<br> <input type="hidden" name="user_no"
					value="${user.user_no}">

				<div class="form-group title" color="black">
					<ul class="nav nav-tabs justify-content-center ">
						<li class="nav-item"><a class="nav-link active"
							href="#list-item-1"><b>로그인/회원정보</b></a></li>
						<li class="nav-item"><a class="nav-link" href="#list-item-4"><b>동행이용</b></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#list-item-2"><b>투어예약</b></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#list-item-3"><b>투어취소/환불</b></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#list-item-5"><b>일정</b></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#list-item-6"><b>도시정보</b></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#list-item-7"><b>서비스</b></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#list-item-8"><b>기타</b></a>
						</li>
					</ul>
				</div>

				<div class="collapse-content">
				    <!-- 로그인/회원정보 -->
					<div class="collapse show" id="list-item-1">
                        <div class="card-header" id="headingOne">
                        <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne"
                        aria-expanded="false" aria-controls="collapseOne"><b>가입한 적이 없는데 이미 가입된 이메일이라고 나와요. 어떻게 하나요?</b></button>
                    </h2>
                    </div>
                       <div id="collapseOne" class="collapse"
                       aria-labelledby="headingOne" data-parent=".collapse-content">
                       <br>
                       가입한 적이 없는데 이미 가입된 이메일이라고 나오는 경우, 다음과 같은 조치를 취할 수 있습니다.
                       <br><br>
                       1. 비밀번호 복구 옵션을 이용하여 이메일 주소를 확인하고 비밀번호를 변경해 보세요.<br>
                       2. 고객지원팀에 문의하여 이메일 주소에 대한 문제를 해결해야 할 수도 있습니다.<br><br> 문제가 지속되는 경우, 고객
                        지원팀에 문의하여 상세한 도움을 받을 수 있습니다.
                        <br><br>
                        </div>
						<div class="card-header" id="heading2">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapse2"
									aria-expanded="false" aria-controls="collapse2"><b>회원가입을 하지 않고도 로그인할 수 있나요?</b></button>
							</h2>
						</div>
						<div id="collapse2" class="collapse"
							aria-labelledby="heading2" data-parent=".collapse-content">
							<br>
							대부분의 경우, 회원 가입을 하지 않고 로그인할 수 있는 방법은 제공되지 않습니다. <br><br>
							로그인은 회원으로 등록된 사용자만 가능합니다. <br><br>회원 가입을 통해 계정을 생성한 후에 로그인할 수 있습니다.<br><br>
						</div>
						<div class="card-header" id="heading3">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapse3"
									aria-expanded="false" aria-controls="collapse3"><b>회원정보
									변경이나 기타 문의 사항은 어떻게 해야 하나요?</b></button>
							</h2>
						</div>
						<div id="collapse3" class="collapse"
							aria-labelledby="heading3" data-parent=".collapse-content">
							<br>
							로그인 후, 마이 페이지 또는 회원 정보 관리 메뉴에서 회원 정보 수정을 할 수 있습니다. <br><br>
							해당 페이지에서 필요한 정보를 수정하고 저장 버튼을 클릭하면 정보가 업데이트됩니다.<br><br>
						</div>

						<div class="card-header" id="heading6">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapse6"
									aria-expanded="false" aria-controls="collapse6"><b>회원가입은
									어떻게 진행하나요?</b></button>
							</h2>
						</div>
						<div id="collapse6" class="collapse"
							aria-labelledby="heading6" data-parent=".collapse-content">
							<br>
                            홈페이지 우측 상단에 있는 "회원 가입" 버튼을 클릭하여 가입 페이지로 이동합니다. <br><br>
                            필요한 정보를 입력한 후, 가입 절차를 완료하면 회원으로 가입됩니다.<br><br>
						</div>
						<div class="card-header" id="heading66">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapse66"
									aria-expanded="false" aria-controls="collapse66"><b>소셜 미디어 계정으로 로그인할 수 있나요?</b></button>
							</h2>
						</div>
						<div id="collapse66" class="collapse"
							aria-labelledby="heading66" data-parent=".collapse-content">
							<br>
                            일부 웹사이트에서는 카카오톡 등의 소셜 미디어 계정으로 로그인할 수 있는 기능을 제공합니다. <br><br>
                            로그인 페이지에서 해당 소셜 미디어 아이콘을 클릭하여 소셜 미디어 계정으로 로그인할 수 있습니다.<br><br>
						</div>
					</div>

					<!-- 투어 예약 -->
					<div class="collapse" id="list-item-2">
						<div class="card-header" id="heading4">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapse4"
									aria-expanded="false" aria-controls="collapse4"><b>투어 예약을 어떻게 할 수 있나요?</b></button>
							</h2>
						</div>
						<div id="collapse4" class="collapse show"
							aria-labelledby="heading4" data-parent=".collapse-content">
							<br>
							웹사이트를 통해 로그인하거나 회원가입을 진행하세요.<br> 메뉴에서 서울시티투어버스를
							선택하세요.<br><br> 원하는 투어를 찾고 투어 상세 페이지로 이동하세요.<br><br>
							투어 일정, 인원 수, 날짜 등 예약에 필요한 정보를 입력하세요.<br><br>
						</div>
						<div class="card-header" id="heading5">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapse5"
									aria-expanded="false" aria-controls="collapse5"><b>투어 예약을
									변경하거나 취소하려면 어떻게 해야 하나요?</b></button>
							</h2>
						</div>
						<div id="collapse5" class="collapse show"
							aria-labelledby="heading5" data-parent=".collapse-content">
							<br>
							예약 변경 또는 취소를 원할 경우, 고객센터에 문의하거나 마이 페이지 또는 예약 관리 메뉴에서 예약을 찾아 변경 또는 취소할 수 있는 기능을 이용합니다.<br><br>
							정책에 따라 변경 및 취소 가능한 시간과 수수료가 적용될 수 있습니다.<br><br>
						</div>
						<div class="card-header" id="heading55">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button"
									data-toggle="collapse" data-target="#collapse55"
									aria-expanded="false" aria-controls="collapse55"><b>투어 예약 확인은 어떻게 할 수 있나요?</b></button>
							</h2>
						</div>
						<div id="collapse55" class="collapse show"
							aria-labelledby="heading55" data-parent=".collapse-content">
							<br>
							예약이 완료되면 이메일 또는 앱 알림을 통해 예약 확인 메시지를 받게 됩니다. <br><br>
							또는 마이 페이지 또는 예약 관리 메뉴에서 예약 상세 정보를 확인할 수 있습니다.<br><br>
						</div>
						<div class="card-header" id="heading555">
							<h2 class="mb-0">
								<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse555"
									aria-expanded="false" aria-controls="collapse555"><b>투어 예약 시 필요한 정보는 무엇인가요?</b></button>
							</h2>
						</div>
						<div id="collapse555" class="collapse show" aria-labelledby="heading555" data-parent=".collapse-content">
							<br>
							일반적으로 투어 예약 시에는 예약자의 이름, 연락처, 이메일 주소 등의 정보가 필요합니다. <br><br>
							추가적으로 인원 수, 특별 요청사항 등을 입력해야 할 수 있습니다.<br><br>
						</div>
					</div>

                    <!-- 동행 이용 -->
					<div class="collapse" id="list-item-4">
                    <div class="card-header" id="heading111">
                         <h2 class="mb-0">
                         <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse111"
                          aria-expanded="false" aria-controls="collapse111"><b>동행 이용은 어떻게 할 수 있나요?</b></button>
                          </h2>
                    </div>
                    <div id="collapse111" class="collapse"
                          aria-labelledby="heading111" data-parent=".collapse-content">
                          <br>
                          동행 이용은 홈페이지를 통해 제공됩니다. <br><br>
                          원하는 동행 서비스를 선택하고, 필요한 정보와 조건을 입력한 후, 검색 또는 조회를 통해 이용 가능한 동행을 찾을 수 있습니다. <br><br>
                          선택한 동행과 연락하여 상세 일정과 가격, 이용 조건을 협의한 후 이용을 진행합니다.<br><br>
                    </div>
                    <div class="card-header" id="heading222">
                         <h2 class="mb-0">
                         <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse222"
                          aria-expanded="false" aria-controls="collapse222"><b>동행 이용을 위해 필요한 정보는 무엇인가요?</b></button>
                          </h2>
                    </div>
                    <div id="collapse222" class="collapse"
                          aria-labelledby="heading222" data-parent=".collapse-content">
                         <br>
                          동행 이용을 위해 필요한 정보는 개인 프로필, 이용 가능한 날짜 및 시간, 선호하는 활동 또는 관심사, 이용 요구사항 등이 포함될 수 있습니다. <br><br>
                          이 정보를 제공하여 동행 서비스를 찾을 때 필요한 조건을 정확하게 전달할 수 있습니다.<br><br>
                    </div>
                    <div class="card-header" id="heading333">
                         <h2 class="mb-0">
                         <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse333"
                          aria-expanded="false" aria-controls="collapse333"><b>동행 이용 시 안전을 어떻게 보장받을 수 있나요?</b></button>
                          </h2>
                    </div>
                    <div id="collapse333" class="collapse"
                          aria-labelledby="heading333" data-parent=".collapse-content">
                          <br>
                          동행 이용 시 안전을 보장받기 위해서는 신뢰할 수 있는 동행자와의 매칭이 중요합니다. <br><br>
                          동행 서비스 제공 업체는 동행자의 신원 확인, 이용자 리뷰 및 평가, 안전 수칙 및 가이드 제공 등을 통해 안전한 동행을 지원하고 있습니다. <br><br>
                          또한 이용자 자체적으로도 사전 조사와 신중한 선택을 통해 안전을 보장받을 수 있습니다.<br><br>
                    </div>
                    <div class="card-header" id="heading444">
                         <h2 class="mb-0">
                         <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse444"
                          aria-expanded="false" aria-controls="collapse444"><b>동행 이용에 대한 리뷰나 평가를 어떻게 남길 수 있나요?</b></button>
                          </h2>
                    </div>
                    <div id="collapse444" class="collapse"
                          aria-labelledby="heading444" data-parent=".collapse-content">
                          <br>
                          동행 이용 후 이용자는 동행 서비스 제공 업체의 플랫폼이나 웹사이트를 통해 동행자에 대한 리뷰나 평가를 남길 수 있습니다. <br><br>
                          이를 통해 이용자들끼리의 경험 공유와 동행자의 신뢰도 평가가 가능합니다. <br><br>
                          리뷰와 평가는 다른 이용자들에게 도움을 주는 중요한 정보가 될 수 있습니다.<br><br>
                    </div>

				</div>
				</div>
				<br>
				<div class="write-btn">
					<a href="q_form.do"> <input type="button"
						class="btn btn-outline-primary write-btn1 form-control"
						value="서비스 일반 문의">
					</a>
				</div>

			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>

