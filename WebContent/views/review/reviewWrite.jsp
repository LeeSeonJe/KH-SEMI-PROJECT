<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	#selectDiv{text-align: center; width: 100%}
	#selectPro{border: none; width: 600px; height: 170px; text-align: left;}
	#pro-img{background: lightgray; border-radius: 5px; border: 1px; 
			width: 160px; height: 160px; text-align: center; 
			}
	#pro-img>img{width: 160px; height: 160px;}
	.sp1{margin-left: 30px;}
	#btn-select{background: darkgray; color: white; border: none; border-radius: 3px;
				width: 75px; height: 30px; margin-left: 30px;
				}
	.labelName{margin-left: 90px; font-size: 16px; margin-bottom: 30px; text-align: center; margin-right: 40px;}

	#heart{font-size: 30px; display: inline-block; margin-left: 25px; margin-bottom: 0;}
	#heart a{text-decoration: none; color: lightgray;}
	#heart a.on{color: red;}
	.label-radio{margin-left: 25px;}
	#reviewTitle{margin-left: 35px; width: 624px;}
	#reviewContent{margin-left:35px; vertical-align: top;}
	#label-age{margin-left: 85px; font-size: 16px; margin-bottom: 30px; text-align: center; margin-right: 31px;}
	
	#div-content{display: inline-block;}
	
	#labelContent{margin-left: 0px; font-size: 16px; margin-top: 2px;}
	
	#tip{display: inline-block; text-align: left; font-size: 11px; width: 40%;}
	#req{display: inline-block; text-align: left; width: 40%;
	margin-left: 190px;}
	#p-tip{font-size: 5px;}

	#divBtns{margin-left: 420px;}
	#btnReset{border-radius: 4px; background: lightgray; width: 55px; height: 35px; border: none;}
	#btnReq{border-radius: 4px; background: linen; width: 55px; height: 35px; border: none;}
	#btnSubmit{border-radius: 4px; color: white; background: slategray; width: 55px; height: 35px; border: none;}
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
			<!-- 작성 시작-->
	<div class="writingReview">
	<h2 style="color: gray"> &nbsp;리뷰 작성</h2>
	<hr>
	<form name="reviewForm" class="reviewForm" action="<%= request.getContextPath() %>/insert.re" method="get" onsubmit="return check();">
	<div id="selectDiv">
		<table id="selectPro">
			<tr>
				<td rowspan=3>
				<div id="pro-img">
					<img name="cosmetic_img">
				</div>
				</td>
				<td><span class="sp1">브랜드 명</span><br> 
				<input id="brandName" type="hidden" name="brand_name" style="border: none; margin-left: 30px; readonly"></td>
			</tr>
			<tr>
				<td><span class="sp1">제품 명</span><br> 
				<input id="cosName" type="text" name="cosmetic_name" style="border: none; width: 500px; margin-left: 30px; readonly"></td>
				<td><input id="cosNo" type="hidden" name="cosmetic_no"/></td>
			</tr>
			<tr>
				<td><button type="button" id="btn-select">제품 선택</button></td>
				
			</tr>
		</table>
	</div>
<hr>	

		<br><br>
		<div>
		     <label class="labelName">평점</label>
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
			<label class="labelName">제목</label>
			<input type="text" name="title" id="reviewTitle"placeholder="제목을 입력해주세요" size="57" required>
		</div>
		<div id="div-content" class="labelName">
 			<label id="labelContent" class="labelName">내용</label>
			<textarea name="content" cols="80" rows="13" id="reviewContent"
			required placeholder=" # 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민,형사상의 책임을 질 수 있습니다."></textarea>
		</div>
			<div id="req">
			<h4>리뷰할 제품을 코스메딕에서 찾을 수 없으신가요?</h4>
			 &nbsp;하단의 '<b>제품등록</b>'을 이용해보세요<br>
			 &nbsp;제품등록을 요청하는 페이지로 이동합니다<br>
			<br><br><br><br><br>
			</div>
			<div id="tip">
			<h4>좋은 리뷰 TIP!</h4>
				<b>&nbsp;1. </b>좋았던 점에 대해서<b> 자세한 </b>리뷰를 남겨 주세요.<br>
				 &nbsp;예) 추천하는 피부타입, 발림성, 흡수력 등 사용감을 적어주세요.<br><br>
				 <b>&nbsp;2. </b>아쉬운 점에 대해서 <b> 자세한 </b>리뷰를 남겨 주세요.<br>
				 &nbsp;예) 추천하지 않는 피부타입, 트러블 유무, 아쉬웠던 사용감을 적어주세요.<br><br>
				 <b>&nbsp;3. </b>꿀팁이 있다면 남겨주세요.<br>
				 &nbsp;예) 나만의 사용법, 제품에 대해 도움이 되는 정보 등을 적어주세요.<br>
			</div>
			<br><br><br><br>

		<div id="divBtns">
			<button onclick="check();" type="submit" id="btnSubmit">리뷰등록</button>
			<button type="reset" id="btnReset">취소</button>
			<button onclick="req();" type="button" id="btnReq">제품등록</button>
		</div>
		<script>
		function check(){
			var cosNo = document.getElementById('cosNo').value;
			var reviewScore = document.getElementById('reviewScore').value;
			
			if(cosNo == ""){
				alert('리뷰할 제품을 선택해주세요.');
				return false;
			}
			if(reviewScore == ""){
				alert('평점을 선택해주세요.');
				return false;
			}
		}
		
		function req(){
			window.open('../admin/cosmeticReqPopup.jsp', 'reqPop', 'width=600, height=500');
			
		}
		</script>
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