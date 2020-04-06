<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	#select-pro{border: none; width: 600px; height: 170px;
				margin-left: 150px;
				}
	#pro-img{background: lightgray; border-radius: 5px; border: none; 
			width: 100px; height: 100px; text-align: center;
			}
	#btn-select{background: darkgray; color: white; border: none; border-radius: 3px;
				width: 75px; height: 30px;
				}
	.label-name{margin-left: 90px; font-size: 16px; margin-bottom: 30px; text-align: center; margin-right: 40px;}
	.label-radio{margin-left: 25px;}
	#review-title{margin-left: 35px;}
	#review-content{margin-left: 85px;}
	#label-age{margin-left: 85px; font-size: 16px; margin-bottom: 30px; text-align: center; margin-right: 31px;}
	
	#div-content{display: inline-block;}
	
	#label-content{margin-left: 85px; font-size: 16px; margin-top: 2px;}
	
	#div-tip{display: inline-block; margin-left: 30px;}
	#p-tip{font-size: 5px;}

	#div-btns{margin-left: 420px;}
	#btn-reset{border-radius: 4px; background: lightgray; width: 55px; height: 35px; border: none;}
	#btn-submit{border-radius: 4px; color: white; background: darkgray; width: 55px; height: 35px; border: none;}
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
			<!-- 작성 시작-->
	<div class="writingReview">
	<h2> &nbsp;리뷰 작성</h2>
	<hr>
	<form class="reviewForm">
	<div>
	<table id="select-pro">
		<tr>
			<td rowspan=3>
			<div id="pro-img">
				제품선택하면 사진이 뿅!!!!@@@@@@@@@@@@~
			</div>
			</td>
			<td>브랜드 명</td>
		</tr>
		<tr>
			<td>제품 명</td>
		</tr>
		<tr>
			<td><button id="btn-select">제품 선택</button></td>
		</tr>
	</table>
<hr>	
	</div>
		<br><br>
		<div>
			<label class="label-name">평점</label>
		</div>
		<div class="review-age">
			<label id="label-age">연령대</label>
			<label class="label-radio"><input type="radio" name="age" value="10"> 10대</label>
			<label class="label-radio"><input type="radio" name="age" value="20early"> 20대 초반</label>
			<label class="label-radio"><input type="radio" name="age" value="20late"> 20대 후반</label>
			<label class="label-radio"><input type="radio" name="age" value="30early"> 30대 초반</label>
			<label class="label-radio"><input type="radio" name="age" value="30late"> 30대 후반</label>
			<label class="label-radio"><input type="radio" name="age" value="other"> 그 외 연령층</label>			
		</div>
		<div class="review-gender">
			<label class="label-name">성별</label>
			<label class="label-radio"><input type="radio" name="gender" value="M"> 남자</label>
			<label class="label-radio"><input type="radio" name="gender" value="F"> 여자</label>
		</div>
		<div>
			<label class="label-name">제목</label>
			<input type="text" name="title" id="review-title"placeholder="제목을 입력해주세요" size="57" required>
		</div>
		<div id="div-content">
 			<label id="label-content">내용</label>
			<textarea name="content" cols="60" rows="13" id="review-content"
			required placeholder=" # 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민,형사상의 책임을 질 수 있습니다."></textarea>
		</div>
			<div id="div-tip">
				<p><h4>좋은 리뷰 TIP!</h4></p>
				<p id="p-tip"><h6>
				<b>1. </b>좋았던 점에 대해서<b> 자세한 </b>리뷰를 남겨 주세요.<br>
				 예) 추천하는 피부타입, 발림성, 흡수력 등 사용감을 적어주세요.<br><br>
				 <b>2. </b>아쉬운 점에 대해서 <b> 자세한 </b>리뷰를 남겨 주세요.<br>
				 예) 추천하지 않는 피부타입, 트러블 유무, 아쉬웠던 사용감을 적어주세요.<br><br>
				 <b>3. </b>꿀팁이 있다면 남겨주세요.<br>
				 예) 나만의 사용법, 제품에 대해 도움이 되는 정보 등을 적어주세요.
				</h6></p>
			</div> 

		<div id="div-btns">
			<button type="submit" id="btn-submit">등록</button>
			<button type="reset" id="btn-reset">취소</button>
		</div>
	</form>
	</div>
<!-- 작성 끝 -->	
	</div>

	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>