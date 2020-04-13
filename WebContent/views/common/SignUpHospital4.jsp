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
	height: 1500px;
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

div.SUII2{
	width : 4%;
	float : left;
	font-size : 16pt;
	height : 400px;
}

div.SUChk {
	margin-left: 10%;
	background-color: white;
	width: 80%;
	height: 700px;
	text-align: left;
	float: left;
	font-size: 16pt;
	border : 1px solid black;
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

div.SUChkMain2{
	width : 65%;
	height : 60px;
	font-size : 19pt;
	float : left;
}

div.SUChkMain5{
	width : 30%;
	float : left;
	font-size : 15pt;
}

div.SUChkMain{
	width : 15%;
	height : 60px;
	font-size : 15pt;
	float : left;
}

div.SUChkMain3{
	width : 75%;
	height : 80px;
	font-size : 15pt;
	float : left;
}

div.SUChkSi{
	width : 5%;
	height : 100%;
	float : left;
}

div.SUChkSi2{
	width : 95%;
	height : 50px;
	float : left;
}

div.SUChkSi3{
	width : 95%;
	height : 25px;
	float : left;
}

div.SUChkMainICF{
	height : 30px;
	width : 500px;
	float : left;
}

div.SUChkConfirm1{
	width : 100%;
	height : 100px;
}

div.SUChkConfirm1_1{
	font-size : 32pt;
	text-align : center;
}

div.SUChkConfirm2{
	width : 100%;
	height : 250px;
}

div.SUChkConfirm2_1{
	text-align : center;
	font-size : 14pt;
	color : #8E6F80;
}

div.SUChkConfirm3{
	width : 100%;
	height : 100px;
	margin-left : 35%;
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
	float : left;
}

input.SUChkMainI{
	width : 250px;
	height: 45px;	
}

input.imgAlert1{
	width : 500px;
	height : 50px;
	background-color : white;
	border : none;
	background-image: url('../../resources/images/AlertIcon1_1_1.png');
	background-repeat: no-repeat;
	background-position:  -5px -10px;
	font-size : 10pt;
	color : #DF1758;
}

input.imgAlert2{
	width : 50px;
	height : 50px;
	background-color : white;
	border : none;
	background-image: url('../../resources/images/AlertIcon2_1_1.png');
	background-repeat: no-repeat;
	background-position:  -5px -10px;
}

img.SUImg {
	width: 220px;
	height: 220px;
	text-align : left;	
}

img.SUImg2 {
	width: 35px;
	height: 35px;
}



h3.SUImgI {
	font-size: 19pt;
	font-weight: 600;
}

/*checkbox*/
</style>
<%@ include file="/views/layout/import2.jsp"%>

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
				<div class = "SUII2">
				</div>	
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk1_1_2.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Step 1
					<h3 class="SUImgI">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					약관동의
					</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk2_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Step 2
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인인증</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk3_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					Step 3
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정보입력</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUHChk4_1_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					Step 4
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입완료</h3>
				</div>
				<div class = "SUII2">
				</div>
			</div>
			<div class="SUChk">
				<div class = "SUChkConfirm1">
				</div>
				<div class = "SUChkConfirm1">
					<div class = "SUChkConfirm1_1">
					코스메딕
					<h3 style="font-size: 31pt; color: black; font-weight : 600; display: inline-block;">회원가입</h3> 승인요청중입니다.
					</div>
				</div>
				<div class = "SUChkConfirm2">
					<div class = "SUChkConfirm2_1">
						<br>
						화장품 정보, 병원 정보, 계속 업데이트되는 뷰티 정보의 바다<br>
						국내 최고의 뷰티정보 사이트 COSMEDIC의 회원이 되실 것을 축하드립니다.<br><br>
						곧 COSMEDIC의 더욱더 아름다운 뷰티세상 즐기시기 바랍니다.<br><br>
						감사합니다.
					</div>
					<div class = "SUChkConfirm1">
					</div>
				</div>
				<div class = "SUChkConfirm3">
					
						<input
						class="SUBC" type="button" value="홈 화면으로 이동"
						style="background-color: white; border: 1px solid black;" 
						onclick="location.href='loginedMain.jsp' ">
				
				</div>
			</div>
			
		</div>
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		    
	</script>
</body>
</html>