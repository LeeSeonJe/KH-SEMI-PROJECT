 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" 
import="java.util.ArrayList" import="review.model.vo.*"%>

<%
   ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
   PageInfo pi = (PageInfo)request.getAttribute("pi");
   System.out.println("reviewMain pi : " + pi);
   ArrayList<Review> slideList = (ArrayList<Review>)request.getAttribute("slideList");
   String value = (String)request.getAttribute("selectId");
   
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
} 
	.medal{width: 70px; height: 70px;}
	#rTitle{width: 450px; padding: 20px;}
	.img>img{width: 160px; height: 160px; border-radius: 70%;}
	
/* 슬라이드 끝 */
	.select_wrap{margin-bottom: 50px;}
	#select_option{float:right;}	
	
	.tb-profile{margin-bottom: 15px; position:relative;}
	
 	.icon-p{width: 60px; height: 60px; border-radius: 70%;} 
 	.p-content{margin-bottom: 10px; margin-top: 10px;}
	.icon-product{width: 80px; height: 70px; margin-top: 10px;}
	.thumb{width: 25px; height: 25px;}
	
	.review-title{white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	
	.star-prototype > * {font-size: 30px; display: inline-block;}
 	.comment-like, .comment-hate{background-color : white; font-size:1em; padding: 2px; border-radius:5px;} 
 	.like-counting{display:inline-block; margin-bottom:10px;}
 	.p-nick{vertical-align:top;}
 	
 	.pagingArea{display:inline-block; position:absolute; right: 800px;}
 	.write_btn{display:inline-block; position:absolute; align:right; right: 305px;}
 	
	
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
		<div id="slide"><!-- 탑리뷰어  -->
	   	   <button class="btn-direction"><img id="prev" src="<%= request.getContextPath() %>/resources/images/prev.png"></button>
	   			<h3>♥top reviewers♥</h3>
					<table id="tableDiv">
						<tr>
							<td><img class="medal" src="<%= request.getContextPath() %>/resources/images/금메달.png"></td>
							<td><img class="medal" src="<%= request.getContextPath() %>/resources/images/은메달.png"></td>
							<td><img class="medal" src="<%= request.getContextPath() %>/resources/images/동메달.png"></td>
						</tr>
						<tr>
						<% if(slideList != null){ %>
						<% for(int i = 0; i<slideList.size(); i++){ 
							Review r = slideList.get(i); 
						%>
							<% if(i < 3){ %>
							<td class="img">
 							<img src="<%= request.getContextPath() %>/member_images/<%=slideList.get(i).getProfile_image() %>" id="tops">
							</td>
							<% } } } %>
						</tr>
						<tr>
						<% for(int j = 0; j<slideList.size(); j++){
							Review r = slideList.get(j); 
							//System.out.println("reviewMain r : " + r);
							%>
							<% if(j<3){ %>
							<td id="rTitle" class="title"><%= r.getUserName() %><br>
							<img src="<%= request.getContextPath() %>/resources/images/따봉.png" style="height: 20px; width: 20px;">
								<div style="display: inline-block;  vertical-align: middle;">
								<h4 style="color: indianred;"><%= r.getThumbs_up() %></h4>
								</div>
							</td>
						<% } } %>
						</tr>
					</table>
		 	<button class="btn-direction"><img id="next" src="<%= request.getContextPath() %>/resources/images/next.png"></button>
				</div><!-- 리스트끝 -->
	<!-- 슬라이드 끝 -->	

	<div><!-- 리뷰 리스트 -->
		<div class="select_wrap">
		<h3>리뷰</h3>
			<select name="filter" id="select_option"> 
				<option value="latest" selected>최신순</option>
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

					<td rowspan="3" align="center" width="10%" style="border-bottom:1px solid #aaa;"><img src="<%=list.get(i).getProfile_image() %>" class="icon-p"></td>
					<td class="noHidden" style="display:none;"><input type="hidden" name="rno" value="<%= list.get(i).getReview_no() %>"></td>
					<td class="write-date" width="15%"><%=list.get(i).getDate() %></td>
					<td class="review-title" height="40px"><!-- 리뷰제목 --><%=list.get(i).getTitle() %></td>
					<td rowspan="2" align="center" width="15%"><img src="<%=list.get(i).getCosmetic_img() %>" class="icon-product"></td>
					<td rowspan="3" align="center" width="12%" style="border-bottom:1px solid #aaa;">
	                    <button type="button" class="comment-like" value="좋아요">좋아요</button><br>
	                    <span class="like_counting"><%=list.get(i).getThumbs_up() %></span><br>
	                    <button type="button" class="comment-hate" value="싫어요">싫어요</button><br>
	                    <span class="hate_counting"><%=list.get(i).getThumbs_down() %></span>
					</td>
				</tr>
				<tr>
					<td class="p-nick"><!-- 닉네임 --><%=list.get(i).getUserName() %></td>
					<td><span class="content"><%=list.get(i).getContent() %></span></td>					
				</tr>
				<tr style="border-bottom: 1px solid #aaa;">
					<td style="vertical-align:middle; padding-bottom:10px;"><%=list.get(i).getAge() %> / <%=list.get(i).getSkintype() %> / <%=list.get(i).getGender() %> &nbsp;&nbsp;</td>
					<td width="48%" class="star-prototype" id="review-star" style="color:red; padding-bottom:10px;">
					<% if(list.get(i).getHeart() == 5 ) { %> 
						♥♥♥♥♥
					<% } else if(list.get(i).getHeart() == 4 ) { %>
						♥♥♥♥
					<% } else if(list.get(i).getHeart() == 3 ) { %>
						♥♥♥
					<% } else if(list.get(i).getHeart() == 2 ) { %>
						♥♥
					<% } else if(list.get(i).getHeart() == 1 ) { %>
						♥
					<% } %>
						
					</td>
					<td style="text-align:center; padding-bottom:10px;"><%=list.get(i).getCosmetic_name() %></td>
				</tr>
				<% } %>
			</table> 
		</div>
		</div>
		
		<!-- 페이징  -->
		<div class="pagingArea" align="center">
		<% if(!list.isEmpty()){ %>
			<!-- 맨 처음으로 -->
			<button class="btn-standard" onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=1'">&lt;&lt;</button>
			
			<!-- 이전 페이지로 -->
			<button class="btn-standard" onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= currentPage-1 %>'" id="beforeBtn">&lt;</button>
			<script>
				if(<%= currentPage %> <= 1){
					$('#beforeBtn').attr('disabled', 'true');
				}
			</script>

			<!-- 10개 페이지 목록 -->
			<% for(int p = startPage; p<= endPage; p++){%>
				<% if(p == currentPage){ %>
					<button class="btn-standard" id="choosen" disabled><%= p %></button>
				<% } else { %>
					<button class="btn-standard" id="numBtn" onclick="location.href='<%= request.getContextPath()%>/list.re?currentPage=<%= p %>'"><%= p %></button> 
				<% } %>				
			<% } %>
			
			<!-- 다음 페이지로 -->
			<button class="btn-standard" id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= currentPage+1 %>'">&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').attr('disabled', 'true');
				}
			</script>
			<!-- 맨 뒤로 -->
			<button class="btn-standard" onclick="location.href='<%= request.getContextPath() %>/list.re?currentPage=<%= maxPage %>'">&gt;&gt;</button>
		<% } %>
		</div>
		
		<div class="write_btn">
			<button class="btn-standard" id="wbtn" onclick="loginChk();">리뷰작성</button>
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
			
			$(document).on('click', '.comment-like' ,function(){
				if('<%= loginUser %>' != 'null'){
					var noHidden = $(this).parent().prev().prev().prev().prev()
					var rno = noHidden[0].children.rno.value;
					console.log("rno : " + rno);
					var vote = $(this).attr('value');
					console.log("vote : " + vote);
					
					var itsme = $(this).next().next();
					
					var count = $(this).next().next().text();
	 				console.log("count : " + count);
					count *= 1;
					count = count + 1;
					$.ajax({
						url:'vote.re',
						data: {rno:rno,vote:vote},
						success: function(data){
							itsme.text(count);			
							$(itsme.prev().prev()).attr('disabled', true);
							$(itsme.prev().prev()).css('background', 'tomato');
							$(itsme.prev().prev()).css('color', 'white');
							$(itsme.next().next()).attr('disabled', true);
						}
					});
				} else {
					alert("로그인이 필요합니다.");
				}
			});
			
			$('.comment-hate').on('click',function(){
				if('<%= loginUser %>' != 'null'){
					var noHidden = $(this).parent().prev().prev().prev().prev()
					var rno = noHidden[0].children.rno.value;
					var vote = $(this).attr('value');
					
					var itsme = $(this).next().next();
					
					var count = $(this).next().next().text();
	 				console.log("count : " + count);
					count *= 1;
					count = count + 1;
				
					$.ajax({
						url:'vote.re',
						data: {rno:rno,vote:vote},
						success: function(data){
							itsme.text(count);	
							$(itsme.prev().prev()).attr('disabled', true);
							$(itsme.prev().prev()).css('background', 'tomato');
							$(itsme.prev().prev()).css('color', 'white');
							$(itsme.parent().children()).attr('disabled', true);
						}
					});
				} else {
					alert("로그인이 필요합니다.");
				}
			});
				
			
			// 리뷰
