<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hospital.model.vo.Hospital"%>
<%
	Hospital h = (Hospital) request.getAttribute("h");

	String[] images = h.getHospital_img().split(",");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#all{text-align: center;}
	.title{font-size: 30px;}
	#hospitalName{font-size: 30px; margin-left: 350px; width:400px;}
	#pointName{width: 250px; height: 50px; float: left; margin: 2px 30px 0px -106px;}
	#hospital-location{width: 420px; height: 50px; float: left; margin: 45px 0 0 -121px;}
	#hospital-review{width: 520px; height: 50px; float: left;margin: 44px 0 0 42px;}
	#hospital-review-more{width: 250px; height: 50px; float: left; margin: 70px 0px 0px 130px;
							cursor: pointer; 
							}
	#hospital-review-more:hover{text-decoration: underline;}							
	.pointArea{ margin: 0 0 0 0; float: right; font-size: 15px;}
	
	#point1{display: inline-block; font-size:20px;}
	#point2{display: inline-block; font-size:20px;}
	
	/* 별점 CSS */
	span.star-prototype, span.star-prototype > * {
			height: 16px; 
			background: url(<%= request.getContextPath()%>/resources/images/heartAvg.png) 0 -16px repeat-x;
			width: 80px;
			display: inline-block;
			text-align: left;
	}
	
	span.star-prototype > * {
		background-position: 0 0;
		max-width:80px; 
	}
	
	.heartPosition {
		display: inline-block;
		vertical-align: middle;
	}
	
	.heartPosition2 {
		display: inline-block;
		vertical-align: middle;
	}
	
	#hospitalImage{float: left; width: 400px; height: 350px;}
	#hospitalInformation{width: 600px; height:250px; margin: 20px; border: 1px solid black;
						 display: inline-block; clear:both; text-align: left;
	}
	#book{width: 300px; height: 100px; font-size: 2em; margin:78px 20px 0px 60px;
		  float:left;  
	}
	#hospitalPoint{font-size: 26px; width: 600px; height: 100px;
					display: inline-block; margin: 0px 0px 0px 80px; padding: 30px 0px; clear:both;
					} 

	#heart-img{width: 25px; height: 25px;}
	#heart1{margin: 0px 0px 20px 0px;}
	   
	#map{width: 450px; height: 400px; float: left;}
	
	#review-list{display: inline-block; width: 630px;}
	.review{display: inline-block;}				
	#review-writer{margin}	
	#review-point1{margin: 0 0 0 70px; width: 30px;}	 	 	
	#review-point2{margin: 0 0 0 5px; width: 30px;}
	#review-star{margin: 0px 100px 0 -90px;}
	#likeImage{width: 20px; height:20px; margin: 0 5px 6px 0;}	
	#hateImage{width: 20px; height:20px; margin: 1px 4px 2px 17px;}	
	#review-like{margin: 20px 0 2px 0; width: 70px;}
	#review-like-number{margin: 0 0 0 0; width: 50px;}				
	#review-hate{margin: 20px 0 2px 0; width: 100px;}				
	#review-hate-number{margin: 0 0 0 0; width: 50px;}				
	.review-hide{display: none; margin: 10px; float: left;}		
	#review-text{width: 580px; height:120px; margin: -5px 10px 10px 10px; border: 1px solid black; clear:both; text-align: left;}
	#review-hate-number{}
	
	#heart{font-size: 0.5em;}

	.button{
    width: 180px;
    height: 140px;
    background-color: rgb(35, 82, 124);
    border: none;
    color:#fff;
    padding: 30px;
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    display: inline-block;
    font-size: 13px;
    cursor: pointer;
    border-radius:10px;
	}
	.button:hover {
    background-color: blue;
	}
	
	.home__slider{
		float: left; 
		width: 450px; 
		height: 350px;
	}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"> 
<script src="https://code.jquery.com/jquery-1.11.3.js"></script> 
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script> 
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f198d7f218db4a29813c5a3b81c52fc&libraries=services"></script>
<script> 
var j = $.noConflict(true); // $.noConflict(true) 를 사용해서 $ -> 변수로 선언한 j로 바꾸니 해결!
j(document).ready(function(){ 
    var main = j('.bxslider').bxSlider({ 
    mode: 'fade', 
    auto: true,	//자동으로 슬라이드 
    controls : true,	//좌우 화살표	
    autoControls: true,	//stop,play 
    pager:true,	//페이징 
    pause: 3000, 
    autoDelay: 0,	
    slideWidth: 400, 
    speed: 300, 
    stopAutoOnclick:true
}); 

j(".bx-stop").click(function(){	// 중지버튼 눌렀을때 
    main.stopAuto(); 
    j(".bx-stop").hide(); 
    j(".bx-start").show(); 
    return false; 
}); 

j(".bx-start").click(function(){	//시작버튼 눌렀을때 
    main.startAuto(); 
    j(".bx-start").hide(); 
    j(".bx-stop").show(); 
    return false; 
}); 

j(".bx-start").hide();	//onload시 시작버튼 숨김. 
}); 
</script>

