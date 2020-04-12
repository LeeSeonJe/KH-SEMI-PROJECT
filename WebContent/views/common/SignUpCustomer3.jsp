<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) request.getAttribute("id");
	String email = (String) request.getAttribute("email");
	String nickname = (String) request.getAttribute("nickname");
	String profile_image = (String) request.getAttribute("profile_image");
	String gender = (String) request.getAttribute("gender");
	
	System.out.println(nickname);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
div.loginForm {
	width: 100%;
	height: 2200px;
	background-color: #DDDDDD;
}

div.logoDiv {
	text-align: center;
	top: 0%;
}

img.logoImg {
	width: 250px;
	height: 250px;
}

div.mLogin {
	width: 75%;
	height: 90%;
	background: white;
}

div.bLogin {
	width: 50%;
	height: 450px;
	float: left;
	border-right: 2px solid slategray;
}

div.fLogin {
	width: 50%;
	height: 450px;
	float: right;
}

div.bLogin2 {
	vertical-align: middle;
	width: 70%;
	height: 85%;
}

div.fLogin2 {
	width: 70%;
	height: 85%;
}

div.loginFont {
	font-size: 26pt;
}

div.loginCB {
	font-size: 13pt;
	margin-left: 212px;
}

div.mSignUp {
	height: 350px;
	width: 100%;
	float: right;
}

div.mSignUpI {
	height: 300px;
	width: 85%;
	border: 1px solid slategray;
}

div.mSignUpII {
	width: 42%;
	height: 300px;
	float: left;
	margin-left: 10%;
	font-size: 25pt;
}

div.mSignUpIS {
	width: 42%;
	height: 350px;
	float: left;
}

div.mSignUpISI {
	font-size: 13pt;
	color: slategray;
	font-weight: 100;
}

div.SUI {
	width: 90%;
	text-align: center;
}

div.SUII {
	width: 12%;
	float: left;
	font-size: 16pt;
	height: 400px;
}

div.SUII2 {
	width: 4%;
	float: left;
	font-size: 16pt;
	height: 400px;
}

div.SUChk {
	margin-left: 10%;
	background-color: white;
	width: 80%;
	height: 1200px;
	text-align: left;
	float: left;
	font-size: 16pt;
	border: 1px solid black;
}

div.SUChk2 {
	margin-left: 10%;
	background-color: white;
	width: 80%;
	height: 180px;
	text-align: left;
	float: left;
	font-size: 16pt;
	border-bottom: 1px solid black;
}

div.SUChkBF {
	float: right;
}

div.SUB {
	float: left;
	width: 50%;
	margin-left: 25%;
}

div.SUChkMain2 {
	width: 65%;
	height: 60px;
	font-size: 19pt;
	float: left;
}

div.SUChkMain5 {
	width: 30%;
	float: left;
	font-size: 15pt;
}

div.SUChkMain {
	width: 15%;
	height: 60px;
	font-size: 15pt;
	float: left;
}

div.SUChkMain3 {
	width: 75%;
	height: 80px;
	font-size: 15pt;
	float: left;
}

div.SUChkSi {
	width: 5%;
	height: 100%;
	float: left;
}

div.SUChkSi2 {
	width: 95%;
	height: 50px;
	float: left;
}

div.SUChkSi3 {
	width: 95%;
	height: 25px;
	float: left;
}

div.SUChkMainICF {
	height: 30px;
	width: 500px;
	float: left;
}

div.SUChkMainICFE {
	height: 30px;
	width: 500px;
	float: left;
}

div.SUChkMainRadio {
	margin-top: 8px;
}

input.loginInput {
	width: 610px;
	height: 50px;
	font-size: 14pt;
}

input.loginPBtn {
	width: 610px;
	height: 76px;
	background-color: #DF1758;
	color: white;
	border: none;
	font-size: 12pt;
}

input.loginPBtnC {
	height: 20px;
	width: 20px;
}

input.loginPBtnF {
	text-align: left;
	background-color: white;
	border: none;
	font-size: 13pt;
}

