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
</style>

<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
</head>
<body>
	<div>
		<h3>비밀번호 변경</h3>
		<hr />
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;안전한 비밀번호로 내정보를 보호하세요</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 다른 아이디/사이트에서 사용한 적 없는 비밀번호</p>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* 이전에 사용한 적 없는 비밀번호가 안전합니다.</p>
		<br>
	</div>
	<form action="">
		<table>
			<tr>
				<td class="title">아이디</td>
			</tr>
			<tr>
				<td><input id="userId" type="text" value="<%= loginUser.getUser_id()%>" readonly="readonly"/></td>
			</tr>
			<tr>
				<td class="title">이전 비밀번호</td>
			</tr>
			<tr>
				<td><input id="userPwd" type="password" /></td>
			</tr>
			<tr>
				<td  class="title">새 비밀번호</td>
			</tr>
			<tr>
				<td><input id="newPwd" type="password" onkeyup = "validateChk();"/></td>
				<td><span id="pwdCheck1"></span></td>
			</tr>
			<tr>
				<td class="title">새 비밀번호 확인</td>
			</tr>
			<tr>
				<td><input type="password" id="newPwd2" onkeyup = "pwdChk();"/></td>
				<td><span id="pwdCheck2"></span></td>
			</tr>
			<tr>
				<td>
					<br>
					<button class="btn-standard" type="button" onclick="send()">확인</button>
					<button class="btn-standard" type="button" id="closeWindow">취소</button>				
				</td>
			</tr>
		</table>
	</form>
	
	<script>
		
		$('#closeWindow').on('click', function(){
			self.close();
		})
		var flag1 = false;
		var flag2 = false;
		function validateChk(){
			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			if (false === reg.test($("#newPwd").val()) && $("#newPwd").val() != "") {
				pwdCheck1.innerHTML = '비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
				pwdCheck1.style.color = 'red';
				pwdCheck1.style.fontSize = '10px';
				console.log($("#newPwd").val());
				flag1 = false;
			} else if (true === reg.test($("#newPwd").val())){
				pwdCheck1.innerHTML = '&nbsp;사용 가능한 비밀번호입니다.';
				pwdCheck1.style.color = 'green';
				pwdCheck1.style.fontSize = '10px';
				console.log($("#newPwd").val());
				flag1 = true;
			} else if ($("#newPwd").val().trim().length == 0) {
				pwdCheck1.innerHTML = "";
				flag1 = false;
			}
		}
		function pwdChk(){
			var pwdCheck2 = document.getElementById('pwdCheck2');
			var pwd = document.getElementById('newPwd');
			var pwd2 = document.getElementById('newPwd2');
			
			if ($("#newPwd2").val().trim().length == 0) {
				pwdCheck2.innerHTML = "";
				flag2 = false;
			} else if(pwd.value == pwd2.value){
				pwdCheck2.innerHTML = '&nbsp;비밀번호가 일치합니다.';
				pwdCheck2.style.color = 'green';
				pwdCheck2.style.fontSize = '10px';
				flag2 = true;
			} else if (pwd.value != pwd2.value){
				pwdCheck2.innerHTML = '&nbsp;비밀번호가 일치하지 않습니다.';
				pwdCheck2.style.color = 'red';
				pwdCheck2.style.fontSize = '10px';
				flag2 = false;
			}
		}
		
		function send() {
			var userId = $('#userId').val();
			var userPwd = $('#userPwd').val();
			var newPwd = $('#newPwd').val();
			console.log(userPwd);
			if ($('#userPwd').val().trim().length == 0) {
				alert("비밀번호를 입력해주세요.");
				$('#userPwd').focus();
			}
			if ($('#newPwd').val().trim().length == 0) {
				alert("비밀번호를 입력해주세요.");
				$('#newPwd').focus();
			}
			if ($('#newPwd2').val().trim().length == 0) {
				alert("비밀번호를 입력해주세요.");
				$('#newPwd2').focus();
			}
			if ($('#userPwd').val() == $('#newPwd').val()){
				alert("이전 비밀번호와 일치합니다.");
			}
			
			if(flag1 && flag2){
				$.ajax({
					url: "/COSMEDIC/changePwd.me",
					data: {
						userId:userId,
						userPwd:userPwd,
						newPwd:newPwd
						},
					success:function(data){
						if(data == 0){
							alert("이전 비밀번호가 일치하지 않습니다.")
						} else {
							alert("비밀번호 변경이 완료되었습니다.");
							alert("다시 로그인 해주세요.");
							$.ajax({
								url: "/COSMEDIC/logout.me"
							})
							window.opener.location.reload();
							window.opener.document.location.href="<%= request.getContextPath()%>"
							self.close();
						}
					}
				})
			} else {
				alert("비밀번호를 확인해주세요.");		
			}
		}
	</script>
</body>
</html>