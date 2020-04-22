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
	href="<%=request.getContextPath()%>/resources/commonCss/SignUpHospitalFace.css"
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
			<br> <br> <br>
		</div>
		<div class="mLogin">
			<div class="logoDiv">
				<img class="logoImg"
					src="<%=request.getContextPath()%>/resources/images/logopink_2.png">
			</div>
			
				<div class="bLogin" id="CLogin2Id">
					<div>
						<br></br>
					</div>
					<div class="bLogin2">
						<div class="loginFont" >
							병원 회원가입
						</div>
						<br>
						<div class = "SignUpFace">
							병원 회원은 관리자 승인 이후 이용이 가능합니다.
						</div>
							<br><br>
						<div>
							<input type="button" class="loginPBtn" value="병원 회원가입" onclick="location.href='SignUpHospital1.jsp' "style="background-color: #4BD763">
						</div>
					</div>
				</div>
			
			<div class="fLogin" id="FLogin2Id">
				<!-- 사이트에 관련된 이미지를 쓸 것 -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img class="logoImg" src="<%=request.getContextPath()%>/resources/images/cghawesome.jpg" style = "width : 400px; height : 550px">
			</div>
		</div>
	
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>