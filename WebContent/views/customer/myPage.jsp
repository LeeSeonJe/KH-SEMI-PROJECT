<%@page import="customer.model.vo.MyPageWorry"%>
<%@page import="review.model.vo.PageInfo"%>
<%@page import="customer.model.vo.MyPageReview"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.AgeCalculator"%>
<%@page import="customer.model.vo.MyPageCustomer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/views/layout/import.jsp" %>
<style>
div>section#nav-tab {
	display: inline-block;
	background-color: #f8f8fb;
	width: 180px;
	min-height: 100px;
	color: black;
	/* position: relative; */
}

#nav-tab>ul>li {
	text-align: center;
	padding: 25px;
	cursor: pointer;
	font-size: 15px;
}

#nav-tab>ul>li:hover {
	background-color: #f2d0e0;
}

div>section#page-name {
	margin-left: 70px;
}

div>section.tab-mypage {
	display: inline-block;
	/* position: absolute; */
	padding-left: 50px;
	padding-top: 20px;
}

#tab-title {
	width: 170px;
	font-size: 25px;
	font-weight: 900;
	display: inline-block;
}

#tab-title-detail {
	display: inline-block;
	min-width: 500px;
}

table.table-standard {
	display: inline-block;
}

table#myInform>tbody>tr>td {
	height: 65px;
	padding: 18px;
	border-bottom: 1px solid gray;
}

table#myInform>tbody>tr>td.tab-myControl-category {
	width: 220px;
}

table#myInform>tbody>tr>td.tab-myControl-content {
	width: 520px;
}

.skinType {
	padding: 10px;
}

#btn-category {
	margin: auto;
	width: 50%;
	margin-top: 20px;
}

#btn-category>button {
	margin-right: 15px;
}

#main-div {
	display: inline-flex;
}

#myReview {
	text-align: center;
}

table#myReview>thead>tr>th {
	height: 48px;
	font-size: 16px;
	border-block-end: 1px solid black;
	text-align: center;
	width: 90px;
}

table#myReview>thead>tr>th#title2 {
	width: 500px;
}

table#myReview>tbody>tr>td {
	height: 45px;
}

#myPost {
	text-align: center;
}

table#myPost>thead>tr>th {
	height: 48px;
	font-size: 16px;
	border-block-end: 1px solid black;
	text-align: center;
	width: 90px;
}

table#myPost>thead>tr>th#title2 {
	width: 500px;
}

table#myPost>tbody>tr>td {
	height: 45px;
}

#myReservation {
	text-align: center;
}

#myReservation>thead>tr>th {
	width: 99px;
	text-align: center;
	font-size: 16px;
	border-block-end: 1px solid black;
	height: 48px;
}

#myReservation>tbody>tr>td {
	height: 45px;
}

#myQnA-writer {
	text-align: center;
}

#myQnA-writer {
	text-align: center;
}

#myQnA-writer {
	text-align: center;
}

#birth {
	border: 0;
	background: white;
	outline: none
}

tbody img {
	width: 160px;
	height: 160px;
}

.filebox {
	display: inline-block;
	vertical-align: bottom;
	margin-left: 20px;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	line-height: normal;
	vertical-align: middle;
	cursor: pointer;
	border-bottom-color: #e2e2e2;
	border: 1px solid #ccccce;
	border-radius: 6px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	font-size: 12px;
	padding: 7px;
}

