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
	width: 300px;
	height: 65px;
	font-size: 12pt;
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
		url('<%=request.getContextPath()%>/resources/images/AlertIcon2_1_12.png');
	background-repeat: no-repeat;
	background-position: -5px -10px;
	float: left;
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
		<%@ include file="/views/layout/header2.jsp"%>
		<!-- 작성 -->

	</div>
	<div
		style="background-color: lightgray; padding-bottom: 75px; margin-bottom: -50px;">
		<div class="foundIDForm">
			<div>
				<br> <br> <br>
			</div>
			<div class="mLogin" id="mLogin1">
				<div class="logoDiv">
					<br> <br> <br> <br> <br>
				</div>
				<div class="sideDiv1"></div>
				<div class="bLogin" id="foundId">
					<div class="titlebox">아이디 찾기</div>
					<br> <br>
				</div>
				<div class="fLogin" id="foundPw" style="cursor: pointer;">
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
								· 회원정보에 등록된 병원 상호명, 이메일이 일치해야만 아이디를 확인할 수 있습니다. <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								· 조회된 아이디는 일부 마스킹처리되어 표시되며, 전체 아이디를 확인하시려면 본인인증을 진행해주세요.
							</div>
							<br>
							<div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">병원 상호명</div>
								</div>
								<div class="rightBox">
									<input type="text" id="nameBox"
										style="width: 179px; height: 40px; font-size: 12pt; float: left">
									<input type="button" class="imgAlert2" style = "margin-left : 18px; margin-top : 5px;"
										id="imgAlert2" disabled>
								</div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">이메일</div>
								</div>
								<div class="rightBox">
									<input type="text" name="	" id="str_email01"
										style="width: 150px; height : 40px; font-size : 13pt;"> @ <input type="text"
										name="str_email02" id="str_email02" 
										style="width: 150px; height : 40px; font-size : 13pt;"
										disabled value="naver.com"> <select
										style="width: 150px; height : 40px; margin-right: 10px; font-size : 13pt;" 
										name="selectEmail"
										id="selectEmail">
										<option value="1">직접입력</option>
										<option value="naver.com" selected>naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="empas.com">empas.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="korea.com">korea.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmir.com">hanmir.com</option>
										<option value="paran.com">paran.com</option>
									</select>
									<input type="button" class="imgAlert2" style = "float : right; margin-right : 23%; margin-top : 5px;"
										id="imgAlert4" disabled>
								</div>
								<div class="leftBox">
									<br>
								</div>
								<div class="rightBox" style="font-size: 12pt; color: gray">
									회원가입 당시 입력했던 이메일을 작성해 주세요.
								</div>
							</div>
							<div style="width: 100%; height: 1px; float: left;">
								<br>
							</div>
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioId2" name="radioId" readonly> <span
								class="label"> </span> 본인인증으로 찾기
							</label>
							<div class="SUB" style="margin-left: 33%; margin-top: 150px;">
								<input name="nextAfter" class="SUBC" type="button"
									value="아이디 찾기" onclick="location.href='SignUpCustomer3.jsp' "
									id="submit1"
									style="background-color: #595959; color: white; border: none;"
									disabled> <input name="nextAfter" class="SUBC"
									type="button" value="아이디 찾기"
									onclick="location.href='SignUpCustomer3.jsp' " id="submit2"
									style="background-color: #4BD763; color: white; border: none;">
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
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_1-1_1.png">
								<img class="SUImg" id="SUImgg2"
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_2-1_1.png">
							</div>
							<div class="SUB" style="margin-top: 80px; margin-left: 33%;">
								<input name="nextAfter" class="SUBC" type="button"
									value="아이디 찾기" onclick="location.href='SignUpCustomer3.jsp' "
									disabled
									style="background-color: #595959; color: white; border: none;"
									id="submitt1"> <input name="nextAfter" class="SUBC"
									type="button" value="아이디 찾기"
									onclick="location.href='SignUpCustomer3.jsp' "
									style="background-color: #4BD763; color: white; border: none;"
									id="submitt2">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mLogin" id="mLogin2">
				<div class="logoDiv">
					<br> <br> <br> <br> <br>
				</div>
				<div class="sideDiv1"></div>
				<div class="bLogin" id="foundId2"
					style="border-top: none; border-left: none; border-bottom: 1px solid black; background-color: lightgray; cursor: pointer;">
					<div class="titlebox">아이디 찾기</div>
					<br> <br>
				</div>
				<div class="fLogin" id="foundPw2"
					style="border-top: 1px solid black; border-right: 1px solid black; background-color: white; border-bottom: none;">
					<div class="titlebox">비밀번호 찾기</div>
				</div>
				<div class="sideDiv2"></div>
				<div class="foundIdF" id="foundIdFEC1">
					<br> <br> <br> <br>
					<div class="foundIdI">
						비밀번호를 찾고자 하는 아이디를 입력해 주세요.<br> <br>
						<div class="foundIdFF" style="height: 160px;">
							<div
								style="float: left; width: 15%; margin-left: 25%; margin-top: 17px; font-size: 12pt;">
								아이디</div>
							<div style="float: left; width: 30%; margin-top: 6px;">
								<input type="text" id="foundIdPw"
									style="height: 45px; width: 280px; border: 1px solid black;">
							</div>

						</div>
						<div>
							<br> <br>
						</div>
						<div>
							<input type="button" class="SUBC" id="next1" value="다음"
								style="background-color: #595959; color: white; border: none;">
						</div>
						<div>
							<input type="button" class="SUBC" id="next2" value="다음"
								style="background-color: #4BD763; color: white; border: none;">
						</div>
					</div>
				</div>
				<div class="foundIdF" id="foundIdFEC2">
					<br> <br>
					<div class="foundIdI">
						<div class="foundIdFF" style="height: 350px;">
							<div
								style="float: left; width: 50%; margin-left: 30%; margin-top: -15px; font-size: 13pt;">
								본인인증을 통해 비밀번호를 재설정하실 수 있습니다.</div>
							<div style="width: 100%; height: 30px;">
								<br>
							</div>
							<div class="SUIdenI" onmouseover="iconChange3()"
								onmouseout="iconChange4()" 
								style="cursor: pointer; margin-left: 39%;">
								<img class="SUImg" id="SUImggg1"
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_1-1_1.png">
								<img class="SUImg" id="SUImggg2"
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_2-1_1.png">
							</div>
						</div>
						<div>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$('#selectEmail').change(function(){ 
			$("#selectEmail option:selected").each(function () { 
				if($(this).val()== '1'){ //직접입력일 경우 
					$("#str_email02").val(''); //값 초기화
					$("#str_email02").attr("disabled",false); //활성화 
					}else{ //직접입력이 아닐경우 
						$("#str_email02").val($(this).text()); //선택값 입력 
						$("#str_email02").attr("disabled",true); //비활성화 
						} 
				}); 
			});

		$(function() {
			$("#mLogin1").hide();
			$("#mLogin2").show();
			$("#foundIdFF2").hide();
			$("#foundIdFF1").show();
			$("#submit2").hide();
			$("#submitt2").hide();
			$(".imgAlert1").hide();
			$(".imgAlert2").hide();
			$("#next2").hide();
			$("#foundIdFEC2").hide();
			$(".mLogin").height("650px");
		});

		$("#radioId2").click(function() {
			$("#foundIdFF1").hide();
			$("#foundIdFF2").show();
			$("#radioIdd2").prop("checked", true);
			$(".mLogin").height("920px");
		});

		$("#radioIdd1").click(function() {
			$("#foundIdFF2").hide();
			$("#foundIdFF1").show();
			$("#radioId1").prop("checked", true);
			$(".mLogin").height("1000px");
		});

		$(".PID").keyup(function() {
			var charLimit = $("#PID1").attr("maxlength");
			if (this.value.length >= charLimit) {
				$("#PID2").focus();
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

			var PID = $("#str_email01").val();
			var PID2 = $("#str_email02").val();

			var flag1 = false;
			var flag3 = false;

			if (name.length < 1) {
				$("#imgAlert1").hide();
				$("#imgAlert2").hide();
			} else {
				if (name.length > 0) {
					$("#imgAlert1").hide();
					$("#imgAlert2").show();
					flag1 = true;
				} else {
					flag1 = false;
					$("#imgAlert2").hide();
					$("#imgAlert1").show();
				}
			}

			if ((PID.length < 1) || (PID2.length < 1)) {
				$("#imgAlert3").hide();
				$("#imgAlert4").hide();
			} else {
				if ((PID.length > 0) && (PID2.length > 0)) {
					$("#imgAlert3").hide();
					$("#imgAlert4").show();
					flag3 = true;
				} else {
					$("#imgAlert4").hide();
					$("#imgAlert3").show();
					flag3 = false;
				}
			}

			if ((flag1 == true) && (flag3 == true)) {
				$("#submit1").hide();
				$("#submit2").show();
			} else {
				$("#submit2").hide();
				$("#submit1").show();
			}

		});

		$("#foundPw").click(function() {
			$("#mLogin1").hide();
			$("#mLogin2").show();
			$(".mLogin").height("650px");
			$("#foundIdFEC2").hide();
			$("#foundIdFEC1").show();
		});

		$("#foundId2").click(function() {
			$("#mLogin2").hide();
			$("#mLogin1").show();
			if ($("#radioId1").prop("checked") == true) {
				$(".mLogin").height("1000px");
			} else if ($("#radioIdd2").prop("checked") == true) {
				$(".mLogin").height("920px");
			}
		});

		$("#mLogin2").keyup(function() {
			var id = $("#foundIdPw").val();

			var flag1 = false;
			var flag2 = false;

			if (id.length > 0) {
				flag1 = true;
			} else {
				flag1 = false;
			}

			if (id.length < 8) {
				flag2 = false;
			} else {
				flag2 = true;
			}

			if ((flag1 == true) && (flag2 == true)) {
				$("#next1").hide();
				$("#next2").show();
			} else {
				$("#next2").hide();
				$("#next1").show();
			}

		});

		$("#next2").click(function() {
			$("#foundIdFEC1").hide();
			$("#foundIdFEC2").show();
		});

		$(function() {
			$('#SUImggg2').hide();
			$('#SUImggg1').show();
		});
		function iconChange3() {
			$('#SUImggg1').hide();
			$('#SUImggg2').show();
			style = "cursor : pointer";
		}

		function iconChange4() {
			$('#SUImggg2').hide();
			$('#SUImggg1').show();
		}
	</script>
</body>
</html>