<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품등록요청</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	#head{background: lightgray; width: 100%; height: 100px; border-radius: 5px;
		  text-align: center;}
</style>
</head>
<body>
	<div id="head">
		<p>
			등록되지 않은 제품 정보자 이미지를 올려주세요.<br>
			요청하신 제품은 등록 후, 개별 알림을 통해 알려드립니다.
		</p>
	</div>
	<form action="<%= request.getContextPath() %>/insert.req" encType="multipart/form-data" method="post">
		<div>
			<input type="file" name="req_img1" multiple="multiple">
			<input type="file" name="req-img2" multiple="multiple">
			<hr>
			<textarea name="content" rows="10" cols="100%" placeholder="해당 화장품의 브랜드와 화장품의 종류 및 카테고리를 입력해주세요."></textarea>
			<button type="submit">등록</button>
			<button type="reset">취소</button>
		</div>
	</form>
	<script type="text/javascript">
		
	</script>
</body>
</html>