.filebox input[type="file"] {
	/* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

/* .review-content:nth-child(2) { */
/* 	width: 160px; */
/* 	overflow: hidden; */
/* 	text-overflow: ellipsis; */
/* 	white-space: nowrap; */
/* 	display: block; */
/* 	margin-top: 12px; */
/* 	text-align: left; */
/* } */

.review-content>div.cosName{
	width: 160px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: left;
}

.review-content>div.boTitle{
	width: 500px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	cursor: pointer;
}

.worry-content:nth-child(2) {
	width: 500px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	position: absolute;
	margin-top: 12px;
	cursor: pointer;
}

.numBtn {
	cursor: pointer;
	border-bottom-color: #e2e2e2;
	border: 1px solid #ccccce;
	border-radius: 6px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	font-size: 12px;
	padding: 7px;
	margin-right: 5px;
	margin-left: 5px;
}

.numBtn2 {
	cursor: pointer;
	border-bottom-color: #e2e2e2;
	border: 1px solid #ccccce;
	border-radius: 6px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	font-size: 12px;
	padding: 7px;
	margin-right: 5px;
	margin-left: 5px;
}
</style>

<%
	MyPageCustomer mpc = (MyPageCustomer) request.getAttribute("mpc");
	ArrayList<MyPageReview> mpr = (ArrayList<MyPageReview>) request.getAttribute("mpr");
	ArrayList<MyPageWorry> mpw = (ArrayList<MyPageWorry>) request.getAttribute("mpw");
	
	PageInfo reviewPi = (PageInfo)request.getAttribute("reviewPi");
	PageInfo worryPi = (PageInfo)request.getAttribute("worryPi");
	
	int currentPage = reviewPi.getCurrentPage();
	int maxPage = reviewPi.getMaxPage();
	int startPage = reviewPi.getStartPage();
	int endPage = reviewPi.getEndPage();
// 	System.out.println(currentPage);
	
	int currentPage2 = worryPi.getCurrentPage();
	int maxPage2 = worryPi.getMaxPage();
	int startPage2 = worryPi.getStartPage();
	int endPage2 = worryPi.getEndPage();
%>
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section id="page-name">
			<h2>마이페이지</h2>
		</section>
		<hr>
		<div id="main-div">
			<section id="nav-tab">
				<ul id="nav-tab-ul">
					<li>내정보관리</li>
					<li>내 리뷰</li>
					<li>내 게시글</li>
					<li>내 예약</li>
					<li>1대1 문의</li>
				</ul>
			</section>
<!--내정보관리 시작 -------------------------------------------------------------------------------------------------------------------------------------------------- -->
			<section id="tab-myControl" class="tab-mypage">
				<div id="tab-title">내정보관리</div>
				<div id="tab-title-detail">고객님의 개인정보 보호를 위해 최선을 다하겠습니다.</div>
				<hr>
				<form action="<%= request.getContextPath() %>/update.me" method="post" encType="multipart/form-data" onsubmit="return update()">
					<table id="myInform" class="table-standard">
						<tbody>
							<tr>
								<td class="tab-myControl-category">프로필</td>
								<td class="tab-myControl-content">
								<% if(mpc.getProfile_image() == null) { %>
									<img id="profile"src="<%=request.getContextPath() %>/member_images/icon.png" alt="" />
								<% } else { %>
									<img id="profile"src="<%=request.getContextPath() %>/member_images/<%= mpc.getProfile_image() %>" alt="" />
								<% } %>
									<div class="filebox"> 
										<label for="ex_filename">사진찾기</label> 
										<input name="profile_img" type="file" id="ex_filename" class="upload-hidden" onchange="LoadImg(this,1)"> 
										<button id="basic_img" class="btn-standard" type="button">기본 이미지로 변경</button>
										<input id="stand" type="hidden" name="stand" value="ch" />
									</div>		
								</td>
							</tr>
							<tr>
								<td class="tab-myControl-category">아이디</td>
								<td class="tab-myControl-content"><%= mpc.getUser_id() %><input type="hidden" name="userNo" value="<%= mpc.getUser_no() %>" /></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">이름</td>
								<td class="tab-myControl-content"><%= mpc.getUser_name() %></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">이메일</td>
								<td class="tab-myControl-content"><%= mpc.getEmail() %></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">성별</td>
								<td class="tab-myControl-content"><%= mpc.getGender() %></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">생년월일</td>
								<td class="tab-myControl-content"><input id="birth" type="date" value="" readonly="readonly"/></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">피부타입</td>
								<td class="tab-myControl-content">
									<input type="radio" name="skinType" class="skinType" value="건성"><span class="skinType">건성</span>
									<input type="radio" name="skinType" class="skinType" value="지성"><span class="skinType">지성</span>
									<input type="radio" name="skinType" class="skinType" value="중성"><span class="skinType">중성</span>
									<input type="radio" name="skinType" class="skinType" value="복합성"><span class="skinType">복합성</span>
									<input type="radio" name="skinType" class="skinType" value="민감성"><span class="skinType">민감성</span>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="btn-category">
						<button id="update_btn" type="submit" class="btn-standard">수정하기</button>
						<button id="change_pwd"type="button" class="btn-standard" onclick="openChangePwd()">비밀번호변경</button>	
						<button type="button" class="btn-standard">회원탈퇴</button>				
					</div> 
				</form>
			</section>		
<!--내정보관리 끝 -------------------------------------------------------------------------------------------------------------------------------------------------- -->			
<!--리뷰게시판 시작 -------------------------------------------------------------------------------------------------------------------------------------------------- -->
			<section id="tab-myReview" class="tab-mypage">
				<div id="tab-title">내 리뷰</div>
				<div id="tab-title-detail">고객님의 리뷰를 확인, 수정, 삭제할 수 있는 페이지입니다.</div>
				<hr>
				<table id="myReview" class="table-standard">
					<thead>
						<tr>
							<th class="review-title">번호</th>
							<th style="width: 160px;" class="review-title">화장품</th>
							<th id="title2" class="review-title">제목</th>
							<th class="review-title">작성일</th>							
						</tr>
					</thead>
					<tbody id=tbody_area>
					<% for(int i = 0; i < mpr.size(); i++) { %>
						<tr>
							<td class="review-content"><%= i+1 %><input type="hidden" value="<%= mpr.get(i).getBoard_no() %>" /></%></td>
							<td class="review-content">
								<div class="cosName">
									<%= mpr.get(i).getCosmetic_name() %>
								</div>
							</td>
							<td class="review-content">
								<div class="boTitle">
									<%= mpr.get(i).getBoard_title() %>
								</div>
							</td>								
							<td class="review-content"><%= mpr.get(i).getBoard_date().substring(0, 10) %></td>
						</tr>
					<% } %>
					</tbody>

				</table>
<!--리뷰게시판 끝 -------------------------------------------------------------------------------------------------------------------------------------------------- -->
<!--리뷰 페이징 시작------------------------------------------------------------------------------------------------------------------------------------------>
				<div class="pagingArea" align="center" style="margin-right: 76px;">
				<% if(!mpr.isEmpty()){ %>
					<!--맨 처음으로  -->
					<button id="fristPage" class="btn-standard">&lt;&lt;</button>
					<script>
						var currentPage = 1
						$('#fristPage').on('click', function(){
							currentPage = "1";
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage:currentPage},
								success: function(data){
									console.log(data)
									$('#tbody_area').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="review-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="review-content"></td>')
										var $div1 = $('<div class="cosName"></div>').text(data[i].cosmetic_name);								
										var $td3 = $('<td class="review-content"></td>');
										var $div2 = $('<div class="boTitle"></div>').text(data[i].board_title);
										var $td4 = $('<td class="review-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$td2.append($div1);
										$td3.append($div2);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area').append($tr)
									}
								}
							})
						})
					</script>
					<!--이전 페이지  -->
					<button  id="beforeBtn" class="btn-standard">&lt;</button>
					<script>
						$('#beforeBtn').on('click', function(){
							console.log(currentPage);
							if(1 == currentPage){
								currentPage = 1
							} else {
								currentPage--;								
							}
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage:currentPage},
								success: function(data){
									console.log(data)
									$('#tbody_area').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="review-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="review-content"></td>')
										var $div1 = $('<div class="cosName"></div>').text(data[i].cosmetic_name);								
										var $td3 = $('<td class="review-content"></td>');
										var $div2 = $('<div class="boTitle"></div>').text(data[i].board_title);
										var $td4 = $('<td class="review-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$td2.append($div1);
										$td3.append($div2);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area').append($tr)
									}
								}
							})
						})
				
					</script>
					
					<!-- 10개 페이지 목록  -->
					<% for(int p=startPage; p<=endPage; p++){ %>
				<%-- 						<%if(p == currentPage){ %> --%>
								<button class="numBtn"><%= p %></button>
				<%-- 						<% } else{ %>			 --%>
				<%-- 								<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/mypage.me?currentPage=<%= p %>'"><%= p %></button> --%>
				<%-- 						<% } %>			 --%>
					<% } %>
					<script>
						$('.numBtn').on('click', function(){
							currentPage = $(this).text();
							console.log(currentPage)
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage:currentPage},
								success: function(data){
									console.log(data)
									$('#tbody_area').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="review-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="review-content"></td>')
										var $div1 = $('<div class="cosName"></div>').text(data[i].cosmetic_name);								
										var $td3 = $('<td class="review-content"></td>');
										var $div2 = $('<div class="boTitle"></div>').text(data[i].board_title);
										var $td4 = $('<td class="review-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$td2.append($div1);
										$td3.append($div2);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area').append($tr)
									}
								}
							})
						})
					</script>
					
					<!-- 다음 페이지로 -->
					<button id="afterBtn" class="btn-standard">&gt;</button>
					<script>
						$('#afterBtn').on('click', function(){
							if(<%= maxPage %> == currentPage){
								currentPage = <%= maxPage %>
							} else {
								currentPage++;								
							}
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage:currentPage},
								success: function(data){
									console.log(data)
									$('#tbody_area').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="review-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="review-content"></td>')
										var $div1 = $('<div class="cosName"></div>').text(data[i].cosmetic_name);								
										var $td3 = $('<td class="review-content"></td>');
										var $div2 = $('<div class="boTitle"></div>').text(data[i].board_title);
										var $td4 = $('<td class="review-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$td2.append($div1);
										$td3.append($div2);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area').append($tr)
									}
								}
							})
						})
					</script>
					
					<!-- 맨 끝으로 -->
					<button id="lastPage" class="btn-standard">&gt;&gt;</button>
					<script>
						$('#lastPage').on('click', function(){
							var currentPage = <%= maxPage %>
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage:currentPage},
								success: function(data){
									console.log(data)
									$('#tbody_area').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="review-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="review-content"></td>')
										var $div1 = $('<div class="cosName"></div>').text(data[i].cosmetic_name);								
										var $td3 = $('<td class="review-content"></td>');
										var $div2 = $('<div class="boTitle"></div>').text(data[i].board_title);
										var $td4 = $('<td class="review-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$td2.append($div1);
										$td3.append($div2);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area').append($tr)
									}
								}
							})
						})
					</script>
				<% } %>
				</div>
			</section>
