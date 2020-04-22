<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="worry.model.vo.* , java.util.ArrayList" %>
<%
	Worry w = (Worry)request.getAttribute("w");
	ArrayList<Comments> list = (ArrayList<Comments>)request.getAttribute("list");
	Member m = ((Member)request.getSession().getAttribute("loginUser"));
	ArrayList<AddFile> fList = (ArrayList<AddFile>)request.getAttribute("fList");
// 	int result = Integer.parseInt((String)request.getAttribute("result"));

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
                height: 120px;}
    .worry-head>h3{margin-bottom: 10px}
    .worry-head>span{font-size:1.1em;}
    .worry-head>time{margin-left:10px;
    				 font-size:1em;}
	.count-reading{float:right;
				   font-size:1.2em;}
                
	.content-body{min-height: 300px;
	            border-bottom: 2px solid #666;
	           
	            position: relative;
	            padding:10px;}
	.content-body>p{display: inline-block; 
					width:800px;
					margin:2px;
					font-size:1.1em;
					maxlength: "2000";}
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
				top:140px; 
				width:50px;
				height:40px;}
	#upload-btn2{position:absolute;
				top:15px; 
				width:100px;
				height:100px;
				color:white;
			   	background: black;}
			
	
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
	.case{width: 250px; height:250px;display: inline-block; }
/* 	.content-text{width: 1151px; height: 580px; resize:none; border: none;} */
	.content-text{width: 1151px; min-height: 280px; white-space:pre-wrap; margin-left:0px;}
	#profile{border-radius:50px;}
	.profile{display: inline-block;}
	#name{margin-left: 22px; height: 60px;}
	#time{margin-left: 22px;}
	.center{text-align:center;}
	#title{font-size:1.3em; width:850px; height: 60px; margin-left: 0px; overflow:hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 2.4em;}
	.replyTr{background: skyblue; width: 100%; margin: 0px; padding: 0px;}
