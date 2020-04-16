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
	href="<%=request.getContextPath()%>/resources/commonCss/SignUpCustomerFace.css"
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
			<div class="logoDiv">
				<img class="logoImg"
					src="<%=request.getContextPath()%>/resources/images/logopink.png">
			</div>
			
				<div class="bLogin" id="CLogin2Id">
					<div>
						<br></br>
					</div>
					<div class="bLogin2">
						<div class="loginFont">
							일반 회원가입
						</div>
						<br>
						<div class = "SignUpFace">
							코스메딕 회원은 모두가 가입 가능합니다.
						</div>
							<br><br>
						<div>
							<input type="button" class="loginPBtn" value="일반 회원가입" onclick="location.href='SignUpCustomer1.jsp' ">
						</div>
					</div>
				</div>
			
			<div class="fLogin" id="FLogin2Id">
				<div>
					<br></br>
				</div>
				<div class="fLogin2">
					<div class="loginFont">
						SNS계정으로 회원가입
					</div>
						<br>
					<div class = "SignUpFace">
							SNS계정인증을 통해 코스메딕 회원으로 가입합니다.
					</div>
						<br><br>
					<div>
						<input type="button" class="loginFBtnN" value="네이버 아이디로 회원가입">
					</div>
					<div>
						<br>
					</div>
					<div>
						<input type="button" class="loginFBtnF" value="페이스북 아이디로 회원가입">
					</div>
					<div>
						<br>
					</div>
					<div>
						<input type="button" class="loginFBtnK" value="카카오톡 아이디로 회원가입">
					</div>
				</div>
			</div>
		</div>
	
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
</body>
</html>