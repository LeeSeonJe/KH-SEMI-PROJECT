<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.ArrayList" import="review.model.vo.*"%>
<%
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
   
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   
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
	


/* 슬라이드 끝 */
	#select-option{text-align: right;}
	
	.tb-profile{display: inline-block; padding: 15px; margin-left: 80px;}
	.icon-p{width: 50px; height: 50px; margin-top: 10px;}
	.p-nick{margin-top: 10px;}
	
	.tb-content{display: inline-block; margin-left: 50px; margin-bottom: 20px;}
	.p-content{margin-bottom: 10px; margin-top: 10px;}
	.icon-h{width: 25px; height: 25px;}
	
	.tb-product{display: inline-block; margin-left: 80px;}
	.icon-product{width: 80px; height: 70px; margin-top: 10px;}
	.pro-name{margin-top: 10px; text-align: center;}
	
	.timing{display: inline-block; margin-left: 100px; margin-bottom: 20px;}
	.thumb{width: 25px; height: 25px;}
	.th-comment{margin-left: 50px;}
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
			<!-- 작성 -->
	<div><!-- 베스트리뷰 슬라이드 -->
	
	
	
	
	
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
			<table class="tb-profile">
			<% for(int i = 0; i< list.size(); i++){ %>
				<tr>
					<td rowspan="2"><img src="<%= request.getContextPath() %>/resources/images/프사.png" class="icon-p"></td>
					<td><p class="p-nick"><!-- 닉네임 --><%=list.get(i).getUserName() %></p></td>
				</tr>
				<tr>	
					<td><!-- 리뷰제목 --><%=list.get(i).getTitle() %></td>
					<td><p class="p-content"><!-- 리뷰내용간략 --><%=list.get(i).getContent() %></p></td>
					<td>연령대 / 피부타입 / 성별 &nbsp;&nbsp; 
					<span class="star-prototype" id="review-star"><%=list.get(i).getHeart() %></span></td>
				</tr>
				<tr>	
					<td rowspan="2"><img src="<%= request.getContextPath() %>/resources/images/makeup.png" class="icon-product"></td>
					<td><p class="pro-name">제품명1</p></td>
				</tr>
				<tr>
					<td rowspan="3"><p><%=list.get(i).getDate() %></p></td>		
				</tr>
				<tr>				
					<td><span class="th-comment"><img src="<%= request.getContextPath() %>/resources/images/따봉.png" class="thumb"> &nbsp;&nbsp;좋아요</span><span class="count"><%=list.get(i).getThumbs_up() %></span></td>
					<td><span class="th-comment"><img src="<%= request.getContextPath() %>/resources/images/역따봉.png" class="thumb"> &nbsp;&nbsp;별로에요</span></td>
				</tr>
				<% } %>
			</table>
		</div>
	<hr>	
		</div>
		
		<div align="right">
			<button onclick="location.href='<%=request.getContextPath() %>/views/review/reviewWrite.jsp'">리뷰작성</button>
		</div>
	</div>		
			
			
	<!— 작성 끝 —>
	

	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>