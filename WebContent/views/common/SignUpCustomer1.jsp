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
	height: 1550px;
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
	background-color: #DDDDDD;
	width: 80%;
	height: 160px;
	text-align: left;
	float: left;
	font-size: 14pt;
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
	font-size: 14pt;
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
	font-size: 11pt;
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
	text-align : left;	
}

img.SUImg2 {
	width: 35px;
	height: 35px;
}

h3.SUImgI {
	font-size: 17pt;
	font-weight: 600;
}

/*checkbox*/
</style>
<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle2.css"
	type="text/css">
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<!-- 작성 -->

	</div>
	<form action = "<%=request.getContextPath()%>/views/common/SignUpCustomer2.jsp" method = "post" onsubmit = "return validate()">
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
						src="<%=request.getContextPath()%>/resources/images/SUChk1_1_1.png">
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
						src="<%=request.getContextPath()%>/resources/images/SUChk3_2_1.png">
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
				<br><br> 
				&nbsp;&nbsp;&nbsp;&nbsp; 
				<label class="form-switch"> <input class="toggleA"
				type="checkbox" id="tglA"> <i></i>
				</label>
				&nbsp;&nbsp; 
				코스메딕 이용약관, 개인정보 수집 및 이용동의, 이벤트
				및 프로모션 안내메일 수신(선택)에 모두 동의합니다.
			</div>
			<div class="SUChk2">
				<br> <br> 
				&nbsp;&nbsp;&nbsp;&nbsp;
				<label class="form-switch"> <input class="toggleB"
				type="checkbox" id="tgl1"> <i></i>
				</label> 
				&nbsp;&nbsp; 
				코스메딕 사이트 이용약관 
				<h3 style="font-size: 13pt; color: #DF1758; display: inline-block;">
				(필수)
				</h3>
				<div class="SUChkBF">
					<input type="button" class="SUChkBt" value="자세히 보기"
					onclick = "popUp1()">
				</div>
			</div>
			<div class="SUChk2">
				<br> <br> 
				&nbsp;&nbsp;&nbsp;&nbsp; 
				<label class="form-switch"> <input class="toggleB"
				type="checkbox" id="tgl2"> <i></i>
				</label>
				&nbsp;&nbsp; 
				개인정보 수집 및 이용동의 
				<h3 style="font-size: 13pt; color: #DF1758; display: inline-block;">
				(필수)
				</h3>
				<div class="SUChkBF">
					<input type="button" class="SUChkBt" value="자세히 보기" onclick = "popUp2()">
				</div>
			</div>
			<div class="SUChk2">
				<br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp; 
				<label class="form-switch"> <input class="toggleC"
				type="checkbox" id="tgl3"> <i></i>
				</label>
				&nbsp;&nbsp; 
				이벤트 및 프로모션 알림 메일 수신
				<h3 style="font-size: 13pt; color: #DF1758; display: inline-block;">
				(선택)
				</h3>
				<div class="SUChkBF">
					<input type="button" class="SUChkBt" value="자세히 보기" onclick = "popUp3()">
				</div>
			</div>
			<div class="SUB">
				<br> <br> <br> <br> 
				<input
					class="SUBC" type="button" value="비동의"
					style="background-color: white; border: 1px solid black;" 
					onclick="location.href='loginedMain.jsp' ">
				<input class="SUBC" type="button" value="동의"
					style="background-color: #595959; border: 1px solid #595959; color: white;" id = "Dummy">
				<input class="SUBC" type="submit" value="동의"
					style="background-color: #DF1758; border: 1px solid #DF1758; color: white;" id = "SUSubmit">
			</div>
		</div>
	</div>
	</form>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		function popUp1(){
			window.open("<%= request.getContextPath() %>/views/common/SignUpTerm1.jsp", "COSMEDIC이용약관", "width=460 , height = 500 , left = 300, top = 150");
		}
		function popUp2(){
			window.open("<%= request.getContextPath() %>/views/common/SignUpTerm2.jsp", "COSMEDIC이용약관", "width=460 , height = 500 , left = 300, top = 150");
		}
		function popUp3(){
			window.open("<%= request.getContextPath() %>/views/common/SignUpTerm3.jsp", "COSMEDIC이용약관", "width=460 , height = 500 , left = 300, top = 150");
		}

		$(document).ready(function(){
			$("#SUSubmit").hide();
			$("#Dummy").show();
			$('.toggleA').change(function(){
				if($('#tglA').is(":checked")){
					$(".toggleB").prop("checked",true);
					$(".toggleC").prop("checked",true);
				}else{
					$(".toggleB").prop("checked",false);
					$(".toggleC").prop("checked",false);
				}
			});
			$('input').change(function(){
				var chkbox = document.getElementsByClassName('toggleB');
				var chk = false;
				
				for (var i = 0; i < 2 ;i++){
					if(chkbox[0].checked){
						if(chkbox[1].checked){
							chk=true;
						}
					} else {
						chk=false;	
					}
				}
				if(chk)	{
					$('#Dummy').hide();
					$('#SUSubmit').show();
				}else{
					$('#SUSubmit').hide();
					$('#Dummy').show();
				}	
			});
		});
		
	</script>
</body>
</html>