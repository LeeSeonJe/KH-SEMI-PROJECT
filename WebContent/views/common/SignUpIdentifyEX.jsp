<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style>
* {
   padding: 0;
   box-sizing: border-box;
   font-family: 'Noto Sans KR', sans-serif;
} /* 리셋 */

body {
	background: white;
}

span {
	font-weight: bold;
	color: orange;
}

table {
	margin-left: 33px;
}
table>tbody>tr>td{
	height: 200px;
	height: 30px;
}

.title {
	vertical-align: bottom;
	font-size: 13px;
}

h3 {
	margin-top: 50px;
    margin-left: 33px;
    margin-bottom: 20px;
}

hr {
	margin-bottom: 20px;
}

button {
	float: right;
    margin-left: 10px;
}

.btn-standard {
	border: 1px solid #ccccce; 
	border-radius: 6px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	cursor: pointer;
	font-size: 12px;
	padding: 5px;
	height: 30px;
}

.input-standard {
	border: 1px solid #ccccce;
	border-radius: 5px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	font-size: 12px;
	padding: 5px;
}
</style>

<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
</head>
<body>
	<div>
		<h3>이메일 인증</h3>
		<hr />
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입을 위해서는 이메일 인증 절차가 필요합니다.</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 정확한 이메일을 입력해주세요.</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 인증번호 확인이 완료되면 창이 자동으로 꺼집니다.</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 또한 페이지의 다음단계 버튼이 활성화 됩니다.</p>
		<br>
	</div>
	<table>
		<tr>
			<td class="title">이메일</td>
		</tr>
		<tr>
			<td><input class="input-standard" type="email" id="email" name="email" placeholder="이메일을 입력하세요."></td>
			<td><button class="btn-standard" id="emailCheck" type="button">인증번호 전송</button></td>
		</tr>
		<tr>
			<td  class="title">인증번호 입력</td>
		</tr>
		<tr>
			<td><input class="input-standard" type="text" id="emailCheckNumber" name="emailCheckNumber" placeholder="인증번호를 입력하세요"></td>
			<td><button class="btn-standard" id="emailRealCheck" type="button">인증번호확인</button></td>
		</tr>
	</table>

	<script>
		$('#emailCheck').click(function(){
			var email = $('#email').val();
			if(email.trim().length == 0){
				alert("이메일을 입력해주세요.")
				$('#email').focus();
			} else {
				$.ajax({
					url: '<%= request.getContextPath()%>/emailCheck.me',
					data: {email:email},
					success: function(data){
						alert('인증번호 전송 완료');
					},
					error: function(data){
						alert('인증번호 전송 실패');
					}
				});
			}
		});
		
		$('#emailRealCheck').click(function(){
			var emailCheck =  $('#emailCheckNumber').val();
			if(emailCheck.trim().length == 0){
				alert("인증번호를 입력해주세요.")
				$('#emailCheckNumber').focus();
			} else {
				$.ajax({
					url: '<%= request.getContextPath()%>/emailCheckNumber.me',
					data : {emailCheck:emailCheck},
					success: function(data){
						alert(data);
						if(data.trim() == '인증번호 불일치'){
							$('#emailCheckNumber').focus();
						} else{
							opener.document.loginForm.nextAfter.className = 'SUBC SUBCBefore';
							opener.document.loginForm.nextAfter.disabled = false;
							self.close();
						}
					},
					error: function(data){
						alert('인증번호 확인 실패');
					}
				});
			}
		});
	</script>
</body>
</html>