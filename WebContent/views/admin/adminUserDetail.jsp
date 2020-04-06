<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0 auto;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.index{margin: 30px; display: inline-block; width: 100px;}
	
	.info{display: inline-block; border: 1px solid black; min-width: 300px; min-height: 40px;}
	
</style>
</head>
<body>
	<div class="index">아이디</div>
	<div class="info" id="id"></div><br>
	<div class="index">비밀번호</div>
	<div class="info" id="pwd"></div><br>	
	<div class="index">이름</div>
	<div class="info" id="name"></div><br>
	<div class="index">이메일</div>
	<div class="info" id="email"></div><br>
	<div class="index">피부 타입</div>
	<div class="info" id="skintype"></div><br>
	<div class="index">사용 중인   화장품</div>
	<div class="info" id="cosmetic"></div><br>	
	
</body>
</html>