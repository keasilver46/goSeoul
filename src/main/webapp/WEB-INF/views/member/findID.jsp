<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/font.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
</head>
<style>
    .flex-container{
        width: 100%;
        height: 100vh;
        display: -webkit-box;
        display: -moz-box;
        display: -ms-flexbox;
        display: flex;

        -webkit-box-align: center;
        -moz-box-align: center;
        -ms-flex-align: center;
        align-items: center; /* 수직 정렬 */

        -webkit-box-pack: center;
        -moz-box-pack: center;
        -ms-flex-pack: center;
        justify-content: center; /* 수평 정렬 */
    }
</style>
<body>
    <div class= "flex-container">
        <form method="post" action="result.do">
    	    <input type="text" name="name"  placeholder="이름을 입력하세요"/>
    	    <input type="text" name="email"  placeholder="email을 입력하세요" />
    	    <input type="submit" name="action" value="아이디 찾기" />
        </form>
    </div>
</body>
</html>