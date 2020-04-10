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
	height: 1200px;
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

div.SUChkMainICFE{
	height : 30px;
	width : 500px;
	float : left;
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

input.SUChkMainIE{
	width : 200px;
	height : 46px;
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
			<br> <br> <br> <br>
		</div>
		<div class="mLogin">
			<br> <br> <br>
			<div class="SUI">
				<div class = "SUII2">
				</div>	
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk1_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Step 1
					<h3 class="SUImgI">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					약관동의
					</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk2_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					Step 2
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;본인인증</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk3_1_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					Step 3
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;정보입력</h3>
				</div>
				<div class="SUII">
					<br> <br> <br> <img class="SUImg2"
						src="<%=request.getContextPath()%>/resources/images/SUChkK.png">
				</div>
				<div class="SUII">
					<img class="SUImg"
						src="<%=request.getContextPath()%>/resources/images/SUChk4_2_1.png">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					Step 4
					<h3 class="SUImgI">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가입완료</h3>
				</div>
				<div class = "SUII2">
				</div>
			</div>
			<div class="SUChk">
				<div class = "SUChkSi">
				</div>
				<div class = "SUChkSi2">
				</div>
				<div class = "SUChkMain2">
					회원정보 입력
				</div>
				<div class = "SUChkMain5">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<h3 style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top : 0%;">*</h3>
					는 필수 입력 항목 입니다.
				</div>
				<div class = "SUChkSi3">
				</div>
				<div class = "SUChkMain">
					아이디
					<h3 style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top : 8%;">*</h3>
				</div>
				<div class = "SUChkMain3">
					<input type = "text" class = "SUChkMainI" id = "SUChkMainIID">
					<div style = "display : inline-block; ">
						<div class = "SUChkMainICF" id = "IDCheckkF">
							<input type = "button" class = "imgAlert1" value = "아이디는 8자 이상, 숫자와 영문자만 포함해야 합니다.                                    " disabled>
						</div>
						<div class = "SUChkMainICF" id = "IDCheckkT">
							<input type = "button" class = "imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class = "SUChkMain">
					비밀번호 
					<h3 style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top : 8%;">*</h3>
				</div>
				<div class = "SUChkMain3">
					<input type = "password" class = "SUChkMainI" id = "SUChkMainIPwd" >
					<div style = "display : inline-block; ">
						<div class = "SUChkMainICF" id = "pwdCheckkF">
							<input type = "button" class = "imgAlert1" onclick = "alert1()" value = "          비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다." disabled>
						</div>
						<div class = "SUChkMainICF" id = "pwdCheckkT">
							<input type = "button" class = "imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class = "SUChkMain">
					비밀번호 확인 
					<h3 style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top : 8%;">*</h3>
				</div>
				<div class = "SUChkMain3">
					<input type = "password" class = "SUChkMainI" id = "SUChkMainIPwdC" >
					<div style = "display : inline-block;">
						<div class = "SUChkMainICF" id = "pwdConfirmmF">
							<input type = "button" class = "imgAlert1" onclick = "alert2()" value = "비밀번호가 일치하지 않습니다.                                                                          ">
							
						</div>
						<div class = "SUChkMainICF" id = "pwdConfirmmT">
							<input type = "button" class = "imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class = "SUChkMain">
					이름 
					<h3 style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top : 8%;">*</h3>
				</div>
				<div class = "SUChkMain3">
					<input type = "text" class = "SUChkMainI" id = "SUChkMainINameC" >
					<div style = "display : inline-block;">
						<div class = "SUChkMainICF" id = "nameConfirmmF">
							<input type = "button" class = "imgAlert1" value = "이름을 입력해 주세요.                                                                               ">
						</div>
						<div class = "SUChkMainICF" id = "nameConfirmmT">
							<input type = "button" class = "imgAlert2" disabled>
						</div>
					</div>
				</div>
				<div class = "SUChkMain">
					전화번호
				</div>
				<div class = "SUChkMain3">
					<input type = "text" class = "SUChkMainIE">
					<input type = "text" class = "SUChkMainIE">
					<input type = "text" class = "SUChkMainIE">
				</div>
				<div class = "SUChkMain">
					이메일 
					<h3 style="font-size: 13pt; color: #DF1758; display: inline-block; margin-top : 0%;">*</h3>
				</div>
				<div class = "SUChkMain3">
					<input type = "text" class = "SUChkMainIE" readonly value = "cosmedic">
					<input type = "text" class = "SUChkMainIE" readonly value = "naver.com">
					<div style = "display : inline-block;">
						<div class = "SUChkMainICFE" id = "emailConfirmmF" style = "width : 50px;">
							<input type = "button" class = "imgAlert2" >
						</div>
					</div>
				</div>
				<div class = "SUChkMain">
					성별
				</div>
				<div class = "SUChkMain3">
					<label class="label-radio"><input type="radio" name="gender" value="M" checked> 남자</label>
					<label class="label-radio"><input type="radio" name="gender" value="F"> 여자</label>
					<label class="label-radio"><input type="radio" name="gender" value="N"> 선택안함</label>
				</div>
				<div class = "SUChkMain">
					연령대
				</div>
				<div class = "SUChkMain3">
					<label class="label-radio"><input type="radio" name="age" value="10" checked> 10대</label>
							<label class="label-radio"><input type="radio" name="age" value="20early"> 20대 초반</label>
							<label class="label-radio"><input type="radio" name="age" value="20late"> 20대 후반</label>
							<label class="label-radio"><input type="radio" name="age" value="30early"> 30대 초반</label>
							<label class="label-radio"><input type="radio" name="age" value="30late"> 30대 후반</label>
							<label class="label-radio"><input type="radio" name="age" value="other"> 그 외 연령층</label>
				</div>	
				<div class = "SUChkMain">
					피부 타입
				</div>
				<div class = "SUChkMain3">
					<input type="radio" name="skintype" value="건성" checked><label>건성</label>
					<input type="radio" name="skintype" value="지성"><label>지성</label>
					<input type="radio" name="skintype" value="중성"><label>중성</label>
					<input type="radio" name="skintype" value="복합성"><label>복합성</label>						<input type="radio" name="skintype" value="민감성"><label>민감성</label>
					<input type="radio" name="skintype" value="민감성"><label>민감성</label>
				</div>
				<div class = "SUChkMain">
					사용중인 화장품
				</div>
				<div class = "SUChkMain3">
					<input class="input-standard" type="text" placeholder=""/><button class="btn-standard" onclick = "test4();">화장품 찾기</button>
				</div>
			</div>
			<div class="SUB">
				<div>
					<br><br><br><br>
				</div>
				<input class="SUBC" id = "SUBCC" type="button" value="취소"
					style="background-color: white; border: 1px solid black;"
					onclick="location.href='loginedMain.jsp'"> 
				<input
					class="SUBC" id = "SUBCC1" type="button" value="다음단계"
					style="background-color: #595959; border: 1px solid #595959; color: white;"
					onclick="alert1()">
				<input
					class="SUBC" id = "SUBCC2" type="button" value="다음단계"
					style="background-color: #DF1758; border: 1px solid #DF1758; color: white;"
					onclick="location.href='SignUpCustomer4.jsp' ">
			</div>
		</div>
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$(function(){
			$(".SUChkMainICF").hide();
			$("#SUBCC2").hide();
			$("#SUBCC1").show();
		});  
	        $('input').change(function(){
	        	var chk = false;
				
				var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
				var pwd = $("#SUChkMainIPwd").val();
			    
				var pwdConfirm = document.getElementById('pwdConfirm');
		        var pwd1 = document.getElementById('SUChkMainIPwd');
		        var pwd2 = document.getElementById('SUChkMainIPwdC');
		        
				var regi = /^(?=.*?[A-Z,a-z])(?=.*?[0-9]).{8,}$/;
				var id = $("#SUChkMainIID").val();
 		        if(true === reg.test(pwd)) {
 		        	$("#pwdCheckkF").hide();
					$("#pwdCheckkT").show();
 					if(pwd1.value == pwd2.value){
 						 $("#pwdConfirmmF").hide();
 						 $("#pwdConfirmmT").show();
 						if($("#SUChkMainINameC").val().trim().length > 0){
 							$("#nameConfirmmF").hide();
 							$("#nameConfirmmT").show();
 							if(true === regi.test(id)){
 								alert("메롱");
 								$("#IDCheckkF").hide();
 								$("#IDCheckkT").show();
 								chk = true;
 							} else {
 								$("#IDCheckkT").hide();
 								$("#IDCheckkF").show();
 							}
 						} else {
 							$("#nameConfirmmT").hide();
 							$("#nameConfirmmF").show();
 						}
 					} else {
 						 $("#pwdConfirmmT").hide();
 						 $("#pwdConfirmmF").show();
 					}
 				}else {
 					 $("#pwdCheckkT").hide();
					 $("#pwdCheckkF").show();
 					chk = false;
 				}
	        	 if(chk === true){
	 		        	$("#SUBCC1").hide();
	 					$("#SUBCC2").show();
	 				}else{
	 					$("#SUBCC2").hide();
	 					$("#SUBCC1").show();			
	 				}	
	        });
	       
	</script>
</body>
</html>