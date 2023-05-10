<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
 <title>Insert title here</title>

<style>
	img {
	  display: flex;
	  margin: 0 auto;
	  max-width: 300px;
	  height: auto;
	  }
   cent {
      text-align: center;
      font-size: 16px;
      font-weight: bold;
    }
 #map {
  position: absolute;
  top: 1000px;
  bottom: 100px;
  width: 600px;
  height: 300px;
	}

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=53dfa7e376b409d44c0d3221cfd4fc2b"></script>
</head>
<body>

<script>
    $(document).ready(function() {
    	const urlParams = new URLSearchParams(window.location.search);
    	const contentId = urlParams.get('contentId');
      $.ajax({
        /* URL에 API에서 가져온 주소값 입력 */
        url: "https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=GoSeoul&_type=json&contentId=2828431&contentTypeId=15&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=20&pageNo=1&serviceKey=9u1LYAg7hOW1YTn138et7L7Q8Qcks2RZvreM6YC011a5iHJrju%2BbgL%2FSP8uU1FE0d3k0K3fqzUuvSEWUu8xndg%3D%3D",
        		/* 
        url: `https://apis.data.go.kr/B551011/KorService1/detailCommon1?MobileOS=ETC&MobileApp=GoSeoul&_type=json&contentId=${contentId}&contentTypeId=15&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&numOfRows=20&pageNo=1&serviceKey=9u1LYAg7hOW1YTn138et7L7Q8Qcks2RZvreM6YC011a5iHJrju%2BbgL%2FSP8uU1FE0d3k0K3fqzUuvSEWUu8xndg%3D%3D`,
        data: {
        	"contentId": contentId
		      },
		       */
        dataType: "json",
        success: function(result) {
          console.log(result);
          console.log(contentId);
          let detail = result.response.body.items.item;
          var mapx=0;
          var mapy=0;
          for (let i = 0; i < detail.length; i++) {
            let dt = detail[i];
            $("<cent>").text(dt.title).appendTo("body");
            $("<img>").attr("src", dt.firstimage).appendTo("body");
            $("<p>").html(dt.overview.replace(/<br\s*[\/]?>/gi, "\n")).appendTo("body");
            $("<p>").html("<b>웹사이트: </b><a href='" + dt.homepage + "'>웹사이트 보기</a>").appendTo("body");
            $("<p>").html("<b>문의처: </b>" + dt.telname + " " + dt.tel).appendTo("body");
            $("<p>").html("<b>주소: </b>" + $("<span>").text(dt.addr1).html()).appendTo("body");
            $("<p>").html("<b>교통 정보: </b>" + $("<span>").text(dt.addr1).html()).appendTo("body");
            $("<p>").html("<b>좌표: </b>" + dt.mapx + " " + dt.mapy).appendTo("body");
            mapx = dt.mapx;
            mapy = dt.mapy;
            
          }
        /*   console.log(mapx);
          console.log(mapy);
          $("#mapx").html(mapx);
          $("#mapy").html(mapy); */
          var mx = parseFloat(mapx);
			var my = parseFloat(mapy);
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(mx, my),
				level: 3
			};
			var map = new kakao.maps.Map(container, options);
		}
	});
});
    
  </script>
<div id="map" style="width:600px;height:300px;"></div>

<!-- 
<div id = "mapx"> </div>
<div id = "mapy"> </div>
	<script>
		var mx = $("#mapx").text();
		var my = $("#mapy").text();
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			/* center: new kakao.maps.LatLng(mx, my), */
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
 -->
  
</body>
</html>
