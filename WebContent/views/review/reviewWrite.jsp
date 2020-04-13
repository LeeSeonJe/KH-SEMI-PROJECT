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

	#heart{font-size: 30px; display: inline-block; margin-left: 25px; margin-bottom: 0;}
	#heart a{text-decoration: none; color: lightgray;}
	#heart a.on{color: red;}
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
	<form name="reviewForm" class="reviewForm" action="<%= request.getContextPath() %>/insert.re" method="get">
	<div>
	<table id="select-pro">
		<tr>
			<td rowspan=3>
			<div id="pro-img">
				제품선택하면 사진이 뿅~
				<img name="cosmetic_img">
			</div>
			</td>
			<td>브랜드 명 <input type="text" name="brand_name" /></td>
		</tr>
		<tr>
			<td>제품 명 <input type="text" name="cosmetic_name"/></td>
			<td><input type="hidden" name="cosmetic_no"/></td>
		</tr>
		<tr>
			<td><button type="button" id="btn-select">제품 선택</button></td>
			
		</tr>
	</table>
<hr>	
	</div>
		<br><br>
		<div>
		     <label class="label-name">평점</label>
		     <p id="heart">
		        <a href="#" no='1'>♥</a>
		        <a href="#" no='2'>♥</a>
		        <a href="#" no='3'>♥</a>
		        <a href="#" no='4'>♥</a>
		        <a href="#" no='5'>♥</a>
		      </p>
		      <input id="reviewScore" name="reviewScore" type="hidden"> 
		   <script>
		       $('#heart a').click(function(){
		           $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
		           $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
		           var no = $(this).attr('no');
		           $('#reviewScore').val(no); // input 태그에 값넣어주는 jquery
		           return false;
		       });
		       
		   </script>
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
	<script>
		$('#btn-select').click(function(){
			window.open('<%= request.getContextPath() %>/views/cosmetic/cosmeticFind.jsp', "findingProduct", "width=600, height=300")
		});
	</script>
	<script src="../../resources/js/main.js"></script>
</body>
</html>