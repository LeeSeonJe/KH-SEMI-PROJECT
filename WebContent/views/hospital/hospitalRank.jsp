<%@page import="hospital.model.vo.Hospital"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/layout/import.jsp"%>
<style>
#page-name>h1 {
	font-size: 40px;
	font-weight: 900;
	margin-left: 70px;
    margin-top: 60px;
}

#cosmetic-beauty-filter {
	display: inline-block;
    border: 1px solid #ccc;
    padding-left: 18px;
    background-color: #F8F8F8;
    height: 396px;
    width: 350px;
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
	padding: 8px 13px;
	background-color: white;
	border: 1px solid #ccc;
	font-size: 13px !important;
	width: 94px	;
	text-align: center;
	position: relative;
	left: -14px;
}

.radioChkActive+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 13px;
	background-color: white;
	border: 1px solid red;
	font-size: 13px !important;
	width: 94px;
	text-align: center;
	position: relative;
	left: -14px;
}


#select-btn-center {
	margin-right: 15px;
    text-align: center;
}

#reset-btn {
    margin-left: 218px;
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
/* #test {
	display: inline-flex;
	width: 500px;
} */

#filter-form {
	display: inline-flex;
	margin-top: 50px;
}

#filter-form>section#cosmetic-filter {
	display: inline-flex;
}


/* 여기부터 리스트 css */
.ranking-list {
	display: inline-flex;
    border-block-end: 1px solid #ccc;
    margin-left: 30px;
    padding-bottom: 30px;
}

.ranking-list div {
	display: inline-block;
	text-align: center;
}

.ranking-list>.cos-rank {
	width: 80px;
    padding-top: 30px;
}
.ranking-list>.cos-img {
	width: 150px;
}
.ranking-list>.cos-detail {
	text-align: left;
	width: 270px;
}
.ranking-list>.cos-score {
	width: 200px;
	padding-top: 70px;
}

.cos-img>img{
	width: 100px;
    height: 100px;
    margin-top: 30px;
}

.cos-detail-link {
	cursor: pointer;
	font-weight: 700;
	display:inline-block;
}

.hospital-detail-link{
	cursor: pointer;
}

.cos-rank h3{
	margin-top: 35px;
}


#filter-form>section#cosmetic-category {
	display: block;
	font-size: 12px;
	margin-right: 225px;
}

#cosmetic-category #sidoCd, #cosmetic-category .sggu, .input-text {
    border: 1px solid #ccc;
    background: white;
    border-radius: 5px;
    /* width: 150px; */
    height: 30px;
    margin-left: 6px;
}

#cosmetic-category #cosmetic-big-category {
	border: 1px solid #ccc;
    background: white;
    border-radius: 5px;
    width: 150px;
    height: 30px;
    margin-left: 30px;
}

#cosmetic-category .middle-category {
	border: 1px solid #ccc;
    background: white;
    border-radius: 5px;
    width: 150px;
    height: 30px;
    margin-left: 4px;
} 

#category-btn {    
	border: 1px solid #ccc;
    background: white;
    border-radius: 5px;
    width: 70px;
    height: 30px;
    margin-left: 4px;
    float: left;
}

#sidoCd, .sggu, .srch-select, .input-text{
	float: left;
}

.no {
	text-align: center;
	font-size: 17px;
}