</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>	
		<hr>
            <h2>고민 게시글</h2>
			<hr>
			<Form action="worryDetail2.bo" method="post">
			<div class="worry-read-wrap">
                <article class="worry-head">
                    <div id="title"><%= w.getTitle() %></div>
                    <input type="hidden" name="title" value="<%= w.getTitle() %>">
                    <input type="hidden" name="worryNo" value="<%= w.getWorryNo() %>">
                    <% if(w.getCategory().equals("A")){ %>
                    <div  class="profile"><img id="profile" src="<%= request.getContextPath()%>/member_images/1.jpg" width="50px" height="50px"></div>
                    <%} else{ %>
                    <div  class="profile"><img id="profile" src="<%= request.getContextPath()%>/member_images/<%= w.getProfileImage() %>" width="50px" height="50px"></div>
                    <%} %>
                    <span id="name"><%= w.getUserName() %></span>
                    <input type="hidden" name="userName" value="<%= w.getUserName() %>">
                    <time id="time" datetime="2020-03-28T19:43:20"><%= w.getDate() %></time>
                    <input type="hidden" name="date" value="<%= w.getDate() %>">
                    <div class="count-reading">
                        <span class="count-title"> 조회수 : <%= w.getHit() %></span>
                        <input type="hidden" name="hit" value="<%= w.getHit() %>">
                    </div>
                </article>
                <article class="content-body">
                    <div class="content-text"><%= w.getContent() %></div>
                    <input type="hidden" name="content" value="<%= w.getContent() %>">
                    <div class="vote-btn">
                    	<% if((String)request.getAttribute("result") == "yes"){ %> 
	                    	<button  type="button" id="like-btn" class="btn-standard" value="좋아요" disabled style="background: lightgray">좋아요</button>
	                        <span id="like-count" class="counting"><%= w.getWorryThumbUp() %></span>
	                        <input type="hidden" name="like" value="<%= w.getWorryThumbUp() %>">
                    	<% } else { %>
	                        <button  type="button" id="like-btn" class="btn-standard" value="좋아요">좋아요</button>
	                        <span id="like-count" class="counting"><%= w.getWorryThumbUp() %></span>
	                        <input type="hidden" name="like" value="<%= w.getWorryThumbUp() %>">
                        <% } %>
                        <button type="button"  id="hate-btn" class="btn-standard" value="싫어요">싫어요</button>
                        <input type="hidden" name="hate" value="<%= w.getWorryThumbDown() %>">
                        <span id="hate-count" class="counting"><%= w.getWorryThumbDown() %></span>
                    </div>
                    <br><br>
                    <% if(fList != null){ %>

                    	<%for(int i = 0 ; i < fList.size(); i++){ %>
		                    <div id="mainCase">
			                    <div id="img-case1" class="case"><img src="<%= request.getContextPath()%>/AddFile/<%= fList.get(i).getChangeName() %>" width="250px" height="250px"></div>
			                    <input type="hidden" name='fList' value="<%= fList.get(i).getChangeName() %>">
			                    <br>
			                    <br>
		              		</div>
              			<%} %>
                   	<%} %>
                </article>
                 
                
                
                  	<div class="worry-btn-wrap">
	                  	
		                 
	                   		
	                    <% if(m != null ){ %>
		                    <% if(w.getUserNo() == m.getUser_no() ){ %>
	                        <button class="btn-standard" type="submit" id="change-btn" onclick="location.href='worryDetail2.bo?worryNo=<%=w.getWorryNo() %>'">수정</button>
	                        <button type="button" id="delete-btn" class="btn-standard" onclick="location.href='worryDelete.bo?worryNo=<%=w.getWorryNo() %>'">삭제</button>
	                        <% } %>
	                    <% } %>    
                        <button class="btn-standard" type="button" value="목록" onclick="location.href='worryList.bo'">목록</button>
                        <button id="prev-worry" class="btn-standard" type="button" value="이전글" onclick="before()" >이전글</button>
                        <button id="next-worry" class="btn-standard" type="button" value="다음글" onclick="after()" >다음글</button>
                    </div>
                
                
                
                </Form>    
                
                
                
                <form>
                <div class="comment-write">
                    	<br><br><br>
                        <textarea id="comment-area" cols="170" rows="5" placeholder="댓글을 남겨주세요."></textarea>
                        <%if(m != null) {%>
                        <button id="upload-btn" class="btn-standard" value="등록">등록</button>
                        <%} else{ %>
<!--                         <button type="button" id="upload-btn2" class="btn-standard" value="등록"> 댓글을 달기 위해서는 로그인이 필요합니다.</button> -->
                        <button type="button" id="upload-btn" class="btn-standard" onclick="login()">등록</button>
                        <%} %>
                        <input type="hidden" name='worryNo' value='<%=w.getWorryNo() %>'>
                    
                </div>
				</form>
 				
 				
 				
 		
                
                <div id="replySelectArea">
			<table id="replySelectTable">
				<% if(list.isEmpty()){ %>
					<br><br>
					<tr><td colspan=3 style="text-align:center;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;댓글이 없습니다.</td></tr>
					<br><br>
				<%} else{ %>
					<tr class="replyTr">
						<th class="center" width="280px" height="40px" colspan="2">작성자</th>
						<th class="center" width="820px">내용</th>
						<th class="center" width="220px">작성 날짜</th>
					</tr>
					<% for (int i = 0 ; i < list.size(); i++){ %>
					<tr>
						<% if(list.get(i).getCategory().equals("C")){ %>
							<td width="60px" height="60px"><img id="profile" src="<%= request.getContextPath()%>/member_images/<%= list.get(i).getprofileImage() %>" width="50px" height="50px"></td>
						<%} else if(list.get(i).getCategory().equals("H")){ %>
							<%String[] profile = list.get(i).getprofileImage().split(","); %>
							<td width="60px" height="60px"><img id="profile" src="<%= request.getContextPath()%>/hospital_images/<%= profile[0] %>" width="50px" height="50px"></td>
						<%} else {%>
							<td width="60px" height="60px"><img id="profile" src="<%= request.getContextPath()%>/member_images/1.jpg" width="50px" height="50px"></td>
						<% } %>
						<td width="200px"><%= list.get(i).getUserName() %></td>
						<td width="800px"><%= list.get(i).getCommentsText() %></td>
						<td width="200px" class="center" ><%= list.get(i).getCommentsDate() %></td>
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
		
// 		$(function(){
// 			if(m == null){
// 				$('#like-btn').attr('disabled', true);
// 				$('#hate-btn').attr('disabled', true);
// 			}
// 		});
		
		
		
		
		$('#upload-btn').click(function(){
				var userNo = 21;
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
		
		$('#like-btn').click(function(){
			<% if( m != null){ %>
			var count = $('#like-count').text();
			count *= 1;
			count = count + 1;
			$.ajax({
				url:'like.bo',
				data: {worryNo:<%= w.getWorryNo() %>},
				success: function(data){
					$('#like-btn').attr('disabled', true);
					$('#like-btn').css('background', 'lightgray');
					$('#hate-btn').attr('disabled', true);
					$('#like-count').text(count);
										

				}
				
			});
			<% }else { %>
				alert("로그인이 필요합니다.");
			<% } %>
		});
		
		
		$('#hate-btn').click(function(){
			<% if( m != null){ %>
			var count = $('#hate-count').text();
			count *= 1;
			count = count + 1;
			$.ajax({
				url:'hate.bo',
				data: {worryNo:<%= w.getWorryNo() %>},
				success: function(data){
					$('#hate-btn').attr('disabled', true);
					$('#hate-btn').css('background', 'lightgray');
					$('#like-btn').attr('disabled', true);
					$('#hate-count').text(count);
				}
				
			});
			<% }else { %>
				alert("로그인이 필요합니다.");
			<% } %>
		});
		
		
		
		function login(){
			alert("로그인이 필요합니다.");
		}	
		
		
		function before(){
				location.href='<%=request.getContextPath()%>/beforeWorryDetail.bo?worryNo=<%= w.getWorryNo()%>';
		}
		
		function after(){

				location.href='<%=request.getContextPath()%>/afterWorryDetail.bo?worryNo=<%= w.getWorryNo()%>';

		}
		
		
		
		
		
	</script>
</body>
</html>