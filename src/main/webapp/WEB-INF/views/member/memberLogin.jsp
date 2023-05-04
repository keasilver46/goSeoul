<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
    form {
        text-align: center;
    }
    table {
            margin: auto;
            border-collapse:collapse;
    }
</style>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>

	<form method="post" action="MemberLoginOk.do" onsubmit="return check()">
		<table>
			<tr>
				<td><input id="id" name="id" placeholder="아이디"></td>
			</tr>
			<br>
			<div class="passwd">
			<tr>
				<td><input type="password" id="pass" name="pass" placeholder="비밀번호"></td>
				<!-- 비밀번호 표시 추가하기 -->
				<div class="eyes">
                  	<i class="fa fa-eye fa-lg"></i>
                  </div>
            </div>

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
		</table>
	</form>

</body>
</html>