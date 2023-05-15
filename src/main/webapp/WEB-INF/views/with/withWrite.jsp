<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>동행 구하기</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- External CSS -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous">
</script>
<!-- 모집인원 range -->
<script>
	$(document).ready(function() {
		$('.range-slider__range').on('input', function() {
			var value = $(this).val();
			$(this).next('.range-slider__value').html(value);
		});

		$('.range-slider__range').each(function() {
			var value = $(this).val();
			$(this).next('.range-slider__value').html(value);
		});
	});
</script>

<!-- 해시태그 처리 -->
<script>
    $(document).ready(function () {
            var with_tag = {};
            var counter = 0;

            // 입력한 값을 태그로 생성한다.
            function addTag (value) {
                with_tag[counter] = value;
                counter++; // del-btn 의 고유 id 가 된다.
            }

            // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
            function marginTag () {
                return Object.values(tag).filter(function (word) {
                    return word !== "";
                });
            }

            // 서버에 제공
            $("#tag-form").on("submit", function (e) {
                var value = marginTag(); // return array
                $("#rdTag").val(value);

                $(this).submit();
            });

            $("#with_tag").on("keypress", function (e) {
                var self = $(this);

                //엔터나 스페이스바 눌렀을때 실행
                if (e.key === "Enter" || e.keyCode == 32) {

                    var tagValue = self.val(); // 값 가져오기

                    // 해시태그 값 없으면 실행X
                    if (tagValue !== "") {

                        // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                        var result = Object.values(with_tag).filter(function (word) {
                            return word === tagValue;
                        })

                        // 해시태그가 중복되었는지 확인
                        if (result.length == 0) {
                            $("#tag-list").append("<li class='tag-item'>"+tagValue+"<span class='del-btn' idx='"+counter+"'> ✕</span></li>");
                            addTag(tagValue);
                            self.val("");
                        } else {
                            alert("태그값이 중복됩니다.");
                        }
                    }
                    e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
                }
            });

            // 삭제 버튼
            // 인덱스 검사 후 삭제
            $(document).on("click", ".del-btn", function (e) {
                var index = $(this).attr("idx");
                with_tag[index] = "";
                $(this).parent().remove();
            });
    })
</script>

<style>
body {
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
    margin-left: 0px;
}

</style>
</head>

<body>
	<%@ include file="/WEB-INF/views/header.jsp"%>
	<h4 class="mb-3" align="center">동행 구하기</h4>
	<form method="post" action="withWriteResult.do">
		<div class="container"
			style="width: auto; height: auto;">
			<div style="width: 1000px; height: auto; margin: 50px auto; background-color: white; border-radius: 10px;">

				<input type="hidden" name="user_no" value="${user_no}">

			<div class="form-group row">
				<label for="gender" class="col-sm-2 col-form-label">성별</label>
					<div class="col-sm-4">
						<input type="radio" id="female" name="gender" required>&nbsp;여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" id="male" name="gender" required>&nbsp;남성
					</div>
				<label for="with_age" class="col-sm-2 col-form-label">나이</label>
					<div class="col-sm-4">
					    <select class="custom-select mr-sm-2" id="with_age" name="with_age">
                                <option selected>선택</option>
                                <option value="20" name="with_age">20대</option>
                                <option value="30" name="with_age">30대</option>
                                <option value="40" name="with_age">40대</option>
                                <option value="50" name="with_age">50대</option>
                                <option value="60" name="with_age">60대 이상</option>
                        </select>
                    </div>
			</div>

					<div class="form-group row">
						<label for="local_no" class="col-sm-2 col-form-label">지역</label>
						<div class="col-sm-10">
							<input type="text" id="local_no" name="local_no"
								class="form-control" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="customRange2" class="col-sm-2 col-form-label">모집
							인원</label>
						<div class="col-sm-10">
							<input type="range" class="range-slider__range" value="1" min="1"
								max="15" id="with_maxto" name="with_maxto" required>&nbsp;
								<span class="range-slider__value" name="with_maxto" value=""></span>명
						</div>
					</div>

				<div class="form-group row">
					<label for="with_date" class="col-sm-2 col-form-label">날짜
						선택</label>
					<div class="col">
						<input class="form-control" type="date" name="with_start" id="with_start" value="시작 일자" required>
					</div>-
					<div class="col">
						<input class="form-control" type="date" name="with_end" id="with_end" value="종료 일자" required>
					</div>
				</div>

				<div class="form-group row">
					<label for="with_filename" class="col-sm-2 col-form-label">첨부 파일</label>
					<div class="col-sm-10">
					<input class="form-control" type="file" id="with_filename"
						name="with_filename">
				    </div>
				</div>

				<div class="form-group">
					<input type="text" id="with_title" name="with_title"
						class="form-control" placeholder="제목을 입력해주세요." required>
				</div>

				<div class="form-group">
					<textarea id="with_content" name="with_content" rows="15" cols="50"
						class="form-control" placeholder="내용을 입력해주세요." required></textarea>
				</div>

				<!--<div class="form-group row">
					<label for="with_tag" class="col-sm-2 col-form-label">태그</label>
					<div class="col-sm-10">
					<input type="text" name="with_tag" class="form-control">
					</div>
				</div>-->

				<div class="tr_hashTag_area">
                           <div class="form-group">
                                <input type="hidden" value="" name="with_tag" id="rdTag" />
                            </div>

                            <div class="form-group">
                            	<input type="text" id="with_tag" size="7" placeholder="#태그입력" class="form-control">
                           </div>
                           <ul id="tag-list"></ul>

                </div>

				<br>
				<div class="form-group row">
					<button type="submit" class="btn btn-outline-primary">작성</button>
					<button type="reset" class="btn btn-outline-secondary">취소</button>
				</div>

			</div>
		</div>
	</form>
	<%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
