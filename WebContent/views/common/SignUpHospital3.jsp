<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-image: url('../../resources/images/AlertIcon2_1_12.png');
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

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header2.jsp"%>
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
						src="<%=request.getContextPath()%>/resources/images/SUHChk1_1_2.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 1
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 약관동의</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk2_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 2
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인인증</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk3_1_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 3
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정보입력</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk4_2_1.png">
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
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
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
				<div class="SUChkMain">
					병원 상호명
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
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
					병원 전화번호
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">
					<input type="text" class="SUChkMainICFBirthh" maxlength="3"
						style="float: left" id="phoneCF1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					<h3 style="float: left; margin-top: 10px; font-size: 16pt;">&nbsp;-&nbsp;</h3>
					<input type="text" class="SUChkMainICFBirthh" maxlength="4"
						style="float: left" id="phoneCF2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					<h3 style="float: left; margin-top: 10px; font-size: 16pt;">&nbsp;-&nbsp;</h3>
					<input type="text" class="SUChkMainICFBirthh" maxlength="4"
						style="float: left" id="phoneCF3" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
					<div class="SUChkMainICF" id="phoneCheckkF"
						style="margin-top: 3px; margin-left: 3px;">
						<input type="button" class="imgAlert1"
							value="전화번호를 모두 입력해 주세요.                                                                            "
							disabled>
					</div>
					<div class="SUChkMainICF" id="phoneCheckkT"
						style="margin-top: 3px; margin-left: 3px;">
						<input type="button" class="imgAlert2" disabled>
					</div>
				</div>
				<div class="SUChkMain">
					사업자등록증 사진
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">

					<div class="fileBox" id="fileBox1">
						<input type="text" class="fileName" id="hospitalLicense"
							readonly="readonly"
							style="height: 45px; width: 300px; font-size: 15pt"> <input
							type="file" id="uploadBtn1" class="uploadBtn">
					</div>
				</div>
				<div class="SUChkMain">
					병원 사진
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">

					<div class="fileBox" id="fileBox">
						<input type="text" class="fileName" id="hospitalPhoto"
							readonly="readonly"
							style="height: 45px; width: 300px; font-size: 15pt"> <input
							type="file" id="uploadBtn2" class="uploadBtn">
					</div>
				</div>
				<div class="SUChkMain">
					병원 설명
					<h3
						style="font-size: 13pt; color: #4BD763; display: inline-block; margin-top: 8%;">*</h3>
				</div>
				<div class="SUChkMain3">

					<div class="	">
						<input type="text" class="fileNameee" id="hospitalIntroduce"
							style="height: 300px; width: 700px; font-size: 15pt; margin-top: 10px; padding-top: 5px;">

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
					style="background-color: #4BD763; border: 1px solid #4BD763; color: white;"
					onclick="location.href='SignUpHospital4.jsp' ">

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

							var regi = /^(?=.*?[A-Z,a-z])(?=.*?[0-9]).{8,}$/;
							var id = $("#SUChkMainIID").val();

							var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
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

							if (p1.length < 1) {
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

							if (($("#uploadBtn1").val().length > 0)
									&& ($("#uploadBtn2").val().length > 0)
									&& ($("#hospitalIntroduce").val().length)) {
								flag5 = true;
							} else {
								flag5 = false;
							}

							if ((flag1 == true) && (flag2 == true)
									&& (flag3 == true) && (flag4 == true)
									&& (flag5 == true) && (flag6 == true)) {
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