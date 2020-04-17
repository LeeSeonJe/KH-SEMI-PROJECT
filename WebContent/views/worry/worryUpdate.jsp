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
	.case{width: 250px; height:250px; display: inline-block; float:left;}
/* 	.content-text{width: 1151px; height: 580px; resize:none; border: none;} */
	.content-text{width: 1151px; white-space:pre-wrap; margin-left:0px;}
	#change-btn{display: inline-block; float: left; margin-left:1210px;}
	#delete-btn{width: 40px;}
</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>	
		<hr>
            <h2>고민 게시판</h2>
			<hr>
			<Form action="worryDetail2.bo">
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
                    <div class="content-text"><%= w.getContent() %></div>
                    

                    
                    <% if(fList != null){ %>
						
                    	<%for(int i = 0 ; i < fList.size(); i++){ %>
		                    <div id="mainCase">
			                    <div id="img-case1" class="case"><img src="<%= request.getContextPath()%>/AddFile/<%= fList.get(i).getChangeName() %>" width="250px" height="250px"></div>
			                    <input type="hidden" name='fList"+i+"' value="<%= fList.get(i).getChangeName() %>">
		              		</div>
              			<%} %>
                   	<%} %>
                </article>
                 
                <button type="submit" id="change-btn" class="btn-standard" >수정</button>
                   
					<div  id="delete-btn" class="btn-standard" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</div> 
				<br><br>
                <div class="add-file">
								<label id="add-file-label">첨부파일</label>
								<input type="file" name="add-image1" multiple accept=".jpg,.png,.jpeg" value="a">
								<input type="file" name="add-image2" multiple accept=".jpg,.png,.jpeg">
							</div>

                
                
                
                </Form>    
                
                
                

 				
 				
 				
 		

                
        	    

				

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
			if(<%= w.getWorryNo()%> != 1){
				location.href='<%=request.getContextPath()%>/beforeWorryDetail.bo?worryNo=<%= w.getWorryNo()%>';
			} else{
				alert("가장 최신 게시글 입니다.");
			}
		}
		
		function after(){

				location.href='<%=request.getContextPath()%>/afterWorryDetail.bo?worryNo=<%= w.getWorryNo()%>';

		}
			
		
		
	</script>
</body>
</html>