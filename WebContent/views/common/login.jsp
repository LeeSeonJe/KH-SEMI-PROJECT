<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.security.SecureRandom"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/commonCss/login.css"
	type="text/css">

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
			<div class="logoDiv" id = "logoNomal">
				<img class="logoImg"
					src="<%=request.getContextPath()%>/resources/images/logopink.png">
			</div>
			<div class="logoDiv" id = "logoHospital">
				<img class="logoImg"
					src="<%=request.getContextPath()%>/resources/images/logopink_2.png">
			</div>
			<form action="<%=request.getContextPath()%>/login.me" method="post"
				onsubmit="return validate();">
				<div class="bLogin" id="CLogin2Id">
					<div>
						<br></br>
					</div>
					<div class="bLogin2">
						<div class="loginFont">
							<div style = "float : left; margin-top : 10px;">
								일반 로그인							
							</div>
							<label class="form-switch" style = "float:left; margin-left:5px;"> <input class="toggle"
								type="checkbox" id="tgl"> <i></i>
							</label>
							<h3 style = "font-size : 13pt; display : inline-block; color : gray; float : left; margin-left : 5px; margin-top : 28px;">병원회원 로그인을 하시려면 토글해주세요.</h3>
						</div>
						<div style = "width : 100%; height : 30px; float : left">
							<br><br>
						</div>
						<div>
							<input class="loginInput" id="id-input" placeholder="  아이디" style = "float : left"
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
							<input type="button" class="loginPBtnF" value="아이디 찾기 "
								onclick="location.href='foundPw.jsp' "> | <input
								type="button" class="loginPBtnF" value=" 비밀번호 찾기"
								onclick="location.href='foundPw2.jsp' ">
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
							<div style = "float : left; margin-top : 10px;">
								병원 로그인							
							</div>
							<label class="form-switch" style = "float:left; margin-left:5px;"> <input class="toggle2"
								type="checkbox" id="tgl2" checked="checked"> <i></i>
							</label>
							<h3 style = "font-size : 13pt; display : inline-block; color : gray; float : left; margin-left : 5px; margin-top : 28px;">일반회원 로그인을 하시려면 토글해주세요.</h3>
						</div>
						<div style = "width : 100%; height : 30px; float : left">
							<br><br>
						</div>
						<div>
							<input class="loginInput" id="id-input2" placeholder="  아이디"
								name="id">
						</div>
						<div>
							<input class="loginInput" id="pw-input2" placeholder="  비밀번호"
								type="password" name="pwd">
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
							<input type="button" class="loginPBtnF" value="아이디 찾기 "
								onclick="location.href='foundHPw.jsp' "> | <input
								type="button" class="loginPBtnF" value=" 비밀번호 찾기"
								onclick="location.href='foundHPw2.jsp' ">
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
					<%
						String clientId = "i8SwCfKScj1UOs_0NpjD";//애플리케이션 클라이언트 아이디값";
						String redirectURI = URLEncoder.encode("http://localhost:8581/COSMEDIC/views/common/callback.jsp", "UTF-8");
						SecureRandom random = new SecureRandom();
						String state = new BigInteger(130, random).toString();
						String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
						apiURL += "&client_id=" + clientId;
						apiURL += "&redirect_uri=" + redirectURI;
						apiURL += "&state=" + state;
						session.setAttribute("state", state);
					%>
					<div>
						<a href="<%=apiURL%>"><input type="button" class="loginFBtnN"
							value="네이버 로그인"></a>
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
					<br> <br> <br>
				</div>
				<div class="mSignUpI">
					<div class="mSignUpII">
						<br> 아직
						<h3
							style="font-size: 25pt; color: #DF1758; display: inline-block;">&nbsp;코스메딕</h3>
						<br> 회원이 아니신가요?
						<div style="font-size: 30pt; color: #DF1758;">_</div>
					</div>
					<div class="mSignUpIS">
						<div>
							<br> <br> 
						</div>
						<div class="mSignUpISI">
							지금
							<h3
								style="font-size: 12pt; color: #DF1758; display: inline-block;">회원가입</h3>
							을 하시면 코스메딕의 다양한 이벤트 및 프로모션에 <br> 참여가 가능하며 특별 할인 혜택을 받아보실 수
							있습니다.
						</div>
						<div>
							<br> <br> 
						</div>
						<input type="button" class="mSignUpISB" value="  코스메딕 회원가입"
							onclick="location.href='SignUpCustomerFace.jsp' ">
					</div>
				</div>
			</div>
			<div class="mSignUp" id="mSignUpH2">
				<div>
					<br> <br> <br>
				</div>
				<div class="mSignUpI">
					<div class="mSignUpII">
						<br> 아직
						<h3
							style="font-size: 25pt; color: #4BD763; display: inline-block;">&nbsp;코스메딕</h3>
						<br> 회원이 아니신가요?
						<div style="font-size: 30pt; color: #4BD763;">_</div>
					</div>
					<div class="mSignUpIS">
						<div>
							<br> <br>
						</div>
						<div class="mSignUpISI">
							지금
							<h3
								style="font-size: 12pt; color: #4BD763; display: inline-block;">회원가입</h3>
							을 하시면 병원 맞춤 고객 정보 제공이 가능하며 <br>세제 혜택을 받아보실 수 있습니다.
						</div>
						<div>
							<br> <br>
						</div>
						<input type="button" class="mSignUpISB" value="  코스메딕 회원가입"
							style="border: 2px solid #4BD763; color: #4BD763;"
							onclick="location.href='SignUpHospitalFace.jsp' ">
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$(function() {
			var chk = $(this).is(":checked");

			if (chk) {
				$('input[id*="tgl"]').prop('checked', true);
				$('input[id*="tgl2"]').prop('checked', true);
			} else {
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
			$("#logoHospital").hide();
			$("#logoNomal").show();
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
					$("#logoHospital").show();
					$("#logoNomal").show();
					$("input:checkbox[id='tgl2']").prop("checked", true);
				}
			});
			$('.toggle').change(function() {
				if ($("#tgl").not(":checked")) {
					$('#CLogin1Id').hide();
					$('#HLogin1Id').show();
					$("#logoNomal").hide();
					$("#logoHospital").show();
					$("input:checkbox[id='tgl']").prop("checked", false);
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
					$("#logoHospital").hide();
					$("#logoNomal").show();
					$("input:checkbox[id='tgl']").prop("checked", false);
				}
			});
			
			$('.toggle2').change(function() {
				if ($("#tgl2").is(":checked")) {
					$('#HLogin1Id').hide();
					$('#CLogin1Id').show();
					$("#logoNomal").hide();
					$("#logoHospital").show();
					$("input:checkbox[id='tgl2']").prop("checked", true);
				}
			});
		});
	</script>
</body>
</html>