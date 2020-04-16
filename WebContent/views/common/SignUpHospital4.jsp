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
	href="<%=request.getContextPath()%>/resources/commonCss/SignUpHospital4.css"
	type="text/css">

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
					<h3 style="font-size: 29pt; color: black; font-weight : 600; display: inline-block;">회원가입</h3> 승인요청중입니다.
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