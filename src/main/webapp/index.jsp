<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hello World!<br>
	<a href="./memberLogin.do">로그인</a>
	<li th:text="|인가코드 = ${code}|">code</li>
    <li th:text="|유효토큰 = ${access_token}|">code</li>
    <li th:text="|사용자정보 = ${userInfo}|">code</li>
    <li th:text="|동의정보 = ${agreementInfo}|">code</li>
    <a href="https://kauth.kakao.com/oauth/logout?client_id=53907bf2cc99ddbb1929db25394e8fae&logout_redirect_uri=http://localhost:8080/member/kakao">로그아웃</a>
</body>
</html>