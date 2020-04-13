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
	height: 1100px;
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
	width: 65%;
	height: 1000px;
	background: white;
}

div.bLogin {
	width: 40%;
	height: 60px;
	float: left;
	border-top: 1px solid black;
	border-left: 1px solid black;
	border-right: 1px solid black;
}

div.fLogin {
	width: 40%;
	height: 60px;
	float: left;
	background-color: lightgray;
	border-bottom: 1px solid black;
}

div.sideDiv1 {
	float: left;
	width: 10%;
	height: 1000px;
}

div.sideDiv2 {
	float: right;
	width: 10%;
	height: 1000px;
}

div.titlebox {
	margin-top: 18px;
	text-align: center;
	font-size: 12pt;
}

/*위*/
div.foundIdF {
	float: left;
	width: 80%;
	height: 500px;
}

div.foundIdFF {
	border: 1px solid lightgray;
	width: 100%;
	height: 500px;
	text-align: left;
	padding: 5%;
}

div.foundIdFF2 {
	border: 1px solid lightgray;
	width: 100%;
	height: 400px;
	text-align: left;
	padding: 5%;
}

div.foundIdFFS {
	font-size: 10pt;
	color: 1px solid lightgray;
	text-align: left;
}

div.foundIdI {
	font-size: 15pt;
	text-align: center;
}

div.leftBox {
	width: 20%;
	height: 60px;
	float: left;
	font-size: 12pt;
}

div.rightBox {
	width: 80%;
	height: 60px;
	float: left;
}

/* 밑  */
div.loginFont {
	font-size: 26pt;
}

