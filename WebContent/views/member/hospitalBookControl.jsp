<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="book.model.vo.Book"%>
<%
	Book b = (Book)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
	
	#back{background: black; color: white; display: inline-block; width: 580px; text-align: center; padding: 20px;}
	#white{background: white; width : 530px; padding: 20px; margin: 10px;}
	.gray{background: lightgray; color: black; width: 90%; margin-left: 15px; padding: 14px; font-weight: bold; font-size: 18px;}
	#main{margin: -10px 0 10px 30px; font-size: 20px;}
	
	#name{margin-left: 110px; height: 30px; width: 210px;}
	#tel{margin-left: 100px; height: 30px; width: 210px;}
	#date{margin-left: 81px; height: 30px; width: 205px;}
	#time{margin-left: 75px; height: 30px; width: 210px;}
	.input{margin: 10px; font-size: 13px;}
	.button{
    width: 80px;
    height: 40px;
    background-color: skyblue;
    border: none;
    color:#fff;
    padding: 10px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    cursor: pointer;
    border-radius:10px;
	}
	.button:hover {
    background-color: blue;
	}
	#textbox{width:440px; height:200px; margin: 20px 0 0 0; font-size: 14px; resize:none;}
	#apply{margin: 0 20px 0 280px; width: 100px;}
	.bookTitle{margin : -10px 0 10px -350px;}
</style>

</head>
<body>
	<div class="contents">
		<section>
			<div id="back">
			<div id="main">예약 페이지</div>
				<div id="white">
					<div class="gray">
						<div class="bookTitle">예약자 정보</div> 
						<div class="input">
							<label>이름</label><input type="text" id="name" name="name" placeholder='이름을 입력해주세요.' value="<%= b.getBooking_name()%>" readonly>
						</div>
						<div class="input">
							<label>연락처</label><input type="tel" id="tel" name="tel" placeholder='연락처를 입력해주세요.' value="<%= b.getBooking_tel()%>" readonly>
						</div>
					</div>
					<br>
					<div class="gray">
					<div class="bookTitle">예약 일시</div>
						<div class="input">
							<label >예약 날짜</label><input type="date" id="date" name="date" placeholder='예약 날짜를 선택해주세요.' value="<%= b.getBooking_date()%>" readonly>
							<script>
							$(function(){
							    $('#date').prop('min', function(){
							        return new Date().toJSON().split('T')[0];
							    });
							});
							</script>
						</div>
						<div class="input">
							<label>예약 시간</label><input type="text" id="time" name="time" value="<%= b.getBooking_time() %>:00" readonly>
							
						</div>
					</div>
					<br>
					<div class="gray">
					<div class="bookTitle">상담 내용</div>
						<div>
							<textarea id="textbox" name="textbox" readonly><%=b.getBooking_content() %></textarea>
						</div>
					</div>]
					<br>
					<input type="button" class="button" id="reject" value="예약 거절">
					<input type="button" class="button" id="cancle" value="취소" onclick="window.close();">
				</div>
			</div>
		</section>
	</div>

	<script>
		$('#reject').click(function(){
			if(window.confirm("예약을 정말 거절하시겠습니까?")){
				alert("예약을 거절했습니다.");
				location.href="<%= request.getContextPath() %>/deleteBook.hos?booking_no=" + <%= b.getBooking_no() %>;
				window.close();
			} else{
				alert("취소");
			}
			
		});
	</script>
</body>
</html>