<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화장품 찾기</title>
<style>

#div1{
	background-color : lightgray;
}

#btn1{
	height : 40px;
	width : 120px;
	
}	 
#btn2{
	height : 28px;
	width : 120px;	
}
#input1{
	height : 20px;
	width : 350px;
}
</style>
</head>
<body>
<div id = "div1">
	<table>
		<tr>
			<td>
				<input id = "input1" type = "text" placeholder = "제품명을 입력해 주세요" name = "productName">
			</td>
			<td>
				<button id = "btn2">검색</button>
			</td>
		</tr>
		<tr>
			<td>찾고있는 브랜드나 제품이 없으신가요?<br>
			등록 요청을 해주시면 빠르게 업데이트됩니다.
			&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td><button id = "btn1">제품등록요청</button></td>
		<tr> 
	</table>
</div>
</body>
</html>