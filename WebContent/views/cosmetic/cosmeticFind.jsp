<%@page import="cosmetic.model.vo.Cosmetic"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<style>
* {
	padding: 0;
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
} /* 리셋 */
body {
	background: white;
}

button {
	border: 1px solid #ccccce;
	border-radius: 6px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	cursor: pointer;
	font-size: 12px;
	padding: 5px;
}

select, input {
	border: 1px solid #ccccce;
	border-radius: 5px;
	background-color: #fff;
	font-weight: 500;
	color: #666;
	font-size: 12px;
	padding: 3px;
	font-size: 13px; 
}

#cosmetic-category>select, div {
	display: inline-block;
}

.ranking-list {
	display: flex;
    border-block-end: 1px solid #ccc;
}

.ranking-list div {
	display: inline-block;
	height: 170px;
	text-align: center;
}

.ranking-list>.cos-rank {
	width: 80px;
    padding-top: 30px;
}
.ranking-list>.cos-img {
	width: 150px;
}
.ranking-list>.cos-detail {
	text-align: left;
	width: 270px;
}
.ranking-list>.cos-score {
	width: 200px;
	padding-top: 70px;
}

.cos-img>img{
	width: 100px;
    height: 100px;
    margin-top: 30px;
}

.cos-detail-link {
	cursor: pointer;
	font-weight: 700;
	display:inline-block;
}
.cos-detail>span {
	font-size: 12px;
}
/* .ranking-list { */
/* 	cursor: pointer; */
/* } */

