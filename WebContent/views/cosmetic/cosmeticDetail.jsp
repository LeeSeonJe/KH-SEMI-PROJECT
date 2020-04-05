<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#cosmeticArea{margin: 20px; width: 400px; height: 300px;float: left;}
	
	#cosmeticImage{float: left; width: 300px; height: 200px; margin: 20px; }
	
	#tag{background: red; color: white; display: inline-block; border-radius: 20px 20px; padding: 5px;
		margin: 0 0 0 -250px;
	}	
	
	#cosmeticInformation{width: 550px; height:250px; margin: 20px;
						 display: inline-block;}
		
	#point{width: 50px; height: 30px; display: inline-block; margin: 0px 20px;}
	#tt{ text-align:center}  
	
	#cosName{font-size: 30px; display: inline-block; margin: 0 0 0 -470px;}
	
	#brand{ color:red; width:100px; margin: 0 0 0 445px; }
	#capacity{margin:11px 0 0 -680px; display: inline-block; color: gray; width:70px;}
	#money{margin:11px 0 0 -15px; font-weight: bold; display: inline-block; width:70px;} 
	#brandLogo{width: 100px; height:50px; margin: 0 0 0 30px; display: inline-block; }
	#logo{width: 100px; height:50px; display: inline-block; margin: -8px 0 0 -474px;}
	#brand2{margin: 12px -12px 0 -225px; display: inline-block;  width: 100px;}
	.heart{margin:-10px 0 0 888px;}  
	#brandBtn{margin: 0 -94px 0 435px; }
	#category{margin: 10px 0 0 -245px; display: inline-block;  width: 100px;}
	#categoryName{margin: 10px 0 0 20px; display: inline-block; width: 100px;}
	#checkBtn{margin: 0 -138px 0 411px}
	#inform{margin: 55px 85px -44px 461px;  display: block; width:100px; }
	
	#pointName{font-size: 30px; display: block; width: 200px; margin: -638px 0 236px 418px;}
	.hr2{width:700px; display: block; margin: -220px 0 0 492px; }
	.hr1{width:700px; display: block; margin: 212px -52px -140px 491px;}

	#heart-img{width: 25px; height: 25px;}
	#heart1{margin: 0px 0px 20px 0px;}
	#point2{width: 50px; height: 30px; margin: 0px 10px; display: inline-block; clear:both;}	   
	
	#cosmetic-review{width: 520px; height: 50px; float: left;}
	#cosmetic-review-more{width: 250px; height: 50px; float: left; margin: 25px 0px 0px 0px;}
	
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
	#reivew-sort{margin: 11px 0 0 -420px}	
	#cosmetic-review-more{width: 250px; height: 50px; float: left; margin: 70px 0px 0px 130px;
							cursor: pointer; 
							}	
	#cosmetic-review-more:hover{text-decoration: underline;}	
	#review-total{margin:65px 0 20px 260px;}		
	.review-hide{display: none; margin: 10px; float: left;}		
	.review-title{font-size:30px; } 
	
	
	#review-text{width: 580px; height:120px; margin: -5px 10px 10px 10px; border: 1px solid black; clear:both; text-align: left;}
	#review-hate-number{}
	
	.pointArea{ margin: 0 0 0 0;}
	
	#point1{display: inline-block; font-size:15px;margin:0 -89px 0 346px;}
	#point2{display: inline-block; font-size:15px;}
	span.star-prototype, span.star-prototype > * {
    height: 16px; 
    background: url(http://i.imgur.com/YsyS5y8.png) 0 -35px repeat-x;
    width:;
    display: inline-block;
    margin: 5px 0 0 0 ;
    
}
	.button{
    width: 80px;
    height: 40px;
    background-color: skyblue;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    cursor: pointer;
    border-radius:10px;
	}
	.button:hover {
    background-color: blue;
	}
 
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
	
	




#cosmetic-beauty-filter {
	margin: 0 0 0 -650px;
	display: inline-block;
    border: 1px solid #ccc;
    padding-left: 18px;
    background-color: #F8F8F8;
    height: 645px;
    width: 395px
}

#cosmetic-beauty-filter-header>h3 {
	display: inline-block;
}

input {
	position: relative;
}

.radioChk+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 19px;
	background-color: white;
	border: 1px solid #ccc;
	font-size: 16px !important;
	width: 110px;
	text-align: center;
	position: relative;
	left: -14px;
}