div.loginCB {
	font-size: 13pt;
	height: 50px;
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

div.SignUpFace {
	font-size: 14pt;
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
	font-size: 14pt;
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
	font-size: 14pt;
	border: none;
	background-image: url('../../resources/images/naver.png');
	background-repeat: no-repeat;
	background-position: 28px 28px;
}

input.loginFBtnF {
	width: 610px;
	height: 84px;
	background-color: #3b5998;
	font-size: 14pt;
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
	font-size: 14pt;
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

input.SUBC {
	width: 350px;
	height: 80px;
	font-size: 15pt;
}

input.imgAlert1 {
   width: 500px;
   height: 50px;
   background-color: white;
   border: none;
   background-image:
      url('<%=request.getContextPath()%>/resources/images/AlertIcon1_1_1.png');
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
   background-image:
      url('<%=request.getContextPath()%>/resources/images/AlertIcon2_1_1.png');
   background-repeat: no-repeat;
   background-position: -5px -10px;
   float : left;
}

/* ios */
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
		<%@ include file="/views/layout/header.jsp"%>
		<!-- 작성 -->

	</div>
	<div
		style="background-color: lightgray; padding-bottom: 75px; margin-bottom: -50px;">
		<div class="foundIDForm">
			<div>
				<br> <br> <br>
			</div>
			<div class="mLogin">
				<div class="logoDiv">
					<br> <br> <br> <br> <br>
				</div>
				<div class="sideDiv1"></div>
				<div class="bLogin" id="foundId">
					<div class="titlebox">아이디 찾기</div>
					<br> <br>
				</div>
				<div class="fLogin" id="foundPw">
					<div class="titlebox">비밀번호 찾기</div>
				</div>
				<div class="sideDiv2"></div>
				<div class="foundIdF">
					<br> <br> <br> <br>
					<div class="foundIdI">
						등록된 회원정보 또는 본인인증을 통해 아이디를 찾으실 수 있으십니다.<br> <br>
						<div class="foundIdFF" id="foundIdFF1">
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioId1" name="radioId" checked readonly>
								<span class="label"> </span> 등록된 회원정보로 찾기
							</label>
							<div class="foundIdFFS">
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								· 회원정보에 등록된 이름, 주민번호가 일치해야만 아이디를 확인할 수 있습니다. <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								· 조회된 아이디는 일부 마스킹처리되어 표시되며, 전체 아이디를 확인하시려면 본인인증을 진행해주세요.
							</div>
							<br>
							<div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">이름</div>
								</div>
								<div class="rightBox">
									<input type="text" id="nameBox"
										style="width: 179px; height: 40px; font-size: 12pt; float : left">
									<input type="button" class="imgAlert1" id = "imgAlert1"
										value="      비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다."
										disabled>
									<input type="button" class="imgAlert2" id = "imgAlert2" disabled>
								</div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">주민번호</div>
								</div>
								<div class="rightBox">
									<input type="text" class="PID" id="PID1"
										style="width: 135px; height: 40px; font-size: 12pt; float : left;"
										maxlength="6"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									<div style = "float : left">&nbsp;-&nbsp; </div>
									<input type="text" class="PID" id="PID2"
										style="width: 28px; height: 40px; font-size: 12pt; float : left"
										maxlength="1"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										<input type="button" class="imgAlert1" id = "imgAlert3"
										value="      비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다."
										disabled>
									<input type="button" class="imgAlert2" id = "imgAlert4" style = "float:left; " disabled>
								</div>
								<div class="leftBox">
									<br>
								</div>
								<div class="rightBox" style="font-size: 12pt; color: gray">
									주민번호 앞자리, 뒤 첫번째 자리 입력. ex) 000213 - 3</div>
							</div>
							<div style="width: 100%; height: 1px; float: left;">
								<br>
							</div>
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioId2" name="radioId" readonly> <span
								class="label"> </span> 본인인증으로 찾기
							</label>
							<div class="SUB" style="margin-left: 30%; margin-top: 150px;">
								<input name="nextAfter" class="SUBC" type="button"
									value="아이디 찾기" onclick="location.href='SignUpCustomer3.jsp' "
									id="submit1"
									style="background-color: #595959; color: white; border: none;"
									disabled> <input name="nextAfter" class="SUBC"
									type="button" value="아이디 찾기"
									onclick="location.href='SignUpCustomer3.jsp' " id="submit2"
									style="background-color: #DF1758; color: white; border: none;">
							</div>
						</div>


						<div class="foundIdFF2" id="foundIdFF2">
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioIdd1" name="radioIdd" readonly> <span
								class="label"> </span> 등록된 회원정보로 찾기
							</label>
							<div style="width: 100%; height: 40px;">
								<br>
							</div>
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioIdd2" name="radioIdd" readonly checked>
								<span class="label"> </span> 본인인증으로 찾기
							</label>
							<div class="SUIdenI" onmouseover="iconChange1()"
								onmouseout="iconChange2()" onclick="openEmailIden()"
								style="cursor: pointer; margin-left: 39%;">
								<img class="SUImg" id="SUImgg1"
									src="<%=request.getContextPath()%>/resources/images/SUEmail2-1.png">
								<img class="SUImg" id="SUImgg2"
									src="<%=request.getContextPath()%>/resources/images/SUEmail1-1.png">
							</div>
							<div class="SUB" style="margin-top: 100px; margin-left: 30%;">
								<input name="nextAfter" class="SUBC" type="button"
									value="아이디 찾기" onclick="location.href='SignUpCustomer3.jsp' "
									disabled
									style="background-color: #595959; color: white; border: none;"
									id="submitt1"> <input name="nextAfter" class="SUBC"
									type="button" value="아이디 찾기"
									onclick="location.href='SignUpCustomer3.jsp' "
									style="background-color: #DF1758; color: white; border: none;"
									id="submitt2">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$(function() {
			$("#foundIdFF2").hide();
			$("#foundIdFF1").show();
			$("#submit2").hide();
			$("#submitt2").hide();
			$(".imgAlert1").hide();
			$(".imgAlert2").hide();
		});

		$("#radioId2").click(function() {
			$("#foundIdFF1").hide();
			$("#foundIdFF2").show();
			$("#radioIdd2").prop("checked", true);
		});

		$("#radioIdd1").click(function() {
			$("#foundIdFF2").hide();
			$("#foundIdFF1").show();
			$("#radioId1").prop("checked", true);
		});

		$(".PID").keyup(function() {
			var charLimit = $(this).attr("maxlength");
			if (this.value.length >= charLimit) {
				$(this).next('.PID').focus();
				return false;
			}
		});

		$(function() {
			$('#SUImgg2').hide();
			$('#SUImgg1').show();
		});
		function iconChange1() {
			$('#SUImgg1').hide();
			$('#SUImgg2').show();
			style = "cursor : pointer";
		}

		function iconChange2() {
			$('#SUImgg2').hide();
			$('#SUImgg1').show();
		}


		$('input').keyup(function() {
			var name = $("#nameBox").val();

			var PID = $("#PID1").val();

			var flag1 = false;
			var flag3 = false;

			if (name.length > 0) {
				$("#imgAlert1").hide();
				$("#imgAlert2").show();
				flag1 = true;
			} else {
				flag1 = false;
				$("#imgAlert2").hide();
				$("#imgAlert1").show();
			}

			if ((PID.length == 6) && ($('#PID2').val().trim().length == 1)) {
				$("#imgAlert3").hide();
				$("#imgAlert4").show();
				flag3 = true;
			} else {
				$("#imgAlert4").hide();
				$("#imgAlert3").show();
				flag3 = false;
			}

			if ((flag1 == true) && (flag3 == true)) {
				$("#submit1").hide();
				$("#submit2").show();
			} else {
				$("#submit2").hide();
				$("#submit1").show();
			}

		});
	</script>
</body>
</html>