</style>
</head>
<body>
	<div>
		<h3>화장품 찾기</h3> 
	</div>
	<section id="cosmetic-category">
		<select id="cosmetic-big-category" name="big">
			<option>스킨케어</option>
			<option>클렌징</option>
			<option>베이스메이크업</option>
			<option>색조메이크업</option>
			<option>마스크/팩</option>
			<option>선케어</option>
			<option>기능성화장품</option>
			<option>바디/핸드/풋</option>
			<option>헤어</option>
			<option>네일</option>
			<option>여성용품</option>
			<option>미용렌즈</option>
			<option>향수</option>
			<option>기타제품</option>
			<option>베이비&맘</option>
			<option>바디라인</option>
			<option>남성화장품</option>		
		</select>
		<div id="cosmetic-middle-category">
			 <%@include file="/views/cosmetic/select_category.jsp" %>
		</div>
		<input id="find-input"type="text" placeholder="화장품 명을 입력해주세요" />
		<button id="category-btn" type="button">찾기</button>
	</section>
	<section>
		<ul id="ul-area">
			<li>
				<div class="ranking-list">
					<h3>화장품을 검색해주세요.</h3>
				</div>
			</li>
		</ul>
	</section>
	
	<script>
	
		$('#category-btn').click(function(){
			var middleCategory = $('.middle-category[name="middle"]').val();
			var findInput = $('#find-input').val();
			if($('#find-input').val().trim().length == 0){
				findInput = "all";				
			}
			console.log(findInput)
			console.log(middleCategory)
			$.ajax({
				url: "/COSMEDIC/cosFind.co",
				data: {
					middleCategory:middleCategory,
					findInput:findInput
				},
				success: function(data){
					$('#ul-area').html("");
					if(data.length > 0) {
						for(var i in data){
							var $li = $('<li></li>');
							var $div1 = $('<div class="ranking-list"></div>');
							var $input = $('<input type="hidden">').val(data[i].cosmetic_no);
							var $div2 = $('<div class="cos-img"></div>');
							var $img = $('<img>');
							if((data[i].cosmetic_img).indexOf("http") == -1){
								$img.attr('src', "<%= request.getContextPath() %>/cosReq_uploadFiles/" + data[i].cosmetic_img);														
							} else {
								$img.attr('src', data[i].cosmetic_img);							
							}
							var $div3 = $('<div class="cos-detail"></div>');
							var $h6 = $('<h6></h6>').text(data[i].brand_name + "\n");
							var $h5 = $('<h5></h5>').text(data[i].cosmetic_name);
							var $vspan = $('<span></span>').text(data[i].volume + " / ");
							var $pspan = $('<span></span>').text(data[i].price);
							
							$div2.append($img);
							$div3.append($h6, $h5, $vspan, $pspan);
							$div1.append($div2, $div3, $input);
							$li.append($div1);
							$('#ul-area').append($li);
						}
					} else {
						var $li = $('<li></li>');
						var $div1 = $('<div class="ranking-list"></div>');
						var $h3 = $('<h3></h3>').text("검색 결과가 없습니다.");
						$div1.append($h3);
						$li.append($div1);
						$('#ul-area').append($li);
					}
					$('.ranking-list').click(function(){
						var tt = $(this).find('img').attr('src').indexOf("http");
						opener.document.reviewForm.cosmetic_no.value = $(this).find('input').val();
						opener.document.reviewForm.brand_name.value = $(this).find('h6').text();
						opener.document.reviewForm.cosmetic_name.value = $(this).find('h5').text();
						if(tt == -1){
							opener.document.reviewForm.cosmetic_img.src = "<%= request.getContextPath() %>/cosReq_uploadFiles/" + data[i].brand_Img;
						} else {
							opener.document.reviewForm.cosmetic_img.src = $(this).find('img').attr('src');
						}
						self.close();
					})
				}
			})
		})


	
		$(function(){
			$('.middle-category').css('display','none')
			$('#skincare').css('display','block');
			$('#skincare').attr("name","middle");
		})
		
		$('#cosmetic-big-category').click(function(){
			var t = document.getElementById('cosmetic-big-category')
			if (t.value == '스킨케어') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#skincare').css('display','block');
				$('#skincare').attr("name","middle");
			} else if (t.value == '클렌징') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#cleansing').css('display','block');
				$('#cleansing').attr("name","middle");
			} else if (t.value == '베이스메이크업') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#base').css('display','block');
				$('#base').attr("name","middle");
			} else if (t.value == '색조메이크업') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#tint').css('display','block');
				$('#tint').attr("name","middle");
			} else if (t.value == '마스크/팩') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#maskPack').css('display','block')
				$('#maskPack').attr("name","middle");
			} else if (t.value == '선케어') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#suncare').css('display','block');
				$('#suncare').attr("name","middle");
			} else if (t.value == '기능성화장품') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#func-cosmetic').css('display','block');
				$('#func-cosmetic').attr("name","middle");
			} else if (t.value == '바디/핸드/풋') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#bodyHandFoot').css('display','block');
				$('#bodyHandFoot').attr("name","middle");
			} else if (t.value == '헤어') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#hair').css('display','block');
				$('#hair').attr("name","middle");
			} else if (t.value == '네일') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#nail').css('display','block');
				$('#nail').attr("name","middle");
			} else if (t.value == '여성용품') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#WomenGoods').css('display','block');
				$('#WomenGoods').attr("name","middle");
			} else if (t.value == '미용렌즈') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#BeautyLens').css('display','block');
				$('#BeautyLens').attr("name","middle");
			} else if (t.value == '향수') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#perfume').css('display','block');
				$('#perfume').attr("name","middle");
			} else if (t.value == '기타제품') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#etc').css('display','block');
				$('#etc').attr("name","middle");
			} else if (t.value == '베이비&맘') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#babyMom').css('display','block');
				$('#babyMom').attr("name","middle");
			} else if (t.value == '바디라인') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#bodyLine').css('display','block');
				$('#bodyLine').attr("name","middle");
			} else if (t.value == '남성화장품') {
				$('.middle-category').css('display','none')
				$('.middle-category').attr("name", null);
				$('#man').css('display','block');
				$('#man').attr("name","middle");
			}
		})
	</script>
</body>
</html>