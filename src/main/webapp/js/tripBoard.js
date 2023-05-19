
function search(s) {	//	키워드 검색기능
	 $.ajax({
		  url:"https://apis.data.go.kr/B551011/KorService1/searchKeyword1?numOfRows=711&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&keyword="+s+"&contentTypeId=12&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
		  type: "GET",
		  data: {},
		  success: function (result){
		 },
	});
}


function all1() {	// 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	
	// 반복문을 통해 각 contentTypeId에 대한 데이터를 호출합니다.
	for (var i = 0; i < contentTypeIdList.length; i++) {
		var contentTypeId = contentTypeIdList[i];
		var url = "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=" + contentTypeId + "&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D";
		
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
				
				$("#searchInput").on("keyup", function() {
					var value = $(this).val().toLowerCase();
					search(value);
					$(".card").filter(function() {
						$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					});
				});
			}
		});
	}
}
all1();

function gangnam() {	//	강남구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	
	selectedSigunguCode = 1;
	culture1();
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
				
				$("#searchInput").on("keyup", function() {
					var value = $(this).val().toLowerCase();
					search(value);
					$(".card").filter(function() {
						$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					});
				});
			}
		});
	}
}
gangnam();

function mapo() {	//	마포구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
    var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
    
    selectedSigunguCode = 13;
    culture1();
    
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

                $("#searchInput").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    search(value);
                    $(".card").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                    });
                });
            }
        });
    }
}
mapo();

function jongro() {	//	종로구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	
	 selectedSigunguCode = 23;
	 culture1();
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
				
				$("#searchInput").on("keyup", function() {
					var value = $(this).val().toLowerCase();
					search(value);
					$(".card").filter(function() {
						$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					});
				});
			}
		});
	}
}
jongro();