<!--리뷰 페이징 끝-------------------------------------------------------------------------------------------------------------------------------------------------->
<!--고민게시판 시작 -------------------------------------------------------------------------------------------------------------------------------------------------- -->
			<section id="tab-myPost" class="tab-mypage">
				<div id="tab-title">내 게시글</div>
				<div id="tab-title-detail">고객님의 게시글을 확인, 수정, 삭제할 수 있는 페이지입니다.</div>
				<hr>
				<table id="myPost" class="table-standard">
					<thead>
						<tr>
							<th>번호</th>
							<th id="title2" class="myPost-title">제목</th>
							<th>작성자</th>
							<th>작성일</th>							
						</tr>
					</thead>
					<tbody id=tbody_area2>
					<% for(int i = 0; i < mpw.size(); i++) { %>
						<tr>
							<td class="worry-content"><%= i+1 %><input type="hidden" value="<%= mpw.get(i).getBoard_no() %>" /></%></td>
							<td class="worry-content"><%= mpw.get(i).getBoard_title() %></td>
							<td style="width: 160px;" class="worry-content"><%= mpw.get(i).getUser_name() %></td>
							<td style="width: 160px;" class="worry-content"><%= mpw.get(i).getBoard_date().substring(0, 10) %></td>
						</tr>
					<% } %>
					</tbody>
				</table>
