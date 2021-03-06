<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="worry.model.vo.* , java.util.ArrayList" %>
<%
request.setCharacterEncoding("UTF-8");
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
	#change-btn{display: inline-block; float: left; margin-left:1210px;}
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
	#name{margin-left: 22px; height: 60px;}
	#time{margin-left: 22px;}
	#content{border: none; width: 90%; height: 300px; resize:none; }
	#profile{border-radius:50px;}
	.profile{display: inline-block;}
	#title{font-size:1.3em; width:850px; height: 60px; margin-left: 0px; overflow:hidden; text-overflow: ellipsis; white-space: normal; line-height: 1.2; height: 2.4em;}
</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>	
		<hr>
            <h2>고민 게시글</h2>
			<hr>
			<form action="<%=request.getContextPath() %>/worryUpdate.bo" method="post" encType="multipart/form-data">
			<div class="worry-read-wrap">
                <article class="worry-head">
                	<input type="hidden" name="worryNo" value="<%= request.getParameter("worryNo") %>">
                    <div id="title"><input style="width:600px;" type="text" name="title" value="<%= w.getTitle() %>"></div>
                    <div  class="profile"><img id="profile" src="<%= request.getContextPath()%>/member_images/<%= w.getProfileImage() %>" width="50px" height="50px"></div>
                    <span id="name"><%= m.getUser_name() %></span>
                    <time id="time" datetime="2020-03-28T19:43:20"><%= w.getDate() %></time>
                    <div class="count-reading">
                        <span class="count-title">조회수 : <%= w.getHit() %></span>
                    </div>
                </article>
                <article class="content-body">
<%--                 	<input id="content" type="text" value='<%= request.getParameter("content") %>'> --%>
                   <textarea id="content" name="content" row="10" style="overflow: hidden; overflow-wrap: break-word; resize: horicontal; height: 170px;"><%= w.getContent() %></textarea>
                 <br><br>

                  <% if(fList != null){ %>
						
                    	<%for(int i = 0 ; i < fList.size(); i++){ %>
		                    <div id="mainCase">
			                    <div id="img-case1" class="case"><img src="<%= request.getContextPath()%>/AddFile/<%= fList.get(i).getChangeName() %>" width="250px" height="250px"><br></div>
			                    <button type="button" class="btn-standard" onclick="location.href='<%=request.getContextPath() %>/deleteFile.bo?fNo=<%= fList.get(i).getFileNo()%>&wNo=<%= w.getWorryNo()%>'">삭제하기</button>
			                    <input class="row" type="hidden" name='fList' value="<%= fList.get(i).getChangeName() %>">
			                    <br><br>
		              		</div>
              			<%} %>
                   	<%} %> 

                </article>
                  	<button type="submit" id="change-btn" class="btn-standard" >수정</button>
                   
					<div  id="delete-btn" class="btn-standard" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</div> 
				<span style="color:#aaa;" id="counter">(0 / 최대 2000자)</span>
 				<br><br>
                <div class="add-file">
								<label id="add-file-label">첨부파일</label>
								<input  class="btn-standard" type="file" name="add-image1" multiple accept=".jpg,.png,.jpeg" value="a">
								<br>
								<input class="btn-standard" type="file" name="add-image2" multiple accept=".jpg,.png,.jpeg">
							</div>
 				
 				
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
	<script type="text/javascript" src="http://lib.inmu.net/autosize.js"></script>
	<script>
		$('#content').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 2000자)");    //글자수 실시간 카운팅
	
		    if (content.length > 2000){
		        alert("최대 2000자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 2000));
		        $('#counter').html("(2000 / 최대 2000자)");
		    }
		});
		
		autosize(document.querySelectorAll("textarea"));

		
	</script>
</body>
</html>