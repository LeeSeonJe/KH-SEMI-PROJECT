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
	href="<%=request.getContextPath()%>/resources/commonCss/SignUpHospital2.css"
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

	<form name="loginForm" class="loginForm">

		<div>
			<br> <br> <br> <br>
		</div>
		<div class="mLogin">
			<br> <br>
			<div class="SUI">
					<div class="SUII2"></div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk1_1_2.png">
					</div>
					<div class="SUII3">
						<br> <br> <br> <img class="SUImg2"
							src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
					</div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk2_1_1.png">
					</div>
					<div class="SUII3">
						<br> <br> <br> <img class="SUImg2"
							src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
					</div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk3_2_1.png">
					</div>
					<div class="SUII3">
						<br> <br> <br> <img class="SUImg2"
							src="<%=request.getContextPath()%>/resources/images/SUChkKK_1.png">
					</div>
					<div class="SUII">
						<img class="SUImg"
							src="<%=request.getContextPath()%>/resources/images/SUHChk4_2_1.png">
					</div>
				</div>
			<div style="width: 80%; height: 50px; float: left; margin-left: 10%;">
				<div class="SUIIDB">
					<div class="SUIIDBI">Step 1</div>
				</div>
				<div class="SUIIDBN"></div>
				<div class="SUIIDB">
					<div class="SUIIDBI">Step 2</div>
				</div>
				<div class="SUIIDBN"></div>
				<div class="SUIIDB">
					<div class="SUIIDBI">Step 3</div>
				</div>
				<div class="SUIIDBN"></div>
				<div class="SUIIDB" style="width: 14%;">
					<div class="SUIIDBI">Step 4</div>
				</div>
			</div>
			<div style="width: 80%; height: 80px; float: left; margin-left: 10%;">
				<div class="SUIIDB">
					<div class="SUIIDBI2">약관동의</div>
				</div>
				<div class="SUIIDBN"></div>
				<div class="SUIIDB">
					<div class="SUIIDBI2">본인인증</div>
				</div>
				<div class="SUIIDBN"></div>
				<div class="SUIIDB">
					<div class="SUIIDBI2">정보입력</div>
				</div>
				<div class="SUIIDBN"></div>
				<div class="SUIIDB" style="width: 14%;">
					<div class="SUIIDBI2">가입완료</div>
				</div>

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
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
						<br>
					</div>
					<input class="SUBC" id="SUBCC" type="button" value="취소"
						style="background-color: white; border: 1px solid black;"
						onclick="location.href='loginedMain.jsp'"> <input
						id="nextAfter" name="nextAfter" class="SUBC" type="button"
						value="다음단계" onclick="location.href='SignUpHospital3.jsp'">
				</div>
			</div>
		</div>
		</div>
	</form>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		var flag = false;
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
		
		$(function(){
			if(flag == false){
				$('#nextAfter').addClass('SUBCAfter').attr("disabled",true);
			}
		})
	
		function openEmailIden(){
			window.open("<%=request.getContextPath()%>/views/common/SignUpIdentifyEX.jsp",
							"이메일 인증",
							"height = 450 , width = 500, left = 300, top = 50");
		}

		$(document).ready(function() {
			$('#SUBCC').click(function() {
				if (confirm("정말 취소하시겠습니까 ?") == true) {

				} else {

				}
			});
		});
	</script>
</body>
</html>