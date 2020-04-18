<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList" import="review.model.vo.*"%>

<%
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   System.out.println("reviewMain pi : " + pi);
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
#slide{width: 100%;
   min-height: 300px; 
   text-align: center;}
#tableDiv{
   width: 80%; margin-top:50px;
   display: inline-block;
   text-align: center;
   vertical-align: middle;
}
/* .btns{width: 50px; height: 50px; margin-top: 165px;}
 */
#next {
   width: 50px;
    height: 50px;
   display: none; 
}

#prev {
   width: 50px;
   height: 50px;
   display: none;
}

.btn-direction {
   border: none;
   background: none;
/*    display: inline-block; */
} 


/* 	#div-ranklist{text-align:center; display: inline-block; width: 100%; padding: 20px;}
	#div-ranklist{display: inline-block; width: 80%;}
	#ranking-title{padding: 20px; text-align: left; display: inline-block}
	h3{margin-left: 30px;}
	.rank-list1>td{display: inline-block; text-align: center; margin-top: 40px;}	
	.rank-list2>td{display: inline-block; text-align: center; margin-top: 40px;}
	
	#slideTable{width: 100px; height: 50px; display: inline-block;}
	
 */	
	#rTitle{width: 450px; padding: 20px;}
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

/* 페이징 */



/* 페이징 끝 */


</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
			<!-- 작성 -->
		<div id="slide"><!-- 베스트리뷰 슬라이드 -->
	   	   <button class="btn-direction"><img id="prev" src="<%= request.getContextPath() %>/resources/images/prev.png"></button>
	   
					<table id="tableDiv">
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
		 	<button class="btn-direction"><img id="next" src="<%= request.getContextPath() %>/resources/images/next.png"></button>
				</div><!-- 리스트끝 -->
	<!-- 슬라이드 끝 -->	

	<div><!-- 리뷰 리스트 -->
		<h3>리뷰</h3>
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
			<table class="tb-profile" style="width: 100%;">
			<% for(int i = 0; i< list.size(); i++){ %>
				<tr>
					<td rowspan="2" width="10%" align="center"><img src="<%= request.getContextPath() %>/member_images/<%=list.get(i).getProfile_image() %>" class="icon-p"></td>
					<td colspan="2" width="60%" class="review-title" height="40px"><!-- 리뷰제목 --><%=list.get(i).getTitle() %></td>
					<td rowspan="2" width="15%" align="center"><img src="<%=list.get(i).getCosmetic_img() %>" class="icon-product"></td>
					<td rowspan="3" width="15%" align="center"><span class="comment-like"><a href="#"><img src="<%= request.getContextPath() %>/resources/images/따봉.png" class="thumb"> &nbsp;&nbsp;좋아요</a></span>
					<span class="like-count"><%=list.get(i).getThumbs_up() %></span><br><span class="comment-hate"><a href="#"><img src="<%= request.getContextPath() %>/resources/images/역따봉.png" class="thumb"> &nbsp;&nbsp;별로에요</a></span><span class="hate-count"><%=list.get(i).getThumbs_down() %></span></td>
				</tr>
				<tr>
					<td colspan="2"><span class="content">
					<!-- 리뷰내용간략 --><%=list.get(i).getContent() %></span>
					<span class="hiddenSpan">
						<!-- 리뷰내용간략 --><%=list.get(i).getContent() %>
					</span>
					</td>
					
				</tr>
				<tr>
					<td><p class="p-nick" align="center"><!-- 닉네임 --><%=list.get(i).getUserName() %></p></td>
					<td colspan="2"><%=list.get(i).getAge() %> / <%=list.get(i).getSkintype() %> / <%=list.get(i).getGender() %> &nbsp;&nbsp;
						<span class="star-prototype" id="review-star"><%=list.get(i).getHeart() %></span>
						<span id="write-date"><%=list.get(i).getDate() %></span>
					</td>
					<td>
						<p class="pro-name" align="center"><%=list.get(i).getCosmetic_name() %></p>
					</td>
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

			<!-- 10개 페이지 목록 -->
			<% for(int p = startPage; p<= endPage; p++){%>
				<% if(p == currentPage){ %>
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
		

		<script>
			function loginChk(){
				if('<%= loginUser %>' != 'null'){
					location.href='<%= request.getContextPath() %>/views/review/reviewWrite.jsp';
				} else{
					alert('로그인 후 이용해주세요.');
					location.href='<%= request.getContextPath() %>/views/common/login.jsp';
				}
			}
			
			var likeCount = Number($(".like-count").text());	
			var hateCount = Number($(".hate-count").text());
			var count = 0;
			var result = 0;
			$(function(){
				$('.comment-like').on('click', function(){
					if(count == 1){
						count--;
					} else if(count == 0){
					count++;
					}
					$(".like-count").text(likeCount + count);
					
				});
				$('.comment-hate').on('click', function(){
					if(count == 1){
						count--;
					} else if(count == 0){
					count++;
					}
					$(".hate-count").text(hateCount + count);
				});
			});
			$(function(){
				$('.hiddenSpan').css('display','none');
				$('.content').click(function(){
					$(this).css('display','none');
			        $(this).next().css('display', 'block');
				});
				$('.hiddenSpan').click(function(){
					$(this).css('display','none');
					$(this).prev().css('display', 'block');
				});	
			});
		</script>
		
			
			
			
	<!-- 작성 끝  -->
	</div>

	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>