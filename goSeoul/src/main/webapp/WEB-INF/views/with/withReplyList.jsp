<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go Seoul</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>

<style>
    body {
        font-family: 'Title_Medium';
    } 
</style>

<script>
	$(function() {
		$('.update').click(function() {
			var id  = $(this).attr('id');
			var txt = $('#content_'+id).text();
			$('#content_'+id).html("<textarea rows='3' cols='30' id='tt_"+id+"'>"+txt
				+"</textarea>");
			
			$('#btn_'+id).html(
			   "<input type='button' class='btn btn-outline-primary' value='확인' onclick='up("+id+")'> "
			  +"<input type='button' class='btn btn-outline-secondary' value='취소' onclick='lst()'>");
		});
	});
	
	function up(id) {
		var withreply_content = $('#tt_'+id).val();
		var formData = "withreply_no="+id+"&withreply_content="+withreply_content
			+"&with_no=${with.with_no}";

		$.post('replyUpdate.do', formData, function(data) {
			$('#replyList').html(data);
		});
	}
	

	function lst() {
		$('#replyList').load('replyList.do?with_no=${with.with_no}');
	}
	

	function del(withreply_no, with_no) {
		var formData="withreply_no="+withreply_no+"&with_no="+with_no;
		$.post("replyDelete.do", formData, function(data) {
			$('#replyList').html(data);
		});
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<table class="table">
			<tr>
				<th>작성자</th>
				<th>내용</th>
				<th>작성일</th>
				<th></th>
			</tr>
			
			<tr>
				<c:if test="${empty replyList}">
					<td colspan="4" align="center">작성된 댓글이 없습니다.</td>
				</c:if>
			</tr>
			
			<c:if test="${not empty replyList}">
				<c:forEach var="reply" items="${replyList}">
					<tr>
						<td>${reply.withreply_nick}</td>
						<td id="content_${reply.withreply_no}">${reply.withreply_content}</td>
						<td>
							<fmt:formatDate value="${reply.withreply_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
						</td>
						<td id="btn_${reply.withreply_no}">
							<c:if test="${reply.withreply_id == sessionScope.id}">
								<input type="button" value="수정" class="update btn btn-outline-primary"
									id="${reply.withreply_no}">
								<input type="button" value="삭제" class="btn btn-outline-danger"
									onclick="del(${reply.withreply_no},${reply.with_no})">
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>