function gangseo() {	//	강서구 전체 ( 관광지, 식당, 숙박, 레포츠, 문화시설, 여행코스, 쇼핑)
	var contentTypeIdList = [12, 14, 25, 28, 32, 38, 39];
	
	 selectedSigunguCode = 4;
	 culture1();
	 
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
				
				$("#searchInput").on("keyup", function() {
					var value = $(this).val().toLowerCase();
					search(value);
					$(".card").filter(function() {
						$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
					});
				});
			}
		});
	}
}
gangseo();
/*
function a1(){
	$.ajax({	//	데이터 가져오기 / 추후에 api 1000개로 수정하면 됨
        url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=711&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&arrange=A&contentTypeId=12&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
        type:"GET",
        data: {},
        success: function(result) {
        	$(".card-container").empty();
            var trip = result.response.body.items.item;
       		var trip_addr1 = [];
        	var trip_title = [];
        	var backgroundImage = [];
        	var contentid = [];
        	
            for(let i = 0; i < trip.length; i++){ // trip.length = total 
                trip_addr1.push(trip[i]["addr1"]);
                trip_title.push(trip[i]["title"]);
                backgroundImage.push(trip[i]["firstimage"]);
                contentid.push(trip[i]["contentid"]);
               
                let card = $("<div>").addClass("card");		
                let title = $("<h2>").text(trip_title[i]);
                let place = $("<p>").text(trip_addr1[i]);
                card.append(title).append(place);
                card.css("background-image", "url(" + backgroundImage[i] + ")");
                $(".card-container").append(card);
                
				card.click(function(){
					window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
				});
            }
            $("#searchInput").on("keyup", function() {
        		let value = $(this).val().toLowerCase();
        		
        		search(value);		//  검색 
        		
        		$(".card").filter(function() {
        			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        		});
        	});
         },
   	 });
  }
	

function mapogu(){	//	마포구 관광지 (contentTypeId = 12)
	$.ajax({	//	데이터 가져오기
		url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=12&areaCode=1&sigunguCode=13&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
		type:"GET",
		async:false,
		data: {},
		success: function(result) {
			$(".card-container").empty();
			var trip = result.response.body.items.item;
			var trip_addr1 = [];
			var trip_title = [];
			var backgroundImage = [];
			var contentid = [];

			for(let i = 0; i < trip.length; i++){ // trip.length = total 
				trip_addr1.push(trip[i]["addr1"]);
				trip_title.push(trip[i]["title"]);
				backgroundImage.push(trip[i]["firstimage"]);
				contentid.push(trip[i]["contentid"]);
				
				let card = $("<div>").addClass("card");		
				let title = $("<h2>").text(trip_title[i]);
				let place = $("<p>").text(trip_addr1[i]);
				card.append(title).append(place);
				card.css("background-image", "url(" + backgroundImage[i] + ")");
				$(".card-container").append(card);
				
				card.click(function(){
					window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
				});
			}
			$("#searchInput").on("keyup", function() {
				let value = $(this).val().toLowerCase();
				
				search(value);		//  검색 
				
				$(".card").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				});
			});
		}
	});
}

function gangnamgu(){
	 $.ajax({	//	데이터 가져오기
	      url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=40&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&arrange=A&contentTypeId=12&areaCode=1&sigunguCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
	      type:"GET",
	      data: {},
	      success: function(result) {
	    	  $(".card-container").empty();
	            var trip = result.response.body.items.item;
	       		var trip_addr1 = [];
	        	var trip_title = [];
	        	var backgroundImage = [];
	        	var contentid = [];
	        	
	        	console.log(contentid);
	        	
	            for(let i = 0; i < trip.length; i++){ // trip.length = total 
	                trip_addr1.push(trip[i]["addr1"]);
	                trip_title.push(trip[i]["title"]);
	                backgroundImage.push(trip[i]["firstimage"]);
	                contentid.push(trip[i]["contentid"]);
	               
	                let card = $("<div>").addClass("card");		
	                let title = $("<h2>").text(trip_title[i]);
	                let place = $("<p>").text(trip_addr1[i]);
	                card.append(title).append(place);
	                card.css("background-image", "url(" + backgroundImage[i] + ")");
	                $(".card-container").append(card);
	                
					card.click(function(){
						window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
					});
	            }
	            $("#searchInput").on("keyup", function() {
	        		let value = $(this).val().toLowerCase();
	        		
	        		search(value);		//  검색 
	        		
	        		$(".card").filter(function() {
	        			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
	        	     });
	             });
	          }
	      });
	 }
*/
/*function hotel(){
	$.ajax({	//	데이터 가져오기
		url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=339&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=32&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
		type:"GET",
		data: {},
		success: function(result) {
			$(".card-container").empty();
			var trip = result.response.body.items.item;
			var trip_addr1 = [];
			var trip_title = [];
			var backgroundImage = [];
			var contentid = [];
			
			for(let i = 0; i < trip.length; i++){ // trip.length = total 
				trip_addr1.push(trip[i]["addr1"]);
				trip_title.push(trip[i]["title"]);
				backgroundImage.push(trip[i]["firstimage"]);
				contentid.push(trip[i]["contentid"]);
				
				let card = $("<div>").addClass("card");		
				let title = $("<h2>").text(trip_title[i]);
				let place = $("<p>").text(trip_addr1[i]);
				
				if (backgroundImage[i] !== "") {	//	api상 사진이 제공되지 않는 경우 
					card.css("background-image", "url(" + backgroundImage[i] + ")");
				}else{
					card.css("background-image", "url(images/cat.jpg)");	
				}
				
				card.append(title).append(place);
				$(".card-container").append(card);
				
				card.click(function(){
					window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
				});
			}
			$("#searchInput").on("keyup", function() {
				let value = $(this).val().toLowerCase();
				
				search(value);		//  검색 
				
				$(".card").filter(function() {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
       	     });
            });
         }
     });
}
	
	function food(){
		$.ajax({	//	데이터 가져오기
			url: "https://apis.data.go.kr/B551011/KorService1/areaBasedList1?numOfRows=100&pageNo=1&MobileOS=ETC&MobileApp=goSeoul&_type=json&listYN=Y&arrange=A&contentTypeId=39&areaCode=1&serviceKey=A37MUkJIHEV23WjpG%2BVAaL0j6wnZYKC6bej9zUYMo1wHfQSWTVWlasJzFBxqSMvDq48CLbTTgT0hAuAfXHwuJg%3D%3D",
			type:"GET",
			data: {},
			success: function(result) {
				$(".card-container").empty();
				var trip = result.response.body.items.item;
				var trip_addr1 = [];
				var trip_title = [];
				var backgroundImage = [];
				var contentid = [];
				
				console.log(contentid);
				
				for(let i = 0; i < trip.length; i++){ // trip.length = total 
					trip_addr1.push(trip[i]["addr1"]);
					trip_title.push(trip[i]["title"]);
					backgroundImage.push(trip[i]["firstimage"]);
					contentid.push(trip[i]["contentid"]);
					
					let card = $("<div>").addClass("card");		
					let title = $("<h2>").text(trip_title[i]);
					let place = $("<p>").text(trip_addr1[i]);
					card.append(title).append(place);
					card.css("background-image", "url(" + backgroundImage[i] + ")");
					$(".card-container").append(card);
					
					card.click(function(){
						window.location.href = "tripDetail_form.do?contentId=" + contentid[i];
					});
				}
				$("#searchInput").on("keyup", function() {
					let value = $(this).val().toLowerCase();
					
					search(value);		//  검색 
					
					$(".card").filter(function() {
						$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
	        	     });
	             });
	          }
	      });
	 }
*/