.radioChkActive+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 19px;
	background-color: white;
	border: 1px solid red;
	font-size: 16px !important;
	width: 110px;
	text-align: center;
	position: relative;
	left: -14px;
}

.chkboxChk+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 19px;
	background-color: white;
	border: 1px solid #ccc;
	font-size: 16px !important;
	width: 110px;
	text-align: center;
	position: relative;
	left: -14px;
}

.chkboxChkActive+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 19px;
	background-color: white;
	border: 1px solid red;
	font-size: 16px !important;
	width: 110px;
	text-align: center;
	position: relative;
	left: -14px;
}


#select-btn-center {
	margin-right: 15px;
    text-align: center;
}

#reset-btn {
    margin-left: 260px;
    border: 0;
    background-color: #F8F8F8;
}

#select-btn {
    width: 144px;
    height: 58px;
    background: red;
    color: white;
    font-size: 16px;
    font-weight: 900;
    border-radius: 6px;
    border: 1px solid red;
}

#filter-form {
	display: inline-flex;
	margin-top: 50px;
}

#filter-form>section#cosmetic-filter {
	display: inline-flex;
}

#filter-form>section#cosmetic-category {
	display: block;
	margin-left: 50px;
}
</style>

<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<div id="tt">
		<section>
		<div id="cosmeticArea">
			<div id="tag">스킨 1위</div>
			<div><img src="<%= request.getContextPath() %>/resources/images/cosmetic.PNG" id="cosmeticImage"></div>
		</div>
		<div id="brand">코스알엑스</div>
		<div id="cosName">풀핏 프로폴리스 시너지 토너</div>
		<br> 
		<div id="capacity">280ml / </div>
		<div id="money">22,000원</div>
		<div class="pointArea">
				<div id="point1">
					(4.5)
				</div>
					<span class="star-prototype">4.5</span>
				<div id="point2">
					(147)
				</div>
			</div>
		<br><br>
		<div id="brandLogo"><img src="<%= request.getContextPath() %>/resources/images/brand.PNG" id="logo"></div>
		<div id="brand2">코스알엑스</div>
		<button class="button" id="brandBtn">브랜드 홈</button>
		<br><br>
		<div id="category">카테고리</div>
		<div id="categoryName">스킨</div>
		<button class="button" id="checkBtn" onclick="location.href='<%= request.getContextPath() %>/views/cosmetic/cosmeticRank.jsp' ">랭킹 확인</button>
		<br><br>
		<div id="inform">설명</div>
		<div id="cosmeticInformation"><pre>
지친 피부에 생기와 활력을 더하는 복합 처방 풀 핏! 끈적이지 않는 고보습, 
 모든 피부를 위한 사계절 데일리 토너
				
- 강인한 생명력을 지닌 검은 벌 프로폴리스추출물 72.6%와 
    꿀추출물 10% 함유로 고보습 케어	
- 끈적이지 않는 텍스처로 피부에 빠르게 흡수되고 흡수 후에는 
    산뜻하고 촉촉하게 마무리 되는 사계절 데일리 보습 토너
