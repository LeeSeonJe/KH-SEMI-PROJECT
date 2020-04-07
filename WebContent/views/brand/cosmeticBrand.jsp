<%@page import="brand.model.vo.Brand"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/layout/import.jsp"%>
<style>
#page-name>h1 {
	font-size: 40px;
	font-weight: 900;
	margin-left: 70px;
    margin-top: 60px;
}

#cosmetic-beauty-filter {
	display: inline-block;
    border: 1px solid #ccc;
    padding-left: 18px;
    background-color: #F8F8F8;
    height: 535px;
    width: 350px;
}

#cosmetic-beauty-filter-header>h3 {
	display: inline-block;
}

input {
	position: relative;
}

.radioChk+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 19px;
	background-color: white;
	border: 1px solid #ccc;
	font-size: 13px !important;
	width: 94px	;
	text-align: center;
	position: relative;
	left: -14px;
}

.radioChkActive+label {
	display: inline-block;
	margin: -2px;
	padding: 8px 19px;
	background-color: white;
	border: 1px solid red;
	font-size: 13px !important;
	width: 94px;
	text-align: center;
	position: relative;
	left: -14px;
}


#select-btn-center {
	margin-right: 15px;
    text-align: center;
}

#reset-btn {
    margin-left: 218px;
    border: 0;
    background-color: #F8F8F8;
}

#select-btn {
    width: 144px;
    height: 58px;
    background: red;
    color: white;
    font-size: 16px;
    font-weight: 900;
    border-radius: 6px;
    border: 1px solid red;
}
/* #test {
	display: inline-flex;
	width: 500px;
} */

#filter-form {
	display: inline-flex;
	margin-top: 50px;
}

#filter-form>section#cosmetic-filter {
	display: inline-flex;
}

#filter-form>section#brand-list-section {
	display: block;
	margin-left: 30px;
	font-size: 12px;
}
 
#brand-list-section {
	float: left;
}


/* 여기부터 리스트 css */
#brand-list {
	display: inline-flex;
    border-block-end: 1px solid #ccc;
}

#brand-list div {
	display: inline-block;
	height: 120px;
	text-align: center;
}

#brand-list>#bd-name {
	width: 450px;
    padding-top: 26px;
}
#brand-list>#bd-img {
	width: 150px;
}

#bd-img>img{
	width: 110px;
    height: 55px;
    margin-top: 30px;
}

#brand-detail-btn {
	border: 1px solid red;
    background: white;
    font-size: 12px;
    padding: 5px;
    margin-top: 43px;
}

#bd-name>h3{
	text-align: left;
    margin-left: 10px;
    font-size: 20px;
}
</style>

<% 
	ArrayList<Brand> list = (ArrayList<Brand>) request.getAttribute("list");
