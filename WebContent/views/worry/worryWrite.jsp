<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
/*고민작성*/
	.worry-form{padding: 50px 80px;}

	.worry-title, .age-group, .gender-group,
	.comment, .add-file{
		margin: 0 10px 40px 0;}

	#title-label, #age-label, #gender-label,
	#comment-label, #add-file-label{
		display: inline-block;
		width: 70px;
		margin-right: 30px;}

	.worry-form label,.age-group>label>input,.gender-group>label>input,.add-file>input{
		margin-right: 15px;}
		
	#comment-label{
		vertical-align: top;}

	.worry-form input,textarea{
		padding:7px;}

	.comment-tip{display: inline-block;
		vertical-align:top;
		margin: 40px 40px;
		width:160px;
		font-size:0.8em;
		}

	.comment-tip>h4{
		color: orange;
	}
	.comment-tip li{
		margin-top:7px;
	}
	.comment-tip ul>li:last-of-type{
		margin-top:0;
		list-style-type:none;
		color: #666;
		font-size: 0.9em;
	}

	.add-file>input{
		color: #666;
		cursor: pointer;
		font-size: 13px;
	}	

	.worry-form button{
		margin:8px;
		}
	.worry-form button:first-of-type{
		margin-left:400px;
	}
	.comment-box{ white-space:pre-wrap; margin-left:0px;} 


</style>

<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
		<div class="worry-board-write">
			<h2>고민 게시글 작성</h2>
				<hr>
				<form class="worry-form" action="<%=request.getContextPath() %>/worryInsert.bo" method="post" encType="multipart/form-data" >
					<div class="worry-title">
						<label for="title" id="title-label">제목</label>
						<input name ="title" type="text" id="title" placeholder="제목을 입력해주세요." size="70" required> 
						<span style="color:#aaa;" id="counter2">(0 / 최대 50자)</span>
					</div>
					
					<div class="comment">
						<label id="comment-label" for="comment-box">내용</label>
						<textarea name = "content" style="overflow: hidden; resize: none; overflow-wrap: break-word; resize: horicontal; height: 400px;" id="comment-box" cols="75" rows="20" required placeholder="# 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민,형사상의 책임을 질 수 있습니다."></textarea>
						<span class="comment-tip">
							<h4>고민작성 TIP!</h4>
							<ol>
								<li>고민이 있는 부분에 대해서 <b>자세하게</b> 설명해주세요.</li>
								<li>관련하여 받은 <b>치료나 검사</b>가 있다면 <b>언제, 어떤 내용을 받았는지 설명해주세요.</b></li>
								<li><b>증상 설명에 도움이 되는 자료가 있다면 첨부</b>해주시면 좋습니다.</li>
								<ul>
									<li>예) 증상을 알 수 있는 사진이나 이미지, 검사 자료 등</li>
								</ul>
							</ol>
						</span>
					</div>	
							<span style="color:#aaa;" id="counter">(0 / 최대 1500자)</span>
							<br><br>
							<div class="add-file">
								<label id="add-file-label">첨부파일</label>
								<input type="file" name="add-image1" multiple accept=".jpg,.png,.jpeg">
								<input type="file" name="add-image2" multiple accept=".jpg,.png,.jpeg">
							</div>
							<button  is="cancleBtn" class="btn-standard" type="reset" value="취소" onclick="location.href='javascript:history.go(-1);'">취소</button>
							<button class="btn-standard" type="submit" value="등록" id="worry-btn" >등록</button>
				</form>


		</div>
	</div>

	<script>



		$('#comment-box').keyup(function (e){
		    var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 1500자)");    //글자수 실시간 카운팅

		    if (content.length > 1500){
		        alert("최대 1500자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1500));
		        $('#counter').html("(1500 / 최대 1500자)");
		    }
		}).keydown(function (e){
			var content = $(this).val();
		    $('#counter').html("("+content.length+" / 최대 1500자)");    //글자수 실시간 카운팅

		    if (content.length > 1500){
		        alert("최대 1500자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 1500));
		        $('#counter').html("(1500 / 최대 1500자)");
		    }
		});
		
		$('#title').keyup(function (e){
		    var content = $(this).val();
		    $('#counter2').html("("+content.length+" / 최대 50자)");    //글자수 실시간 카운팅

		    if (content.length > 50){
		        alert("최대 50자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 50));
		        $('#counter2').html("(50 / 최대 50자)");
		    }
		}).keydown(function (e){
			var content = $(this).val();
		    $('#counter2').html("("+content.length+" / 최대 50자)");    //글자수 실시간 카운팅

		    if (content.length > 50){
		        alert("최대 50자까지 입력 가능합니다.");
		        $(this).val(content.substring(0, 50));
		        $('#counter2').html("(50 / 최대 50자)");
		    }
		});
		
		autosize(document.querySelectorAll("textarea"));
	
	</script>
	
	
	
	
	<%@ include file="/views/layout/footer.jsp"%>
	<script type="text/javascript" src="http://lib.inmu.net/autosize.js"></script>
	<script src="../../resources/js/main.js"></script>
	
</body>
</html>