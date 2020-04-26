<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="hospital.model.vo.Hospital"%>
<%
	Hospital h = (Hospital) request.getAttribute("h");
%>
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
    padding-left: 100px;
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
	width: 170px;
}

table#myInform>tbody>tr>td.tab-myControl-content {
	width: 700px;
}


table#myInform2>tbody>tr>td {
    height: 65px;
    padding: 18px;
    border-bottom: 1px solid gray;
}

table#myInform2>tbody>tr>td.tab-myControl-category {
	width: 170px;
	text-align: left;
}
table#myInform2>tbody>tr>td.tab-myControl-content1 {
	width: 230px;
}
table#myInform2>tbody>tr>td.tab-myControl-content2 {
	width: 230px;
}

.skinType {
	padding: 10px;
}

#btn-category {
	margin: auto;
    width: 50%;
    margin-top: 20px; 
}

#btn-category>form>button {
	margin-right: 15px;
}
#main-div{
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
    width:90px;
}

table#myReview>thead>tr>th#title2 {
	width:420px;
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
    width:90px;
}

table#myPost>thead>tr>th#title2 {
	width:420px;
}

table#myPost>tbody>tr>td{
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
</style>
</head>
<body>
   <div class="contents">
      <%@ include file="/views/layout/header.jsp"%>
      <hr>
      <section id="page-name">
         <h2>병원 마이 페이지</h2>
      </section>
      <hr>
      <div id="main-div">
         <section id="nav-tab">
            <ul id="nav-tab-ul">
               <li style="background: #f2d0e0" onclick="location.href = '<%= request.getContextPath()%>/mypage.hos'">내정보관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/bookControl.hos'">예약 관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/hospitalQnA.hos'">1대1 문의</li>
            </ul>
         </section>
         
         <!-- 회원관리 -->
         <section id="tab-myControl" class="tab-mypage">
				<div id="tab-title">내정보관리</div>
				<div id="tab-title-detail">고객님의 개인정보 보호를 위해 최선을 다하겠습니다.</div>
				<hr>
				<form action="hMyPage.up" method="post" enctype="multipart/form-data" onsubmit="return update()">
					<table id="myInform" class="table-standard">
						<tbody>
							<tr>
								<td class="tab-myControl-category">아이디</td>
								<td class="tab-myControl-content"><%= loginUser.getUser_id() %></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">병원 명</td>
								<td class="tab-myControl-content"><%= loginUser.getUser_name() %></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">이메일</td>
								<td class="tab-myControl-content"><%= h.getEmail() %></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">병원 전화번호</td>
								<td class="tab-myControl-content"><%= h.getTel() %></td>
							</tr>
							<tr>
								<td class="tab-myControl-content-category">병원 주소</td>
								<td class="tab-myControl-content"><%= h.getAddress() %></td>
							</tr>
						</tbody>
					</table>
					<table id="myInform2">
							<tr>
								<td class="tab-myControl-category">사업자 등록증</td>
								<td class="tab-myControl-content1">
									<img src='<%= request.getContextPath() %>/hospital_images/<%= h.getRegi() %>' width="200" height="200">
								</td>
								<td class="tab-myControl-content2" style="width='200'" height="200""></td>
								<td class="tab-myControl-content2" style="width='200'" height="200""></td>
							</tr>
							<tr>
								<td class="tab-myControl-category">병원 이미지</td>
								<% String[] images = h.getHospital_img().split(","); %>
								<td id="contentImgArea1" class="tab-myControl-content2">
									<img id="contentImg1" src='<%= request.getContextPath() %>/hospital_images/<%= images[0] %>' width="200" height="200">
									<input type="hidden" id="hFirst" name="first"/>
								</td>
								<td id="contentImgArea2" class="tab-myControl-content2">
									<img id="contentImg2" src='<%= request.getContextPath() %>/hospital_images/<%= images[1] %>' width="200" height="200"> 
									<input type="hidden" id="hSecond" name="second"/>
								</td>
								<td id="contentImgArea3" class="tab-myControl-content2">
									<img id="contentImg3" src='<%= request.getContextPath() %>/hospital_images/<%= images[2] %>' width="200" height="200">
									<input type="hidden" id="hThird" name="third"/>
								</td>
							</tr>
					</table>
					<div id="fileArea">
						<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
						<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
						<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					</div>
					<table id="myInform" class="table-standard">
						<tbody>
							<tr>
								<td class="tab-myControl-category">병원 설명</td>
								<td class="tab-myControl-content">
									<textarea style = "height : 300px; width : 700px; font-size : 13pt; margin-top : 10px ; padding-top : 5px; resize:none;" name="about"><%= h.getHospital_about() %></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div id="btn-category">
							<button type="submit" id="updateBtn" class="btn-standard">수정하기</button>
							<button id="change_pwd"type="button" class="btn-standard" onclick="openChangePwd()">비밀번호변경</button>	
							<button type="button" class="btn-standard">회원탈퇴</button>				
					</div> 
				</form>
			</section>		      
      </div>
   </div>   

   <%@ include file="/views/layout/footer.jsp"%>
   
	<script>
		function update(){
			var profile = $('#profile').attr('src');
			var category = "H";
			var id = '<%= loginUser.getUser_id()%>'
			var pwd = '<%= loginUser.getUser_pwd()%>'
			console.log(id);
			console.log(pwd);
			$.ajax({
				url: 'login.me',
				data: {category:category, id:id, pwd:pwd}
			})
			$.ajax({
				url: 'login.me',
				data: {category:category, id:id, pwd:pwd}
			})	
			$.ajax({
				url: 'login.me',
				data: {category:category, id:id, pwd:pwd}
			})	
		}
	
		$(function(){
			$("#fileArea").hide();
// 			$("#fileArea2").hide();
			
// 			$("#titleImgArea").click(function(){
// 				$("#thumbnailImg1").click();
// 			});
			$("#contentImgArea1").click(function(){
				$("#thumbnailImg1").click();
			});
			$("#contentImgArea2").click(function(){
				$("#thumbnailImg2").click();
			});
			$("#contentImgArea3").click(function(){
				$("#thumbnailImg3").click();
			});
		});
		
		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){								
					switch(num){
// 					case 1: 
// 						$("#titleImg").attr("src", e.target.result);
// 						break;
					case 1:
						$("#contentImg1").attr("src", e.target.result);
						$("#hFirst").val("first");
						break;
					case 2: 
						$("#contentImg2").attr("src", e.target.result);
						$("#hSecond").val("second");
						break;
					case 3:
						$("#contentImg3").attr("src", e.target.result);
						$("#hThird").val("third");
						break;
					}
				}
				
				reader.readAsDataURL(value.files[0]);
			}
		}
	</script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
   
</body>
</html>