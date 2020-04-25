<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
/* 슬라이드 css*/
#slide {
	width: 100%;
	min-height: 300px;
	text-align: center;
}

#slide>img {
	width: 80%;
	height: 400px;
	text-align: center;
	border-radius: 20px;
	height: 500px;
}

#next {
	width: 50px;
	height: 50px;
	display: inline-block;
}

#prev {
	width: 50px;
	height: 50px;
	display: inline-block;
}

.btn-direction {
	border: none;
	background: none;
	/*    display: inline-block; */
}
/* 슬라이드css끝 */
#div-recommend {
	text-align: center;
}

#ranking-title, #riview-title {
	padding: 20px;
	text-align: left;
}

h3 {
	margin-left: 50px;
}

.rank-list {
	display: inline-block;
	text-align: left;
}

#center-list {
	margin-left: 120px;
	margin-right: 120px;
}

.product_recommend {
	display: inline-block;
}
.product_recommend>img {
	width: 160px;
	height: 160px;
	margin-right: 60px;
    margin-left: 60px;
}

.recomend_div {
	text-align: center;
}

.center-img{
	margin-left: 150px; 
	margin-right: 150px;
	
}

.prodect_name, .prodect_bname {
	border: 0;
	margin-top: 20px;
	text-align: center;
	outline: none;
	cursor: pointer;	
	background: white;
}

#liveList{
	text-align: center;
}

#reviewList-section, #worryList-section, #HospitalList-section {
	display: inline-block;
}

