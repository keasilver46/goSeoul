<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/font.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>
<style>
    body {
        font-family: 'Title_Medium';
    }
</style>
</head>
<body>
    <c:import url="../header.jsp" />
    <div id="withlist">
        <h1 class="withlist_title" style="font-size:40px; position:static; margin:10px;">동행 구하기</h1>

        <form class="form-inline my-2 my-md-0 justify-content-end">
            <input class="form-control" type="text" placeholder="검색어를 입력하세요." aria-label="Search">
            <button class="btn btn-outline-primary" type="submit">검색</button>
        </form>

        <div class="d-flex">
            <c:forEach items="${withlist}" var="with">
                <span class="card" style="width: 18rem;">
                    <img src="${with.with_filepath}" class="card-img-top" alt="${with.with_filename}">
                        <div class="card-body">
                            <h5 class="card-title">
                                <a href="with_detail.do?with_no=${with.with_no}&page=${page}&state=detail">${with.with_title}</a>
                            </h5>
                            <p class="card-text">${with.with_content}</p>
                        </div>
                </span>
            </c:forEach>
        </div>


    </div>
    <c:import url="../footer.jsp" />
</body>
</html>