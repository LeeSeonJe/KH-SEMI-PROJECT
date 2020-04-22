<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String emailNoSNS = (String) session.getAttribute("emailNoSNS");
	// 소셜로그인용
	String id = (String) request.getAttribute("id");
	String emailSNS = (String) request.getAttribute("emailSNS");
	String nickname = (String) request.getAttribute("nickname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/commonCss/SignUpCustomer3.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/radio.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/inputFile.css"
	type="text/css">
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<!-- 작성 -->
	</div>

	<form class="loginForm" action="<%= request.getContextPath() %>/insertC.me" method="post" encType="multipart/form-data">

		<div>
			<br> <br> <br> <br>
		</div>
		<div class="mLogin">
			<br> <br> 
			<div class="SUI">
				<div class = "SUII2">
				</div>	
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk1_2_1.png">
				</div>
				<div class="SUII3">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk2_2_1.png">
				</div>
				<div class="SUII3">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk3_1_1.png">
				</div>
				<div class="SUII3">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk4_2_1.png">
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
			<div class="SUChk" 
				<% if(emailSNS != null) { %>
				style="height: 800px"
				<% } %>
				>
				<div class="SUChkSi"></div>
				<div class="SUChkSi2"></div>
				<div class="SUChkMain2">회원정보 입력</div>
				<div class="SUChkMain5" id="SUChkMain5Focus">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 0%;">*</h3>
					는 필수 입력 항목 입니다.
				</div>
				<div class="SUChkSi3"></div>
				<% if(emailSNS == null) { %>
				<div class="SUChkMain">
					아이디
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainI" id="SUChkMainIID"
						name="userId" 
						<% if(emailSNS != null) { %>
							value="<%= id %>" readonly
						<% } %>
						>
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="IDCheckkF">
							<input type="button" class="imgAlert1"
								value="아이디는 8자 이상, 숫자와 영문자만 포함해야 합니다.                                    "
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
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="password" class="SUChkMainI" id="SUChkMainIPwd" name="userPwd"
					<% if(emailSNS != null) { %>
							readonly
					<% } %>
					>
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="pwdCheckkF">
							<input type="button" class="imgAlert1"
								value="      비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다."
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
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="password" class="SUChkMainI" id="SUChkMainIPwdC"
					<% if(emailSNS != null) { %>
							readonly
					<% } %>
					>
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
				<% } else {%>
				<input type="hidden" class="SUChkMainI" id="SUChkMainIID"
						name="userId" 
						<% if(emailSNS != null) { %>
							value="<%= id %>" readonly 
						<% } %>
						>
				<% } %>
				<div class="SUChkMain">
					이름
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainI" id="SUChkMainINameC"
						name="userName"
					<% if(emailSNS != null) { %>
						value="<%= nickname %>" readonly
					<% } %>	
					>
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="nameConfirmmT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					이메일
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
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
					주민등록번호
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainIEFront" id="SUChkMainPID"
						maxlength="6"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
						name="userBirth"> - <input type="text"
						class="SUChkMainIE2" id="SUChkMainPID2" maxlength="1"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="personIDConfirmmF">
							<input type="button" class="imgAlert1"
								value="올바른 주민번호가 아닙니다.                                                                                 "
								disabled>
						</div>
						<div class="SUChkMainICF" id="personIDConfirmmT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					생년월일
					<h3
						style="font-size: 13pt; color: white; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<div style="display: inline-block;">
						<input class="SUChkMainICFBirth" id="customerBY" type="text"
							readonly> <input class="SUChkMainICFBirth2"
							id="customerBM" type="text" readonly> <input
							class="SUChkMainICFBirth2" id="customerBD" type="text" readonly>
						<div style="display: inline-block;">
							<div class="SUChkMainICF" id="personIDConfirmmTTT1">
								<input type="button" class="imgAlert2" disabled>
							</div>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					성별
					<h3
						style="font-size: 13pt; color: white; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainGender" id="customerGender"
						name="gender" readonly>
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="personIDConfirmmTTT2">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					피부 타입
					<h3
						style="font-size: 13pt; color: white; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<div class="SUChkMainRadio">
						<label style="font-weight: 100;"> <input type="radio"
							class="radio" name="skintype" value="건성" checked readonly>
							<span class="label"> </span> 건성 &nbsp;&nbsp;
						</label> <label style="font-weight: 100;"> <input type="radio"
							class="radio" name="skintype" value="지성" readonly> <span
							class="label"> </span> 지성 &nbsp;&nbsp;
						</label> <label style="font-weight: 100;"> <input type="radio"
							class="radio" name="skintype" value="중성" readonly> <span
							class="label"> </span> 중성 &nbsp;&nbsp;
						</label> <label style="font-weight: 100;"> <input type="radio"
							class="radio" name="skintype" value="복합성" readonly> <span
							class="label">s </span> 복합성 &nbsp;&nbsp;
						</label> <label style="font-weight: 100;"> <input type="radio"
							class="radio" name="skintype" value="민감성" readonly> <span
							class="label"> </span> 민감성 &nbsp;&nbsp;
						</label>
					</div>
				</div>
				<div class="SUChkMain">
					프로필 사진
					<h3
						style="font-size: 13pt; color: white; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<div id="titleImgArea">
						<img id="titleImg" width="200" height="150"
								src ="<%= request.getContextPath() %>/member_images/icon.png">
						<button class="btn-standard" type="button" id="selectBtn">파일 선택</button>
					</div>
					<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
					</div>
				</div>
				
				<script>
					$(function(){
						$("#fileArea").hide();
						
						$("#selectBtn").click(function(){
							$("#thumbnailImg1").click();
						});
					});
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								}
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
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
				<input type="submit" class="SUBC" id="SUBCC2" value="다음단계"
					style="background-color: #DF1758; border: 1px solid #DF1758; color: white;">

			</div>
		</div>
	</form>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
	var email = "<%= emailSNS %>";
	$(function() {
		$(".SUChkMainICF").hide();
		$("#SUBCC2").hide();
		$("#SUBCC1").show();
		$("#genderConfirmmN").show();
		$("#nameConfirmmTT").show();
	});

	$('.loginForm').keyup(
					function() {
						var flag1 = false;
						var flag2 = false;
						var flag3 = false;
						var flag4 = false;
						var flag5 = false;

						//var regi = /^(?=.*?[A-Za-z])(?=.*?[0-9]).{8,}$/;
						var regi = /^[A-Za-z0-9]{8,}$/;
						var id = $("#SUChkMainIID").val();

						var reg =  /(?=.*\d{1,})(?=.*[~`!@#$%\^&*()-+=]{1,})(?=.*[a-z]{1,})(?=.*[A-Z]{1,}).{8,}$/;

						var pwd = $("#SUChkMainIPwd").val();

						var pwdd = $("#SUChkMainIPwdC").val();
						var pwd1 = document.getElementById('SUChkMainIPwd');
						var pwd2 = document
								.getElementById('SUChkMainIPwdC');

						var PID = $('#SUChkMainPID').val();
						var PID2 = $('#SUChkMainPID2').val().substr(0,1);
						var yyyy = $('#SUChkMainPID').val().substr(0, 2);
						var MM = $('#SUChkMainPID').val().substr(2, 2);
						var dd = $('#SUChkMainPID').val().substr(4, 2);
						var gender = $("#SUChkMainPID2").val().substr(0, 1);

						var flagg1 = false;
						var flagg2 = false;
						var flagg3 = false;
						var flagg4 = false;

						$(".SUChkMainIEFront").keyup(function() {
							var charLimit = $(this).attr("maxlength");
							if (this.value.length >= charLimit) {
								$("#SUChkMainPID2").focus();
								return false;
							}
						});

						$(".SUChkMainICFBirthh").keyup(
								function() {
									var charLimit = $(this).attr(
											"maxlength");
									if (this.value.length >= charLimit) {
										$(this).next('.SUChkMainICFBirthh')
												.focus();
										return false;
									}
								});
						
						if(email == "null"){
							if (id.length > 0) {
								if (true == regi.test(id)) {
									$("#IDCheckkF").hide();
									$("#IDCheckkT").show();
									flag1 = true;
								} else {
									$("#IDCheckkT").hide();
									$("#IDCheckkF").show();
									flag1 = false;
								}
							}
	
							if (pwd.length > 0) {
								if (true == reg.test(pwd)) {
									$("#pwdCheckkF").hide();
									$("#pwdCheckkT").show();
									flag2 = true;
								} else {
									$("#pwdCheckkT").hide();
									$("#pwdCheckkF").show();
									flag2 = false;
								}
							} 
		
							if ((pwd.length > 0)&&(pwdd.length > 0)) {
									if (true == reg.test(pwd)) {
										if (pwd1.value == pwd2.value) {
											$("#pwdConfirmmF").hide();
											$("#pwdConfirmmT").show();
											flag3 = true;
										} else {
											$("#pwdConfirmmT").hide();
											$("#pwdConfirmmF").show();
											flag3 = false;
										}
									} else {
										$("#pwdConfirmmT").hide();
										$("#pwdConfirmmF").hide();
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
						}
						
						// 주민번호 유효성
						if (($('#SUChkMainPID').val().length < 1)
								|| ($('#SUChkMainPID').val().length < 6)) {
							flagg1 = false;
						} else {
							flagg1 = true;
						}

						if (($('#SUChkMainPID2').val().length < 1) ||(PID2 < 1)||(PID2 > 4)) {
							
							flagg2 = false;
							
						} else {
							flagg2 = true;
						}

						if ((dd > 0) && (dd < 32)) {
							flagg3 = true;
						} else {

							flagg3 = false;
						}

						if ((MM > 0) && (MM < 13)) {
							flagg4 = true;
						} else {
							flagg4 = false;
						}

						if ((PID.length > 0) && (PID2.length > 0)) {
							if ((flagg1 == true)&&(flagg2 == true)&&(flagg3 == true)&&(flagg4 == true)) {
								$("#personIDConfirmmF").hide();
								$("#personIDConfirmmTTF1").hide();
								$("#personIDConfirmmTTF2").hide();
								$("#personIDConfirmmT").show();
								$("#personIDConfirmmTTT1").show();
								$("#personIDConfirmmTTT2").show();
								flag5 = true; 
							} else if(PID2.length == 0) {
								$("#personIDConfirmmT").hide();
								$("#personIDConfirmmTTT1").hide();
								$("#personIDConfirmmTTT2").hide();
								$("#personIDConfirmmF").show();
								$("#personIDConfirmmTTF1").show();
								$("#personIDConfirmmTTF2").show();
								flag5 = false;
							} else{
								$("#personIDConfirmmT").hide();
								$("#personIDConfirmmTTT1").hide();
								$("#personIDConfirmmTTT2").hide();
								$("#personIDConfirmmF").show();
								$("#personIDConfirmmTTF1").show();
								$("#personIDConfirmmTTF2").show();
								flag5 = false;
							}

						}			
						// 회원가입 버튼 show hide

						if(email != null){
							flag1 = true;
							flag2 = true;
							flag3 = true;
							flag4 = true;
						}
						if ((flag1 == true) && (flag2 == true)
								&& (flag3 == true) && (flag4 == true)
								&& (flag5 == true)) {
							$("#SUBCC1").hide();
							$("#SUBCC2").show();

						} else {
							$("#SUBCC2").hide();
							$("#SUBCC1").show();

						}

						if (($('#SUChkMainPID').val().length > 0)
								&& ($('#SUChkMainPID2').val().length > 0)
								&& (dd > 0) && (dd < 32) && (MM > 0)
								&& (MM < 13)) {
							if ((gender == 1) || (gender == 2)) {
								$('#customerBY').val("19" + yyyy);
								$('#customerBM').val(MM);
								$('#customerBD').val(dd);
							} else if ((gender == 3) || (gender == 4)) {
								$('#customerBY').val("20" + yyyy);
								$('#customerBM').val(MM);
								$('#customerBD').val(dd);
							} else {
								$('#customerBY').val("");
								$('#customerBM').val("");
								$('#customerBD').val("");
							}
						} else {
							$('#customerBY').val("");
							$('#customerBM').val("");
							$('#customerBD').val("");
						}

						if ((gender == 1) || (gender == 3)) {
							$("#customerGender").val("남성");
						} else if ((gender == 2) || (gender == 4)) {
							$("#customerGender").val("여성");
						}
					});
	</script>
</body>
</html>