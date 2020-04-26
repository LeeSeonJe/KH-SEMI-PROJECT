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

.bnameSpan {
	display: inline-block;
    margin-top: 25px;
    vertical-align: top;
    cursor: pointer;
}
/* .ranking-list { */
/* 	cursor: pointer; */
/* } */

</style>
</head>
<body>
	<div>
		<h3>브랜드 검색</h3> 
	</div>
	<section id="cosmetic-category">

		<input id="find-input"type="text" placeholder="브랜드 명을 입력해주세요" />
		<button id="category-btn" type="button">찾기</button>
	</section>
	<section>
		<ul id="ul-area">
<!-- 			<li> -->
<!-- 				<div class="ranking-list"> -->
<!-- 					<h3>브랜드를 검색해주세요.</h3> -->
<!-- 				</div> -->
<!-- 			</li> -->
		</ul>
	</section>
	
	<script>
		$('#category-btn').click(function(){
			var middleCategory = $('.middle-category[name="middle"]').val();
			var findInput = $('#find-input').val();
			if($('#find-input').val().trim().length == 0){
				alert("한글자이상 입력해주세요.");	
				$('#find-input').focus();
			} else {
				$.ajax({
					url: "/COSMEDIC/BrandFind.br",
					data: {
						findInput:findInput
					},
					success: function(data){
						console.log(data)
						$('#ul-area').html("");
						if(data.length > 0) {
							for(var i in data){
								var $li = $('<li></li>');
								var $img = $('<img style="width: 160px; height: 80px;">');
								if((data[i].brand_Img).indexOf("http") == -1){
									$img.attr('src', "<%= request.getContextPath() %>/brandReq_uploadFiles/" + data[i].brand_Img);														
								} else {
									$img.attr('src', data[i].brand_Img);							
								}
								var $span = $('<span class="bnameSpan"></span>').text(data[i].brand_Name + "\n");
								$li.append($img, $span);
								$('#ul-area').append($li);
							}
						} else {
							var $li = $('<li></li>');
							var $div1 = $('<div class="ranking-list"></div>');
							var $h3 = $('<h3></h3>').text("검색 결과가 없습니다.");
							var $button = $('<button type="button" class="btn-standard" onclick="brandInput();">브랜드등록</button>');
							$div1.append($h3);
							$li.append($div1, $button);
							$('#ul-area').append($li);
						}
						
						$('.bnameSpan').click(function(){
							console.log($(this).text());
							window.opener.document.reqFrom.brandName.value = $(this).text();
							self.close();
						})
					}
				})
			}
		})

		function brandInput(){
			var test = window.open("/COSMEDIC/views/admin/brandReqPopup.jsp", "brandReqPopup", "width=800, height=700");
			window.opener.close();
			self.close();
		}
	
		
	</script>
</body>
</html>