#noSearch {
    width: 300px;
    margin: 100px;
    margin-bottom: 0;
}

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
#search_area{
	display: inline-block;
    margin-left: 40px;
}
.hos_about {
    width: 270px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
</style>

<% 
	ArrayList<Hospital> list = (ArrayList<Hospital>) request.getAttribute("list"); 
%>
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section id="page-name">
			<h1>병원 랭킹</h1>
		</section>
		
		<form id="filter-form" action="<%= request.getContextPath() %>/searchAddress.hos" onsubmit="return false;">
			<section id="cosmetic-filter">
				<div id="cosmetic-beauty-filter">
					<div id="cosmetic-beauty-filter-header">
						<h3>필터</h3>
						<button id="reset-btn" type="button" onClick="window.location.reload()">초기화</button>
					</div>
					<br>
					<div id="cosmetic-beauty-filter-select">
					<fieldset id="hospital-fieldset">
						<legend>
							<h4>기준</h4>
						</legend>
							<input type="radio" id="ranking" class="radioChkActive" name="hospital_filter" value="랭킹순" checked="checked"/> <label for="ranking">랭킹순</label>
							<input type="radio" id="reviewH" class="radioChk" name="hospital_filter" value="리뷰 많은 순"/> <label for="reviewH">리뷰 많은 순</label>
							<input type="radio" id="reviewL" class="radioChk" name="hospital_filter" value="리뷰 적은 순"/> <label for="reviewL">리뷰 적은 순</label><br><br>					
							<input type="radio" id="heartH" class="radioChk" name="hospital_filter" value="평점 높은 순"/> <label for="heartH">평점 높은 순</label>						
							<input type="radio" id="heartL" class="radioChk" name="hospital_filter" value="평점 낮은 순"/> <label for="heartL">평점 낮은 순</label>						
							<input type="radio" id="replyH" class="radioChk" name="hospital_filter" value="답변 많은 순"/> <label for="replyH">답변 많은 순</label><br><br>						
							<input type="radio" id="replyL" class="radioChk" name="hospital_filter" value="답변 적은 순"/> <label for="replyL">답변 적은 순</label>						
					</fieldset>
					<br><br>
					<div id="select-btn-center">
						<button id="select-btn" type="button" onclick="filter_apply()">필터적용</button>
					</div>
					<br>
					</div>
				</div>
			</section>
			<section id="cosmetic-category" >
				<div id="search_area">
					<select name="sidoCd" id="sidoCd" title="시/도 선택" class="sido" style="width: 93px;">
					    <option value="first" selected>시/도 선택</option>
					    <option value="서울특별시">서울특별시</option>
					    <option value="부산광역시">부산광역시</option>
					    <option value="대구광역시">대구광역시</option>
					    <option value="인천광역시">인천광역시</option>
					    <option value="광주광역시">광주광역시</option>
					    <option value="대전광역시">대전광역시</option>
					    <option value="울산광역시">울산광역시</option>
					    <option value="세종특별자치시">세종특별자치시</option>
					    <option value="경기도">경기도</option>
					    <option value="강원도">강원도</option>
					    <option value="충청북도">충청북도</option>
					    <option value="충청남도">충청남도</option>
					    <option value="전라북도">전라북도</option>
					    <option value="전라남도">전라남도</option>
					    <option value="경상북도">경상북도</option>
					    <option value="경상남도">경상남도</option>
					    <option value="제주특별자치도">제주특별자치도</option>
					</select>
					<%@include file="/views/hospital/select_sggu.jsp" %>
					<input type="text" id="dong" name="dong" style="ime-mode: active;" placeholder="읍/면/동 또는 도로명을 입력해주세요" class="input-text" size="33"/>
					<button id="category-btn" type="button" onclick="addressSearch()">검색</button>
				</div>
			<section>
				<ul id='ul-area'>
				<% if(list.size() == 0) { %>
						<li>
							<div class="ranking-list">
								<div class="cos-rank">
								</div>
								<div class="cos-img">
								</div>
								<div class="cos-detail">
								<br>
								<br><br>
								<br>
								<span>조회된 결과가 없습니다.</span>
								</div>
								<div class="cos-score">
								</div>
							</div>
						</li>
				<% } else { %>
					<% for (int i = 0; i < list.size(); i++) { %>
						<li>
							<div class="ranking-list">
								<div class="cos-rank">
									<% if(list.get(i).getReview_count()==0) { %>
										<h3>-</h3>
									<% } else { %>
										<h3><%= i+1 %></h3>
									<% } %>
								</div>
								<div class="cos-img">
										<%-- <span><%= list.get(i).getHospital_img() %></span> --%>
										<% String[] images = list.get(i).getHospital_img().split(","); %>
										<img src="<%= request.getContextPath() %>/hospital_images/<%= images[0] %>"/>
								</div>
								<div class="cos-detail hospital-detail-link">
									<br>
									<h6 style="margin-top: 42px;"><%= list.get(i).getUser_name() %></h6>
									<div class="hos_about"><%= list.get(i).getHospital_about() %></div><br><br>
								</div>
								<div class="cos-score">
									<span>
									<% if(list.get(i).getHospital_heart() - (int)list.get(i).getHospital_heart() == 0) {%>
										<%= (int)list.get(i).getHospital_heart()%>
									<% } else { %>
										<%= list.get(i).getHospital_heart()%>
									<% } %>
									</span>
									<div class="heartPosition">
										<span class="star-prototype"><%= list.get(i).getHospital_heart()%></span>
									</div>
									<span>(<%= (int)list.get(i).getReview_count() %>)</span>
								</div>
							</div>
						</li>
					<% } %>
				<% } %>
				</ul>
				</section>
			</section>
		</form>
	</div>
	<%@ include file="/views/layout/footer.jsp"%>

	<script>
		/* 별점 스크립트 */
		$.fn.generateStars = function() {
			return this.each(function(i,e){
				$(e).html($('<span/>').width($(e).text()*16));
			});
		};
		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();

		$('.hospital-detail-link').click(function(){
			location.href="<%= request.getContextPath()%>/detail.hos?hosName=" + encodeURIComponent($(this).children('h6').text());
		})
		
		$('input[name=hospital_filter]').click(function() {
			if ($(this)[0].value == "랭킹순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "리뷰 많은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "리뷰 적은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "평점 높은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "평점 낮은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "답변 많은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "답변 적은 순") {
				$('input[name=hospital_filter]').addClass('radioChk')
				$('input[name=hospital_filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			}
		})
		
		$('#reset-btn').click(function() {
			$('input[name=hospital_filter]').addClass('radioChk').removeClass("radioChkActive");
			$("#ranking").prop("checked", true).addClass("radioChkActive");
		})
		
		function filter_apply() {
			$('#sidoCd').val("first");
			$('select[name=sggu]')[0].value = "first";
			$('#dong').val("");
			var hospital_filter = $('#hospital-fieldset>input[name]:checked').val();
			$.ajax({
				url: 'hospital.li',
				data: {hospital_filter:hospital_filter},
				success: function(data){
					var count = 0;
					$('#ul-area').html("");
					console.log(data);
					for(var i in data){
						if(data.length == 0){
							var $li1 = $('<li class="no" ></li>')
							var $img = $('<img id="noSearch" src="/COSMEDIC/resources/images/nosearch.png">')
							var $li2 = $('<li class="no">선택하신 필터 조건과 일치하는 제품이 없습니다.</li>')
							
							$li1.append($img);
							$('#ul-area').append($li1, $li2)
						}
						count += 1;
						var $div1 = $('<div class="ranking-list"></div>');
						var $div2 = $('<div class="cos-rank"></div>');
						if(hospital_filter == "리뷰 적은 순" || hospital_filter == '평점 낮은 순' || hospital_filter == "답변 적은 순"){
							var $h3 = $('<h3></h3>').text(count);
						}
						else{
							if(data[i].review_count == 0){
								var $h3 = $('<h3></h3>').text('-');							
							} else{
								var $h3 = $('<h3></h3>').text(count);
							}							
						}
						var $div3 = $('<div class="cos-img"></div>');
						var $img = $('<img>')						
						var images = data[i].hospital_img.split(",");
							$img.attr('src', "<%= request.getContextPath() %>/hospital_images/" + images[0]);		
						var $div4 = $('<div class="cos-detail hospital-detail-link"></div>');
						var $br = $('<br>');
						var $h6 = $('<h6 style="margin-top: 42px;"></h6>').text(data[i].user_name);
						var $h5 = $('<div class="hos_about"></div>').text(data[i].hospital_about);
						var $div5 = $('<div class="cos-score"></div>');
						var $span1 = $('<span></span>').text(data[i].hospital_heart+" ");
						var $div6 =  $('<div class="heartPosition"></div>');
						var $span2 = $('<span class="star-prototype"></span>').text(data[i].hospital_heart);
						var $span3 = $('<span></span>').text(" "+'('+data[i].review_count+')');
						
						$div2.append($h3);
						$div3.append($img);
						$div4.append($br);
						$div4.append($h6);
						$div4.append($h5);
						$div5.append($span1);
						$div6.append($span2);
						$div5.append($div6);
						$div5.append($span3);
						
						$div1.append($div2);
						$div1.append($div3);
						$div1.append($div4);
						$div1.append($div5);
						
						$('#ul-area').append($div1);
						
						$('.hospital-detail-link').click(function(){
							location.href="<%= request.getContextPath()%>/detail.hos?hosName=" + encodeURIComponent($(this).children('h6').text());
						})
					}
					$('.star-prototype').generateStars();
					$.fn.generateStars = function() {
						return this.each(function(i,e){
							$(e).html($('<span/>').width($(e).text()*16));
						});
					};
				}
			})
		}
		
		$(function(){
			$('.sggu').css('display','none')
			$('#first').css('display','block');
			$('#first').attr("name","sggu");
		})
		
		$('#sidoCd').click(function(){
			var t = document.getElementById('sidoCd');
			if(t.value=='first'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#first').css('display','block');
				$('#first').attr("name","sggu");
			} else if(t.value=='서울특별시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#seoul').css('display','block');
				$('#seoul').attr("name","sggu");
			} else if(t.value=='부산광역시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#busan').css('display','block');
				$('#busan').attr("name","sggu");
			} else if(t.value=='대구광역시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#daegu').css('display','block');
				$('#daegu').attr("name","sggu");
			} else if(t.value=='인천광역시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#incheon').css('display','block');
				$('#incheon').attr("name","sggu");
			} else if(t.value=='광주광역시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#gwangju').css('display','block');
				$('#gwangju').attr("name","sggu");
			} else if(t.value=='대전광역시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#daejeon').css('display','block');
				$('#daejeon').attr("name","sggu");
			} else if(t.value=='울산광역시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#ulsan').css('display','block');
				$('#ulsan').attr("name","sggu");
			} else if(t.value=='세종특별자치시'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#sejong').css('display','block');
				$('#sejong').attr("name","sggu");
			} else if(t.value=='경기도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#gyeonggi').css('display','block');
				$('#gyeonggi').attr("name","sggu");
			} else if(t.value=='강원도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#gangwon').css('display','block');
				$('#gangwon').attr("name","sggu");
			} else if(t.value=='충청북도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#chungcheongbuk').css('display','block');
				$('#chungcheongbuk').attr("name","sggu");
			} else if(t.value=='충청남도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#chungcheongnam').css('display','block');
				$('#chungcheongnam').attr("name","sggu");
			} else if(t.value=='전라북도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#jeollabuk').css('display','block');
				$('#jeollabuk').attr("name","sggu");
			} else if(t.value=='전라남도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#jeollanam').css('display','block');
				$('#jeollanam').attr("name","sggu");
			} else if(t.value=='경상북도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#gyeongsangbuk').css('display','block');
				$('#gyeongsangbuk').attr("name","sggu");
			} else if(t.value=='경상남도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#gyeongsangnam').css('display','block');
				$('#gyeongsangnam').attr("name","sggu");
			} else if(t.value=='제주특별자치도'){
				$('.sggu').css('display','none')
				$('.sggu').attr("name", null);
				$('#jeju').css('display','block');
				$('#jeju').attr("name","sggu");
			}
		})
		
		function addressSearch(){
			$('input[name=hospital_filter]').addClass('radioChk').removeClass("radioChkActive");
			$("#ranking").prop("checked", true).addClass("radioChkActive");
			var sidoCd = $('#sidoCd').val();
			var sggu = $('select[name=sggu]')[0].value;
			var dong = $('#dong').val();
			
			$.ajax({
				url: 'searchAddress.hos',
				data: {sidoCd:sidoCd, sggu:sggu, dong:dong},
				success: function(data){
					var count = 0;
					$('#ul-area').html("");
					if(data.length == 0){
						var $li1 = $('<li class="no" ></li>')
						var $img = $('<img id="noSearch" src="/COSMEDIC/resources/images/nosearch.png">')
						var $li2 = $('<li class="no">선택하신 필터 조건과 일치하는 제품이 없습니다.</li>')
						
						$li1.append($img);
						$('#ul-area').append($li1, $li2)
					} else {
						for(var i in data){
							count += 1;
							var $div1 = $('<div class="ranking-list"></div>');
							var $div2 = $('<div class="cos-rank"></div>');
							if(data[i].review_count == 0){
								var $h3 = $('<h3></h3>').text('-');							
							} else{
								var $h3 = $('<h3></h3>').text(count);
							}							
							var $div3 = $('<div class="cos-img"></div>');
							var $img = $('<img>')
							var images = data[i].hospital_img.split(",");
							$img.attr('src', "<%= request.getContextPath() %>/hospital_images/" + images[0]);														
							var $div4 = $('<div class="cos-detail hospital-detail-link"></div>');
							var $br = $('<br>');
							var $h6 = $('<h6 style="margin-top: 42px;"></h6>').text(data[i].user_name);
							var $h5 = $('<div class="hos_about"></div>').text(data[i].hospital_about);
							var $div5 = $('<div class="cos-score"></div>');
							var $span1 = $('<span></span>').text(data[i].hospital_heart+" ");
							var $div6 =  $('<div class="heartPosition"></div>');
							var $span2 = $('<span class="star-prototype"></span>').text(data[i].hospital_heart);
							var $span3 = $('<span></span>').text(" "+'('+data[i].review_count+')');
							
							$div2.append($h3);
							$div3.append($img);
							$div4.append($br);
							$div4.append($h6);
							$div4.append($h5);
							$div5.append($span1);
							$div6.append($span2);
							$div5.append($div6);
							$div5.append($span3);
							
							$div1.append($div2);
							$div1.append($div3);
							$div1.append($div4);
							$div1.append($div5);
							
							$('#ul-area').append($div1);
							
							$('.hospital-detail-link').click(function(){
								location.href="<%= request.getContextPath()%>/detail.hos?hosName=" + encodeURIComponent($(this).children('h6').text());
							})
						}
						$('.star-prototype').generateStars();
						$.fn.generateStars = function() {
							return this.each(function(i,e){
								$(e).html($('<span/>').width($(e).text()*16));
							});
						};
					}
				}	
			})
		}
		
	</script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>