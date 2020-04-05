<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#CSU-form>table>tbody>tr>td {
	height: 60px;
}
#CSU-form>table>tbody>tr>td>label {
    margin-right: 5px;
}
#CSU-form>table>tbody>tr>td:first-child {
    width: 110px;
}

#CSU-form>table>tbody>tr>td.td-center {
    text-align: center;
}

.td-center>button {
	margin: 12px;
}
.CSU-board {
    margin-left: 70px;
}
</style>

<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<div class="CSU-board">
			<h2>병원 회원가입</h2>
		</div>
		<hr>
		<form id="CSU-form">
			<table>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input class="input-standard" type="text" placeholder="아이디를 입력하세요." id = "id" onkeyup ="test3();">
							<button class = "btn-standard">중복확인</button>
						</td>
						
					</tr>
					<tr>
						<td></td>
						<td><label id = "idCheck"></label></td>
					</tr>
					
					<tr>
						<td>비밀번호</td>
						<td><input class="input-standard" type="password" placeholder="비밀번호를 입력하세요." id = "pwd" onkeyup = "test1();"></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td><label id = "pwdCheck"></label></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input class="input-standard" type="password" placeholder="비밀번호를 입력하세요." id ="pwd2" onkeyup = "test2();"></td>
					</tr>
					<tr>
						<td></td>
						<td> <label id="pwdConfirm"></label></td>
					</tr>
					<tr>
						<td>병원 이름</td>
						<td><input class="input-standard" type="text" placeholder="병원 이름을 입력하세요."/></td>
					</tr>
					<tr>
							<td>병원 전화번호</td>
						<td><input class="input-standard" type="email" placeholder="이메일을 입력하세요."/></td>
					</tr>
					<tr>
						<td>병원 주소</td>
						<td><input class="input-standard" type="text" placeholder="병원 대표전화번호를 입력하세요."/></td>
					</tr>
					<tr>
						<td>사업자등록증</td>
					</tr>
					<tr>
						<td>
							<input class="input-standard" type="text" readonly placeholder="사업자등록증 사진"/>
							<button class="btn-standard">파일 선택</button>
						</td>
					</tr>
					<tr>
						<td>
							<input class="input-standard" type="text" readonly placeholder="병원사진"/>
							<button class="btn-standard">파일 선택</button>
						</td>
					</tr>
					<tr>
						<td>병원 설명</td>
												
					</tr>
					<tr>
						<td><input class="input-standard" type="text" placeholder="내용을 작성해 주세요"/></td>
					</tr>
					<tr>
						<td colspan="2" class="td-center"><button class="btn-standard" type="submit">신청</button><button class="btn-standard">취소</button></td>
					</tr>
					
				</tbody>
			</table>
		</form>
		<script>
		function test1(){

			var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

			var pwd = $("#pwd").val();

			if(false === reg.test(pwd)) {
				pwdCheck.innerHTML = '비밀번호는 8자 이상이어야 하며,<br> 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.';
				pwdCheck.style.color = 'red';
			}else {
				pwdCheck.innerHTML = '&nbsp;사용 가능한 비밀번호입니다.'
				pwdCheck.style.color = 'green';
			}

			}
		 function test2(){
	         var pwdConfirm = document.getElementById('pwdConfirm');
	         var pwd = document.getElementById('pwd');
	         var pwd2 = document.getElementById('pwd2');
	         
	         if(pwd.value == pwd2.value){
	            pwdConfirm.innerHTML = '&nbsp;비밀번호가 일치합니다.';
	            pwdConfirm.style.color = 'green';
	         } else{
	            pwdConfirm.innerHTML = '&nbsp;비밀번호가 일치하지 않습니다.';
	            pwdConfirm.style.color = 'red';
	         }
		 }
		 
		 function test3(){
			 var reg = /^(?=.*?[A-Z,a-z])(?=.*?[0-9]).{8,}$/;

			 var id = $("#id").val();
		 if(false === reg.test(id)){
			idCheck.innerHTML = '아이디는 8자 이상이어야 하며, 영어, 숫자만<br> 입력하여야 하고 특수문자는 사용이 불가능합니다';
			idCheck.style.color = 'red';
		 } else {
			 idCheck.innerHTML = '아이디 중복확인 부탁드립니다!';
			 idCheck.style.color = 'green'; 
		 }
		 }		
		</script>
		
	</div>



	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>