<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*, java.util.*"%>
<%
	Review r = (Review)request.getAttribute("board");
	ArrayList<AddFile> fileList = (ArrayList<AddFile>)request.getAttribute("fileList");
//	AddFile af = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디를 찾았습니다!</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<form action>
	<h1>요청하신 아이디를 찾았습니다.</h1>
	<h2>아이디를 확인하시려면 아래의 버튼을 클릭해주세요</h2>
	<button type="button" onclick="">아이디 확인하기</button>
	</form>
	<script>
	
	</script>

</body>
</html>