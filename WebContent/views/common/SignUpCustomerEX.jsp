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
	font-size : 30pt;
    background-color : #DF1758;
    color : white;
    height : 100px;
    
}
</style>

<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<div class="CSU-board">
			&nbsp;&nbsp;&nbsp;회원가입
		</div>
		<form action="<%= request.getContextPath() %>/insertC.me" method="post" id="CSU-form" onsubmit="return validate();">
			<input type="hidden" name="category" value="C">
			<table>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input class="input-standard" type="text" placeholder="아이디를 입력하세요." name="userId" id = "id" onkeyup = "test3();">
						<button class="btn-standard">중복확인</button></td>
					</tr>
					<tr>
						<td></td>
						<td><label id = "idCheck"></label></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input class="input-standard" type="text" id="name" name="userName" placeholder="이름을 입력하세요."/>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input class="input-standard" type='password' name="userPwd" placeholder="비밀번호를 입력하세요." id = "pwd" onkeyup="test1();">
					</tr>
					<tr>
						<td></td>
						<td><label id = "pwdCheck"></label></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input class="input-standard" type="password" placeholder="비밀번호를 입력하세요" id = "pwd2" onkeyup="test2();">
						
					</tr>	
					<tr>
						<td></td>
						<td> <label id="pwdConfirm"></label></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input class="input-standard" type="email" id="email" name="email" placeholder="이메일을 입력하세요.">
						<button class="btn-standard">인증번호 전송</button></td>
					</tr>
					<tr>
						<td></td>
						<td><input class="input-standard" type="text" placeholder="인증번호를 입력하세요">
						<button class="btn-standard">인증번호확인</button></td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<label class="label-radio"><input type="radio" name="gender" value="M"> 남자</label>
							<label class="label-radio"><input type="radio" name="gender" value="F"> 여자</label>
						</td>
					</tr>
					<tr>
						<td>연령대</td>
						<td>
							<label class="label-radio"><input type="radio" name="age" value="10"> 10대</label>
							<label class="label-radio"><input type="radio" name="age" value="20early"> 20대 초반</label>
							<label class="label-radio"><input type="radio" name="age" value="20late"> 20대 후반</label>
							<label class="label-radio"><input type="radio" name="age" value="30early"> 30대 초반</label>
							<label class="label-radio"><input type="radio" name="age" value="30late"> 30대 후반</label>
							<label class="label-radio"><input type="radio" name="age" value="other"> 그 외 연령층</label>
						</td>
					</tr>
					<tr>
						<td>피부 타입</td>
						<td>
							<input type="radio" name="skintype" value="건성"><label>건성</label>
							<input type="radio" name="skintype" value="지성"><label>지성</label>
							<input type="radio" name="skintype" value="중성"><label>중성</label>
							<input type="radio" name="skintype" value="복합성"><label>복합성</label>
							<input type="radio" name="skintype" value="민감성"><label>민감성</label>
						</td>
					</tr>
					<tr>
						<td>사용중인 화장품</td>
						<td colspan="2" class="td-center"><input class="input-standard" type="text" placeholder=""/><button class="btn-standard" onclick = "test4();">화장품 찾기</button></td>
					</tr>
					<tr>
						<td colspan="2" class="td-center"><button class="btn-standard" type="submit">완료</button><button class="btn-standard" onclick="location.href='javascript:history.back()'">취소</button></td>
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
		 
		 function test4(){
			 var popup = window.open("<%= request.getContextPath() %>/views/common/SignUpCustomerPopup.jsp", "a", "width = 460 , height = 500");
		 }
		 
		 function validate(){
			var found1 = null;
			var found2 = null;
			var found3 = null;
			var gender = document.getElementsByName("gender");
			var age = document.getElementsByName('age');
			var skintype = document.getElementsByName('skintype');

			for(var i=0; i<gender.length; i++){
				if(gender[i].checked == true)
					found1 = gender[i];
			}
			for(var i=0; i<age .length; i++){
				if(age[i].checked == true)
					found2 = age[i];
			}
			for(var i=0; i<skintype.length; i++){
				if(skintype[i].checked == true)
					found3 = skintype[i];
			}
			
			if($('#id').val().trim().length == 0){
				alert('아이디를 입력해주세요');
				$('#id').focus();
				
				return false;
			} else if($('#pwd').val().trim().length == 0){
				alert('비밀번호를 입력해주세요');
				$('#pwd').focus();
				return false;
			} else if($('#pwd2').val().trim().length == 0){
				alert('비밀번호 확인을 입력해주세요');
				$('#pwd2').focus();
				return false;
			} else if($('#name').val().trim().length == 0){
				alert('이름을 입력해주세요');
				$('#name').focus();
				return false;
			} else if(found1==null){
				alert('성별을 선택해주세요');
				return false;
			} else if(found2==null){
				alert('나이를 선택해주세요');
				return false;
			} else if(found3==null){
				alert('피부타입을 선택해주세요');
				return false;
			} else{
					alert(name.value+'님, 회원가입이 성공적으로 완료되었습니다^^');
					return true;
			}
			
		 }
		</script>
	</div>
	



	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>