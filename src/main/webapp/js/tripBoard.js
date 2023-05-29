let total = 0; // 전체 페이지 갯수
var pageSize = 10; // 한 페이지에 보여줄 아이템 수
var currentPage = 1; // 현재 페이지 번호
var totalItems = 0; // 전체 아이템 수
var totalPages = 0; // 총 페이지 수

$(document).ready(function() {   //   서울 전체는 부제목 x 나머지는 부제목 o
   $("#all1").on("click", function() {
     $("#trip_check").hide();
   });

   $("#gangnam, #gangseo, #mapo").on("click", function() {
     $("#trip_check").show();
   });

   $("#searchButton").on("click", function() {
      var value = $("#searchInput").val().toLowerCase();
      $(".paging-container").empty();
      $(".card").filter(function() {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
      });
      var total = $(".card:visible").length;
         console.log("Total:", total);
   });
});

function all1() {
  $(".card-container").empty();
  var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
  var total = 0;

  selectedSigunguCode = 26;
  img();

  totalItems = 0;
  totalPages = 0;

  // 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
  for (var i = 0; i < contentTypeIdList.length; i++) {
    var contentTypeId = contentTypeIdList[i];
    var url =
      "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" +
      contentTypeId +
      "&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";

    $.ajax({
      url: url,
      type: "GET",
      async: false,
      data: {},
      success: function (result) {
        total = result.response.body.totalCount;
        var trip = result.response.body.items.item;
        var trip_addr1 = [];
        var trip_title = [];
        var backgroundImage = [];
        var contentid = [];

        console.log(total);

        for (var j = 0; j < trip.length; j++) {
          trip_addr1.push(trip[j]["addr1"]);
          trip_title.push(trip[j]["title"]);
          backgroundImage.push(trip[j]["firstimage"]);
          contentid.push(trip[j]["contentid"]);

          var card = $("<div>").addClass("card");
          var title = $("<h2>").text(trip_title[j]);
          var place = $("<p>").text(trip_addr1[j]);
          card.append(title).append(place);

          // backgroundImage[j]가 " "인 경우에 대한 처리
          if (backgroundImage[j] !== "") {
            card.css("background-image", "url(" + backgroundImage[j] + ")");
          } else {
            card.css("background-image", "url(images/cat.jpg)");
          }

          $(".card-container").append(card);

          (function (contentId) {
            // 전체 여행지에서만 수정된 코드
            card.click(function () {
              window.location.href =
                "tripDetail_form.do?contentId=" + contentId;
            });
          })(contentid[j]);
        }

        totalItems += trip.length;
        totalPages = Math.ceil(totalItems / pageSize);
      },
    });
  }

  // 초기 데이터 호출
  goToPage(currentPage);
  addPagingButtons();
}

// 페이지 이동 함수
function goToPage(pageNumber) {
  if (pageNumber < 1 || pageNumber > totalPages) {
    return;
  }

  currentPage = pageNumber;

  var startIndex = (currentPage - 1) * pageSize;
  var endIndex = startIndex + pageSize;

  $(".card").hide(); // 모든 아이템 숨기기
  $(".card").slice(startIndex, endIndex).show(); // 현재 페이지에 해당하는 아이템만 보이기
}

// 이전 페이지로 이동하는 함수
function goToPreviousPage() {
  if (currentPage > startPage) {
     goToPage(currentPage - 1);
  }
}

// 다음 페이지로 이동하는 함수
function goToNextPage() {
  if (currentPage < totalPages) {
    goToPage(currentPage + 1);
  }
}

// 페이징 버튼 추가
function addPagingButtons() {
  var pagingContainer = $("<div>").addClass("paging-container");

  var startPage = (Math.floor((currentPage - 1) / 10) * 10) + 1;
  var endPage = Math.min(startPage + 9, totalPages);

  // 이전 버튼 추가
  var previousButton = createPagingButton("이전", goToPreviousPage);
  pagingContainer.append(previousButton);

  // 페이지 버튼 추가
  for (var i = startPage; i <= endPage; i++) {
    var pageButton = createPagingButton(i, goToPage);
    pagingContainer.append(pageButton);
  }

  // 다음 버튼 추가
  var nextButton = createPagingButton("다음", goToNextPage);
  pagingContainer.append(nextButton);

  $(".card-container").after(pagingContainer);
}

// 페이지 버튼 생성 함수
function createPagingButton(label, onClick) {
  return $("<button>")
    .text(label)
    .addClass("paging-button")
    .click(function () {
      onClick(parseInt($(this).text()));
    });
}

all1();

