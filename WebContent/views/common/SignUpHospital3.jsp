<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String emailNoSNS = (String) session.getAttribute("emailNoSNS");
	// 소셜로그인용
	String emailSNS = (String) request.getAttribute("emailSNS");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/commonCss/SignUpHospital3.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/radio.css"
	type="text/css">

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header2.jsp"%>
		<!-- 작성 -->

	</div>
	<form action="<%= request.getContextPath() %>/insertH.me" method="post" encType="multipart/form-data">
	<div class="loginForm">

		<div>
			<br> <br> <br> <br>
		</div>
		<div class="mLogin">
			<br> <br> 
			<div class="SUI">
					<div class="SUII2"></div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk1_1_2.png">
					</div>
					<div class="SUII3">
						<br> <br> <br> <img class="SUImg2"
							src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
					</div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk2_2_1.png">
					</div>
					<div class="SUII3">
						<br> <br> <br> <img class="SUImg2"
							src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
					</div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk3_1_1.png">
					</div>
					<div class="SUII3">
						<br> <br> <br> <img class="SUImg2"
							src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
					</div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk4_2_1.png">
					</div>
				</div>
			<div style = "width : 80%; height : 50px; float : left; margin-left : 10%;">
				<div class = "SUIIDB">
					<div class = "SUIIDBI">
						Step 1
					</div>
				</div>
				<div class = "SUIIDBN">
				
				</div>
				<div class = "SUIIDB">
					<div class = "SUIIDBI">
						Step 2
					</div>
				</div>
				<div class = "SUIIDBN">
				
				</div>
				<div class = "SUIIDB">
					<div class = "SUIIDBI">
						Step 3
					</div>
				</div>
				<div class = "SUIIDBN">
				
				</div>
				<div class = "SUIIDB"  style = "width : 14%;">
					<div class = "SUIIDBI">
						Step 4
					</div>
				</div>
			</div>
			<div style = "width : 80%; height : 80px; float : left; margin-left : 10%;">
				<div class = "SUIIDB">
					<div class = "SUIIDBI2">
						약관동의
					</div>
				</div>
				<div class = "SUIIDBN">
				
				</div>
				<div class = "SUIIDB">
					<div class = "SUIIDBI2">
						본인인증
					</div>
				</div>
				<div class = "SUIIDBN">
				
				</div>
				<div class = "SUIIDB">
					<div class = "SUIIDBI2">
						정보입력
					</div>
				</div>
				<div class = "SUIIDBN">
				
				</div>
				<div class = "SUIIDB"  style = "width : 14%;">
					<div class = "SUIIDBI2">
						가입완료
					</div>
				</div>
				
			</div>
			<div class="SUChk">
				<div class="SUChkSi"></div>
				<div class="SUChkSi2"></div>
				<div class="SUChkMain2">회원정보 입력</div>
				<div class="SUChkMain5" id="SUChkMain5Focus">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 0%;">*</h3>
					는 필수 입력 항목 입니다.
				</div>
				<div class="SUChkSi3"></div>
				<div class="SUChkMain">
					아이디
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainI" id="SUChkMainIID" name="id">
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="IDCheckkF">
							<input type="button" class="imgAlert1"
								value="              아이디는 8자 이상, 숫자와 영문자만 포함해야 합니다.                                    "
								disabled>
						</div>
						<div class="SUChkMainICF" id="IDCheckkT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					비밀번호
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="password" class="SUChkMainI" id="SUChkMainIPwd" name="pwd">
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="pwdCheckkF">
							<input type="button" class="imgAlert1"
								value="                비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다."
								disabled>
						</div>
						<div class="SUChkMainICF" id="pwdCheckkT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					비밀번호 확인
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="password" class="SUChkMainI" id="SUChkMainIPwdC">
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="pwdConfirmmF">
							<input type="button" class="imgAlert1"
								value="비밀번호가 일치하지 않습니다.                                                                            "
								disabled>
						</div>
						<div class="SUChkMainICF" id="pwdConfirmmT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain" >
					병원 상호명
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainI" id="SUChkMainINameC" name="name" style = "border:1px solid gray">
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="nameConfirmmT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					병원 전화번호
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainICFBirthh" id="phoneCF1" maxlength="3" name="tel1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					- <input type="text" class="SUChkMainICFBirthh" id="phoneCF2" maxlength="4" name="tel2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					- <input type="text" class="SUChkMainICFBirthh" id="phoneCF3" maxlength="4" name="tel3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="phoneCheckkF">
							<input type="button" class="imgAlert1" style = "width : 450px;"
								value="전화번호를 정확히 입력해 주세요.                                                         "
								disabled>
						</div>
						<div class="SUChkMainICF" id="phoneCheckkT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">	
					이메일
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="email" class="SUChkMainIE" name="email"
					<% if(emailSNS != null) { %>
						value="<%= emailSNS %>" readonly 
					<% } else { %>
						value="<%= emailNoSNS %>" readonly 
					<% } %>
					> 
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="nameConfirmmTT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>		
				<div class="SUChkMain">
					병원 주소
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMainAddress">
					<input style="margin-bottom: 10px;"class="postcodify_postcode5 SUChkMainIE" type="text" readonly placeholder="검색버튼을 눌러 주소를 작성해주세요"/>
					<button id="postcodify_search_button" type="button" class="input-standard">검색</button><br>
					<input style="margin-bottom: 10px;" type="text" name="addressBasic" class="postcodify_address SUChkMainIE" value="" placeholder="기본주소" readonly/><br>
					<input style="margin-bottom: 10px;" type="text" name="addressDetail" class="postcodify_details SUChkMainIE" value="" placeholder="상세주소" />
				</div>
				<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
				<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
				
				<div class="SUChkMain">
					사업자등록증 사진<br>
					* 필수 항목
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMainReg">
					<div id="titleImgArea">
						<img id="titleImg" width="200" height="200">
						<button class="uploadBtn" type="button" id="selectBtn">파일 선택</button>
					</div>
					<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					</div>
				</div>
				<div class="SUChkMain">
					병원 사진<br>
					* 필수 항목<br>&nbsp;&nbsp;(사진 3장)
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMainReg">
					<div id="titleImgArea">
						<div id="contentImgArea1" style="float: left; margin-right: 20px">
							<img id="contentImg1" width="200" height="200"> 
						</div>
						<div id="contentImgArea2" style="float: left; margin-right: 20px">
							<img id="contentImg2" width="200" height="200"> 
						</div>
						<div id="contentImgArea3" style="float: left;">
							<img id="contentImg3" width="200" height="200"> 
						</div>
					</div>
					<div id="fileArea2">
					<input type="file" id="thumbnailImg2" multiple="multiple" name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple" name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple" name="thumbnailImg4" onchange="LoadImg(this,4)">
					</div>
				</div>
				<script>
					$(function(){
						$("#fileArea").hide();
						$("#fileArea2").hide();
						
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#contentImgArea1").click(function(){
							$("#thumbnailImg2").click();
						});
						$("#contentImgArea2").click(function(){
							$("#thumbnailImg3").click();
						});
						$("#contentImgArea3").click(function(){
							$("#thumbnailImg4").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								case 2:
									$("#contentImg1").attr("src", e.target.result);
									break;
								case 3: 
									$("#contentImg2").attr("src", e.target.result);
									break;
								case 4:
									$("#contentImg3").attr("src", e.target.result);
									break;
								}
							}
							
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				<div class="SUChkMain">
					병원 설명
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<div>
						<textarea class="fileNameee" id="hospitalIntroduce"style = "height : 300px; width : 700px; font-size : 15pt; margin-top : 10px ; padding-top : 5px;" name="about"></textarea> 
					</div>
					<span id="counter">0</span>/1500<br>
					<script>
					$(function(){
						// textarea에 입력된 글자수가 카운트되면서 만일 150글자가 넘어가면 빨간색으로 숫자가 바뀌게 하기
						$('#hospitalIntroduce').keyup(function(e){
							$('#counter').text($('#hospitalIntroduce')[0].textLength);
							
							if($('#counter').text() >= 1500){
								$('#counter').css('color','red');
							} else{
								$('#counter').css('color','black');
							}
						}).keydown(function(e){
							$('#counter').text($('#hospitalIntroduce')[0].textLength);
							
							if($('#counter').text() >= 1500){
								$('#counter').css('color','red');
							} else{
								$('#counter').css('color','black');
							}
						});
					});
					</script>
				</div>

			</div>
			<div class="SUB">
				<div>
					<br> <br> <br> <br>
				</div>
				<input class="SUBC" id="SUBCC" type="button" value="취소"
					style="background-color: white; border: 1px solid black;"
					onclick="location.href='loginedMain.jsp'"> <input
					class="SUBC" id="SUBCC1" type="button" value="다음단계"
					style="background-color: #595959; border: 1px solid #595959; color: white;">
				<input class="SUBC" id="SUBCC2" type="submit" value="다음단계"
					style="background-color: #4BD763; border: 1px solid #4BD763; color: white;">
			</div>
		</div>
	</div>
	</form>
	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$(function() {
			$(".SUChkMainICF").hide();
			$("#SUBCC2").hide();
			$("#SUBCC1").show();
			$("#genderConfirmmN").show();
			$("#nameConfirmmTT").show();
		});
		
		$("#phoneCF1").keyup(function() {
			var charLimit = $("#phoneCF1").attr("maxlength");
			if (this.value.length >= charLimit) {
				$('#phoneCF2').focus();
				return false;
			}
		});
		$("#phoneCF2").keyup(function() {
			var charLimit = $("#phoneCF2").attr("maxlength");
			if (this.value.length >= charLimit) {
				$('#phoneCF3').focus();
				return false;
			}
		});

		
		var uploadFile = $('.fileBox .uploadBtn');

		$('.loginForm')
				.keyup(
						function() {
							var flag1 = false;
							var flag2 = false;
							var flag3 = false;
							var flag4 = false;
							var flag5 = false;
							var flag6 = false;
							var flag7 = false;

							var regi = /^[A-Za-z0-9]{8,}$/;
							var id = $("#SUChkMainIID").val();

							var reg =  /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-z]{1,})(?=.*[A-Z]{1,}).{8,}$/;
							var pwd = $("#SUChkMainIPwd").val();
							
							var pwdd = $("#SUChkMainIPwdC").val();
							var pwd1 = document.getElementById('SUChkMainIPwd');
							var pwd2 = document.getElementById('SUChkMainIPwdC');

							var p1 = $("#phoneCF1").val();
							var p2 = $("#phoneCF2").val();
							var p3 = $("#phoneCF3").val();

							var flagg1 = false;
							var flagg2 = false;
							var flagg3 = false;
							var flagg4 = false;
							
							

							
							if (id.length > 0) {
								if (true === regi.test(id)) {
									$("#IDCheckkF").hide();
									$("#IDCheckkT").show();
									flag1 = true;
								} else {
									$("#IDCheckkT").hide();
									$("#IDCheckkF").show();
									flag1 = false;
								}
							}

							if ( p1.length < 1) {
								$("#phoneCheckkF").hide();
								$("#phoneCheckkT").hide();
							} else {
								if ((p1.length > 0) && (p2.length > 0)
										&& (p3.length > 0)) {
									$("#phoneCheckkF").hide();
									$("#phoneCheckkT").show();
									flag3 = true;
								} else {
									$("#phoneCheckkT").hide();
									$("#phoneCheckkF").show();
									flag3 = false;
								}
							}

							if ($("#SUChkMainINameC").val().length > 0) {
								$("#nameConfirmmF").hide();
								$("#nameConfirmmT").show();
								flag4 = true;
							} else {
								$("#nameConfirmmT").hide();
								$("#nameConfirmmF").show();
								flag4 = false;
							}
							
							if (pwd.length > 0) {
								if (true == reg.test(pwd)) {
									$("#pwdCheckkF").hide();
									$("#pwdCheckkT").show();
									flag6 = true;
								} else {
									$("#pwdCheckkT").hide();
									$("#pwdCheckkF").show();
									flag6 = false;
								}
							} 

							if ((pwd.length > 0) && (pwdd.length > 0)) {
								if (true == reg.test(pwd)) {
									if (pwd1.value == pwd2.value) {
										$("#pwdConfirmmF").hide();
										$("#pwdConfirmmT").show();
										flag2 = true;
									} else {
										$("#pwdConfirmmT").hide();
										$("#pwdConfirmmF").show();
										flag2 = false;
									}
								} else {
									$("#pwdConfirmmT").hide();
									$("#pwdConfirmmF").hide();
									flag2 = false;
								}
							}
              
							if ($("#SUChkMainINameC").val().length > 0) {
								$("#nameConfirmmF").hide();
								$("#nameConfirmmT").show();
								flag4 = true;
							} else {
								$("#nameConfirmmT").hide();
								$("#nameConfirmmF").show();
								flag4 = false;
							}
							
							/* if(($("#uploadBtn1").val().length > 0)&&($("#uploadBtn2").val().length >0)&&($("#hospitalIntroduce").val().length)){
								flag5 = true;
							} else {
								flag5 = false;
							} */
							
							if((flag1 == true)&&(flag2==true)&&(flag3 == true)&&(flag4 == true)/* &&(flag5 == true) */){
								$("#SUBCC1").hide();
								$("#SUBCC2").show();
							} else {
								$("#SUBCC2").hide();
								$("#SUBCC1").show();
							}
						});

		// 주민번호 유효성
	</script>
</body>
</html>