<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section>
		<div id="all">
		<div class="home__slider"> 
		    <div class="bxslider"  id="hospitalImage">
		    	<% for(int i=0; i<images.length; i++){ %> 
			        <div><img src="<%= request.getContextPath() %>/hospital_images/<%=images[i]%>" alt="그림<%= i %>" id="hospitalImage"></div>
		        <% } %> 
		    </div> 
		</div> 
		<div id="hospitalName" class="title"><%= h.getUser_name() %></div>
		<div id="hospitalInformation"><%= h.getHospital_about() %></div>
		
		<br><br>
		
		<div id="book" onclick="book();" class="button" >병원 예약 하기</div>
		<br>
		<div id="hospitalPoint">
			<div id="pointName" class="title">병원 평점</div>
			<div class="pointArea">
				<div id="point1">
					<span>(<%= h.getHospital_heart() %>)</span>
				</div>
				<div class="heartPosition">
					<span class="star-prototype"><%= h.getHospital_heart() %></span>
				</div>	
				<div id="point2">
					<span>(<%= (int)h.getReview_count() %>)</span>
				</div>
			</div>
		</div>
		<br><br><br><br>
		<div id="hospital-location" class="title">오시는 길</div>
		<div id="hospital-review" class="title">병원 리뷰</div>
		<div id="hospital-review-more">리뷰 더 보기</div>
		<br><br><br><br><br>
		
		<!-- <div id="map"><img src="mapp.PNG" id="mapPhoto"></div> -->
		
		<div id="map"></div>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
           level: 3 // 지도의 확대 레벨
       };  
   
      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption); 
      
      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();
      
      // 주소로 좌표를 검색합니다
      var url = "";
      geocoder.addressSearch('<%= h.getAddress() %>', function(result, status) {
          // 정상적으로 검색이 완료됐으면 
           if (status === kakao.maps.services.Status.OK) {
      
              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            url = "https://map.kakao.com/link/roadview/" + result[0].y + "," + result[0].x;
              // 결과값으로 받은 위치를 마커로 표시합니다
              var marker = new kakao.maps.Marker({
                  map: map,
                  position: coords
              });
      
              // 인포윈도우로 장소에 대한 설명을 표시합니다
              var infowindow = new kakao.maps.InfoWindow({
                  content: '<div class="location" style="width:150px; text-align:center; padding:6px 0;"><a target="_blank"><%= h.getUser_name()%></a></div>'
              });
              infowindow.open(map, marker);
      
              // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              map.setCenter(coords);
          } 
          $('.location>a').attr("href", url);
      });      
   </script>
		<div id="review-list">
			<div class="review">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<div class="heartPosition2">
						<span class="star-prototype" id="review-star">4.5</span>
					</div>
					<div class="review" id="review-like"><img src="like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div><div class="review">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<div class="heartPosition2">
						<span class="star-prototype" id="review-star">4.5</span>
					</div>
					<div class="review" id="review-like"><img src="like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div><div class="review">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<div class="heartPosition2">
						<span class="star-prototype" id="review-star">4.5</span>
					</div>
					<div class="review" id="review-like"><img src="like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div>
			<div class="review-hide">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<div class="heartPosition2">
						<span class="star-prototype" id="review-star">4.5</span>
					</div>
					<div class="review" id="review-like"><img src="like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div><div class="review-hide">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<div class="heartPosition2">
						<span class="star-prototype" id="review-star">4.5</span>
					</div>
					<div class="review" id="review-like"><img src="like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div>
		</div>
		</div>
<script>
	$(function(){
		$('#book').click(function(){
			open("#","이름" );
		});
		
		$('#hospital-review-more').click(function(){
			$('.review-hide').show(100);
		});	
		
		
		$.fn.generateStars = function() {
		    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
		
	});
	function book(){
		window.open("<%=request.getContextPath()%>/views/hospital/hospitalBook.jsp", 'book', 'width=650, height= 800');	
	}
</script>
		</section>
	</div>
	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>