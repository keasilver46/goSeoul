<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>
    form {
        text-align: center;
    }
    table {
            margin: auto;
            border-collapse:collapse;
    }
</style>
<script>
function check(){
    if($.trim($("#id").val())==""){
    alert("아이디를 입력해주세요.");
    $("#id").val("").focus();
    return false;
    }
    if($.trim($("#pass").val())==""){
    alert("비밀번호를 입력해주세요.");
    $("#pass").val("").focus();
    return false;
    }
}
</script>

</head>
<body>

	<form method="post" action="MemberLoginOk.do" onsubmit="return check()">
		<table>
			<tr>
				<td><input id="id" name="id" placeholder="아이디"></td>
			</tr>
			<br>
			<tr>
				<td><input type="password" id="pass" name="pass" placeholder="비밀번호"></td>
				<!-- 비밀번호 표시 추가하기 -->

			</tr><br>
            <tr>
            <td><input type="checkbox">아이디 저장</td>
		    </tr>
		    <br><br>
		    <tr>
		    <td><input type="submit"value="로그인"></td>
		    <tr>
		</table>
		<br>
		<a href="" style="text-decoration:none;" style="color: gray">아이디 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="" style="text-decoration:none;" style="color: gray">비밀번호 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		<a href="" style="text-decoration:none;" style="color: gray">회원가입</a><br>
        <hr width="30%">
        <br>

		<!-- 로그인 api 구글, 네이버, 카톡 작성하기 -->
        구글 네이버 카톡

	</form>

</body>
</html>