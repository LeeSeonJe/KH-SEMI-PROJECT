<%@page import="hospital.model.vo.HospitalReviewList"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="hospital.model.vo.Hospital"%>
<%
	Hospital h = (Hospital) request.getAttribute("h");
	String[] images = h.getHospital_img().split(",");
	ArrayList<HospitalReviewList> hrlList = (ArrayList<HospitalReviewList>) request.getAttribute("hrlList");
// 	Member hos_loginUser = (Member) session.getAttribute("loginUser");
// 	System.out.println("hospital.jsp : " + hos_loginUser.getUser_id());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#all {
	width: 100%;
}

#hospitalName {
	display: inline-block;
}

#hospital-location {
	font-size: 23px;
}

#point1 {
	display: inline-block;
}

#point2 {
	display: inline-block;
	
}

/* 별점 CSS */
span.star-prototype, span.star-prototype>* {
	height: 16px;
	background: url(<%=request.getContextPath()%>/resources/images/heartAvg.png) 0 -16px repeat-x;
	width: 80px;
	display: inline-block;
	text-align: left;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 80px;
}

.heartPosition {
	display: inline-block;
	vertical-align: middle;
}

.hospitalImage {
	height: 400px;
}

#hospitalPoint {
	float: right;
}

#map {
	width: 450px;
	height: 400px;
	display: inline-block;
}

.button {
	width: 180px;
    height: 80px;
    background-color: rgb(35, 82, 124);
    border: none;
    color: #fff;
    padding-top: 23px;
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    display: inline-block;
    font-size: 22px;
    cursor: pointer;
    border-radius: 10px;
}

.button:hover {
	background-color: #337ab7;
}

.home__slider {
	display: inline-block;
    width: 430px;
}

<!--리뷰부분 -->
.review_list {
	border-bottom: 1px solid #ebd3d3;
	margin-bottom: 40px;
}

.userInfo>div>img {
	width: 50px;
	height: 50px;
	border-radius: 20px;
}

.userDetail, .userProfile_name {
	margin-bottom: 10px;
}

.userDetail>span {
	font-size: 14px;
	margin-left: 10px;
}

.userDetail>span>img {
	width: 15px;
	height: 15px;
}

/* 리뷰크기  */
.userReview>h3 {
	margin-bottom: 20px;
}

.wName {
	margin-left: 20px;
	font-size: 20px;
}

#hospitalInfo_div {
	display: inline-block;
    width: 60%;
 	margin-left: 17px;
}

#hospital-review {
	display: inline-block;
    width: 55%;
    vertical-align: top;
    margin-left: 30px;
}

#hospital-review>h2 {
	margin-top: 0px;
	margin-bottom: 10px;
}

.userInfo>div>img { 
	width:50px;
	height: 50px;
	border-radius: 20px;
}

div>.wDate {
	float: right;
    margin-top: 13px;
}

/* 리뷰크기  */
.review_ta {
/* 	width:850px; */
	min-height:32px;
	overflow-y:hidden;
	border: 0;
	resize: none;
	font-size: 16px;
    width: 76vh;
    background: white;
}

/* 리뷰 클릭시 나오는 아웃라인 제거 */
.review_ta:focus {
	outline: none;
}

/* 리뷰 전체 글씨크기  및 리뷰사이의 거리*/
.userReview {
	font-size: 28px;
    border-bottom: 1px solid #ebd3d3;
    margin-bottom: 40px;
}

.userReview>h3 {
	margin-bottom: 20px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 76vh;
    margin-left: 0;
}

.wName {
    margin-left: 20px;
    font-size: 20px;
}
input, textarea {
	border: 0;
    width: 500px;
    outline: none;
    resize: none;
    padding-left: 4px;
}

input#title {
	height: 40px;
}

textarea#content {
	margin-top: 5px;
	font-size: 14px;
}
td{
	border: 1px solid;
}

button {
	border: 1px solid #ccccce;
	border-radius: 6px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	cursor: pointer;
	font-size: 12px;
	padding: 5px;
}

