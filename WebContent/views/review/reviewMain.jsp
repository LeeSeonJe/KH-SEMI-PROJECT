<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList" import="review.model.vo.*"%>

<%
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   ArrayList<Review> slideList = (ArrayList<Review>)request.getAttribute("slideList");
   
   int currentPage = pi.getCurrentPage();
   int maxPage = pi.getMaxPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">	
/* 슬라이드 */
#slide{width: 100%; height: 400px; background: none;}

.btns{width: 50px; height: 50px; margin-top: 165px;}
#next{display: none;}
#prev{display: none;}


	#div-ranklist{text-align:center; display: inline-block; width: 100%; padding: 20px;}
	#ranking-title{padding: 20px; text-align: left;}
	h3{margin-left: 30px;}
	.rank-list1>td{display: inline-block; text-align: center; margin-top: 40px;}	
	.rank-list2>td{display: inline-block; text-align: center; margin-top: 40px;}	
	#rank2{margin-left: 80px; margin-right: 80px;}
	#rank5{margin-left: 80px; margin-right: 80px;} 
	
	.review-shots{width: 180px; height: 100px;}
	
	#rTitle{width: 450px; padding: 20px;}
	#slideTable{width: 100px; height: 50px; display: inline-block;}
	.img>img{width: 160px;}
