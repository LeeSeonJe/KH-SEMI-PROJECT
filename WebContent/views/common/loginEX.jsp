<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/views/layout/import.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
   text-align: center;
}

table>tbody>tr>th { 
   text-align: center;
    height: 100px;
    font-size: 35px;
}

table>tbody>tr>td {
   height: 50px;
}

.login-tab {
   border: 1px solid black;
    width: 228px;
    padding: 23px;
}

.login-tab:hover {
   cursor: pointer;
}

.act-login-tab {
   background: #726654;
   color: white;
   border: 1px solid black;
    width: 228px;
    padding: 23px;
}

#login-btn {
    border: 0;
    background-color: #726654;
    color: white;
    width: 150px;
    height: 70px;
    font-size: 15px;
   margin-top: 65px;
    margin-bottom: 50px;
}

#id-input {
    margin-top: 48px;
    width: 210px;
}

#pwd-input {
   width: 210px;
   margin-bottom: 32px;
}

.signFind {
   border: 1px solid;
}

.socialLogin {
   font-size: 17px;
}
</style>


</head>
<body>
   <div class="contents">
      <%@ include file="/views/layout/header.jsp"%>
      <hr>
      
      <section id="memberLogin">
         <form action="<%= request.getContextPath() %>/login.me" method="post" onsubmit="return validate();">
            <table>
               <tr>
                  <th colspan="4">COSMEDIC LOGIN</th>
               </tr>
               <tr>
                  <td id="member" class="login-tab" colspan="2">MEMBER</td>
                  <td id="hospital" class="login-tab" colspan="2">HOSPITAL</td>
               </tr>
               <tr>
                  <td class="input-area" colspan="3"><input id="id-input" class="input-standard" type="text" name="id" placeholder="아이디" /></td>
                  <td rowspan="2"><button id="login-btn">로그인</button></td>
               </tr>
               <tr>
                  <td class="input-area" colspan="3"><input id="pwd-input" class="input-standard" type="password" name="pwd" placeholder="비밀번호" /></td>
               </tr>
               <tr>
                  <td class="signFind" colspan="2"><a id="sign-area">회원가입</a></td>
                  <td class="signFind" colspan="2" onclick="location.href='<%= request.getContextPath() %>/views/common/foundPw.jsp'">아이디/비밀번호 찾기</td>
               </tr>
               <tr>
                  <td class="socialLogin" colspan="4">카카오톡 로그인</td>
               </tr>
               <tr>
                  <td class="socialLogin" colspan="4">네이버 로그인</td>
               </tr>
            </table>
         </form>
      </section>
   </div>
   <%@ include file="/views/layout/footer.jsp"%>

   <script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
   <script>
   	  function validate(){
   		  if($('#id-input').val().trim().length==0){
   			  alert('아이디를 입력해주세요');
   			  $('#id-input').focus();
   			  
   			  return false;
   		  }
   		  if($('#pwd-input').val().trim().length==0){
   			  alert('비밀번호를 입력해주세요');
   			  $('#pwd-input').focus();
   			  
   			  return false;
   		  }
   		  return true;
   	  }
   	  
      $(function(){
         $('#memberLogin').css('display', 'block');
         $('#signHospital').css('display', 'none');
         $('#member').addClass('act-login-tab');
         $('#sign-area').attr('href','<%= request.getContextPath() %>/views/common/SignUpCustomer.jsp');
      })
      
      $('#member').click(function(){
         $('.socialLogin').show();
         $('#member').addClass('act-login-tab');
         $('#hospital').removeClass('act-login-tab');
         $('#sign-area').attr('href','<%= request.getContextPath() %>/views/common/SignUpCustomer.jsp');
      })

      $('#hospital').click(function(){
         $('.socialLogin').hide();
         $('#member').removeClass('act-login-tab');
         $('#hospital').addClass('act-login-tab');
         $('#sign-area').attr('href','<%= request.getContextPath() %>/views/common/SignUpHospital.jsp');
      })
   </script>
</body>
</html>