input.loginFBtnN {
	width: 610px;
	height: 84px;
	background-color: #2DB400;
	color: white;
	font-size: 12pt;
	border: none;
	background-image: url('../../resources/images/naver.png');
	background-repeat: no-repeat;
	background-position: 28px 28px;
}

input.loginFBtnF {
	width: 610px;
	height: 84px;
	background-color: #3b5998;
	font-size: 12pt;
	color: white;
	border: none;
	background-image: url('../../resources/images/facebook.png');
	background-repeat: no-repeat;
	background-position: 28px 28px;
}

input.loginFBtnK {
	width: 610px;
	height: 84px;
	background-color: #f9df00;
	font-size: 12pt;
	color: #3b1c1c;
	border: none;
	background-image: url('../../resources/images/kakao3.png');
	background-repeat: no-repeat;
	background-position: 28px 28px;
}

input.mSignUpISB {
	width: 350px;
	height: 60px;
	background-color: white;
	color: #DF1758;
	border-radius: 30px;
	border: 2px solid #DF1758;
	font-size: 15pt;
	background-image: url('../../resources/images/signup2.jpg');
	background-repeat: no-repeat;
	background-position: 45px 5px;
}

input.SUChkC {
	width: 35px;
	height: 35px;
	background-color: white;
	border: 1px solid black;
}

input.SUChkBt {
	font-size: 13pt;
	background-color: #DF1758;
	border: none;
	color: white;
	width: 150px;
	height: 60px;
	margin-right: 0px;
}

input.SUBC {
	width: 350px;
	height: 80px;
	font-size: 15pt;
	float: left;
}

input.SUChkMainI {
	width: 250px;
	height: 45px;
}

input.imgAlert1 {
	width: 500px;
	height: 50px;
	background-color: white;
	border: none;
	background-image: url('../../resources/images/AlertIcon1_1_1.png');
	background-repeat: no-repeat;
	background-position: -5px -10px;
	font-size: 10pt;
	color: #595959;
}

input.imgAlert2 {
	width: 50px;
	height: 50px;
	background-color: white;
	border: none;
	background-image: url('../../resources/images/AlertIcon2_1_1.png');
	background-repeat: no-repeat;
	background-position: -5px -10px;
}

input.SUChkMainIE {
	width: 200px;
	height: 46px;
}

input.SUChkMainIE2 {
	width: 30px;
	height: 46px;
}

input.SUChkMainIEFront {
	width: 150px;
	height: 46px;
}

input.SUChkMainICFBirth {
	width: 100px;
	height: 46px;
}

input.SUChkMainICFBirthh {
	width: 100px;
	height: 46px;
}

input.SUChkMainICFBirth2 {
	width: 50px;
	height: 46px;
}

input.SUChkMainGender {
	width: 50px;
	height: 46px;
}

img.SUImg {
	width: 220px;
	height: 220px;
	text-align: left;
}

img.SUImg2 {
	width: 35px;
	height: 35px;
}

h3.SUImgI {
	font-size: 19pt;
	font-weight: 600;
}

