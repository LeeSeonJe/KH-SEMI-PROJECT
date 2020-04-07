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
		<form id="reqFrom" action="<%= request.getContextPath() %>/insert.cos" method="post" onsubmit="return validate();">
				<div class="content">
				<table>
					<tr>
						<th width="100px">브랜드명</th>
						<td rowspan="7">&nbsp;&nbsp;</td>
						<td colspan="3"><input type="text" size="45" name="brandName"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<input type="text" id="topCg" name="topCg" placeholder="대분류" size="18" list="toplist">
							<datalist id="toplist">
								<option value="스킨케어"></option>
								<option value="클렌징"></option>
								<option value="베이스메이크업"></option>
								<option value="색조메이크업"></option>
								<option value="마스크/팩"></option>
								<option value="선케어"></option>
								<option value="기능성화장품"></option>
								<option value="바디/핸드/풋"></option>
								<option value="헤어"></option>
								<option value="네일"></option>
								<option value="여성용품"></option>
								<option value="미용렌즈"></option>
								<option value="향수"></option>
								<option value="기타제품"></option>
								<option value="베이비&맘"></option>
								<option value="바디라인"></option>
								<option value="남성화장품"></option>
							</datalist>
						</td>
						<td>
							<input type="text" id="middleCg" name="middleCg" onclick="middle();" placeholder="중분류" size="18" list="middlelist">
							<datalist id="스킨케어">
								<option value="스킨"></option>
								<option value="에센스"></option>
								<option value="로션"></option>
								<option value="크림"></option>
								<option value="토너/필링패드"></option>
								<option value="페이스오일"></option>
								<option value="미스트"></option>
								<option value="메이크업픽스"></option>
							</datalist>
							<datalist id="클렌징">
								<option value="클렌징폼"></option>
								<option value="클렌징오일"></option>
								<option value="클렌징밀크"></option>
								<option value="클렌징크림"></option>
								<option value="클렌징워터"></option>
								<option value="클렌징젤"></option>
								<option value="스크렙/필링"></option>
								<option value="포인트리무버"></option>
								<option value="클렌징티슈"></option>
								<option value="클렌징비누"></option>
							</datalist>
							<datalist id="베이스메이크업">
								<option value="메이크업베이스"></option>
								<option value="톤업크림"></option>
								<option value="베이스프라이머"></option>
								<option value="포인트프라이머"></option>
								<option value="파운데이션"></option>
								<option value="비비크림"></option>
								<option value="씨씨크림"></option>
								<option value="쿠션타입"></option>
								<option value="컨실러"></option>
								<option value="팩트"></option>
								<option value="파우더"></option>
								<option value="트윈케익"></option>
							</datalist>
							<datalist id="색조메이크업">
								<option value="립스틱"></option>
								<option value="립글로스/락커"></option>
								<option value="립틴트"></option>
								<option value="립밤"></option>
								<option value="립라이너"></option>
								<option value="아이라이너-펜슬&젤"></option>
								<option value="마스카라"></option>
								<option value="픽서/영양제"></option>
								<option value="아이섀도우"></option>
								<option value="아이브로우-펜슬"></option>
								<option value="아이브로우-파우더"></option>
								<option value="아이브로우-마스카라&리퀴드"></option>
								<option value="하이라이터"></option>
								<option value="쉐딩"></option>
								<option value="블러셔"></option>
							</datalist>
							<datalist id="마스크/팩">
								<option value="마스크시트"></option>
								<option value="수면팩"></option>
								<option value="워시오프"></option>
								<option value="필오프"></option>
								<option value="수딩젤/팩"></option>
								<option value="코팩"></option>
							</datalist>
							<datalist id="선케어">
								<option value="선블럭"></option>
								<option value="선스프레이"></option>
								<option value="선스틱"></option>
								<option value="선쿠션"></option>
								<option value="태닝"></option>
							</datalist>
							<datalist id="기능성화장품">
								<option value="링클케어"></option>
								<option value="트러플케어"></option>
								<option value="화이트닝케어"></option>
								<option value="모공케어"></option>
								<option value="아이케어"></option>
								<option value="넥케어"></option>
							</datalist>
							<datalist id="바디/핸드/풋">
								<option value="바디워시"></option>
								<option value="바디스크럽"></option>
								<option value="바디로션"></option>
								<option value="바디크림"></option>
								<option value="바디오일"></option>
								<option value="바디미스트"></option>
								<option value="바디에센스"></option>
								<option value="바디팜/파우더"></option>
								<option value="핸드케어"></option>
								<option value="풋케어"></option>
								<option value="데오도란트"></option>
								<option value="목욕비누"></option>
								<option value="입욕제"></option>
								<option value="아로마테라피"></option>
							</datalist>
							<datalist id="헤어">
								<option value="헤어"></option>
								<option value="린스/컨디셔너"></option>
								<option value="트리트먼트/팩"></option>
								<option value="헤어소품"></option>
								<option value="헤어스타일링"></option>
								<option value="염색제/퍼머제"></option>
								<option value="헤어기기"></option>
							</datalist>
							<datalist id="네일">
								<option value="네일컬러"></option>
								<option value="베이스/탑코트/퀵드라이"></option>
								<option value="네일아트/소품"></option>
								<option value="네일영양"></option>
								<option value="네일리무버"></option>
							</datalist>
							<datalist id="여성용품">
								<option value="소형"></option>
								<option value="중형"></option>
								<option value="대형"></option>
								<option value="오버나이트"></option>
								<option value="팬티라이너"></option>
								<option value="체내형"></option>
								<option value="청결제"></option>
							</datalist>
							<datalist id="미용렌즈">
								<option value="컬러렌즈"></option>
								<option value="렌즈관리용품"></option>
								<option value="투명렌즈"></option>
							</datalist>
							<datalist id="향수">
								<option value="여성향수"></option>
								<option value="남성향수"></option>
								<option value="방향제"></option>
								<option value="향초"></option>
								<option value="디퓨저"></option>
							</datalist>
							<datalist id="기타제품">
								<option value="브러쉬"></option>
								<option value="스펀지/퍼프"></option>
								<option value="뷰러"></option>
								<option value="페이스소품"></option>
								<option value="아이소품"></option>
							</datalist>
							<datalist id="베이비&맘">
								<option value="베이비스킨케어"></option>
								<option value="베이비바디"></option>
								<option value="베이비클렌저/샴푸"></option>
								<option value="베이비선케어"></option>
								<option value="키즈제품"></option>
								<option value="맘케어"></option>
							</datalist>
							<datalist id="바디라인">
								<option value="바디슬리밍"></option>
								<option value="제모제/용품"></option>
								<option value="건강/다이어트식품"></option>
							</datalist>
							<datalist id="남성화장품">
								<option value="클렌징"></option>
								<option value="스크럽/필링"></option>
								<option value="쉐이빙"></option>
								<option value="애프터쉐이브"></option>
								<option value="마스크/팩"></option>
								<option value="메이크업"></option>
								<option value="선케어"></option>
								<option value="헤어/바디"></option>
							</datalist>
						</td>
						<script>
							function middle(){
								var list = $('#topCg')[0].value;
								$('#middleCg').attr('list', list);
							}
						</script>
						<td>
							
						</td>
					</tr>
					<tr>
						<th width="100px">제품 명</th>
						<td colspan="3"><input type="text" size="45" name="name"></td>
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
					<tr>
						<th>용량</th>
						<td colspan="3"><input type="text" size="45" name="volume"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td colspan="3"><input type="text" size="45" name="price"></td>
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