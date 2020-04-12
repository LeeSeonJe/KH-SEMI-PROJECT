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
	height: 1300px;
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
	width: 92%;
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

/* ios */
</style>
<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle.css"
	type="text/css">
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<!-- 작성 -->

	</div>

	<div class="loginForm">

		<div>
			<br> <br> <br>
		</div>
		<div class="mLogin">
			<div class="logoDiv">
				<img class="logoImg"
					src="<%=request.getContextPath()%>/resources/images/logopink.png">
			</div>
			<form action="<%=request.getContextPath()%>/login.me" method="post"
				onsubmit="return validate();">
				<div class="bLogin" id="CLogin2Id">
					<div>
						<br></br>
					</div>
					<div class="bLogin2">
						<div class="loginFont">
							일반 로그인 <label class="form-switch"> <input class="toggle"
								type="checkbox" id="tgl"> <i></i>
							</label>
						</div>
						<div>
							<br>
						</div>
						<div>
							<input class="loginInput" id="id-input" placeholder="  아이디"
								name="id">
						</div>
						<div>
							<input class="loginInput" id="pw-input" placeholder="  비밀번호"
								type="password" name="pwd">
						</div>
						<div>
							<br> <br>
						</div>
						<div>
							<input type="submit" class="loginPBtn" value="로그인">
						</div>
						<div>
							<br>
						</div>
						<div class="loginCB">
							<input type="button" class="loginPBtnF" value="아이디 찾기 " onclick="location.href='foundPw.jsp' ">
							| <input type="button" class="loginPBtnF" value=" 비밀번호 찾기" onclick="location.href='foundPw.jsp' ">
						</div>
					</div>
				</div>
			</form>
			<form action="<%=request.getContextPath()%>/login.me" method="post"
				onsubmit="return validate2();">
			<div class="bLogin" id="HLogin2Id">
				<div>
					<br></br>
				</div>
				<div class="bLogin2">
					<div class="loginFont">
						병원 로그인 <label class="form-switch"> <input class="toggle2"
							type="checkbox" id="tgl2"  checked="checked"> <i></i>
						</label>
					</div>
					<div>
						<br>
					</div>
					<div>
						<input class="loginInput" id="id-input2" placeholder="  아이디" name = "id">
					</div>
					<div>
						<input class="loginInput" id="pw-input2" placeholder="  비밀번호"
							type="password" name = "pwd">
					</div>
					<div>
						<br> <br>
					</div>
					<div>
						<input type="submit" class="loginPBtn" value="로그인"
							style="background-color: #4BD763">
					</div>
					<div>
						<br>
					</div>
					<div class="loginCB">
						<input type="button" class="loginPBtnF" value="아이디 찾기 "onclick="location.href='foundPw.jsp' "> |
						<input type="button" class="loginPBtnF" value=" 비밀번호 찾기"onclick="location.href='foundPw.jsp' ">
					</div>
				</div>
			</div>
			</form>
			<div class="fLogin" id="FLogin2Id">
				<div>
					<br></br>
				</div>
				<div class="fLogin2">
					<div class="loginFont">간편 로그인</div>
					<div>
						<br> <br>
					</div>
					<div>
						<input type="button" class="loginFBtnN" value="네이버로 로그인">
					</div>
					<div>
						<br>
					</div>
					<div>
						<input type="button" class="loginFBtnF" value="페이스북 로그인">
					</div>
					<div>
						<br>
					</div>
					<div>
						<input type="button" class="loginFBtnK" value="카카오톡 로그인">
					</div>
				</div>
			</div>
			<div class="mSignUp" id="mSignUpH1">
				<div>
					<br> <br>
				</div>
				<div class="mSignUpI">
					<div class="mSignUpII">
						<br> 아직
						<h3
							style="font-size: 25pt; color: #DF1758; display: inline-block;">&nbsp;코스메딕</h3>
						<br> 회원이 아니신가요?
						<div style="font-size: 40pt; color: #DF1758;">_</div>
					</div>
					<div class="mSignUpIS">
						<div>
							<br> <br>
						</div>
						<div class="mSignUpISI">
							지금
							<h3 style="font-size: 13pt; color: #DF1758; display: inline-block;">회원가입</h3>
							을 하시면 코스메딕의 다양한 이벤트 및 프로모션에 <br> 참여가 가능하며 특별 할인 혜택을 받아보실 수
							있습니다.
						</div>
						<div>
							<br> <br>
						</div>
						<input type="button" class="mSignUpISB" value="  코스메딕 회원가입" onclick="location.href='SignUpCustomerFace.jsp' ">
					</div>
				</div>
			</div>
			<div class="mSignUp" id="mSignUpH2">
				<div>
					<br> <br>
				</div>
				<div class="mSignUpI">
					<div class="mSignUpII">
						<br> 아직
						<h3
							style="font-size: 25pt; color: #4BD763; display: inline-block;">&nbsp;코스메딕</h3>
						<br> 회원이 아니신가요?
						<div style="font-size: 40pt; color: #4BD763;">_</div>
					</div>
					<div class="mSignUpIS">
						<div>
							<br> <br>
						</div>
						<div class="mSignUpISI">
							지금
							<h3 style="font-size: 13pt; color: #4BD763; display: inline-block;">회원가입</h3>
							을 하시면 병원 맞춤 고객 정보 제공이 가능하며 <br>세제 혜택을 받아보실 수 있습니다.
						</div>
						<div>
							<br> <br>
						</div>
						<input type="button" class="mSignUpISB" value="  코스메딕 회원가입"
							style="border: 2px solid #4BD763; color: #4BD763;" onclick="location.href='SignUpHospitalFace.jsp' ">
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$(function(){
			var chk = $(this).is(":checked");
            
            if(chk){
            	$('input[id*="tgl"]').prop('checked', true);
            	$('input[id*="tgl2"]').prop('checked', true);
            }else{	
            	$('input[id*="tgl"]').prop('checked', false);
            	$('input[id*="tgl2"]').prop('checked', false);
            }
		});
		function validate() {
			if ($('#id-input').val().trim().length == 0) {
				alert('아이디를 입력해주세요');
				$('#id-input').focus();
				return false;
			}
			if ($('#pw-input').val().trim().length == 0) {
				alert('비밀번호를 입력해주세요');
				$('#pw-input').focus();

				return false;
			}
			return true;
		}
		function validate2() {
			if ($('#id-input2').val().trim().length == 0) {
				alert('아이디를 입력해주세요');
				$('#id-input2').focus();

				return false;
			}
			if ($('#pw-input2').val().trim().length == 0) {
		   		alert('비밀번호를 입력해주세요');
				$('#pw-input2').focus();

				return false;
			}
			return true;
		}
		$(function() {
			$('#HLogin2Id').hide();
			$('#CLogin2Id').show();
			$('#mSignUpH1').show();
			$('#mSignUpH2').hide();
		})
		
		$(document).ready(function() {
			$('.toggle').change(function() {
				if ($("#tgl").is(":checked")) {
					$('#CLogin2Id').hide();
					$('#HLogin2Id').show();
					$('#mSignUpH2').show();
					$('#mSignUpH1').hide();
					$("input:checkbox[id='tgl2']").prop("checked", true);
				}
			});
		});
		$(document).ready(function() {
			$('.toggle2').change(function() {
				if ($("#tgl2").not(":checked")) {
					$('#HLogin2Id').hide();
					$('#CLogin2Id').show();
					$('#mSignUpH1').show();
					$('#mSignUpH2').hide();
					$("input:checkbox[id='tgl']").prop("checked", false);
				}
			});
		});
		
	</script>
</body>
</html>