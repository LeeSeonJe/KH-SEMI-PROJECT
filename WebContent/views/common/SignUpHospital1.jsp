<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/commonCss/SignUpHospital1.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle3.css"
	type="text/css">
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header2.jsp"%>
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
						src="<%=request.getContextPath()%>/resources/images/SUHChk1_1_1.png">
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
						src="<%=request.getContextPath()%>/resources/images/SUHChk4_2_1.png">
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
				<h3 style="font-size: 13pt; color: #4BD763; display: inline-block;">
				(필수)
				</h3>
				<div class="SUChkBF">
					<input type="button" class="SUChkBt" value="자세히 보기"
					onclick = "popUp1()" style = "background-color : #4BD763">
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
				<h3 style="font-size: 13pt; color: #4BD763; display: inline-block;">
				(필수)
				</h3>
				<div class="SUChkBF">
					<input type="button" class="SUChkBt" value="자세히 보기" onclick = "popUp2()" style = "background-color : #4BD763">
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
				<h3 style="font-size: 13pt; color: #4BD763; display: inline-block;">
				(선택)
				</h3>
				<div class="SUChkBF">
					<input type="button" class="SUChkBt" value="자세히 보기" onclick = "popUp3()" style = "background-color : #4BD763">
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
				<input class="SUBC" type="button" value="동의"
					style="background-color: #4BD763; border: 1px solid #4BD763; color: white;" id = "SUSubmit"onclick="location.href='SignUpHospital2.jsp'">
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