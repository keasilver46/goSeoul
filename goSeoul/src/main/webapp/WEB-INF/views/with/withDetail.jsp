<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Go Seoul</title>
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

<style>
    body {
        font-family: 'Title_Medium';
    }
    
    #withdetail {
    	margin: 50px auto;
    }
    
    .withdetail_title {
    	margin-bottom: 50px;
    }
    
    #withImg {
    	padding: 1rem;
    }
    
    #replyForm {
    	padding: 0.75rem;
    }
    
    #replyInsert {
    	white-space: nowrap;
    }
    
    #withBtn > button {
    	margin: 0 2px;
    }
</style>

<script>
	$(function() {
		$('#replyList').load('replyList.do?with_no=${with.with_no}');
		
		$('#replyInsert').click(function() {
			if (!replyForm.withreply_content.value) {
				alert('댓글을 입력하세요.');
				replyForm.withreply_content.focus();
				return false;
			}
			
			var replyData = $('#replyForm').serialize();
			
			$.post('withReply.do', replyData, function(data) {
				$('#replyList').html(data);
				replyForm.withreply_content.value = '';
			});
		});
	});
</script>
</head>
<body>
    <c:import url="../header.jsp" />
    <div id="withdetail" class="container">
        <h3 class="withdetail_title" align="center">동행 구하기</h3>

        <table class="table">        	
            <tr>
                <th>제목</th>
                <td colspan="3">${with.with_title}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${with.with_nick}</td>
                <th>조회수</th>
                <td>${with.with_hit}</td>
            </tr>
            <tr>
                <th>지역</th>
                <td>${with.with_category}</td>
                <th>성별</th>
                <td>${with.with_gender}</td>
            </tr>
            <tr>
                <th>나이</th>
                <td>${with.with_age}</td>
                <th>날짜</th>
                <td>${with.with_start} ~ ${with.with_end}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td colspan="3">
                    ${with.with_content} <br>
                    <c:if test="${with.with_filename != null}">
                        <img src="./upload/${with.with_filename}" id="withImg">
                    </c:if>
                </td>
            </tr>
            <tr>
                <th>태그</th>
                <td colspan="3">${with.with_tag}</td>
            </tr>
            <tr>
                <th>현재인원</th>
                <td>${with.with_curno} / ${with.with_maxto}</td>
                <c:if test="${id != with.with_id}">
                	<c:if test="${with.with_curno < with.with_maxto}">
                    	<td colspan="2">
                        	<button class="btn btn-outline-primary" onClick="location.href='with_reserve.do?with_no=${with.with_no}&page=${page}&state=detail'">신청하기</button>
                    	</td>
                	</c:if>
                	<c:if test="${with.with_curno == with.with_maxto}">
                    	<td colspan="2">
                        	<button class="btn btn-danger">마감</button>
                    	</td>
                	</c:if>
         		</c:if>
            </tr>
        </table>
        
        <form id="replyForm" name="replyForm" method="post">
        	<input type="hidden" name="withreply_id" value="${sessionScope.id}">
        	<input type="hidden" name="with_no" value="${with.with_no}">
            <div class="form-group row">
               	<label for="withreply_content" class="col-sm-2 col-form-label font-weight-bold" id="replyLabel">댓글</label>
           		<div class="d-flex col-sm-10">
           	   		<textarea id="withreply_content" name="withreply_content" rows="1" cols="3" class="form-control" placeholder="댓글을 입력해주세요." required></textarea>
           	   		<button class="btn btn-outline-primary" id="replyInsert">작성</button>
           		</div>
            </div> 
        </form>
 		
        <div id="replyList"></div>
    	
    	<div class="d-flex justify-content-center" id="withBtn">
    		<button class="btn btn-outline-primary" onClick="location.href='with_list.do?page=${page}'">목록</button>
    		<c:if test="${id == with.with_id}">
        		<button class="btn btn-outline-primary" onClick="location.href='withUpdate.do?with_no=${with.with_no}&page=${page}'">수정</button>
        		<button class="btn btn-outline-danger" onClick="location.href='withDelete.do?with_no=${with.with_no}'">삭제</button>
        	</c:if>
    	</div>
    	
    </div>
    <c:import url="../footer.jsp" />
</body>
</html>