- 외부 환경에 자극 받은 피부, 예민한 피부에 탁월한 보습과 
    진정효과를 부여하는 저자극 토너</pre>
		</div>
		<br><br>
		<hr id="hr1">
		<br><br>
		
		<form id="filter-form" action="#">
			<section id="cosmetic-filter">
				<div id="cosmetic-beauty-filter">
					<div id="cosmetic-beauty-filter-header">
						<h3>필터</h3>
						<button id="reset-btn" type="reset">초기화</button>
					</div>
					<br>
					<div id="cosmetic-beauty-filter-select">
					<fieldset id="sex-fieldset">
						<legend>
							<h4>성별</h4>
						</legend>
							<input type="radio" id="filter-sex-all" class="radioChkActive" name="filter-sex" value="filter-sex-all" checked="checked"/> <label for="filter-sex-all">전체</label>
							<input type="radio" id="filter-sex-female" class="radioChk" name="filter-sex" value="filter-sex-female"/> <label for="filter-sex-female">여자</label>
							<input type="radio" id="filter-sex-male" class="radioChk" name="filter-sex" value="filter-sex-male"/> <label for="filter-sex-male">남자</label>						
					</fieldset>
					<br>
					<fieldset>
						<legend>
							<h4>연령대</h4>
						</legend>
							<input type="checkbox" id="filter-age-all" class="chkboxChkActive" name="filter-age-all" value="filter-age-all" checked="checked" /> <label for="filter-age-all">전체</label>
							<input type="checkbox" id="filter-age-10" class="chkboxChk" name="filter-age" value="filter-age-10" /> <label for="filter-age-10">10대</label>
							<input type="checkbox" id="filter-age-20u" class="chkboxChk" name="filter-age" value="filter-age-20u" /> <label for="filter-age-20u">20대 초반</label>	
							<br><br>
							<input type="checkbox" id="filter-age-20d" class="chkboxChk" name="filter-age" value="filter-age-20d" /> <label for="filter-age-20d">20대 후반</label>	
							<input type="checkbox" id="filter-age-30" class="chkboxChk" name="filter-age" value="filter-age-30" /> <label for="filter-age-30">30대 초반</label>	
							<input type="checkbox" id="filter-age-30u" class="chkboxChk" name="filter-age" value="filter-age-30u" /> <label for="filter-age-30u">30대 후반</label>	
					</fieldset>
					<br>
					<fieldset>
						<legend>
							<h4>피부타입</h4>
						</legend>
							<input type="checkbox" id="filter-skinType-all" class="chkboxChkActive" name="filter-skinType-all" value="filter-skinType-all"/> <label for="filter-skinType-all">전체</label>
							<input type="checkbox" id="filter-skinType-dry" class="chkboxChk" name="filter-skinType" value="filter-skinType-dry"/> <label for="filter-skinType-dry">건성</label>
							<input type="checkbox" id="filter-skinType-oily" class="chkboxChk" name="filter-skinType" value="filter-skinType-oily"/> <label for="filter-skinType-oily">지성</label>	
							<br><br>
							<input type="checkbox" id="filter-skinType-neutral" class="chkboxChk" name="filter-skinType" value="filter-skinType-neutral"/> <label for="filter-skinType-neutral">중성</label>	
							<input type="checkbox" id="filter-skinType-combi" class="chkboxChk" name="filter-skinType" value="filter-skinType-combi"/> <label for="filter-skinType-combi">복합성</label>	
							<input type="checkbox" id="filter-skinType-sensitive" class="chkboxChk" name="filter-skinType" value="filter-skinType-sensitive"/> <label for="filter-skinType-sensitive">민감성</label>	
					</fieldset>
					<br><br>
					<div id="select-btn-center">
						<button id="select-btn" type="submit">필터적용</button>
					</div>
					<br>
					</div>
				</div>
			</section>
		</form>	
		<br>
		
		<div id="hospitalPoint">
			<div id="pointName">평점</div>
			<hr class="hr2">
			<hr class="hr1"> 
		</div>

		<div>
			<div id="heart2">(4.5) <span class="star-prototype">4.5</span>(147)</div>
		</div>

		<br><br><br><br><br>
		<div id="review-total">
		<div id="cosmetic-review"class="review-title">리뷰</div>
		<select id="reivew-sort">
			<option>최신 순</option>
			<option>좋아요 많은 순</option>
			<option>평점 순</option>
		</select>
		<div id="cosmetic-review-more">리뷰 더 보기</div>
		<br><br><br><br><br>

		
		
		
		<div id="review-list">
			<div class="review">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<span class="star-prototype" id="review-star">4.5</span>
					<div class="review" id="review-like"><img src="<%= request.getContextPath() %>/resources/images/like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="<%= request.getContextPath() %>/resources/images/hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div>
			<div class="review">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<span class="star-prototype" id="review-star">4.5</span>
					<div class="review" id="review-like"><img src="<%= request.getContextPath() %>/resources/images/like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="<%= request.getContextPath() %>/resources/images/hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div>
			<div class="review">
				<div>
					<div class="review" id="review-writer">작성자</div>
					<div class="review" id="review-point1">평점</div>
					<div class="review" id="review-point2">4.3</div>
					<span class="star-prototype" id="review-star">4.5</span>
					<div class="review" id="review-like"><img src="<%= request.getContextPath() %>/resources/images/like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="<%= request.getContextPath() %>/resources/images/hate.png" id="hateImage">별로에요</div>
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
					<div class="review" id="review-like"><img src="<%= request.getContextPath() %>/resources/images/like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="<%= request.getContextPath() %>/resources/images/hate.png" id="hateImage">별로에요</div>
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
					<div class="review" id="review-like"><img src="<%= request.getContextPath() %>/resources/images/like.PNG" id="likeImage">좋아요</div>
					<div class="review" id="review-like-number">326</div>
					<div class="review" id="review-hate"><img src="<%= request.getContextPath() %>/resources/images/hate.png" id="hateImage">별로에요</div>
					<div class="review" id="review-hate-number">17</div>
				</div>
				
				<div class="review" id="review-text">리뷰 내용을 여기다가 줄줄줄ㅈ루 주 ㄹ주주룾룾루</div>
			</div>

		  
    
	</div>
		</div>
		
		
		</section>
		</div>
		
		<script> 
			$(function(){
				$('#book').click(function(){
					open("#","이름" );
				});
				
				$('#cosmetic-review-more').click(function(){
					$('.review-hide').show(100);
				});	
				
				$.fn.generateStars = function() {
				    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*16));});
				};

				// 숫자 평점을 별로 변환하도록 호출하는 함수
				$('.star-prototype').generateStars();
				
			});
			

			$('input[name=filter-sex]').click(function() {
				if ($(this)[0].value == "filter-sex-all") {
					$('input[name=filter-sex]').addClass('radioChk')
					$('input[name=filter-sex]').removeClass('radioChkActive')
					$(this).addClass('radioChkActive')
				} else if ($(this)[0].value == "filter-sex-female") {
					$('input[name=filter-sex]').addClass('radioChk')
					$('input[name=filter-sex]').removeClass('radioChkActive')
					$(this).addClass('radioChkActive')
				} else if ($(this)[0].value == "filter-sex-male") {
					$('input[name=filter-sex]').addClass('radioChk')
					$('input[name=filter-sex]').removeClass('radioChkActive')
					$(this).addClass('radioChkActive')
				}
			})
			
			$('#filter-age-all').click(function(){
				if ($(this)[0].value == "filter-age-all") {
					console.log($(this)[0].value)
					$('#filter-age-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
					$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
				}
			})
		
			$('input[name=filter-age]').click(function(){
				var chk = document.getElementsByName('filter-age');
				var chkAll = document.getElementById('filter-age-all');
				var count = 0;
				$('#filter-age-all').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
				for (var i = 0; i < chk.length; i++) {
					if (chk[i].checked) {
						chk[i].classList.add("chkboxChkActive")
						count++;
					} 		
					if(!chk[i].checked) {
						chk[i].classList.remove("chkboxChkActive")
						chk[i].classList.add("chkboxChk")
					}
				}
				if (count == chk.length) {
					$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive")
					$('#filter-age-all').prop("checked", true).addClass("chkboxChkActive");
				} else if (count == 0) {
					$('#filter-age-all').prop("checked", true).addClass("chkboxChkActive");
				}
			})
			
			$('#filter-skinType-all').click(function(){
				if ($(this)[0].value == "filter-skinType-all") {
					console.log($(this)[0].value)
					$('#filter-skinType-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
					$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
				}
			})
		
			$('input[name=filter-skinType]').click(function(){
				var chk = document.getElementsByName('filter-skinType');
				var chkAll = document.getElementById('filter-skinType-all');
				var count = 0;
				$('#filter-skinType-all').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
				for (var i = 0; i < chk.length; i++) {
					if (chk[i].checked) {
						chk[i].classList.add("chkboxChkActive")
						count++;
					} if(!chk[i].checked) {
						chk[i].classList.remove("chkboxChkActive")
						chk[i].classList.add("chkboxChk")
					}
				}
				if (count == chk.length) {
					$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive")
					$('#filter-skinType-all').prop("checked", true).addClass("chkboxChkActive");
				} else if (count == 0) {
					$('#filter-skinType-all').prop("checked", true).addClass("chkboxChkActive");
				}
			})
			
			$('#reset-btn').click(function(){
				$('input[name=filter-sex]').addClass('radioChk').removeClass("radioChkActive")
				$("#filter-sex-all").prop("checked", true).addClass("radioChkActive")
				$('#filter-age-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
				$('#filter-skinType-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			})
			
			
		</script>
		
		
		
	</div>
	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>