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
	height: 1200px;
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
	font-size: 22pt;
	font-weight: bold;
}

div.loginCB {
	font-size: 13pt;
	margin-left: 120px;
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
	width: 430px;
	height: 50px;
}

input.loginPBtn {
	width: 430px;
	height: 65px;
	background-color: #DF1758;
	color: white;
	border: none;
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
	width: 430px;
	height: 75px;
	background-color: #2DB400;
	color: white;
	border: none;
	background-image: url('../../resources/images/naver.png');
	background-repeat: no-repeat;
	background-position: 20px 20px;
}

input.loginFBtnF {
	width: 430px;
	height: 75px;
	background-color: #3b5998;
	color: white;
	border: none;
	background-image: url('../../resources/images/facebook.png');
	background-repeat: no-repeat;
	background-position: 20px 20px;
}

input.loginFBtnK {
	width: 430px;
	height: 75px;
	background-color: #f9df00;
	color: #3b1c1c;
	border: none;
	background-image: url('../../resources/images/kakao3.png');
	background-repeat: no-repeat;
	background-position: 20px 20px;
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
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<!-- 작성 -->
		<form action = "<%= request.getContextPath() %>/login.me" method = "post" onsubmit = "return validate();">
		<div class="loginForm">
			<div>
				<br><br><br>
			</div>
			<div class="mLogin">
				<div class="logoDiv">
					<img class="logoImg"
						src="<%=request.getContextPath()%>/resources/images/logopink.png">
				</div>
				<div class="bLogin">
					<div>
						<br></br>
					</div>
					<div class="bLogin2">
						<div class="loginFont">일반 로그인</div>
						<div>
							<br> <br>
						</div>
						<div>
							<input class="loginInput" id = "id-input" placeholder="  아이디">
						</div>
						<div>
							<input class="loginInput" id = "pw-input" placeholder="  비밀번호" type="password">
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
							<input type="button" class="loginPBtnF" value="아이디 찾기 ">
							| <input type="button" class="loginPBtnF" value=" 비밀번호 찾기">
						</div>
					</div>
				</div>
				<div class="fLogin">
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
				<div class="mSignUp">
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
								<br>
								<br>
							</div>
							<div class="mSignUpISI">
								지금
								<h3
									style="font-size: 13pt; color: #DF1758; display: inline-block;">회원가입</h3>
								을 하시면 코스메딕의 다양한 이벤트 및<br>  프로모션에 참여가 가능하며 특별 할인 혜택을 받아보실 <br>
								수 	있습니다.
							</div>
							<div>
								<br>
							</div>
							<input type="button" class="mSignUpISB" value="  코스메딕 회원가입">
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		function validate(){
			if($('#id-input').val().trim().length==0){
				alert('아이디를 입력해주세요');
				$('#id-input').focus(); 	
				
				return false;
			}
			if($('#pw-input').val().trim().length==0){
				alert('비밀번호를 입력해주세요');
				$('#pw-input').focums();
				
				return false;
			}
			return true;
		}
	</script>
</body>
</html>