/*filebox*/
/*checkbox*/
</style>
<%@ include file="/views/layout/import.jsp"%>

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

	<div class="loginForm">

		<div>
			<br> <br> <br> <br>
		</div>
		<div class="mLogin">
			<br> <br> <br>
			<div class="SUI">
				<div class="SUII2"></div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk1_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 1
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 약관동의</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk2_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 2
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인인증</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk3_1_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 3
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정보입력</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk4_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 4
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입완료</h3>
				</div>
				<div class="SUII2"></div>
			</div>
			<div class="SUChk">
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
				<div class="SUChkMain">
					아이디
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainI" id="SUChkMainIID">
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
					<input type="password" class="SUChkMainI" id="SUChkMainIPwd">
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
				<div class="SUChkMain">
					이름
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainI" id="SUChkMainINameC">
					<div style="display: inline-block;">
						<div class="SUChkMainICF" id="nameConfirmmT">
							<input type="button" class="imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class="SUChkMain">
					전화번호
					<h3
						style="font-size: 13pt; color: white; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainICFBirthh" maxlength="3">
					- <input type="text" class="SUChkMainICFBirthh" maxlength="4">
					- <input type="text" class="SUChkMainICFBirthh" maxlength="4">
				</div>
				<div class="SUChkMain">
					이메일
					<h3
						style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainIE" readonly value="cosmedic">
					<input type="text" class="SUChkMainIE" readonly value="naver.com">
					<div style="display: inline-block;">
						<div class="SUChkMainICFE" id="emailConfirmmF"
							style="width: 50px;">
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
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"> -
					<input type="text" class="SUChkMainIE2" id="SUChkMainPID2"
						maxlength="1"
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
						readonly>
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

					<div class="fileBox">
						<input type="text" class="fileName" readonly="readonly" style = "height : 45px; width : 300px; font-size : 15pt"> 
						<label for="uploadBtn" class="btn_file" style = "height : 45px; margin-top : 5px; font-weight : 100;">찾아보기</label> 
						<input type="file" id="uploadBtn" class="uploadBtn">
					</div>
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
				<input class="SUBC" id="SUBCC2" type="button" value="다음단계"
					style="background-color: #DF1758; border: 1px solid #DF1758; color: white;"
					onclick="location.href='SignUpCustomer4.jsp' ">

			</div>
		</div>
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$(function() {
			$(".SUChkMainICF").hide();
			$("#SUBCC2").hide();
			$("#SUBCC1").show();
			$("#genderConfirmmN").show();
		});
		var uploadFile = $('.fileBox .uploadBtn');
		uploadFile.on('change',
				function() {
					if (window.FileReader) {
						var filename = $(this)[0].files[0].name;
					} else {
						var filename = $(this).val().split('/').pop().split(
								'\\').pop();
					}
					$(this).siblings('.fileName').val(filename);
				});
		$('.loginForm').keyup(
						function() {
							var flag1 = false;
							var flag2 = false;
							var flag3 = false;
							var flag4 = false;
							var flag5 = false;

							var regi = /^(?=.*?[A-Z,a-z])(?=.*?[0-9]).{8,}$/;
							var id = $("#SUChkMainIID").val();

							var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
							var pwd = $("#SUChkMainIPwd").val();

							var pwdd = $("#SUChkMainIPwdC").val();
							var pwd1 = document.getElementById('SUChkMainIPwd');
							var pwd2 = document
									.getElementById('SUChkMainIPwdC');

							var PID = $('#SUChkMainPID').val();
							var PID2 = $('#SUChkMainPID2').val();
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
							} else {

							}

							if (pwdd.length > 0) {
								if (pwdd.length > 0) {
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
										$("#pwdConfirmmF").show();
										flag3 = false;
									}
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

							// 주민번호 유효성
							if (($('#SUChkMainPID').val().length < 1)
									|| ($('#SUChkMainPID').val().length < 6)) {
								flagg1 = false;
							} else {
								flagg1 = true;
							}

							if ($('#SUChkMainPID2').val().length < 1) {
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

							if ((PID.length > 0) || (PID2.lenth > 0)) {
								if (flagg1 == true) {
									if (flagg2 == true) {
										if (flagg3 == true) {
											if (flagg4 == true) {
												$("#personIDConfirmmF").hide();
												$("#personIDConfirmmT").show();

												$("#personIDConfirmmTTF1")
														.hide();
												$("#personIDConfirmmTTF2")
														.hide();
												$("#personIDConfirmmTTT1")
														.show();
												$("#personIDConfirmmTTT2")
														.show();
												flag5 = true;
											}
										}
									}
								} else {
									$("#personIDConfirmmT").hide();
									$("#personIDConfirmmF").show();

									$("#personIDConfirmmTTT1").hide();
									$("#personIDConfirmmTTT2").hide();
									$("#personIDConfirmmTTF1").show();
									$("#personIDConfirmmTTF2").show();
									flag5 = false;
								}

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