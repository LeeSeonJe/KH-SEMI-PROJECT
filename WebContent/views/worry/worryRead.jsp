<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	#comment-area{margin: 5px; display:inline-block;}  
	#upload-btn{position:absolute;
				top:80px;
				width:50px;
				height:40px;}
	
	.comment-list-wrap{font-size: 1.1em;}
	.comment-list-wrap>li{border-bottom: 1px dotted #666;
	                      padding: 3px; vertical-align:middle;}
	.comment-list-wrap>li:last-of-type{border-bottom: 2px solid #666;}
	
	.comment-writer{display:inline-block;
					width: 150px; 
					text-align:center; 
					vertical-align:top;}
	.comment-text{display:inline-block;
				  width: 750px;}
	.comment-time{display:inline-block;
				  width:150px;
				  text-align:center;
				  vertical-align:top}

</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>	
		<hr>
            <h2>고민 게시판</h2>
			<hr>
			<div class="worry-read-wrap">
                <article class="worry-head">
                    <h3>얼굴에 좁쌀 여드름이 자꾸 나요</h3>
                    <span><a href="#">노홍철</a></span>
                    <time datetime="2020-03-28T19:43:20">2020.03.28</time>
                    <div class="count-reading">
                        <span class="count-title">조회수</span>
                        <span class="read-count">5</span>
                    </div>
                </article>
                <article class="content-body">
                    <p class="content-text">
                    턱 밑에 자꾸 좁쌀 여드름이 작게 올라와요 화장품을 바꿔봐도 효과가 없는데 어떻게 해야하나요?
                    피부과는 가기 너무 무서워요!!
                    </p>
                    <div class="vote-btn">
                        <button id="like-btn" class="btn-standard" value="좋아요">좋아요</button>
                        <span id="like-count" class="counting">2</span>
                        <button id="hate-btn" class="btn-standard" value="싫어요">싫어요</button>
                        <span id="hate-count" class="counting">0</span>
                    </div>
                    <div class="edit-btn">
                        <button id="change-btn" class="btn-standard" value="수정">수정</button>
                        <button id="delete-btn" class="btn-standard" value="삭제">삭제</button>
                        <button id="write-btn" class="btn-standard" value="글쓰기" onclick="location.href='worryWrite.jsp'">글쓰기</button>
                    </div>
                </article>
                  	<div class="worry-btn-wrap">
                        <button class="btn-standard" type="button" value="목록" onclick="location.href='worryBoard.jsp'">목록</button>
                        <button id="prev-worry" class="btn-standard" type="button" value="이전글">이전글</button>
                        <button id="next-worry" class="btn-standard" type="button" value="다음글">다음글</button>
                    </div>
                <div class="comment-write">
                    <form>
                        <textarea id="comment-area" cols="120" rows="5">댓글을 남겨주세요.</textarea>
                        <button id="upload-btn" class="btn-standard" value="등록">등록</button>
                    </form>
                </div>
                <ul class="comment-list-wrap">
                    <li><span class="comment-writer"><a href="#">깨끗한 피부의원</a></span><span class="comment-text">여러 환경적 요인으로 발생 할 수 있습니다. 피부과 진료를 받아보시면 좀 더 정확한 원인을 알 수 있습니다.s.kfe.kafjewklsfne.gk/kas.gjsb,jkba</span><span class="comment-time"><time datetime="2020-03-28T20:05:10">30분전</time></span></li>
                    <li><span class="comment-writer"><a href="#">리뷰 작성자</a></span><span class="comment-text">리뷰 내용</span><span class="comment-time"><time>작성 시간</time></span></li>
                </ul>
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
		
	</script>
</body>
</html>