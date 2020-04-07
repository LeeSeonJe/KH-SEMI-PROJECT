<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/layout/import.jsp" %>
<style>
	.top{margin-top: 50px;}
	body {
	    font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	    font-size: 19px;
	    line-height: 1.42857143;
	    color: #333;
	    background-color: #fff;
	}
	
	.btn-standard{
		font-size: 19px;
	}
	
	
</style>
</head>
<body>
	<div class="top">
		<form id="reqFrom" action="<%= request.getContextPath() %>/req.cos" method="post" onsubmit="return validate();">
				<div class="content">
				<table>
					<tr>
						<th width="100px">브랜드명</th>
						<td rowspan="5">&nbsp;&nbsp;</td>
						<td colspan="3"><input type="text" size="45" name="brandName"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<div id="contentImgArea1">
								<img id="contentImg1" width="120" height="100"> 
							</div>
						</td>
						<td>
							<div id="contentImgArea2">
								<img id="contentImg2" width="120" height="100"> 
							</div>
						</td>
						<td>
							<div id="contentImgArea3">
								<img id="contentImg3" width="120" height="100"> 
							</div>
						</td>
					</tr>
					<tr>
						<th width="100px">제품 명</th>
						<td colspan="3"><input type="text" size="45" name="cosName"></td>
					</tr>
					<tr>
						<th width="100px">제품 설명</th>
						<td colspan="3"><textarea name="content" rows="5" cols="50" style="resize:none;"></textarea>
					</tr>
					<tr>
						<th>제품 이미지</th>
						<td colspan="2">
							<div id="titleImgArea">
								<img id="titleImg" width="350" height="200">
							</div>
						</td>
						<td style="text-align: center">
							<button class="btn-standard" type="button" id="selectBtn">파일 선택</button>
						</td>
					</tr>
				</table>
				
				<!-- 파일 업로드 하는 부분 -->
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this,1)">
				</div>
				<script>
					// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
					$(function(){
						$("#fileArea").hide();
						
						$("#selectBtn").click(function(){
							$("#thumbnailImg1").click();
						});
						$("#titleImgArea").click(function(){
							$("#thumbnailImg1").click();
						});
					});
					
					// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
					function LoadImg(value, num){
						if(value.files && value.files[0]){
							var reader = new FileReader();
							
							reader.onload = function(e){								
								switch(num){
								case 1: 
									$("#titleImg").attr("src", e.target.result);
									break;
								}
							
								reader.readAsDataURL(value.files[0]);
							}
						}
					}
				</script>
				
			</div>
			<br>
			<div class="btnArea" align="center">
				<button class="btn-standard" type="submit" id="insertBtn">작성완료</button>
				<button class="btn-standard" type="button" id="closeBtn" >닫기</button>
			</div>
		</form>
	</div>
	
	<script>
		$("#closeBtn").click(function() {
		  	window.close();
		});
	</script>
</body>
</html>