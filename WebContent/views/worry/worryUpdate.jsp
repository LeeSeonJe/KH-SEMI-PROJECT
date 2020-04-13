<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="worry.model.vo.* , java.util.ArrayList" %>
<%
	
%>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="/views/layout/import.jsp"%>
<style>
/*공통*/
	a:link{color: black;text-decoration: none;}
	a:visited{color: black; text-decoration: none;}
	a:hover{color: green; text-decoration: none;}

/* 상세 게시글 */
	.worry-read-wrap{padding: 0 5px;}
    .worry-head{border-bottom: 2px solid #666;
                padding: 0 10px;
                height: 80px;}
    .worry-head>h3{margin-bottom: 10px}
    .worry-head>span{font-size:1.1em;}
    .worry-head>time{margin-left:10px;
    				 font-size:1em;}
	.count-reading{float:right;
				   font-size:1.2em;}
                
	.content-body{min-height: 300px;
	            border-bottom: 2px solid #666;
	            overflow:scroll;
	            position: relative;
	            padding:10px;}
	.content-body>p{display: inline-block; 
					width:800px;
					margin:2px;
					font-size:1.1em;}
	.vote-btn{width:70px;
	          position: absolute; 
	          top:80px;
	          right: 30px;
	          margin:10px;
	          text-align: center;}
	#like-btn, #hate-btn{margin:5px;}
	
	
	.edit-btn{position: absolute;
	          bottom:0px;
	          left:40%;
	          margin: 10px;}
	#change-btn,#delete-btn{margin-right:3px;}
	#change-btn{display: inline-block; float: left; margin-left:1220px;}
	#delete-btn{width: 40px;}
	#write-btn, #upload-btn{color:white;
			   				background: black;}
	          
	.worry-btn-wrap{text-align:right;}
	#prev-worry, #next-worry {margin: 3px;}
	
	.comment-write{border-bottom: 2px solid #666;
				   padding: 10px;
				   position: relative;}
	#comment-area{margin: 5px; display:inline-block; resize: none;}  
	#upload-btn{position:absolute;
				top:80px;
				width:50px;
				height:40px;}
	
	.comment-list-wrap{font-size: 1.1em;}
	.comment-list-wrap>li{border-bottom: 1px dotted #666;
	                      padding: 3px; vertical-align:middle;}
	.comment-list-wrap>li:last-of-type{border-bottom: 2px solid #666;}
	
	.comment-writer{display:inline-block;
					width: 200px; 
					text-align:center; 
					vertical-align:top;
					font-size: 1.1em;}
	.comment-text{display:inline-block;
				  width: 850px;}
	.comment-time{display:inline-block;
				  width:200px;
				  text-align:center;
				  vertical-align:top}
	
	#content{border: none; width: 90%; height: 300px; resize:none;}

</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>	
		<hr>
            <h2>고민 게시판</h2>
			<hr>
			<form action="<%=request.getContextPath() %>/worryUpdate.bo">
			<div class="worry-read-wrap">
                <article class="worry-head">
                	<input type="hidden" name="worryNo" value="<%= request.getParameter("worryNo") %>">
                    <h3><input type="text" name="title" value="<%= request.getParameter("title") %>"></h3>
                    <span><%= request.getParameter("userName") %></span>
                    <time datetime="2020-03-28T19:43:20"><%= request.getParameter("date") %></time>
                    <div class="count-reading">
                        <span class="count-title">조회수 : <%= request.getParameter("hit") %></span>
                    </div>
                </article>
                <article class="content-body">
<%--                 	<input id="content" type="text" value='<%= request.getParameter("content") %>'> --%>
                   <textarea id="content" name="content"><%= request.getParameter("content") %></textarea>
                    <div class="vote-btn">
                        <button id="like-btn" class="btn-standard" value="좋아요">좋아요</button>
                        <span id="like-count" class="counting"><%= request.getParameter("like") %></span>
                        <button id="hate-btn" class="btn-standard" value="싫어요">싫어요</button>
                        <span id="hate-count" class="counting">0</span>
                    </div>

                </article>
                  	<button type="submit" id="change-btn" class="btn-standard" >수정</button>
                   
					<div  id="delete-btn" class="btn-standard" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</div> 
				
 				
 				
 				
 				<div id="replySelectArea">
					<table id="replySelectTable">
						<tr class="comment-list-wrap">
<!-- 							<span class="comment-writer">리뷰 작성자</span><span class="comment-text">리뷰 내용</span><span class="comment-time"><time>작성 시간</time></span> -->
						</tr>

		
					</table>
				</div>
                
              
	</div>
	</form>
				
	</div>








	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
	<script>
		var likeCount = Number($("#like-count").text());	
		var hateCount = Number($("#hate-count").text());
		var count = 0;
		$(function(){
			$('#like-btn').on('click', function(){
				if(count == 1){
					count--;
				} else if(count == 0){
				count++;
				}
				$("#like-count").text(likeCount + count);
				
			});
			$('#hate-btn').on('click', function(){
				if(count == 1){
					count--;
				} else if(count == 0){
				count++;
				}
				$("#hate-count").text(hateCount + count);
				
			});
		});
		
	
		
		
		
		
	</script>
</body>
</html>