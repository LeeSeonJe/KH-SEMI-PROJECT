<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	.pointArea{ margin: 0 0 0 0;}
	
	#point1{display: inline-block; font-size:20px;}
	#point2{display: inline-block; font-size:20px;}
	span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -35px repeat-x;
    width: 100px;
    display: inline-block;
    margin: 5px 91px 0 85px ;
	}
	span.star-prototype > * {
    background-position: 0 0;
    max-width:80px; 
	}
	
	#hospitalImage{float: left; width: 400px; height: 300px; margin: 20px;}
	#hospitalInformation{width: 600px; height:250px; margin: 20px; border: 1px solid black;
						 display: inline-block; clear:both; text-align: left;
	}
	#book{width: 300px; height: 100px; font-size: 2em; margin:20px 20px 0px 60px;
		  float:left;  
	}
	#hospitalPoint{font-size: 26px; width: 600px; height: 100px;
					display: inline-block; margin: 0px 0px 0px 80px; padding: 30px 0px; clear:both;
					} 
		
	  
	
	  


	#heart-img{width: 25px; height: 25px;}
	#heart1{margin: 0px 0px 20px 0px;}
	   
	
	#map{width: 400px; height: 300px; margin: 20px; float: left;}
	#mapPhoto{width: 400px; height: 300px; float: left;}
	
	
	
	
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



</style>

<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section>
		<div id="all">
		<img src="hospital.jpg" id="hospitalImage">
		<div id="hospitalName" class="title">병원 이름</div>
		<div id="hospitalInformation">병원 상세 설명을 여기다 줄줄줄  줄줄 줄병원 상세 설명을 여기다 줄줄줄  줄줄 줄병원 상세 설명을 여기다 줄줄줄  줄줄 줄병원 상세 설명을 여기다 줄줄줄  줄줄 줄</div>
		
		<br><br>
		
		<div id="book" onclick="book();" class="button" >병원 예약 하기</div>
		<br>
		<div id="hospitalPoint">
			<div id="pointName" class="title">병원 평점</div>
			<div class="pointArea">
				<div id="point1">
					(4.5)
				</div>
					<span class="star-prototype">4.5</span>
				<div id="point2">
					(147)
				</div>
			</div>
		</div>
		<br><br><br><br>
		<div id="hospital-location" class="title">오시는 길</div>
		<div id="hospital-review" class="title">병원 리뷰</div>
		<div id="hospital-review-more">리뷰 더 보기</div>
		<br><br><br><br><br>
		<div id="map"><img src="mapp.PNG" id="mapPhoto"></div>
		
		
		
		
		<div id="review-list">
			<div class="review">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<span class="star-prototype" id="review-star">4.5</span>
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
					<span class="star-prototype" id="review-star">4.5</span>
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
					<span class="star-prototype" id="review-star">4.5</span>
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
					<span class="star-prototype" id="review-star">4.5</span>
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
					<span class="star-prototype" id="review-star">4.5</span>
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
				window.open('hospitalBook.jsp', 'book', 'width=650, height= 800');	
			}
		</script>
		
		
		
		
		
		
		
		
		
		
		</section>
		
		
		
		
		
		
		
		
	</div>
	<%@ include file="/views/layout/footer.jsp"%>

	<script src="/cosMedic/resources/js/main.js"></script>
</body>
</html>