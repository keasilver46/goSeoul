<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="./css/font.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

<style>
	@font-face {
	    font-family: 'Title_Medium';
	    src: url('../fonts/Title_Medium.woff') format('woff');
	}
    header {
        font-family: 'Title_Medium';
    }

     .navbar-nav > li {
        padding-left: 40px;
        padding-right: 40px;
    }

    .dropdown:hover .dropdown-menu {
        display: block;
        margin-top: 0;
    }
</style>
</head>
<body>
    <header class="border-bottom">
        <div class="d-flex justify-content-between">
            <span class="weather">
                <span class="weather_icon"></span>
                <span class="weather_temp"></span>
            </span>

            <form class="form-inline my-2 my-md-0">
                <input class="form-control" type="text" placeholder="검색어를 입력하세요." aria-label="Search">
                <button class="btn btn-outline-primary" type="submit">검색</button>
            </form>

            <ul class="nav justify-content-end">
                <li class="nav-item">
                    <a href="#" class="nav-link text-dark">마이페이지</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link text-dark">로그인</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link text-dark">회원가입</a>
                </li>
            </ul>
        </div>

        <div class="my-2">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <div class="navbar-collapse justify-content-center" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-dark" href="#" role="button" aria-expanded="false">
                                    같이서울
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">동행구하기</a></li>
                                    <li><a class="dropdown-item" href="#">여행정보공유</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-dark" href="#" role="button" aria-expanded="false">
                                    해봤서울
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">행사캘린더</a></li>
                                    <li><a class="dropdown-item" href="#">이벤트</a></li>
                                    <li><a class="dropdown-item" href="#">축제&행사</a></li>
                                    <li><a class="dropdown-item" href="#">전시&공연</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-dark" href="#" role="button" aria-expanded="false">
                                    가봤서울
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">테마추천코스</a></li>
                                    <li><a class="dropdown-item" href="#">종류별</a></li>
                                    <li><a class="dropdown-item" href="#">지역별</a></li>
                                </ul>
                            </li>

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-dark" href="#" role="button" aria-expanded="false">
                                    정보서울
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">서울시티투어버스</a></li>
                                    <li><a class="dropdown-item" href="#">공지사항</a></li>
                                    <li><a class="dropdown-item" href="#">FAQ</a></li>
                                    <li><a class="dropdown-item" href="#">개인정보처리방침</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
</body>
</html>