// 			$(function(){
// 				$('.hiddenSpan').css('display','none');
// 				$('.content').click(function(){
// 					$(this).css('display','none');
// 			        $(this).next().css('display', 'block');
// 				});
// 				$('.hiddenSpan').click(function(){
// 					$(this).css('display','none');
// 					$(this).prev().css('display', 'block');
// 				});	
// 			});
			
			
			// select-box
			$('#select_option').on('change',function(){
				var orderSelect = document.getElementById('select_option');
				var selectId = orderSelect.options[orderSelect.selectedIndex].value;
				console.log('selectId: ' + selectId);
				$.ajax({
					url: "<%=request.getContextPath()%>/select.re",
	 				data:{selectId:selectId},
	 				success:function(data){
	 					if(data != null){
		 					$('.tb-profile').html("");
		 					//console.log(data)
		 					for(var i in data){
		 						console.log(data);
			 					var $tr1 = $('<tr></tr>');
			 					var $tr2 = $('<tr></tr>');
			 					var $tr3 = $('<tr style="border-bottom: 1px solid #aaa;"></tr>');
			 					var $td1 = $('<td></td>'); 
			 					var $td2 = $('<td class="p-nick"></td>').text(data[i].userName); 
			 					var $td3 = $('<td style="vertical-align:middle; padding-bottom:10px;"></td>').text((data[i].age + ' / ' + data[i].skintype + ' / ' + data[i].gender)); 
			 					var $td4 = $('<td></td>'); 
			 					var $pImg = $('<img class="icon-p">');
			 					$pImg.attr('src',"");
			 					var $span = $('<span></span>');
			 					var $br1 = $('<br>');
			 					var $br2 = $('<br>');
			 					var $br3 = $('<br>');
			 					var $proTd = $('<td rowspan="3" align="center" width="10%" style="border-bottom:1px solid #aaa;"></td>');
			 					var $reviewNo = $('<td class="noHidden" style="display:none;"></td>');
			 					var $hiddenInput = $('<input type="hidden" name="rno">').val(data[i].review_no);
			 					var $date = $('<td width="15%" id="write-date"></td>').text(data[i].date);
			 					var $heart = $('<td width="48%" class="star-prototype" style="color:red; padding-bottom:10px;"></td>')
			 					if(parseInt(data[i].heart) == 5) {
			 						$heart.text('♥♥♥♥♥');
			 					} else if(parseInt(data[i].heart) == 4) {
			 						$heart.text('♥♥♥♥');
			 					} else if(parseInt(data[i].heart) == 3) {
			 						$heart.text('♥♥♥');
			 					} else if(parseInt(data[i].heart) == 2) {
			 						$heart.text('♥♥');
			 					} else if(parseInt(data[i].heart) == 2) {
			 						$heart.text('♥');
			 					}
			 					var $cosTd = $('<td rowspan="2" align="center" width="15%"></td>');
			 					var $cImg = $('<img class="icon-product">');
			 					if((data[i].cosmetic_img).indexOf("http") == -1) {
			 						$cImg.attr('src','<%= request.getContextPath() %>/cosReq_uploadFiles/' + data[i].cosmetic_img);
			 					} else {
			 						$cImg.attr('src',data[i].cosmetic_img);
			 					}
			 					var $voteTd = $('<td rowspan="3" align="center" width="12%" style="border-bottom:1px solid #aaa;"></td>');
								var $likeb = $('<button  type="button" class="comment-like" value="좋아요"></button>').text('좋아요');
								var $likeSpan = $('<span class="like_counting"></span>').text(data[i].thumbs_up);
								var $hateb = $('<button type="button" class="comment-hate" value="싫어요"></button>').text('싫어요');
								var $hateSpan = $('<span class="hate_counting""></span>').text(data[i].thumbs_down);
			 					var $title = $('<td class="review-title" height="40px"></td>').text(data[i].title);
			 					var $contentSpan = $('<span class="content"></span>').text(data[i].content);
			 					var $cosName = $('<td style="text-align:center; padding-bottom:10px;"></td>').text(data[i].cosmetic_name);
			 					
			 					$proTd.append($pImg);
			 					$reviewNo.append($hiddenInput);
			 					$cosTd.append($cImg);
			 					$voteTd.append($likeb);
			 					$voteTd.append($br1);
			 					$voteTd.append($likeSpan);
			 					$voteTd.append($br2);
			 					$voteTd.append($hateb);
			 					$voteTd.append($br3);
			 					$voteTd.append($hateSpan);
			 					
			 					$tr1.append($proTd,$reviewNo,$date,$title,$cosTd,$voteTd);
			 					
			 					$td4.append($contentSpan);
			 					//$td4.append($hiddenContent);
			 					
			 					$tr2.append($td2,$td4);
			 					
			 					
			 					$tr3.append($td3,$heart,$cosName);
			 					
			 					$('.tb-profile').append($tr1,$tr2,$tr3);
			 				
		 					}
		 					
		 					$(document).on('click', '.comment-like' ,function(){
		 						if('<%= loginUser %>' != 'null'){
		 							var noHidden = $(this).parent().prev().prev().prev().prev()
		 							var rno = noHidden[0].children.rno.value;
		 							console.log("rno : " + rno);
		 							var vote = $(this).attr('value');
		 							console.log("vote : " + vote);
		 							
		 							var itsme = $(this).next().next();
		 							
		 							var count = $(this).next().next().text();
		 			 				console.log("count : " + count);
		 							count *= 1;
		 							count = count + 1;
		 							$.ajax({
		 								url:'vote.re',
		 								data: {rno:rno,vote:vote},
		 								success: function(data){
		 									itsme.text(count);			
		 									$(itsme.prev().prev()).attr('disabled', true);
		 									$(itsme.prev().prev()).css('background', 'tomato');
		 									$(itsme.prev().prev()).css('color', 'white');
		 									$(itsme.next().next()).attr('disabled', true);
		 								}
		 							});
		 						} else {
		 							alert("로그인이 필요합니다.");
		 						}
		 					});
		 					
		 					$('.comment-hate').on('click',function(){
		 						if('<%= loginUser %>' != 'null'){
		 							var noHidden = $(this).parent().prev().prev().prev().prev()
		 							var rno = noHidden[0].children.rno.value;
		 							var vote = $(this).attr('value');
		 							
		 							var itsme = $(this).next().next();
		 							
		 							var count = $(this).next().next().text();
		 			 				console.log("count : " + count);
		 							count *= 1;
		 							count = count + 1;
		 						
		 							$.ajax({
		 								url:'vote.re',
		 								data: {rno:rno,vote:vote},
		 								success: function(data){
		 									itsme.text(count);	
		 									$(itsme.prev().prev()).attr('disabled', true);
		 									$(itsme.prev().prev()).css('background', 'tomato');
		 									$(itsme.prev().prev()).css('color', 'white');
		 									$(itsme.parent().children()).attr('disabled', true);
		 								}
		 							});
		 						} else {
		 							alert("로그인이 필요합니다.");
		 						}
	 						});
	 					}
					}
				});		
			});
		</script>
		
			
			
			
	<!-- 작성 끝  -->
	</div>

	<%@ include file="/views/layout/footer.jsp"%>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>