/* 슬라이드 끝 */
#select-option{text-align: right;}
	
	.tb-profile tr td{border:1px solid black}
 	.icon-p{width: 50px; height: 50px; margin-top: 10px;} 
 	.p-content{margin-bottom: 10px; margin-top: 10px;}
	.icon-product{width: 80px; height: 70px; margin-top: 10px;}
	.thumb{width: 25px; height: 25px;}
	
	.best-rivew{display:inline-block; width:150px; height:110px; text-align:center; vertical-align: middle;}
	.best-rivew-title{overflow: hidden; width:140px; display:inline-block; max-height:2.7em;}
	.review-title{white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	.content{white-space: nowrap; overflow: hidden; text-overflow: ellipsis; width: 570px; display:inline-block; min-height:20px;}
	.hiddenSpan{min-height:20px; margin:0; text-align:left}
	#write-date{float:right;}
	
	
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
			<!-- 작성 -->
		<div id="slide"><!-- 베스트리뷰 슬라이드 -->
			<div id="div-btns">
				<img class="btns" id="prev" src="/COSMEDIC/resources/images/prev.png">
					<div id="ranking-title"><h3 style="color:gray">지금 뜨는 리뷰</h3></div>
				<div id="div-ranklist"><!-- 리스트 -->
					<table>
							<tr>
							<% for(int i = 0; i<slideList.size(); i++){ 
								Review r = slideList.get(i); %>
								<%if(i<3){ %>
								<td class="img">
								<img src="<%= r.getCosmetic_img() %>">
								</td>
							<% } }%>
							</tr>
							<tr>
							<% for(int j = 0; j<slideList.size(); j++){
								Review r = slideList.get(j);%>
								<%if(j<3){ %>
								<td id="rTitle" class="title"><%= r.getTitle() %></td>
							<% } } %>
							</tr>
						</table>
				</div><!-- 리스트끝 -->
				<img class="btns" id="next" src="/COSMEDIC/resources/images/next.png">
			</div>
				
		</div>
				<div id="div-ranklist"><!-- 리스트 -->
		<div id="ranking-title"><h3 style="color:white">지금 뜨는 리뷰</h3></div>

			<ol class="rank-list1" id="rank1">
				<li><img src="/COSMEDIC/resources/images/fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목1</li>
			</ol>
			<ol class="rank-list1" id="rank2">
				<li><img src="/COSMEDIC/resources/images/fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목2입니다. 리뷰제목2입니다.<br>
				제목이 길어지면 내려갑니다. 안녕하세요??</li>
			</ol>
			<ol class="rank-list1" id="rank3">
				<li><img src="/COSMEDIC/resources/images/fabric.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목3입니다. 리뷰제목3입니다.<br>
				제목이 넘 길어서 한줄 내려갑니다. </li>
			</ol>
 			<ol class="rank-list2" id="rank4">
				<li><img src="/COSMEDIC/resources/images/cosy.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목4444. 리뷰제목4444.<br>
				제목이 길어지면 내려갑니다. 안녕하세요??</li>

			</ol>
			<ol class="rank-list2" id="rank5">
				<li><img src="/COSMEDIC/resources/images/cosy.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목5555. 리뷰제목5555.<br>
				제목이 길어지면 내려갑니다. 안녕하세요??</li>
			</ol>
			<ol class="rank-list2" id="rank6">
				<li><img src="/COSMEDIC/resources/images/cosy.jpg" class="review-shots"></li>
				<br>
				<li>리뷰제목6666. 리뷰제목6666.<br>
				제목이 넘 길어서 한줄 내려갑니다. </li>
			</ol> 		
	</div><!-- 리스트끝 -->
<script type="text/javascript">

$(function(){
	$('.rank-list2').hide();
	/* $('#slide2').hide(); */


 	var currentSlide = 1;
	$('#next').click(function(){
		if(currentSlide == 1){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 2;		
		}else if(currentSlide ==2){
			$('.rank-list2').hide();
			$('.rank-list1').fadeIn(300);
 			currentSlide = 3;
		}else if(currentSlide == 3){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 1; 
		}});
	
 	var currentSlide = 1;
	$('#prev').click(function(){
		if(currentSlide == 1){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 2;		
		}else if(currentSlide ==2){
			$('.rank-list2').hide();
			$('.rank-list1').fadeIn(300);
 			currentSlide = 3;
		}else if(currentSlide == 3){
			$('.rank-list1').hide();
			$('.rank-list2').fadeIn(300);
			currentSlide = 1; 
		}});
	});
</script>	
	</div><!-- 베리슬라이드 끝 -->	
	
<hr>
	<div><!-- 리뷰 리스트 -->
		<div><h3>리뷰</h3></div>
		<div id="select-option">
		<select name="filter">
			<option value="latest">최신순</option>
			<option value="oldest">오래된 순</option>
			<option value="loved">좋아요 많은 순</option>
			<option value="unloved">좋아요 적은 순</option>
		</select>
		</div>
	<hr>
		<div class="reviews" id="review1">	
			<table class="tb-profile" width="100%">
			<% for(int i = 0; i< list.size(); i++){ %>
				<tr>
					<td rowspan="2" width="10%" align="center"><img src="<%= request.getContextPath() %>/resources/images/프사.png" class="icon-p"></td>
					<td colspan="2" width="60%" class="review-title" height="40px"><!-- 리뷰제목 --><%=list.get(i).getTitle() %></td>
					<td rowspan="2" width="15%" align="center"><img src="<%= request.getContextPath() %>/resources/images/makeup.png" class="icon-product"></td>
					<td rowspan="3" width="15%" align="center"><span class="comment-like"><a href="#"><img src="<%= request.getContextPath() %>/resources/images/따봉.png" class="thumb"> &nbsp;&nbsp;좋아요</a></span>
					<span class="like-count"><%=list.get(i).getThumbs_up() %></span><br><span class="comment-hate"><a href="#"><img src="<%= request.getContextPath() %>/resources/images/역따봉.png" class="thumb"> &nbsp;&nbsp;별로에요</a></span><span class="hate-count"><%=list.get(i).getThumbs_up() %></span></td>
				</tr>
				<tr>
					<td colspan="2"><span class="content"><!-- 리뷰내용간략 --><%=list.get(i).getContent() %></span><span class="hiddenSpan"><!-- 리뷰내용간략 --><%=list.get(i).getContent() %></span></td>
					
				</tr>
				<tr>
					<td><p class="p-nick" align="center"><!-- 닉네임 --><%=list.get(i).getUserName() %></p></td>
					<td colspan="2">연령대 / 피부타입 / 성별 &nbsp;&nbsp;<span class="star-prototype" id="review-star"><%=list.get(i).getHeart() %></span><span id="write-date"><%=list.get(i).getDate() %></span></td>
					<td><p class="pro-name" align="center">제품명1</p></td>
				</tr>
				<% } %>
			</table> 
		</div>
	<hr>	
			</div>
		
		<!-- 페이징  -->
		<div class="pagingArea" align="center">
		<% if(!list.isEmpty()){ %>
			<!-- 맨 처음으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					$('#beforeBtn').attr('disabled', 'true');
				}
			</script>
			<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=1'">1</button>
			<!-- 10개 페이지 목록 -->
			<% for(int p = startPage; p<= endPage; p++){%>
				<% if(p==currentPage){ %>
					<button id="choosen" disabled><%= p %></button>
				<% } else { %>
					<button id="numBtn" onclick="location.href='<%= request.getContextPath()%>/list.re?currentPage=<%= p %>'"><%= p %></button> 
				<% } %>				
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= currentPage+1 %>'">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').attr('disabled', 'true');
				}
			</script>
			<!-- 맨 뒤로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= maxPage %>'">&gt;&gt;</button>
		<% } %>
		</div>
		<div align="right">
			<button onclick="loginChk();">리뷰작성</button>
		</div>
		
	<script type="text/javascript">

		$(function(){
			$('.rank-list2').hide();
			/* $('#slide2').hide(); */
		
		
		 	var currentSlide = 1;
			$('#next').click(function(){
				if(currentSlide == 1){
					$('.rank-list1').hide();
					$('.rank-list2').fadeIn(300);
					currentSlide = 2;		
				}else if(currentSlide ==2){
					$('.rank-list2').hide();
					$('.rank-list1').fadeIn(300);
		 			currentSlide = 3;
				}else if(currentSlide == 3){
					$('.rank-list1').hide();
					$('.rank-list2').fadeIn(300);
					currentSlide = 1; 
				}});
			
		 	var currentSlide = 1;
			$('#prev').click(function(){
				if(currentSlide == 1){
					$('.rank-list1').hide();
					$('.rank-list2').fadeIn(300);
					currentSlide = 2;		
				}else if(currentSlide ==2){
					$('.rank-list2').hide();
					$('.rank-list1').fadeIn(300);
		 			currentSlide = 3;
				}else if(currentSlide == 3){
					$('.rank-list1').hide();
					$('.rank-list2').fadeIn(300);
					currentSlide = 1; 
				}});
			});
		</script>	
		<script>
			function loginChk(){
				if('<%= loginUser %>' != 'null'){
					location.href='<%= request.getContextPath() %>/views/review/reviewWrite.jsp';
				} else{
					alert('로그인 후 이용해주세요.');
					location.href='<%= request.getContextPath() %>/views/common/login.jsp';
				}
			}
		</script>
		
	</div>		
			
			
	<!-- 작성 끝  -->
	

	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>