function gangnam() {	//	강남구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	var total = 0;

	selectedSigunguCode = 1;
	img();

	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
		var contentTypeId = contentTypeIdList[i];
		var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";

		$.ajax({
			url: url,
			type: "GET",
			async: false,
			data: {},
			success: function(result) {
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];

				for (var i = 0; i < trip.length; i++) {
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);

					var card = $("<div>").addClass("card");
					var title = $("<h2>").text(trip_title[i]);
					var place = $("<p>").text(trip_addr1[i]);
					card.append(title).append(place);

					// backgroundImage[i]가 " "인 경우에 대한 처리
					if (backgroundImage[i] !== "") {
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					} else {
						card.css("background-image", "url(images/cat.jpg)");
					}

					$(".card-container").append(card);

					(function(contentId) {	//	전체 여행지에서만 수정된 코드
						card.click(function() {
							window.location.href = "tripDetail_form.do?contentId=" + contentId;
						});
					})(contentid[i]);
				}

				total = $(".card:visible").length;
			    console.log("Total:", total);

				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();

					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var total = $(".card:visible").length;
				        console.log("Total:", total);
				});
			}
		});
	}
}

function gangseo() {	//	강서구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];

	selectedSigunguCode = 4;
	img();
	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
		var contentTypeId = contentTypeIdList[i];
		var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=4&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";

		$.ajax({
			url: url,
			type: "GET",
			async: false,
			data: {},
			success: function(result) {
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];

				for (var i = 0; i < trip.length; i++) {
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);

					var card = $("<div>").addClass("card");
					var title = $("<h2>").text(trip_title[i]);
					var place = $("<p>").text(trip_addr1[i]);
					card.append(title).append(place);

					// backgroundImage[i]가 " "인 경우에 대한 처리
					if (backgroundImage[i] !== "") {
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					} else {
						card.css("background-image", "url(images/cat.jpg)");
					}

					$(".card-container").append(card);

					(function(contentId) {	//	전체 여행지에서만 수정된 코드
						card.click(function() {
							window.location.href = "tripDetail_form.do?contentId=" + contentId;
						});
					})(contentid[i]);
				}

				total = $(".card:visible").length;
			    console.log("Total:", total);

				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();

					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  total = $(".card:visible").length;
					  console.log("Total:", total);
				});
			}
		});
	}
}

function mapo() {	//	마포구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
    var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
    var total = 0;

    selectedSigunguCode = 13;
    img();

    // 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
    for (var i = 0; i < contentTypeIdList.length; i++) {
        var contentTypeId = contentTypeIdList[i];
        var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=13&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";

        $.ajax({
            url: url,
            type: "GET",
            async: false,
            data: {},
            success: function(result) {
                var trip = result.response.body.items.item;
                var trip_addr1 = [];
                var trip_title = [];
                var backgroundImage = [];
                var contentid = [];

                for (var i = 0; i < trip.length; i++) {
                    trip_addr1.push(trip[i]["addr1"]);
                    trip_title.push(trip[i]["title"]);
                    backgroundImage.push(trip[i]["firstimage"]);
                    contentid.push(trip[i]["contentid"]);

                    var card = $("<div>").addClass("card");
                    var title = $("<h2>").text(trip_title[i]);
                    var place = $("<p>").text(trip_addr1[i]);
                    card.append(title).append(place);

                    // backgroundImage[i]가 " "인 경우에 대한 처리
                    if (backgroundImage[i] !== "") {
                    	card.css("background-image", "url(" + backgroundImage[i] + ")");
                    } else {
                    	card.css("background-image", "url(images/cat.jpg)");
                    }

                    $(".card-container").append(card);

                    (function(contentId) {	//	전체 여행지에서만 수정된 코드
                        card.click(function() {
                          window.location.href = "tripDetail_form.do?contentId=" + contentId;
                        });
                      })(contentid[i]);
                }

                total = $(".card:visible").length;
			    console.log("Total:", total);

                $("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();

					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  var total = $(".card:visible").length;
				        console.log("Total:", total);
				});
			}
		});
	}
}


function jongro() {	//	종로구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	$(".card-container").empty();
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	var total = 0;

	 selectedSigunguCode = 23;
	 img();

	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
		var contentTypeId = contentTypeIdList[i];
		var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&sigunguCode=23&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";

		$.ajax({
			url: url,
			type: "GET",
			async: false,
			data: {},
			success: function(result) {
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];

				for (var i = 0; i < trip.length; i++) {
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);

					var card = $("<div>").addClass("card");
					var title = $("<h2>").text(trip_title[i]);
					var place = $("<p>").text(trip_addr1[i]);
					card.append(title).append(place);

					// backgroundImage[i]가 " "인 경우에 대한 처리
					if (backgroundImage[i] !== "") {
						card.css("background-image", "url(" + backgroundImage[i] + ")");
					} else {
						card.css("background-image", "url(images/cat.jpg)");
					}

					$(".card-container").append(card);

					(function(contentId) {	//	전체 여행지에서만 수정된 코드
						card.click(function() {
							window.location.href = "tripDetail_form.do?contentId=" + contentId;
						});
					})(contentid[i]);
				}

				total = $(".card:visible").length;
			    console.log("Total:", total);


				$("#searchButton").on("click", function() {
					  var value = $("#searchInput").val().toLowerCase();
					  $(".card").filter(function() {
					    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					  });
					  total = $(".card:visible").length;
				        console.log("Total:", total);
				});
			}
		});
	}
}