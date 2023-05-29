<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>개인정보 처리방침</title>

<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

<!-- External CSS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<style>
.privacy {
  overflow: scroll;
}


</style>

</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="container" style="width: auto; height: auto;">
    <div style="width: 1000px; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">
    <br>

    <div>
    <h3 align="center">개인정보 처리방침</h3>
    </div>
    <hr>
    <br>
    <div class="privacy" align="center">

    <p style="font-size:120%">
    이 개인정보 처리방침은 회원님의 개인정보를 수집, 이용, 저장, 공유, 보호하는 방법을 설명합니다. <br>
    저희는 회원님의 개인정보를 보호하기 위해 최선을 다하고 있으며, 관련 법률 및 규정을 준수하고 있습니다. <br>아래의 내용을 주의 깊게 읽어주시기 바랍니다.<br>
    <br>
    <b>1. 수집하는 개인정보 항목</b><br>
    회원 가입 시에는 이름, 이메일 주소, 연락처 등의 개인정보를 수집할 수 있습니다.<br>
    서비스 이용 과정에서 생성되는 정보, 접속 기록, 쿠키, IP 주소 등의 정보도 수집될 수 있습니다.<br>
    추가적인 개인정보가 필요한 경우, 이용 목적과 법적 근거를 밝힌 후 회원님의 동의를 받습니다.<br>
    <br><br>
    <b>2. 개인정보의 수집 및 이용목적</b><br>

    회원 가입 및 관리, 서비스 제공 및 운영, 문의 및 문제 해결 등 회원 관리와 서비스 운영을 위해 개인정보를 수집 및 이용합니다.<br>
    서비스 개선, 신규 서비스 개발, 마케팅 및 광고 활동에 활용하기 위해 개인정보를 활용할 수 있습니다.<br>
    법령 및 이용약관에 따른 요구사항 및 회사 정책을 준수하기 위해 개인정보를 처리할 수 있습니다.
    <br><br>
    <b>3. 개인정보의 보유 및 삭제</b>
    <br>
    회원님의 개인정보는 수집 및 이용목적이 달성되거나 회원탈퇴 요청 시에는 즉시 삭제되거나 파기됩니다.<br>
    다만, 관련 법령에 따라 일정 기간 동안 개인정보를 보관할 수 있으며, 이 경우에는 해당 법령에 따라 개인정보를 안전하게 보호합니다.
    <br><br>
    <b>4. 개인정보의 공유 및 제공</b><br>

    회원님의 개인정보는 원칙적으로 제3자에게 제공되지 않습니다.<br>
    다만, 회원님의 동의가 있거나 법적 의무를 준수하기 위해 필요한 경우에는 제3자에게 개인정보를 제공할 수 있습니다.
    <br><br>
    <b>5. 개인정보의 보호</b><br>

    회사는 회원님의 개인정보를 안전하게 보호하기 위해 보안 시스템을 유지하고 개인정보 처리에 관련된 규정과 절차를 마련하고 있습니다.<br>
    개인정보에 접근 권한을 가진 직원들은 개인정보의 비밀을 유지하며, 외부로부터의 무단 접근을 방지하기 위해 노력합니다.
    <br><br>
    <b>6. 개인정보 처리방침의 변경</b><br>
    개인정보 처리방침은 필요에 따라 변경될 수 있으며, 변경 시에는 웹사이트 공지사항을 통해 고지할 것입니다.<br>
    변경된 개인정보 처리방침은 공지된 날로부터 효력을 발생합니다.<br><br><br><br>
    개인정보 처리방침은 회원님의 개인정보를 보호하고 안전하게 처리하기 위한 지침으로서, <br>회원님의 개인정보 보호를 최우선으로 생각하고 있습니다. <br>
    궁금한 점이 있으시거나 개인정보 처리방침에 관한 문의사항이 있으시면 언제든지 저희에게 문의해주시기 바랍니다.<br>
    </p>
    </div>

    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>