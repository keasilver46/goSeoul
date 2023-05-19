<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행정보 공유</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 글꼴 -->
<link rel="stylesheet" href="./css/font.css">
<!-- 날씨 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/weather.js"></script>

<!-- 부트스트랩 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"></script>


<!-- 해시태그 처리 -->
<script>
$(document).ready(function() {
  var free_tag = [];
  var counter = 0;

  // 입력한 값을 태그로 생성한다.
  function addTag(value) {
	  free_tag[counter] = value;
    counter++; // del-btn의 고유 id가 된다.
  }

           // 서버에 제공
          $("#free_tag").on("keyup", function (e) {

             var tag = $("#tag-list").text();
              console.log(tag);
              $("#tag").val(tag);

          });

  $("#free_tag").on("keypress", function(e) {
    var self = $(this);

    // 엔터나 스페이스바 눌렀을 때 실행
    if (e.key === "Enter" || e.keyCode == 32) {
      var tagValue = self.val().trim();

      // 해시태그 값이 없으면 실행하지 않음
      if (tagValue !== "") {
        // 같은 태그가 있는지 검사한다. 있다면 해당 값이 배열로 반환된다.
        var result = Object.values(free_tag).filter(function(word) {
          return word === tagValue;
        });

        // 해시태그가 중복되지 않으면 추가
        if (result.length === 0) {
          $("#tag-list").append("<li>" + tagValue + "<span class='del-btn' idx='" + counter + "'>✕</span></li>");
          addTag(tagValue);
          self.val("");

          console.log("free_tag: "+free_tag);
          console.log("tagValue: "+tagValue);
        } else {
          alert("태그값이 중복됩니다.");
        }
      }
      e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
    }
  });

   // 삭제 버튼
   // 인덱스 검사 후 삭제
   $(document).on("click", ".del-btn", function(e) {
     var index = $(this).attr("idx");
     free_tag[index] = "";
     $(this).parent().remove();
   });
   })
</script>

<style>
* {
	font-family: 'Title_Medium';
}

input[type="date"] {
	width: 100%; /* 원하는 길이로 설정 */
}

input[type="range"] {
	width: 95%; /* 원하는 길이로 설정 */
}

label {
	font-weight: bold;
}

ul {
	list-style-type: '#';
	padding-inline-start: 1ch;
}

li {
	float: left;
	margin-right: 25px;
}

.write-btn {
	text-align: center;
}

.write-btn1 {
	display: inline-block;
}
</style>
</head>

<body>
<c:import url="../header.jsp" />
	<br><h4 class="mb-3" align="center">여행정보 공유 상세내용</h4>
	<form method="post" action="freeWriteResult.do" >
		<div class="container" style="width: auto; height: auto;">
			<div
				style="width: 100%; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">

				<input type="hidden" name="user_no" value="${user_no}">

				<div class="form-group row">
					<label for="free_category" class="col-sm-2 col-form-label">카테고리</label>
					<div class="col-sm-4">
						<input class="custom-select mr-sm-4" id="free_category"
							value="${board.free_category}" readonly>
					</div>
				<!-- </div>

				<div class="form-group row"> -->
					<label for="free_filename" class="col-sm-2 col-form-label">첨부
						파일</label>
					<div class="col-sm-4">
						<input class="form-control" type="file" id="free_filename"
							name="free_filename">
					</div>
				</div>

				<hr>

				<div class="form-group">
					<input type="text" id="nick" name="nick"
						class="form-control" value="${nick}">
				</div>
				<div class="form-group">
					<input type="text" id="free_title" name="free_title"
						class="form-control" value="${board.free_title}" readonly>
				</div>

				<div class="form-group">
					<textarea id="free_content" name="free_content" rows="15" cols="50"
						class="form-control" value="${board.free_content}"></textarea>
				</div>

				<div class="tr_hashTag_area">
                  <div class="form-group">
                   <input type="hidden" id="tag" name="free_tag" value="">
                    <input type="text" id="free_tag" placeholder="#태그입력" class="form-control">
                  </div>
                  <ul id="tag-list"></ul>
                </div>

				<br>
				<div class="write-btn">
					<button type="submit" class="btn btn-outline-primary write-btn1">작성</button>
					<button type="reset" class="btn btn-outline-secondary write-btn1">취소</button>
				</div>

			</div>
		</div>
	</form>
<c:import url="../footer.jsp"/>
</body>
</html>




<%-- <body>
	<div class="container" align="center" style="margin-bottom: 50px">
		<h2 class="text-primary" style="margin: 50px 0">정보 공유 상세정보</h2>
		<table class="table table-bordered">
			<tr>
				<td>글번호</td>
				<td>${board.free_no}</td>
			</tr>
			<tr>
				<td>지역번호</td>
				<td>${board.local_no}</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>${board.free_title}</td>
			</tr>
			<tr>
				<td>유저번호</td>
				<td>${board.user_no}</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>${board.free_content}</td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>${board.free_category}</td>
			</tr>
			<tr>
				<td>키워드</td>
				<td>${board.free_tag}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${board.free_hit}</td>
			</tr>
			<tr>
				<td>좋아요</td>
				<td>
					<td><c:if test="${isLogined }"> <span id="add-goodRp-btn"
					class="btn btn-outline">좋아요👍 <span class="add-goodRp ml-2">${foundArticle.goodReactionPoint}</span>


				</span>

				</td>
			</tr>
			<tr>
				<td>싫어요</td>
				<td>
					<td><c:if test="${isLogined }"> <span id="add-badRp-btn"
					class="btn btn-outline">싫어요👎 <span class="add-badRp ml-2">${foundArticle.badReactionPoint}</span>
				</span>
				</td>
			</tr>
			<tr>
				<td>작성시간</td>
				<td><pre>${board.free_date}</pre></td>
			</tr>

		</table>
			<a href="freeWrite.do?pageNum=${pageNum}" class="btn btn-outline-primary">작성</a>
			<a href="freeList?pageNum=${pageNum}" class="btn btn-outline-primary">목록</a>
			<a href="updateForm?num=${board.free_no}&pageNum=${pageNum}"
			class="btn btn-outline-primary">수정</a>
			<a href="deleteForm?num=${board.free_no}&pageNum=${pageNum}"
			class="btn btn-outline-danger">삭제</a>

	</div>
 --%>