#reviewList-section>ul>li, #worryList-section>ul>li, #HospitalList-section>ul>li {
	text-align: left;
    width: 290px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    margin-left: 50px;
    margin-right: 50px;
    font-weight: 600;
    cursor: pointer;
    margin-bottom: 10px;
    font-size: 15px;
    border-bottom: 1px solid;
}
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<!-- 작성 -->
		<div id="slide">
			<!-- 슬라이드 -->
			<button class="btn-direction">
				<img id="prev" src="<%=request.getContextPath()%>/resources/images/prev.png">
			</button>
	   <img class="slides" id="slide1" src="<%= request.getContextPath() %>/resources/images/cos-banner1.png">
	   <img class="slides" id="slide2" src="<%= request.getContextPath() %>/resources/images/cos-banner3.png">
	   <img class="slides" id="slide3" src="<%= request.getContextPath() %>/resources/images/cos-banner2.png">
	   <button class="btn-direction"><img id="next" src="<%= request.getContextPath() %>/resources/images/next.png"></button>
   </div><!-- 슬라이드 끝 -->      

    <hr>

		<section id="recommend_section">
			<div id="div-recommend">
				<!-- 랭킹 리스트 -->
				<div id="ranking-title">
					<h3></h3>
				</div>
			</div>
			<div class="recomend_div">
			
			</div>
		</section>
		<br><br><hr>
		<section id="liveList">
			<div id="riview-title">
				<h3>실시간 게시글</h3>
			</div>
			<div id="reviewList-section">
			</div>
			<div id="worryList-section">
			</div>
			<div id="HospitalList-section">
			</div>
		</section>
		<!-- 작성끝 -->
	</div>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url: 'mainViewList.cos',
				success: function(data){
					var count = 0;
					$('.recomend_div').html("");
					for(var i in data){
						$div1 = $('<div class="product_recommend"></div>')
						$img = $('<img>')
						if((data[i].cosmetic_img).indexOf("http") == -1){
							$img.attr('src', "<%= request.getContextPath() %>/cosReq_uploadFiles/" + data[i].cosmetic_img);														
						} else {
							$img.attr('src', data[i].cosmetic_img);							
						}
						// disabled는 따로 function을 지정해주어도 기능이 작동하지 않음
						$input1 = $('<input class="prodect_bname" readonly>').val(data[i].brand_name)
						$input2 = $('<input class="prodect_name" readonly>').val(data[i].cosmetic_name)
						$div1.append($img, $('<br>'), $input1, $('<br>'), $input2);
						$('.recomend_div').append($div1);
						count++;
						console.log(count)
						if(count == 4){break;}						
					}
					$('#ranking-title>h3').text("오늘의 " + data[0].middle_no + " 추천 제품")
					$('.prodect_bname').on('click', function(){
						location.href = "/COSMEDIC/detail.br?bname=" + encodeURIComponent($(this).val())
					})	
					$('.prodect_name').on('click', function(){
						location.href = "/COSMEDIC/detail.cos?cosName=" + encodeURIComponent($(this).val()) + "&category=" + $('#ranking-title>h3').text()
					})	
				}
			})	
			
			$.ajax({
				url:'mainViewList.ri',
				success:function(data){
					console.log(data)
					$('#reviewList-section').html("");
					$ul = $('<ul></ul>');
					for(var i = 0; i < 5; i++){
						if(!data[i]){
							$li = $('<li></li>').text((i+1) + ". [리뷰] 조회된 게시물이 없습니다.");
							$ul.append($li);
						} else {
							$li = $('<li></li>').text((i+1) + ". [리뷰] " + data[i].title);
							$input1 = $('<input type="hidden">').val(data[i].cosmetic_name);
							$input2 = $('<input type="hidden">').val(data[i].middle_name);
							$ul.append($li, $input1, $input2);
						}
						if(i == 4){break;}
					}
					$('#reviewList-section').append($ul);
					$('#reviewList-section>ul>li').on('click', function(){
						if($(this).next().val()==0 || $(this).next().val()==undefined || $(this).next().val()==null){
							
						} else {
							console.log($(this).next().val())
							location.href = "/COSMEDIC/detail.cos?cosName=" + encodeURIComponent($(this).next().val()) + "&category=" + $(this).next().next().val()							
						}
					})
				}
			})
			
			$.ajax({
				url:'mainViewList.wo',
				success:function(data){		
					console.log(data)
					$('#worryList-section').html("");
					$ul = $('<ul></ul>');
					for(var i = 0; i < 5; i++){
						if(!data[i]){
							$li = $('<li></li>').text((i+1) + ". [고민] 조회된 게시물이 없습니다.");
							$ul.append($li);
						} else {
							$li = $('<li></li>').text((i+1) + ". [고민] " + data[i].title);
							$input = $('<input type="hidden">').val(data[i].worryNo)
							$ul.append($li, $input);
						}
						if(i == 4){break;}
					}
					$('#worryList-section').append($ul);
					$('#worryList-section>ul>li').on('click', function(){
						if($(this).next().val()==0 || $(this).next().val()==undefined || $(this).next().val()==null){
							
						} else {
							console.log($(this).next().val())
							location.href = location.href='<%=request.getContextPath() %>/worryDetail.bo?worryNo=' + $(this).next().val()
						}
					})
				}
			})
			
			$.ajax({
				url:'mainViewList.hos',
				success:function(data){		
					console.log(data)
					$('#HospitalList-section').html("");
					$ul = $('<ul></ul>');
					for(var i = 0; i < 5; i++){
						if(!data[i]){
							$li = $('<li></li>').text((i+1) + ". [병원리뷰] 조회된 게시물이 없습니다.");
							$ul.append($li);
						} else {
							$li = $('<li></li>').text((i+1) + ". [병원리뷰] " + data[i].board_title);
							$input = $('<input type="hidden">').val(data[i].user_name);
							$ul.append($li, $input);
						}
						if(i == 4){break;}
					}
					$('#HospitalList-section').append($ul);
					$('#HospitalList-section>ul>li').on('click', function(){
						if($(this).next().val()==0 || $(this).next().val()==undefined || $(this).next().val()==null){
							
						} else {
							location.href = "/COSMEDIC/detail.hos?hosName=" + $(this).next().val()
						}
					})
				}
			})
			
		})
			
		$(function() {
			$('#slide3').hide();
			$('#slide2').hide();

			var currentSlide = 1;
			$('#next').click(function() {
				if (currentSlide == 1) {
					$('#slide1').hide();
					$('#slide2').fadeIn(300);
					currentSlide = 2;
				} else if (currentSlide == 2) {
					$('#slide2').hide();
					$('#slide3').fadeIn(300);
					currentSlide = 3;
				} else if (currentSlide == 3) {
					$('#slide3').hide();
					$('#slide1').fadeIn(300);
					currentSlide = 1;
				}
			});

			var currentSlide = 1;
			$('#prev').click(function() {
				if (currentSlide == 1) {
					$('#slide1').hide();
					$('#slide2').fadeIn(300);
					currentSlide = 2;
				} else if (currentSlide == 2) {
					$('#slide2').hide();
					$('#slide3').fadeIn(300);
					currentSlide = 3;
				} else if (currentSlide == 3) {
					$('#slide3').hide();
					$('#slide1').fadeIn(300);
					currentSlide = 1;
				}
			});
		});
	</script>
	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>