#button-area {
	text-align: right;
	margin-top: 20px;
	margin-bottom: 30px;
	border-bottom: 1px solid; 
}

#hosReview-table {
	margin: 0 auto;
	width: 100%;
	margin-bottom: 10px; 	
	border-spacing: 5px;
    border-collapse: unset;
}

span.star-prototype, span.star-prototype > * {
		height: 16px; 
		background: url(<%= request.getContextPath()%>/resources/images/heartAvg.png) 0 -16px repeat-x;
		width: 80px;
		display: inline-block;
}

span.star-prototype > * {
	background-position: 0 0;
	max-width:80px; 
}

.heartPosition {
	display: inline-block;
	vertical-align: middle;
}

.score-count{
	display: inline;
    float: right;
}

#heart {
	display: inline-block;
    float: left;
    font-size: 20px;
}
#heart a{text-decoration: none; color: lightgray;}
#heart a.on{color: red;}

</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7f198d7f218db4a29813c5a3b81c52fc&libraries=services"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
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
					<div class="bxslider" id="hospitalImage">
						<%
							for (int i = 0; i < images.length; i++) {
						%>
						<div>
							<img src="<%=request.getContextPath()%>/hospital_images/<%=images[i]%>" alt="그림<%=i%>" class="hospitalImage">
						</div>
						<%
							}
						%>
					</div>
				</div>
				<div id="hospitalInfo_div">
					<div id="hospitalName" class="title"><h2><%=h.getUser_name()%></h2><input id="hospitalNo" type="hidden" value="<%= h.getHospital_no() %>" /></div><br><br>
					<div id="hospitalTel" class="title"><h4>연락처 <%=h.getTel()%></h4><br>병원 소개</div>
					<div id="hospitalPoint">
						<div id="pointName" class="title">병원 평점</div>
						<div class="pointArea">
							<div id="point1">
								<span>(<%=h.getHospital_heart()%>)
								</span>
							</div>
							<div class="heartPosition">
								<span class="star-prototype"><%=h.getHospital_heart()%></span>
							</div>
							<div id="point2">
								<span>(<%=(int) h.getReview_count()%>)
								</span>
							</div>
						</div>
					</div><br><br>
					<div id="hospitalInformation">
						<textarea name="" id="" cols="95" rows="12" style="outline: none; resize: none; border: 0; background: white;" disabled="disabled">
							<%=h.getHospital_about()%>
						</textarea>
					</div>
				</div>

				<br>
				<br>
				<section style="display: inline-block; margin-left: 17px;">
					<div id="book" <%if (loginUser == null) {%>
						onclick="alert('먼저 로그인을해주세요.')"
						<%} else if (loginUser.getUser_category().equals("H")) {%>
						onclick="alert('병원회원은 이용하실 수 없습니다.')"
						<%} else if (loginUser.getUser_category().equals("A")) {%>
						onclick="alert('관리자는 이용하실 수 없습니다.')" <%} else {%>
						onclick="window.open('<%=request.getContextPath()%>/views/hospital/hospitalBook.jsp?customer_no=<%=loginUser.getUser_no()%>&hos_name=<%=h.getUser_name()%>', 'book', 'width=650, height= 800');"
						<%}%> class="button">병원 예약 하기</div><br><br>
					
					<div id="hospital-location" class="title">오시는 길</div><br>
					<div id="hospital-address" class="title"><%= h.getAddress() %></div><br>
	<!-- 				<div id="hospital-review" class="title">병원 리뷰</div> -->
	<!-- 				<div id="hospital-review-more">리뷰 더 보기</div> -->
				

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
			geocoder.addressSearch('<%=h.getAddress()%>', function(result, status) {
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
			    content: '<div class="location" style="width:150px; text-align:center; padding:6px 0;"><a target="_blank"><%=h.getUser_name()%></a></div>'});
					infowindow.open(map, marker);
			
					// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					map.setCenter(coords);
				}
				$('.location>a').attr("href", url);
			});
		</script>
		</section>
			<section id="hospital-review">
				<h2>리뷰</h2>
				<br>
				<section>
					<table id="hosReview-table">
						<tbody>
							<tr>
								<td>
									<input id="title" name="title" type="text" placeholder=" 제목을 입력해주세요(병원리뷰)" maxlength="40" required="required">
								</td>
							</tr>
							<tr></tr>
							<tr>
								<td>
									<textarea id="content" name="content" cols="30" rows="7" placeholder=" 병원 리뷰를 입력해주세요" required="required"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="button-area">
						<p id="heart"> 평점
					        <a href="#" no='1'>♥</a>
					        <a href="#" no='2'>♥</a>
					        <a href="#" no='3'>♥</a>
					        <a href="#" no='4'>♥</a>
					    	<a href="#" no='5'>♥</a>
					    </p>
				        <input id="reviewScore" name="reviewScore" type="hidden"> 
					   	<script>
					    	$('#heart a').click(function(){
				           		$(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
				           		$(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
			           			var no = $(this).attr('no');
				           		$('#reviewScore').val(no); // input 태그에 값넣어주는 jquery
				           		return false;
			       			});
			
				   		</script>
					<% if(loginUser != null) { %>
						<button id="review_insert" type="button" style="margin-bottom: 20px;" onclick="review_insert()">리뷰등록</button>
					<% } else { %>
						<button id="review_insert" type="button" style="margin-bottom: 20px;" onclick="alert('리뷰등록을 위해서는 로그인을 하셔야합니다.');">리뷰등록</button>						
					<% } %>
					</div>
					<ul id="ul-area">
					<% for (int i = 0; i < hrlList.size(); i++) { %>
						<li class="review_list">
							<div class="userInfo">
								<div class="userProfile_name">
									<% if(hrlList.get(i).getProfile_image() == null) { %>
										<img src="<%= request.getContextPath() %>/member_images/icon.png" alt="" />								
									<% } else { %>								
										<img src="<%= request.getContextPath() %>/member_images/<%= hrlList.get(i).getProfile_image() %>" alt="" />
									<% } %>
									<span class="wName"><%= hrlList.get(i).getUser_name() %></span> 
									<span class="wDate"><%= hrlList.get(i).getBoard_date() %></span>
								</div>
								<div class="userDetail">
									<span> 
										<%= hrlList.get(i).getAge() %>세 ㆍ <%= hrlList.get(i).getSkinType() %> ㆍ <% if(hrlList.get(i).getGender().equalsIgnoreCase("남성")) { %> 
											<img src="<%= request.getContextPath() %>/resources/images/male.png" alt="남자" /> 
										<% } else { %> 
											<img src="<%= request.getContextPath() %>/resources/images/female.png" alt="여자" /> 
										<% } %>   
									</span>
									<div class="score-count">
										<div class="heartPosition">
											<span class="star-prototype"><%= hrlList.get(i).getReview_heart() %></span>
										</div>
									</div>
								</div>
							</div>
							<div class="userReview">
								<h3><%= hrlList.get(i).getBoard_title() %></h3>
								<textarea class="review_ta" disabled="disabled"><%= hrlList.get(i).getBoard_content() %></textarea>
							</div>
						</li>
					<% } %>
					</ul>
				</section>
			</section>
		</div>
			<script>
				$(function(){
					function xSize(e) {
						var t;
						e.select = function(){
							t = setInterval(
								function()
								{
									e.style.height = '1px';
									e.style.height = (e.scrollHeight + 12) + 'px';
								}, 100);
						}
						e.onblur = function(){
							clearInterval(t);
						}
					}
					var ttt = <%= hrlList.size() %>
					for(var tt = 0; tt < ttt; tt++){ 
						xSize(document.getElementsByClassName('review_ta')[tt]);	
						console.log(document.getElementsByClassName('review_ta')[tt]);
						document.getElementsByClassName('review_ta')[tt].select(); 
					}
				})
			
			
				$(function() {

					$('#hospital-review-more').click(function() {
						$('.review-hide').show(100);
					});

					$.fn.generateStars = function() {
						return this.each(function(i, e) {
							$(e).html($('<span/>').width($(e).text() * 16));
						});
					};

					// 숫자 평점을 별로 변환하도록 호출하는 함수
					$('.star-prototype').generateStars();

				})
				
			$(function(){
				console.log(login)
				$('.bx-wrapper .bx-controls-direction a').css('z-index', '1000');
			});
				
				
			function review_insert(){
				var title = $('#title').val();
				var content = $('#content').val();
				var hospitalNo = $('#hospitalNo').val();
				var heart = $('#reviewScore').val();
				console.log(heart);
				var flag = false;
				if(title.trim().length == 0 && content.trim().length == 0 && $('#reviewScore').val().trim().length == 0){
					alert("리뷰를 작성해주세요.")
					$('#title').focus();
				} else if (title.trim().length == 0){
					alert("제목을 입력해주세요.")
					$('#title').focus();					
				} else if(content.trim().length == 0 ){
					alert("내용을 입력해주세요.")
					$('#content').focus();
				} else if($('#reviewScore').val().trim().length == 0){
					alert("평점을 입력해주세요.")
				} else {
					flag = true;
					if(flag == true){
						$.ajax({
							url: '/COSMEDIC/reviewInsert.hos',
							data: {
								title:title, content:content, hospitalNo:hospitalNo, heart:heart
							},
							success: function(data){
								console.log(data)
								$('#ul-area').html("");
								for(var i in data){
									var $li = $('<li class="review_list"></li>');
									var $div1 = $('<div class="userInfo"></div>');
									var $div2 = $('<div class="userProfile_name"></div>');
									var $img1 = $('<img>');
									if(data[i].profile_image == null){
										$img1.attr('src', "<%= request.getContextPath() %>/member_images/icon.png");
									} else {
										$img1.attr('src', "<%= request.getContextPath() %>/member_images/" + data[i].profile_image);								
									}
									var $span1 = $('<span class="wName"></span>').text(data[i].user_name);
									var $span2 = $('<span class="wDate"></span>').text(data[i].board_date);
									// 한 div 끝
									
									var $div3 = $('<div class="userDetail"></div>');
									var $img2 = $('<img>');
									if(data[i].gender == "남성"){
										$img2.attr('src', "<%= request.getContextPath() %>/resources/images/male.png");								
									} else {
										$img2.attr('src', "<%= request.getContextPath() %>/resources/images/female.png");								
									}
									var $span3 = $('<span></span>').text(data[i].age + "세 ㆍ " + data[i].skinType + " ㆍ ");
									var $div5 = $('<div class="score-count"></div>')
									var $div6 = $('<div class="heartPosition"></div>')
									var $span4 = $('<span class="star-prototype"></span>').text(data[i].review_heart)
								
									$div6.append($span4)
									$div5.append($div6)
									
									
									var $div4 = $('<div class="userReview"></div>');
									var $h3 = $('<h3></h3>').text(data[i].board_title);
									var $textarea = $('<textarea cols="80" class="review_ta"></textarea>').val(data[i].board_content);
									
									$div2.append($img1, $span1, $span2);
									$span3.append($img2);
									$div3.append($span3, $div5);
									$div4.append($h3, $textarea)
									
									$div1.append($div2, $div3, $div4);
									$li.append($div1);
									$('#ul-area').append($li);
								} 
								title = "";
								content = "";
								$.fn.generateStars = function() {
									return this.each(function(i,e){
										$(e).html($('<span/>').width($(e).text()*16));
									});
								};
								// 숫자 평점을 별로 변환하도록 호출하는 함수
								$('.score-count .star-prototype').generateStars();
							}
						})
					}
				}
				
			}
			</script>
		</section>
	</div>
	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>