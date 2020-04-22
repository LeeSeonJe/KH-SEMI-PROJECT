<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
/* 슬라이드 */
#slide{width: 100%; height: 400px; background: #d1dbef; position: relative;}

.btns{width: 50px; height: 50px; margin-top: 165px;}
#next{position: absolute; margin-left: 1032px; }
#prev{position: absolute;}


	#div-ranklist{text-align:center;}
	#ranking-title{padding: 20px; text-align: left;}
	h3{margin-left: 30px;}
	.rank-list1{display: inline-block; text-align: center; margin-top: 40px;}	
	.rank-list2{display: inline-block; text-align: center; margin-top: 40px;}	
	#rank2{margin-left: 80px; margin-right: 80px;}
	#rank5{margin-left: 80px; margin-right: 80px;} 
	
	.review-shots{width: 180px; height: 100px;}
/* 슬라이드 끝 */
#select-option {
	text-align: right;
}

.tb-profile {
	display: inline-block;
	padding: 15px;
	margin-left: 80px;
}

.icon-p {
	width: 50px;
	height: 50px;
	margin-top: 10px;
}

.p-nick {
	margin-top: 10px;
}

.tb-content {
	display: inline-block;
	margin-left: 50px;
	margin-bottom: 20px;
}

.p-content {
	margin-bottom: 10px;
	margin-top: 10px;
}

.icon-h {
	width: 25px;
	height: 25px;
}

.tb-product {
	display: inline-block;
	margin-left: 80px;
}

.icon-product {
	width: 80px;
	height: 70px;
	margin-top: 10px;
}

.pro-name {
	margin-top: 10px;
	text-align: center;
}

.timing {
	display: inline-block;
	margin-left: 100px;
	margin-bottom: 20px;
}

.thumb {
	width: 25px;
	height: 25px;
}

.th-comment {
	margin-left: 50px;
}
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
			<!-- 작성 -->
	<div id="slide"><!-- 베스트리뷰 슬라이드 -->

			<div id="div-btns">
				<img class="btns" id="next" src="/cosMedic/resources/images/next.png">
				<img class="btns" id="prev" src="/cosMedic/resources/images/prev.png">
			</div>
			
		<div id="div-ranklist"><!-- 리스트 -->
		<div id="ranking-title"><h3 style="color:white">지금 뜨는 리뷰</h3></div>

			<ol class="rank-list1" id="rank1">
				<li><img src="fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목1입니다. 리뷰제목1입니다.<br>
				제목이 길어지면 내려갑니다. 안녕하세요??</li>

			</ol>
			<ol class="rank-list1" id="rank2">
				<li><img src="fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목2입니다. 리뷰제목2입니다.<br>
				제목이 길어지면 내려갑니다. 안녕하세요??</li>
			</ol>
			<ol class="rank-list1" id="rank3">
				<li><img src="fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목3입니다. 리뷰제목3입니다.<br>
				제목이 넘 길어서 한줄 내려갑니다. </li>
			</ol>
 			<ol class="rank-list2" id="rank4">
				<li><img src="fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목4444. 리뷰제목4444.<br>
				제목이 길어지면 내려갑니다. 안녕하세요??</li>

			</ol>
			<ol class="rank-list2" id="rank5">
				<li><img src="fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목5555. 리뷰제목5555.<br>
				제목이 길어지면 내려갑니다. 안녕하세요??</li>
			</ol>
			<ol class="rank-list2" id="rank6">
				<li><img src="fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목6666. 리뷰제목6666.<br>
				제목이 넘 길어서 한줄 내려갑니다. </li>
			</ol> 		
	</div><!-- 리스트끝 -->
<script type="text/javascript">

