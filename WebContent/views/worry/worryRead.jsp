<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="worry.model.vo.* , java.util.ArrayList" %>
<%
	Worry w = (Worry)request.getAttribute("w");
	ArrayList<Comments> list = (ArrayList<Comments>)request.getAttribute("list");
	Member m = ((Member)request.getSession().getAttribute("loginUser"));
	ArrayList<AddFile> fList = (ArrayList<AddFile>)request.getAttribute("fList");
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
	#mainCase{ margin-left:10px; width:900px;}
	.case{width: 250px; height:250px; display: inline-block; float:left;}


</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>	
		<hr>
            <h2>고민 게시판</h2>
			<hr>
			<Form action="views/worry/worryUpdate.jsp">
			<div class="worry-read-wrap">
                <article class="worry-head">
                    <h3><%= w.getTitle() %></h3>
                    <input type="hidden" name="title" value="<%= w.getTitle() %>">
                    <input type="hidden" name="worryNo" value="<%= w.getWorryNo() %>">
                    <span><%= w.getUserName() %></span>
                    <input type="hidden" name="userName" value="<%= w.getUserName() %>">
                    <time datetime="2020-03-28T19:43:20"><%= w.getDate() %></time>
                    <input type="hidden" name="date" value="<%= w.getDate() %>">
                    <div class="count-reading">
                        <span class="count-title"> 조회수 : <%= w.getHit() %></span>
                        <input type="hidden" name="hit" value="<%= w.getHit() %>">
                    </div>
                </article>
                <article class="content-body">
                    <p class="content-text">
			        	<%= w.getContent() %>           
                    </p>
                    <input type="hidden" name="content" value="<%= w.getContent() %>">
                    <div class="vote-btn">
                        <button id="like-btn" class="btn-standard" value="좋아요">좋아요</button>
                        <span id="like-count" class="counting"><%= w.getWorryThumbUp() %></span>
                        <input type="hidden" name="like" value="<%= w.getWorryThumbUp() %>">
                        <button id="hate-btn" class="btn-standard" value="싫어요">싫어요</button>
                        <span id="hate-count" class="counting">0</span>
                    </div>
                    
                    <% if(fList != null){ %>
                    	<%for(int i = 0 ; i < fList.size(); i++){ %>
		                    <div id="mainCase">
			                    <div id="img-case1" class="case"><img src="<%= request.getContextPath()%>/AddFile/<%= fList.get(i).getChangeName() %>" width="250px" height="250px"></div>
		              		</div>
              			<%} %>
                   	<%} %>
                </article>
                 
                
                
                  	<div class="worry-btn-wrap">
	                  	
		                    <div class="edit-btn">
		                        <button type="submit" id="change-btn" class="btn-standard" >수정</button>
		                        <button id="delete-btn" class="btn-standard" onclick="location.href='worryDelete.bo'">삭제</button>
		<!--                         <button id="write-btn" class="btn-standard" value="글쓰기" onclick="location.href='worryWrite.jsp'">글쓰기</button> -->
	                   		</div>
	                    <% if(w.getUserNo() == m.getUser_no() ){ %>
                        <button class="btn-standard" type="submit" id="change-btn" onclick="location.href='worryList.bo'">수정</button>
                        <button id="delete-btn" class="btn-standard" onclick="location.href='worryDelete.bo'">삭제</button>
                        <% } %>
                        <button class="btn-standard" type="button" value="목록" onclick="location.href='worryList.bo'">목록</button>
                        <button id="prev-worry" class="btn-standard" type="button" value="이전글" onclick="location.href='<%=request.getContextPath()%>/worryDetail.bo?worryNo=<%= w.getWorryNo() - 1%>'">이전글</button>
                        <button id="next-worry" class="btn-standard" type="button" value="다음글" onclick="location.href='<%=request.getContextPath()%>/worryDetail.bo?worryNo=<%= w.getWorryNo() + 1%>'">다음글</button>
                    </div>
                
                
                
                </Form>    
                
                
                
                <form>
                <div class="comment-write">
                    
                        <textarea id="comment-area" cols="120" rows="5" placeholder="댓글을 남겨주세요."></textarea>
                        <button id="upload-btn" class="btn-standard" value="등록">등록</button>
                        <input type="hidden" name='worryNo' value='<%=w.getWorryNo() %>'>
                    
                </div>
				</form>
 				
 				
 				
 		
                
                <div id="replySelectArea">
			<table id="replySelectTable">
				<% if(list.isEmpty()){ %>
					<tr><td colspan=3>댓글이 없습니다.</td></tr>
				<%} else{ %>
					<% for (int i = 0 ; i < list.size(); i++){ %>
					<tr>
						<td width="200px"><%= list.get(i).getUserName() %></td>
						<td width="800px"><%= list.get(i).getCommentsText() %></td>
						<td width="200px"><%= list.get(i).getCommentsDate() %></td>
					</tr>
					<% } %>
				<% } %>	

			</table>
		</div>
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
		
		
		$('#upload-btn').click(function(){
			var userNo = <%= loginUser.getUser_no() %>;
			var worryNo = '<%= w.getWorryNo()%>';
			var content = $('#comment-area').val();
			
			$.ajax({
				url: 'insertComments.bo',
				data: {userNo:userNo, worryNo:worryNo, content:content},
				success: function(data){
					
					$replyTable = $('#replySelectTable');
					$replyTable.html("");
					
					for(var key in data){
						var $tr = $('<tr>');
						var $writerTd = $('<td>').text(data[key].userName).css('width', '200px');
						var $contentTd = $('<td>').text(data[key].commentsText).css('width', '800px');
						var $dataTd = $('<td>').text(data[key].commentsDate).css('width', '200px');
						
						$tr.append($writerTd);
						$tr.append($contentTd);
						$tr.append($dataTd);
						$replyTable.append($tr);
					}
					$('#comment-area').val("");
					
				}
			});
			
		});
		
		
		
		
	</script>
</body>
</html>