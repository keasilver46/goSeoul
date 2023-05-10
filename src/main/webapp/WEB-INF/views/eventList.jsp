<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
     <meta charset="UTF-8">
    <title>서울시 행사</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <style>
	.container {
		display: flex;
		flex-wrap: wrap;
		justify-content: left;
		align-items: left;
		height: 80vh;
	}
	
	.menu-1 {
		display: flex;
		flex-direction: column;
		align-items: left;
		width: 100%;
		max-width: 1400px;
		margin: 0 auto;
	}
	
	.card-container {
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		gap: 20px;
		margin-top: 50px;
		row-gap: 20px;
	}
	
	.card {
		display: flex;
		flex-direction: column;
		justify-content: flex-end;
		width: 100%;
		height: 400px;
		border-radius: 8px;
		box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
		overflow: hidden;
		background-size: cover;
		position: relative;
	}
	
	.card h2, .card p {
		padding: 5px;
		margin: 0;
		color: white;
		background-color: rgba(0, 0, 0, 0.3);
		font-size: 14px;
	}
</style>
    
</head>
<body>
  <div class="container">
    <div class="menu-1">
      <h1>서울시 행사 리스트</h1>
      <div id="searchContainer">
        <label for="searchInput">행사명 검색</label>
        <input id="searchInput" type="text" placeholder="Search...">
      </div>
      <div class="card-container"></div>
  
  <script>
    $(document).ready(function() {

      $.ajax({
    	/* URL에 API에서 가져온 주소값 입력 */  
        url: "https://apis.data.go.kr/B551011/KorService1/searchFestival1?numOfRows=200&pageNo=1&MobileOS=ETC&MobileApp=GoSeoul&_type=json&listYN=Y&arrange=A&eventStartDate=20230501&areaCode=1&serviceKey=9u1LYAg7hOW1YTn138et7L7Q8Qcks2RZvreM6YC011a5iHJrju%2BbgL%2FSP8uU1FE0d3k0K3fqzUuvSEWUu8xndg%3D%3D",
        dataType: "json",
        success: function(result) {
        	let events = result.response.body.items.item;
        	events.sort(function(a, b) {
        	  return b.eventstartdate.localeCompare(a.eventstartdate);
        	});
          let cardContainer = $(".card-container");
          let cardRow;
          for (let i = 0; i < events.length; i++) {
            let event = events[i];
            console.log(event.contentid);
            let card = $("<div>").addClass("card");
            let title = $("<h2>").text(event.title);
            let place = $("<p>").text(event.addr1);
            let startDate = new Date(event.eventstartdate.slice(0, 4), event.eventstartdate.slice(4, 6) - 1, event.eventstartdate.slice(6, 8));
            let endDate = new Date(event.eventenddate.slice(0, 4), event.eventenddate.slice(4, 6) - 1, event.eventenddate.slice(6, 8));
            let date = $("<p>").text(startDate.toLocaleDateString("ko-KR") + " ~ " + endDate.toLocaleDateString("ko-KR"));

            let backgroundImage = "url(" + event.firstimage + ")";
            card.append(title).append(place).append(date);
            card.css("background-image", backgroundImage);
            cardRow = $("<div>").addClass("card-row");
            cardContainer.append(cardRow);
            cardRow.append(card);
            card.click(function() {
              window.location.href = "eventDetail.do";
/* 
              card.click(function() {
              window.location.href = "eventDetail.do?contentId=" + event.contentId;
 */
            });
          }
     	  }
      });
      $("#searchInput").on("keyup", function() {
        let value = $(this).val().toLowerCase();
        $(".card").filter(function() {
          $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
      });
    });

  </script>
</body>
</html>