// 	int count = 20;
%>
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section id="page-name">
			<h1>브랜드 찾기</h1>
		</section>
		
		<form id="filter-form" action="#">
			<section id="cosmetic-filter">
				<div id="cosmetic-beauty-filter">
					<div id="cosmetic-beauty-filter-header">
						<h3>필터</h3>
						<button id="reset-btn" type="reset">초기화</button>
					</div>
					<br>
					<div id="cosmetic-beauty-filter-select">
					<fieldset id="brand-fieldset">
						<legend>
							<h4>가나다순</h4>
						</legend>
							<input type="radio" id="brand-all" class="radioChkActive" name="brand-filter" value="all" checked="checked"/> <label for="brand-all">전체</label>
							<input type="radio" id="brand-r" class="radioChk" name="brand-filter" value="가"/> <label for="brand-r">ㄱ</label>
							<input type="radio" id="brand-s" class="radioChk" name="brand-filter" value="나"/> <label for="brand-s">ㄴ</label><br><br>					
							<input type="radio" id="brand-e" class="radioChk" name="brand-filter" value="다"/> <label for="brand-e">ㄷ</label>						
							<input type="radio" id="brand-f" class="radioChk" name="brand-filter" value="라"/> <label for="brand-f">ㄹ</label>						
							<input type="radio" id="brand-a" class="radioChk" name="brand-filter" value="마"/> <label for="brand-a">ㅁ</label><br><br>						
							<input type="radio" id="brand-q" class="radioChk" name="brand-filter" value="바"/> <label for="brand-q">ㅂ</label>						
							<input type="radio" id="brand-t" class="radioChk" name="brand-filter" value="사"/> <label for="brand-t">ㅅ</label>						
							<input type="radio" id="brand-d" class="radioChk" name="brand-filter" value="아"/> <label for="brand-d">ㅇ</label><br><br>						
							<input type="radio" id="brand-w" class="radioChk" name="brand-filter" value="자"/> <label for="brand-w">ㅈ</label>				
							<input type="radio" id="brand-c" class="radioChk" name="brand-filter" value="차"/> <label for="brand-c">ㅊ</label>						
							<input type="radio" id="brand-z" class="radioChk" name="brand-filter" value="카"/> <label for="brand-z">ㅋ</label><br><br>					
							<input type="radio" id="brand-x" class="radioChk" name="brand-filter" value="타"/> <label for="brand-x">ㅌ</label>				
							<input type="radio" id="brand-v" class="radioChk" name="brand-filter" value="파"/> <label for="brand-v">ㅍ</label>						
							<input type="radio" id="brand-g" class="radioChk" name="brand-filter" value="하"/> <label for="brand-g">ㅎ</label><br><br>						
							<input type="radio" id="brand-etc" class="radioChk" name="brand-filter" value="etc"/> <label for="brand-etc">기타</label>						
					</fieldset>
					<br>
					<div id="select-btn-center">
						<button id="select-btn" type="submit">필터적용</button>
					</div>
					<br>
					</div>
				</div>
			</section>
			<section id="brand-list-section" >
				<section>
					<ul id = 'ul-area'>
					<% for (int i = 0; i < list.size(); i++) { %>
						<li id="brand-list-li">
							<div id="brand-list">
								<div id="bd-img">
									<img src="<%=list.get(i).getBrand_Img() %>" />
								</div>
								<div id="bd-name">
									<h3><%=list.get(i).getBrand_Name() %></h3>
								</div>
								<div>
									<button id="brand-detail-btn" class="brand-detail-btn" type="button" value="<%=list.get(i).getBrand_Name() %>">바로가기</button>
								</div>
							</div>
						</li>
					<% } %>		
					</ul>
				</section>
			</section>
		</form>
		
	</div>
	<%@ include file="/views/layout/footer.jsp"%>

	<script>
	
		$(function() {
			$('.brand-detail-btn').click(function(){
				var bname = $(this).val();
				console.log(bname);
				location.href="<%= request.getContextPath()%>/detail.br?bname=" + bname
			})
		}) 
		//스크롤 바닥 감지
		<%-- window.onscroll = function(e) {
			//추가되는 임시 콘텐츠
			//window height + window scrollY 값이 document height보다 클 경우,
			if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - 50) {
				//실행할 로직 (콘텐츠 추가)
				var li = document.createElement('li');
				li.id = 'brand-list-li';
				
				var div1 = document.createElement('div');
				div1.id = 'brand-list';
				
				var div2 = document.createElement('div');
				div2.id = 'bd-img';
				
				var img = document.createElement('img');
				img.src = '<%= list.get(count).getBrand_Img() %>';
				
				var div3 = document.createElement('div');
				div3.id = 'bd-name';
				
				var h3 = document.createElement('h3');
				var h3Text = document.createTextNode('<%= list.get(count).getBrand_Name() %>');
				var h3Text = document.createTextNode('<%= list.get(count).getBrand_Name() %>');
				h3.appendChild(h3Text);
				
				li.appendChild(div1);
				div1.appendChild(div2);
				div2.appendChild(img);
				div1.appendChild(div3);
				div3.appendChild(h3);
				document.getElementById('ul-area').appendChild(li);
			};
		} --%>

		$('input[name=brand-filter]').click(function() {

			if ($(this)[0].value == "all") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "가") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "나") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "다") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "라") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "마") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "바") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "사") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "아") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "자") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "차") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "카") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "타") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "파") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "하") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "etc") {
				$('input[name=brand-filter]').addClass('radioChk')
				$('input[name=brand-filter]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			}
		})

		$('#reset-btn').click(
				function() {
					$('input[name=brand]').addClass('radioChk').removeClass(
							"radioChkActive")
					$("#brand-all").prop("checked", true).addClass(
							"radioChkActive")
				})
	</script>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>