<!--고민페이지 끝 -------------------------------------------------------------------------------------------------------------------------------------------------- -->
<!--고민 페이징 시작------------------------------------------------------------------------------------------------------------------------------------------  -->
				<div class="pagingArea2" align="center" style="margin-right: 76px;">
				<% if(!mpr.isEmpty()){ %>
					<!--맨 처음으로  -->
					<button id="fristPage2" class="btn-standard">&lt;&lt;</button>
					<script>
						var currentPage2 = 1
						$('#fristPage2').on('click', function(){
							currentPage2 = "1";
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage2:currentPage2},
								success: function(data){
									console.log(data)
									$('#tbody_area2').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="worry-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="worry-content"></td>').text(data[i].board_title);
										var $td3 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].user_name);										
										var $td4 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area2').append($tr)
									}
								}
							})
						})
					</script>
					<!--이전 페이지  -->
					<button  id="beforeBtn2" class="btn-standard">&lt;</button>
					<script>
						$('#beforeBtn2').on('click', function(){
							console.log(currentPage2);
							if(1 == currentPage){
								currentPage2 = 1
							} else {
								currentPage2--;								
							}
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage2:currentPage2},
								success: function(data){
									console.log(data)
									$('#tbody_area2').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="worry-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="worry-content"></td>').text(data[i].board_title);
										var $td3 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].user_name);										
										var $td4 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area2').append($tr)
									}
								}
							})
						})
	
					</script>
					
					<!-- 10개 페이지 목록  -->
					<% for(int p=startPage2; p<=endPage2; p++){ %>
<%-- 						<%if(p == currentPage){ %> --%>
								<button class="numBtn2"><%= p %></button>
<%-- 						<% } else{ %>			 --%>
<%-- 								<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/mypage.me?currentPage=<%= p %>'"><%= p %></button> --%>
<%-- 						<% } %>			 --%>
					<% } %>
					<script>
						$('.numBtn2').on('click', function(){
							currentPage2 = $(this).text();
							console.log(currentPage2)
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage2:currentPage2},
								success: function(data){
									console.log(data)
									$('#tbody_area2').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="worry-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="worry-content"></td>').text(data[i].board_title);
										var $td3 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].user_name);										
										var $td4 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area2').append($tr)
									}
								}
							})
						})
					</script>
					
					<!-- 다음 페이지로 -->
					<button id="afterBtn2" class="btn-standard">&gt;</button>
					<script>
						$('#afterBtn2').on('click', function(){
							if(<%= maxPage2 %> == currentPage2){
								currentPage2 = <%= maxPage %>
							} else {
								currentPage2++;								
							}
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage2:currentPage2},
								success: function(data){
									console.log(data)
									$('#tbody_area2').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="worry-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="worry-content"></td>').text(data[i].board_title);
										var $td3 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].user_name);										
										var $td4 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area2').append($tr)
									}
								}
							})
						})
					</script>
					
					<!-- 맨 끝으로 -->
					<button id="lastPage2" class="btn-standard">&gt;&gt;</button>
					<script>
						$('#lastPage2').on('click', function(){
							var currentPage2 = <%= maxPage2 %>
							$.ajax({
								url: '/COSMEDIC/mypage.me',
								data: {currentPage2:currentPage2},
								success: function(data){
									console.log(data)
									$('#tbody_area2').html("");
									for(var i in data){
										var $tr = $('<tr></tr>');
										var $td1 = $('<td class="worry-content"></td>').text((10*parseInt(currentPage)-10)+parseInt(i)+1);
										var $input = $('<input type="hidden">').val(data[i].board_no)
										var $td2 = $('<td class="worry-content"></td>').text(data[i].board_title);
										var $td3 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].user_name);										
										var $td4 = $('<td style="width: 160px;" class="worry-content"></td>').text(data[i].board_date.substr(0, 10));	
										
										$td1.append($input);
										$tr.append($td1, $td2, $td3, $td4);
										$('#tbody_area2').append($tr)
									}
								}
							})
						})
					</script>
				<% } %>
				</div>
