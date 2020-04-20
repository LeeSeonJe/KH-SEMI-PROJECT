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
	clip:rect(0,0,0,0); 
	border: 0; 
}

</style>

<%
	MyPageCustomer mpc = (MyPageCustomer) request.getAttribute("mpc");
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
			
			<section id="tab-myReview" class="tab-mypage">
				<div id="tab-title">내 리뷰</div>
				<div id="tab-title-detail">고객님의 리뷰를 확인, 수정, 삭제할 수 있는 페이지입니다.</div>
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
							<td class="review-content"><a href="#">동해물과백두산이 마르고</a></td>
							<td class="review-content">이선제</td>
							<td class="review-content">2020-03-26</td>
						</tr>
					</tbody>
				</table>
				
			</section>
			
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
					<tbody>
						<tr>
							<td>1</td>
							<td>동해물과백두산이 마르고</td>
							<td>이선제</td>
							<td>2020-03-26</td>
						</tr>
					</tbody>
				</table>
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
			<section id="tab-myQnA-writer" class="tab-mypage">
				<div id="tab-title">1대1 문의</div>
				<div id="tab-title-detail">고객님께서 불편을 드려서 죄송합니다. 최선을 다하겠습니다.</div>
				<hr>
				<table id="myQnA-writer">
					<thead>
						<tr>
							<td class="">제목</td>							
							<td>
								<input type="text" placeholder="제목을 입력해주세요.">
							</td>							
						</tr>
						<tr>
							<td>작성자</td>	
							<td>이선제</td>														
						</tr>
						<tr>
							<td>내용</td>							
							<td>
								<input type="text" placeholder="내용을 입력해주세요.">
							</td>							
						</tr>
					</thead>
				</table>
			</section>
		</div>
	</div>	

	<%@ include file="/views/layout/footer.jsp"%>
	
	<script>
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
		
		$('.btn-standard').click(function(){
			if($(this).text() === '문의하기'){
				$('#tab-myQnA').css('display','none');
				$('#tab-myQnA-writer').css('display','block')				
			}
		})
	
	</script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
	
</body>
</html>