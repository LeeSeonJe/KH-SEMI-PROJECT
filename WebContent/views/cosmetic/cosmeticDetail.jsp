<%@page import="cosmetic.model.vo.Cosmetic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/views/layout/import.jsp"%>

<style>

#cos-section{
    display: inline-flex;
    margin-top: 100px;
}

#cos-img {
    width: 280px;
    height: 280px;
}

#input-img{
	/* width: 500px; */
    min-height: 200px;
}

#cos-detail-wrap{
	margin-left: 30px;
}

#cos-detail{

}

#brand-product-name{
	margin-bottom: 40px;
}
#brand-product-name>span{
	color: #936890;
    font-size: 15px;
}
#brand-product-name>h3{
	font-weight: 900;
/*     font-size: 35px; */
}

#product-volume-price{
    display: inline;
}

#product-volume-price>span:first-child{
	color: #936890;
}

#score-count{
	display: inline;
    float: right;
}

#cos-brand{
	margin-top: 30px;
}

#brand-img {
	width: 100px;
	height: 50px;
}

#cos-category {
	margin-top: 30px;
	color: #936890;
	font-size: 13px;
}
#cos-category>span {
	margin-left: 15px;
	font-size: 13px;
	color: black;
}

#cos-contents {
	margin-top: 30px;
	display: flex;
}

#cos-contents>div:first-child {
	display: inline-block;
/* 	width: 120px; */
	width:13%;
	margin-right: 23px;
}

/* #cos-contents>p { */
/* 	width:500px; */
/* } */

#brandHomeBtn {
	float: right;
	border: 1px solid red;
    background: white;
    font-size: 11px;
    border-radius: 3px;
    padding: 5px;
}

#cosRankHomeBtn {
	margin-left: 20px; 
	border: 1px solid red;
    background: white;
    font-size: 11px;
    border-radius: 3px;
    padding: 5px;
}

#td-contents {
	width: 67px; 
	vertical-align: top;
	color: #936890;
}
</style>
<%
	Cosmetic c = (Cosmetic) request.getAttribute("cosmeticInform");
	String bImg = (String) request.getAttribute("bImg");
	String middleName = (String) request.getAttribute("middleName");
%>
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<section id="cos-section">
			<div id="input-img"><img id="cos-img" src="<%=c.getCosmetic_img() %>" alt="화장품이미지" /></div>
			<div id="cos-detail-wrap">
				<section id="cos-detail">
					<div id="brand-product-name">
						<span><%= c.getBrand_name() %></span><br>
						<h3><%= c.getCosmetic_name() %></h3>
					</div>
					<div id="product-volume-price">
						<span><%= c.getVolume() %></span> /
						<span><%= c.getPrice() %></span>
						<div id="score-count">
							<span>1.@@</span>
							<span>♥♥♥♥</span>
							<span>(count하기)</span>
						</div>
					</div>
					<div id="cos-brand">
						<span><img id="brand-img" src="<%= bImg %>" alt="" /></span>
						<span><%= c.getBrand_name() %></span>
						<button id="brandHomeBtn" class="" type="button" onclick="brandHome()">브랜드홈</button>
					</div>
					<div id="cos-category">
						카테고리 <span><%= middleName %></span>
						<button id="cosRankHomeBtn" class="" type="button" onclick="cosRankHome()">랭킹확인</button>
					</div>
					<div id="cos-contents">
						<table>
							<tr>
								<td id="td-contents">설명</td>
								<td style="width: 760px"><%= c.getCosmetic_about() %></td>
								<td style="width: 180px"></td>
							</tr>
						</table>
					</div>
				</section>
			</div>
		</section>
	</div>

	<%@ include file="/views/layout/footer.jsp"%>
	<script> 
		function brandHome() {
			location.href = '<%= request.getContextPath()%>/detail.br?bname=' + '<%= c.getBrand_name()%>';
		}
		
		function cosRankHome() {
			location.href = '<%= request.getContextPath()%>/cosmetic.li?cos_middle_no=' + '<%= c.getMiddle_no()%>';
		}

		$('input[name=filter-sex]').click(function() {
			if ($(this)[0].value == "filter-sex-all") {
				$('input[name=filter-sex]').addClass('radioChk')
				$('input[name=filter-sex]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "filter-sex-female") {
				$('input[name=filter-sex]').addClass('radioChk')
				$('input[name=filter-sex]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			} else if ($(this)[0].value == "filter-sex-male") {
				$('input[name=filter-sex]').addClass('radioChk')
				$('input[name=filter-sex]').removeClass('radioChkActive')
				$(this).addClass('radioChkActive')
			}
		})
		
		$('#filter-age-all').click(function(){
			if ($(this)[0].value == "filter-age-all") {
				console.log($(this)[0].value)
				$('#filter-age-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			}
		})
	
		$('input[name=filter-age]').click(function(){
			var chk = document.getElementsByName('filter-age');
			var chkAll = document.getElementById('filter-age-all');
			var count = 0;
			$('#filter-age-all').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					chk[i].classList.add("chkboxChkActive")
					count++;
				} 		
				if(!chk[i].checked) {
					chk[i].classList.remove("chkboxChkActive")
					chk[i].classList.add("chkboxChk")
				}
			}
			if (count == chk.length) {
				$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive")
				$('#filter-age-all').prop("checked", true).addClass("chkboxChkActive");
			} else if (count == 0) {
				$('#filter-age-all').prop("checked", true).addClass("chkboxChkActive");
			}
		})
		
		$('#filter-skinType-all').click(function(){
			if ($(this)[0].value == "filter-skinType-all") {
				console.log($(this)[0].value)
				$('#filter-skinType-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
				$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			}
		})
	
		$('input[name=filter-skinType]').click(function(){
			var chk = document.getElementsByName('filter-skinType');
			var chkAll = document.getElementById('filter-skinType-all');
			var count = 0;
			$('#filter-skinType-all').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			for (var i = 0; i < chk.length; i++) {
				if (chk[i].checked) {
					chk[i].classList.add("chkboxChkActive")
					count++;
				} if(!chk[i].checked) {
					chk[i].classList.remove("chkboxChkActive")
					chk[i].classList.add("chkboxChk")
				}
			}
			if (count == chk.length) {
				$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive")
				$('#filter-skinType-all').prop("checked", true).addClass("chkboxChkActive");
			} else if (count == 0) {
				$('#filter-skinType-all').prop("checked", true).addClass("chkboxChkActive");
			}
		})
		
		$('#reset-btn').click(function(){
			$('input[name=filter-sex]').addClass('radioChk').removeClass("radioChkActive")
			$("#filter-sex-all").prop("checked", true).addClass("radioChkActive")
			$('#filter-age-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
			$('input[name=filter-age]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
			$('#filter-skinType-all').prop("checked", true).removeClass("chkboxChk").addClass("chkboxChkActive");
			$('input[name=filter-skinType]').prop("checked", false).removeClass("chkboxChkActive").addClass("chkboxChk");
		})
	</script>


	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>