<!--고민 페이징 끝------------------------------------------------------------------------------------------------------------------------------------------  -->
			</section>
			
			<section id="tab_myReservation" class="tab-mypage">
				<div id="tab-title">내 예약</div>
				<div id="tab-title-detail">고객님의 병원 예약정보를 조회할 수 있는 페이지입니다.</div>
				<hr>
				<table id="myReservation" class="table-standard">
					<thead>
						<tr>
							<th>병원이름</th>
							<th>병원번호</th>
							<th>성함</th>
							<th>날짜</th>							
							<th>시간</th>							
							<th>상담내용</th>							
							<th>예약수정</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>KH피부과</td>
							<td>02-0000-1111</td>
							<td>이선제</td>
							<td>2020-03-26</td>
							<td>13:00</td>
							<td>상담</td>
							<td>
								<button type="button" class="btn-standard">
									예약수정
								</button>
							</td>
						</tr>
						
					</tbody>
				</table>
				
			</section>
			
			<section id="tab-myQnA" class="tab-mypage">
				<div id="tab-title">1대1 문의</div>
				<div id="tab-title-detail">고객님께서 불편을 드려서 죄송합니다. 최선을 다하겠습니다.</div>
				<hr>
				<table id="myReview" class="table-standard">
					<thead>
						<tr>
							<th class="review-title">번호</th>
							<th id="title2" class="review-title">제목</th>
							<th class="review-title">작성자</th>
							<th class="review-title">작성일</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="review-content">1</td>
							<td class="review-content">동해물과백두산이 마르고</td>
							<td class="review-content">이선제</td>
							<td class="review-content">2020-03-26</td>
						</tr>
						<tr>
							<td class="review-content">1</td>
							<td class="review-content">동해물과백두산이 마르고</td>
							<td class="review-content">이선제</td>
							<td class="review-content">2020-03-26</td>
						</tr>
						<tr>
							<td class="review-content">1</td>
							<td class="review-content">동해물과백두산이 마르고</td>
							<td class="review-content">이선제</td>
							<td class="review-content">2020-03-26</td>
						</tr>
						<tr>
							<td class="review-content">1</td>
							<td class="review-content">동해물과백두산이 마르고</td>
							<td class="review-content">이선제</td>
							<td class="review-content">2020-03-26</td>
						</tr>
						
					</tbody>
				</table>
				<div>
					<button id="QnA-btn"class="btn-standard">문의하기</button> 				
				</div> 
			</section>
		</div>
	</div>	

	<%@ include file="/views/layout/footer.jsp"%>
	
	<script>
		$('#QnA-btn').on('click', function(){
			window.open('<%=request.getContextPath()%>/views/customer/sendQnA.jsp', "sendQnA", "width=550, height=600");
		})
	
		$(document).on('click', '.review-content:nth-child(3)', function(){
			var reviewNo = $(this).prev().prev().find('input').val()
			console.log(reviewNo);
			location.href='<%=request.getContextPath() %>/reviewDetail.me?reviewNo=' + reviewNo;
		})
		
		$(document).on('click', '.worry-content:nth-child(2)', function(){
			var worryNo = $(this).prev().find('input').val()
			console.log(worryNo);
			location.href='<%=request.getContextPath() %>/worryDetail.bo?worryNo=' + worryNo;
		})
	
		function update(){	
			var profile = $('#profile').attr('src');
			var category = "c";
			var id = '<%= mpc.getUser_id()%>'
			var pwd = '<%= mpc.getUser_pwd()%>'
			console.log(id);
			$.ajax({
				url: 'login.me',
				data: {category:category, id:id, pwd:pwd}
			})
		}
	
		$('#basic_img').on('click', function(){
			$("#profile").attr("src", "<%= request.getContextPath()%>/member_images/icon.png");
			$('#stand').val("basic");
		})
		
		function LoadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){								
					switch(num){
					case 1: 
						$("#profile").attr("src", e.target.result);
						$('#stand').val("up");
						console.log($('#stand').val());
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
		
	
	
		$(function(){
			
			// 피부타입 라디오 박스 체크하기
			var skintype = '<%= mpc.getSkintype() %>'
			$('input:radio[name=skinType]:input[value=' + skintype + ']').attr("checked", true);
			
			// 현재 날짜 
			var age = '<%= mpc.getAge()%>'
			var y = new Date().getFullYear();
			var m = new Date().getMonth() + 1;
			var d = new Date().getDate();
			
			
			var ageY = age.substr(0,2);
			y = y + "";
			if(y < ageY) {
				ageY = "19" + ageY
				console.log(ageY)
			} else {
				ageY = "20" + ageY
				console.log(ageY)
			}
			
			var ageM = age.substr(2, 2)
			var ageD = age.substr(4, 2)
			
			var birth = ageY + "-" + ageM + "-" + ageD
			console.log(birth)
			$('#birth').val(birth);
			
		})
	
		function openChangePwd(){
			window.open('/COSMEDIC/views/customer/change_pwd.jsp', 'change_pwd', 'width=600, height=650');
		}		
		$(function(){
			$('.tab-mypage').hide();
			$('.tab-mypage:first').show();
			
			$('#nav-tab-ul li').click(function(){
				if($(this).text() == '내정보관리'){
					$('.tab-mypage').hide();
					$('#tab-myControl').css('display','block');
				} else if($(this).text() == '내 리뷰'){
					$('.tab-mypage').hide();
					$('#tab-myReview').css('display','block');
				} else if($(this).text() == '내 게시글'){
					$('.tab-mypage').hide();
					$('#tab-myPost').css('display','block');
				} else if($(this).text() == '내 예약'){
					$('.tab-mypage').hide();
					$('#tab_myReservation').css('display','block');
				} else {
					$('.tab-mypage').hide();
					$('#tab-myQnA').css('display','block');
				}
			})
			
		})
	</script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
	
</body>
</html>