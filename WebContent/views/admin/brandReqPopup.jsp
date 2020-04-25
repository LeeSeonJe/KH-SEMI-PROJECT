<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int result =0;
	if(request.getAttribute("result") == null){
		
	} else{
		result = (int)request.getAttribute("result");
	}
%>
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
<script>
	$(function (){
		<% if(result > 0) { %>
			alert('화장품 등록을 완료했습니다.');
			self.close();
		<% } %>
	});
</script>
</head>
<body>
	<div class="top">
		<form id="reqFrom" action="<%= request.getContextPath() %>/brandInsert.br" method="post" onsubmit="return validate();" encType="multipart/form-data">
				<div class="content">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;브랜드 등록</h3><br><br>
				<table>
					<tr>
						<td>
							<div id="titleImgArea">
								브랜드 이미지 <br><br>
								<img id="titleImg" width="350" height="200">
							</div>
						</td>
					</tr>
					<tr>
						<td><br>브랜드명 <br><br><input style="width:350px;" type="text" name="bname" id="bname" /></td>
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
							}
							reader.readAsDataURL(value.files[0]);
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
		function validate() {
			if($('#thumbnailImg1').val() == ""){
				alert('브랜드 이미지를 넣어주세요')
				return false;
			}
			if($('#bname').val().trim() == ""){
				alert('브랜드 명을 입력해주세요.');
				$('#bname').focus();
				return false;
			}
		}
		$("#closeBtn").click(function() {
		  	window.close();
		});
	</script>
</body>
</html>