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
	height: 1250px;
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
	height: 380px;
}

div.SUII2 {
	width: 4%;
	float: left;
	font-size: 16pt;
	height: 400px;
}

div.SUChk {
	margin-left: 10%;
	background-color: #DDDDDD;
	width: 80%;
	height: 160px;
	text-align: left;
	float: left;
	font-size: 16pt;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
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
	width: 70%;
	margin-left: 15%;
}

div.SUIden {
	float: left;
	width: 80%;
	height: 400px;
	margin-left: 5%;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

div.SUIdenF {
	font-size: 22px;
}

div.SUIdenI {
	width: 20%;
	margin-left: 39%;
}

div.SUBB {
	float: left;
	width: 50%;
	margin-left: 25%;
}

div.SUBBI {
	float: left;
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
	width: 300px;
    height: 70px;
    font-size: 14pt;
}

img.SUImg {
	width: 220px;
	height: 220px;
	text-align: left;
	float: left;
}

img.SUImg1 {
	width: 35px;
	height: 35px;
}

img.SUImg2 {
	width: 35px;
	height: 35px;
}

img.SUImg3 {
	width: 220px;
	height: 220px;
	text-align: center;
}

h3.SUImgI {
	font-size: 17pt;
    font-weight: 600;
}

/*checkbox*/
</style>
<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle.css"
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
						src="<%=request.getContextPath()%>/resources/images/SUHChk2_1_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Step 2
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인인증</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk3_2_1.png">
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
				<div class="SUIden">
					<br> <br> <br> <br> 
					<div class="SUIdenF">본인인증을 진행해주세요.</div>

					<div class="SUIdenI" onmouseover="iconChange1()"
						onmouseout="iconChange2()" onclick="openEmailIden()"
						style="cursor: pointer">
						<img class="SUImg" id="SUImgg1"
							src="<%=request.getContextPath()%>/resources/images/SUHChkE_1-1_1.png">
						<img class="SUImg" id="SUImgg2"
							src="<%=request.getContextPath()%>/resources/images/SUHChkE_2-1_1.png">
					</div>
					<div class="SUB">
						<div>
							<br><br><br><br><br><br><br><br><br>
						</div>
						<input class="SUBC" id = "SUBCC" type="button" value="취소"
						style="background-color: white; border: 1px solid black;"
						onclick="location.href='loginedMain.jsp'"> <input
						class="SUBC" type="button" value="다음단계"
						style="background-color: #4BD763; border: 1px solid #4BD763; color: white;"
						onclick="location.href='SignUpHospital3.jsp' ">
					</div>
				</div>	
			</div>
		</div>
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$(function(){
			$('#SUImgg2').hide();
			$('#SUImgg1').show();
		});
		function iconChange1(){
			$('#SUImgg1').hide();
			$('#SUImgg2').show();
			style = "cursor : pointer";
		}
	
		function iconChange2(){
			$('#SUImgg2').hide();
			$('#SUImgg1').show();	
		}
	
		function openEmailIden(){
			window.open("<%=request.getContextPath()%>/views/common/SignUpIdentifyEX.jsp", "구현어떻게하지씨발ㅋㅋ", "height = 700 , width = 700, left = 300, top = 50");
		}
		
		$(document).ready(function(){
			$('#SUBCC').click(function(){
				if(confirm("정말 취소하시겠습니까 ?") == true){
		
			    }else{
			        
			    }
			});
		});
	</script>
</body>
</html>