$(function(){
	$('.rank-list2').hide();
	/* $('#slide2').hide(); */


 	var currentSlide = 1;
	$('#next').click(function(){
		if(currentSlide == 1){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 2;		
		}else if(currentSlide ==2){
			$('.rank-list2').hide();
			$('.rank-list1').fadeIn(300);
 			currentSlide = 3;
		}else if(currentSlide == 3){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 1; 
		}});
	
 	var currentSlide = 1;
	$('#prev').click(function(){
		if(currentSlide == 1){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 2;		
		}else if(currentSlide ==2){
			$('.rank-list2').hide();
			$('.rank-list1').fadeIn(300);
 			currentSlide = 3;
		}else if(currentSlide == 3){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 1; 
		}});
	});
</script>	
	</div><!-- 베리슬라이드 끝 -->		
<hr>
	<div><!-- 리뷰 리스트 -->
		<div><h3>리뷰</h3></div>
		<div id="select-option">
		<select name="filter">
			<option value="latest">최신순</option>
			<option value="oldest">오래된 순</option>
			<option value="loved">좋아요 많은 순</option>
			<option value="unloved">좋아요 적은 순</option>
		</select>
		</div>
	<hr>
		<div class="reviews" id="review1">
			<table class="tb-profile">
				<tr>
					<td><img src="프사.png" class="icon-p"></td>
				</tr>
				<tr>
					<td><p class="p-nick">닉네임1</p></td>
				</tr>
			</table>
			<table class="tb-content">
				<tr>
					<td>리뷰제목</td>
				</tr>
				<tr>
					<td><p class="p-content">리뷰내용간략히...</p></td>
				</tr>
				<tr>
					<td>연령대 / 피부타입 / 성별 &nbsp;&nbsp; 
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
					</td>
				</tr>
			</table>
			<table class="tb-product">
				<tr>
					<td><img src="makeup.png" class="icon-product"></td>
				</tr>
				<tr>
					<td><p class="pro-name">제품명1</p></td>
				</tr>
			</table>
			<table class="timing">
				<tr>
					<td rowspan=2><p>1초 전</p></td>					
					<td><p class="th-comment"><img src="따봉.png" class="thumb"> &nbsp;&nbsp;좋아요</p></td>
					<td><p class="count">( 1 )</p></td>
				</tr>
				<tr>
					<td><p class="th-comment"><img src="역따봉.png" class="thumb"> &nbsp;&nbsp;별로에요 &nbsp;</p></td>
					<td><p class="count">( 1 )</p></td>
				</tr>				
			</table>
			

		</div>
	<hr>	
		<div class="reviews" id="review2">
			<table class="tb-profile">
				<tr>
					<td><img src="프사.png" class="icon-p"></td>
				</tr>
				<tr>
					<td><p class="p-nick">닉네임2</p></td>
				</tr>
			</table>	
			<table class="tb-content">
				<tr>
					<td>리뷰제목</td>
				</tr>
				<tr>
					<td><p class="p-content">리뷰내용간략히...</p></td>
				</tr>
				<tr>
					<td>연령대 / 피부타입 / 성별 &nbsp;&nbsp; 
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
						<img src="빈하트.png" class="icon-h">
					</td>
				</tr>
			</table>
			<table class="tb-product">
				<tr>
					<td><img src="makeup.png" class="icon-product"></td>
				</tr>
				<tr>
					<td><p class="pro-name">제품명1</p></td>
				</tr>
			</table>
			<table class="timing">
				<tr>
					<td rowspan=2><p>1초 전</p></td>					
					<td><p class="th-comment"><img src="따봉.png" class="thumb"> &nbsp;&nbsp;좋아요</p></td>
					<td><p class="count">( 1 )</p></td>	
				</tr>
				<tr>
					<td><p class="th-comment"><img src="역따봉.png" class="thumb"> &nbsp;&nbsp;별로에요 &nbsp;</p></td>
					<td><p class="count">( 1 )</p></td>
				</tr>				
			</table>			
			
			
			
			
		</div>
	</div>		
			
			
	<!-- 작성 끝 -->
	</div>

	<%@ include file="/views/layout/footer.jsp"%>

	<script src="../../resources/js/main.js"></script>
</body>
</html>