<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
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

#noticeList {
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
	line-height: 20px
}
</style>
</head>

<body>
	<div class="wrap">
		<c:import url="../header.jsp" />
		<div id="content">
			<form method="post" action="withWriteResult.do"
				enctype="multipart/form-data">
				<div class="container">
					<div
						style="margin: 50px auto; background-color: white; border-radius: 10px;">

						<div class="form-group title">
							<h3 class="title">공지사항</h3>
						</div>
						<br> <input type="hidden" name="user_no"
							value="${user.user_no}">

						<div class="form-group title" color="black">
							<ul class="nav nav-tabs justify-content-center ">
								<li class="nav-item" id="noticeList"><a
									class="nav-link active" href="#list-item-1"><b>동행안내</b></a></li>
								<li class="nav-item" id="noticeList"><a class="nav-link"
									href="#list-item-4"><b>서비스</b></a></li>
								<li class="nav-item" id="noticeList"><a class="nav-link"
									href="#list-item-2"><b>업데이트</b></a></li>
								<li class="nav-item" id="noticeList"><a class="nav-link"
									href="#list-item-3"><b>투어취소/환불</b></a></li>
								<li class="nav-item" id="noticeList"><a class="nav-link"
									href="#list-item-5"><b>일정</b></a></li>
								<li class="nav-item" id="noticeList"><a class="nav-link"
									href="#list-item-6"><b>도시정보</b></a></li>
								<li class="nav-item" id="noticeList"><a class="nav-link"
									href="#list-item-7"><b>서비스</b></a></li>
								<li class="nav-item" id="noticeList"><a class="nav-link"
									href="#list-item-8"><b>기타</b></a></li>
							</ul>
						</div>


						<div class="collapse-content">
							<!-- 로그인/회원정보 -->
							<div class="collapse show" id="list-item-1">
								<div class="card-header" id="headingOne">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapseOne1"
											aria-expanded="false" aria-controls="collapseOne1">
											<b>[공지] 서울 여행 동행 구하는 안내</b>
										</button>
									</h2>
								</div>
								<div id="collapseOne1" class="collapse"
									aria-labelledby="headingOne1" data-parent=".collapse-content"
									style="padding: 20px;">
									<br> 안녕하세요, 서울 여행에 관심 있는 분들을 위해 동행을 구하는 공지사항입니다. 함께 여행을 즐길
									분을 찾고 계시다면 이 글을 확인해주세요!<br> <br> 서울은 다양한 관광지와 매력적인
									문화, 음식 등으로 유명한 도시입니다. 이번 여행에서 함께 동행할 파트너를 찾고자 합니다. 아래는 동행을 구하는
									조건과 연락처 정보입니다.<br> <br> 1. 여행 일정: 6월 10일부터 6월 15일까지
									(5박 6일)<br> 2. 여행 목적지: 서울 시내 주요 관광지 및 음식 체험 등<br> 3.
									동행 조건: 20대 후반~30대 초반, 외국인 친구를 만나고 싶은 분, 서울에 관심이 있는 분<br>
									4. 동행 인원: 2~4명<br> <br> 만약 위 조건에 해당되고 관심이 있으신 분은 아래
									연락처로 연락 주시기 바랍니다.<br> <br> 이름: 홍길동<br> 연락처:
									010-1234-5678<br> 이메일: honggildong@example.com<br> <br>
									많은 분들의 참여를 기다립니다. 함께 멋진 서울 여행을 즐겨봅시다!<br> <br> 감사합니다.<br>
									서울 여행 동행 구하는 팀 <br> <br>
								</div>
								<div class="card-header" id="headingOne">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapseOne"
											aria-expanded="false" aria-controls="collapseOne">
											<b>[공지] 서울 여행 안내 및 관련 업데이트</b>
										</button>
									</h2>
								</div>
								<div id="collapseOne" class="collapse"
									aria-labelledby="headingOne" data-parent=".collapse-content"
									style="padding: 20px;">
									<br> 안녕하세요, 여러분!<br> <br> 저희 서비스에서는 서울 여행과 관련된
									다양한 소식과 업데이트를 안내드리고자 합니다. 아래는 최신 정보를 제공해드리니 참고해주시기 바랍니다.<br>
									<br> 1. 서울 여행 안내<br> 서울은 역사와 문화, 맛집, 쇼핑 등 다양한 매력을 가진
									도시입니다. 여행객들을 위해 추천 관광지와 유용한 정보를 제공하고 있습니다. 자세한 내용은 저희 웹사이트의 '서울
									여행' 페이지를 확인해주세요.<br> <br> 2. 이벤트 안내<br> 현재 진행 중인
									서울 여행 관련 이벤트를 소개합니다. 이벤트 기간, 참여 방법, 상금 등에 대한 자세한 내용은 저희 웹사이트의
									'이벤트' 페이지에서 확인하실 수 있습니다.<br> <br> 3. 서울 관광 패키지 특가<br>
									서울 여행객들을 위해 저희 서비스에서는 특별 서울 관광 패키지를 제공하고 있습니다. 다양한 코스와 할인 혜택을
									만나보세요. 패키지 예약은 저희 웹사이트 또는 모바일 앱에서 가능합니다.<br> <br> 4.
									코로나19 관련 안내<br> 현재 코로나19로 인해 여행에 제한이 있을 수 있습니다. 서울 여행 시
									참고할 수 있는 방역 지침과 관련된 최신 정보를 저희 웹사이트에서 확인해주세요. 여행 전에는 여행 목적지와 관련된
									국가 및 지역의 여행 제한 조치를 확인하는 것이 중요합니다.<br> <br> 5. 문의 사항<br>
									추가적인 문의나 도움이 필요한 사항이 있으시면 언제든지 저희 고객 서비스 센터로 연락해주시기 바랍니다. 친절한
									상담원들이 항상 여러분을 도와드리겠습니다.<br> <br> 서울 여행을 계획하시는 분들께 유용한
									정보와 다양한 혜택을 제공하기 위해 더욱 노력하겠습니다. 감사합니다!<br> <br>
								</div>
								<div class="card-header" id="heading2">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapse2"
											aria-expanded="false" aria-controls="collapse2">
											<b>[공지] 서울 여행 안전 수칙 안내</b>
										</button>
									</h2>
								</div>
								<div id="collapse2" class="collapse" aria-labelledby="heading2"
									data-parent=".collapse-content" style="padding: 20px;">
									<br> 안녕하세요, 여러분!<br> <br> 저희 서비스에서는 서울 여행객들의 안전을
									최우선으로 생각하고 있습니다. 서울 여행 시 반드시 지켜야 할 안전 수칙을 안내드리고자 합니다. 아래 내용을 꼭
									확인하시기 바랍니다.<br> <br> 1. 개인 보안 유의<br> 소중한 개인
									물품(지갑, 핸드폰, 가방 등)은 항상 감시하고 보호하세요. 사람 많은 관광지나 대중교통 이용 시 특히 주의가
									필요합니다. 가방은 언제나 몸에 가까이 착용하고, 가치있는 물품은 가시적으로 보이지 않도록 하세요.<br>
									<br> 2. 길 안내와 지도 이용<br> 서울 여행 시 길을 잃거나 혼란스러울 수 있습니다.
									항상 지도를 손에 쥐고 다니거나 스마트폰의 길 안내 앱을 활용하세요. 공공장소에서의 와이파이 이용에는 주의가
									필요하며, 안전한 Wi-Fi 서비스를 이용하는 것을 추천합니다.<br> <br> 3. 교통수단
									이용<br> 대중교통을 이용할 때에는 붐비는 시간대와 짐이 많은 시간대를 피하고, 출입구 주변에서는
									휴대품에 특별한 주의를 기울이세요. 택시를 이용할 경우 정식 택시를 이용하고, 운전기사의 신분과 차량 번호를
									확인하는 습관을 가지세요.<br> <br> 4. 음식과 음료 섭취<br> 서울은 다양한
									맛집과 음식점으로 유명합니다. 그러나 식중독을 예방하기 위해 식품 안전에 주의를 기울이세요. 위생적인 음식점을
									선택하고, 물이나 음료수는 믿을 수 있는 곳에서만 섭취하세요.<br> <br> 5. 응급상황
									대비<br> 여행 중 응급상황이 발생할 수도 있습니다. 여행 보험 가입 여부를 확인하고, 응급상황에
									대비하여 중요한 연락처와 주소를 기록해두세요. 서울의 응급의료 시스템에 대한 정보를 숙지하고 있으면 도움이 될
									것입니다.<br> <br> 여행은 즐거움과 함께 안전이 우선입니다. 서울 여행 시 위 안전
									수칙을 준수하여 즐거운 여행을 만끽해주세요. 저희 서비스를 이용해주셔서 감사합니다! <br> <br>
								</div>
							</div>
							<div class="collapse" id="list-item-4">
								<div class="card-header" id="heading3">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapse3"
											aria-expanded="false" aria-controls="collapse3">
											<b>[긴급] 서비스 장애 공지</b>
										</button>
									</h2>
								</div>
								<div id="collapse3" class="collapse" aria-labelledby="heading3"
									data-parent=".collapse-content" style="padding: 20px;">
									<br> 서비스팀에서 긴급한 공지사항이 있습니다. <br>현재 서비스에 장애가 발생하여
									일시적으로 이용이 불가능한 상태입니다. <br>아래는 장애 상황에 대한 자세한 내용입니다: <br>
									<br> - 장애 발생 시간: 2023년 5월 25일 오후 2시부터<br> - 장애 내용:
									데이터베이스 서버 문제로 인해 서비스에 접속할 수 없음<br> - 조치 계획: 엔지니어들이 이미 문제를
									분석 중이며, 빠른 시일 내에 복구 작업을 진행할 예정입니다. <br> <br>장애가 해결되는
									대로 추가적인 공지를 통해 알려드리겠습니다. <br> <br> 이용에 불편을 드려 죄송합니다.
									<br>최대한 신속하게 문제를 해결하여 정상적인 서비스를 제공할 수 있도록 노력하겠습니다. <br>문제가
									해결되는 대로 다시 알려드리겠습니다.<br> <br> 감사합니다.<br> <br>
									서비스팀 드림<br> <br>
								</div>
								<div class="card-header" id="heading33">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapse33"
											aria-expanded="false" aria-controls="collapse33">
											<b>[긴급] 유지 보수 작업 안내</b>
										</button>
									</h2>
								</div>
								<div id="collapse33" class="collapse"
									aria-labelledby="heading33" data-parent=".collapse-content" style="padding: 20px;">
									<br> 저희는 시스템의 안정성을 위해 주기적인 유지 보수 작업을 실시합니다. <br> <br>
									따라서 특정 시간대에 일시적으로 서비스가 중단될 수 있습니다. <br> 유지 보수 작업 일정은 공지사항을
									통해 사전에 알려드리겠습니다. <br> <br> 양해 부탁드립니다.
								</div>
								<div class="card-header" id="heading333">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapse333"
											aria-expanded="false" aria-controls="collapse333">
											<b>[서비스] 서비스 업데이트</b>
										</button>
									</h2>
								</div>
								<div id="collapse333" class="collapse"
									aria-labelledby="heading333" data-parent=".collapse-content" style="padding: 20px;">
									<br> 서비스 이용에 관한 약관이 최근 업데이트되었습니다. <br> <br> 새로운
									약관은 웹사이트에서 확인하실 수 있으며, 업데이트된 내용에 동의하지 않으실 경우 서비스 이용이 제한될 수
									있습니다. <br> 약관 변경에 대한 문의사항이 있으시면 고객 지원 센터로 문의해 주세요.
								</div>
							</div>
							<div class="collapse" id="list-item-2">
								<div class="card-header" id="heading3">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapse3"
											aria-expanded="false" aria-controls="collapse3">
											<b>[업데이트] 업데이트 안내 - 새로운 기능 추가 및 개선 사항</b>
										</button>
									</h2>
								</div>
								<div id="collapse3" class="collapse" aria-labelledby="heading3"
									data-parent=".collapse-content" style="padding: 20px;">
									<br> 새로운 업데이트는 [날짜]부터 적용됩니다. <br>업데이트를 받으시려면 앱스토어 또는
									웹사이트에서 최신 버전으로 업데이트해 주시기 바랍니다.<br> 업데이트 과정에서 문제가 발생할 경우,
									고객 지원 센터로 문의하여 도움을 받으실 수 있습니다.

								</div>
								<div class="card-header" id="heading33">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapse33"
											aria-expanded="false" aria-controls="collapse33">
											<b>[업데이트] 버그 수정 및 안정성 강화</b>
										</button>
									</h2>
								</div>
								<div id="collapse33" class="collapse"
									aria-labelledby="heading33" data-parent=".collapse-content" style="padding: 20px;">
									<br> 이번 업데이트에서는 몇 가지 버그를 수정하고, 서비스의 안정성을 강화하였습니다. <br>
									<br>불편을 드려 죄송하며, 이제부터 더욱 원활하게 서비스를 이용하실 수 있을 것입니다.<br>
								</div>
								<div class="card-header" id="heading333">
									<h2 class="mb-0">
										<button class="btn btn-link btn-block text-left" type="button"
											data-toggle="collapse" data-target="#collapse333"
											aria-expanded="false" aria-controls="collapse333">
											<b>[goseoul] 서비스 업데이트 안내 - 새로운 기능 추가 및 개선 사항</b>
										</button>
									</h2>
								</div>
								<div id="collapse333" class="collapse"
									aria-labelledby="heading333" data-parent=".collapse-content" style="padding: 20px;">
									<br> 안녕하세요, [goseoul] 고객님들께 감사드립니다. <br>저희는 항상 더 나은
									서비스를 제공하기 위해 노력하고 있으며, 이번에도 여러분을 위한 업데이트를 진행하였습니다. <br>아래는
									업데이트 내용을 안내해 드리겠습니다. <br> <br> <b>새로운 기능 추가</b><br>
									[동행 구하기]: 이제부터 여러분은 [동행 구하기]를 통해 새롭게 제공되는 기능을 이용하실 수 있습니다. <br>이
									기능은 서울 여행하는 사람들을 위한 동행을 구하는 기능으로 여러분의 이용 경험을 한층 더 향상시켜 줄 것입니다.<br>
									[카카오 로그인]: 또한, [카카오 로그인]이 추가되었습니다. <br>이를 통해 여러분은 [카카오
									로그인]으로 인해 더욱 편리하고 다양한 기능을 이용하실 수 있을 것입니다.<br> <br> <b>사용자
										경험 개선</b><br> 여러분의 소중한 의견을 바탕으로 저희는 서비스의 사용자 경험을 개선하였습니다.
									이제부터는 더 빠르고 원활한 서비스 이용이 가능해질 것입니다. <br>불편한 점이나 개선 사항이 있으시면
									언제든지 저희에게 피드백해 주세요. 여러분의 의견은 저희에게 큰 보탬이 됩니다.<br> <br>
									<b>버그 수정 및 안정성 강화</b><br> 이번 업데이트에서는 몇 가지 버그를 수정하고, 서비스의
									안정성을 강화하였습니다. <br>불편을 드려 죄송합니다. <br>하지만 이제부터는 더욱 원활하고
									안정적인 서비스를 제공해 드릴 수 있을 것입니다.<br> <br> <b>업데이트 안내</b><br>
									새로운 업데이트는 [날짜]부터 적용될 예정입니다. <br>업데이트를 받으시려면 앱스토어(또는
									플레이스토어)에서 최신 버전으로 업데이트해 주시기 바랍니다.<br> 업데이트 과정에서 문제가 발생할
									경우, 고객 지원 센터로 문의하여 도움을 받으실 수 있습니다.<br> 여러분의 편의와 만족을 위해
									지속적으로 노력하는 [goseoul]이 되겠습니다. <br>앞으로도 보다 나은 서비스를 제공하기 위해
									최선을 다할 것입니다.<br> <br> 감사합니다.
								</div>
							</div>

							<br>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="footerBox">
			<c:import url="../footer.jsp" />
		</div>
	</div>
</body>
</html>
