<%@page import="book.model.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String hos_name = request.getParameter("hos_name");
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
							<label>이름</label><input type="text" id="name" name="name" placeholder='이름을 입력해주세요.' value="<%= b.getBooking_name()%>">
						</div>
						<div class="input">
							<label>연락처</label><input type="tel" id="tel" name="tel" placeholder='연락처를 입력해주세요.' value="<%= b.getBooking_tel()%>">
						</div>
					</div>
					<br>
					<div class="gray">
					<div class="bookTitle">예약 일시</div>
						<div class="input">
							<label >예약 날짜</label><input type="date" id="date" name="date" placeholder='예약 날짜를 선택해주세요.' value="<%= b.getBooking_date()%>">
							<script>
							$(function(){
							    $('#date').prop('min', function(){
							        return new Date().toJSON().split('T')[0];
							    });
							});
							</script>
						</div>
						<div class="input">
							<label>예약 시간</label>
							<select id="time" name="time">
							<option>예약 시간을 선택해주세요</option>
							<option value="09">09:00</option>
							<option value="10">10:00</option>
							<option value="11">11:00</option>
							<option value="13">13:00</option>
							<option value="14">14:00</option>
							<option value="15">15:00</option>
							<option value="16">16:00</option>
							<option value="17">17:00</option>
							</select> 
						</div>
					</div>
					<br>
					<div class="gray">
					<div class="bookTitle">상담 내용</div>
						<div>
							<textarea id="textbox" name="textbox"><%= b.getBooking_content() %></textarea>
						</div>
					</div>
					<br>
					<input type="button" class="button" id="apply" value="예약 수정하기">
					<input type="button" class="button" id="cancle" value="취소" onclick="window.close();">
				</div>
			</div>
		</section>
	</div>

	<script>
		$(function(){
			var date = 	$('#date').val();
			$.ajax({
				url: '<%= request.getContextPath()%>/bookTimeCheck.hos',
				data : {date:date},
				success: function(data){
					$('select[name="time"]').find("option").removeAttr('disabled');
					for(var i in data){
						$('select[name="time"]').find("option[value="+data[i]+"]").prop('disabled',true);
					}
				}
			})
		})
		$('#date').change(function(){
			var date = 	$('#date').val();
			
			$.ajax({
				url: '<%= request.getContextPath()%>/bookTimeCheck.hos',
				data : {date:date},
				success: function(data){
					$('select[name="time"]').find("option").removeAttr('disabled');
					for(var i in data){
						$('select[name="time"]').find("option[value="+data[i]+"]").prop('disabled',true);
					}
				}
			})
		});
	
		$('#apply').click(function(){
			var book_no = '<%= b.getBooking_no()%>'
			var name = $('#name').val();
			var tel = $('#tel').val();
			var date = $('#date').val();
			var time = $('#time').val();
			var textbox = $('#textbox').val();
			var hos_name = "<%=hos_name%>";
			var customer_no = "<%= b.getCustomer_no() %>";
			if(name.trim().length == 0 ||
				tel.trim().length == 0 ||
				date.trim().length == 0 ||
				time.trim().length == 13 ||
				textbox.trim().length == 0){
				
				alert("내용을 모두 채워주세요.");
			} else{
				$.ajax({
					url: '<%= request.getContextPath()%>/updateBook.hos',
					data : {
						book_no:book_no, name:name, tel:tel, date:date, time:time,
						textbox:textbox, customer_no:customer_no,
						hos_name:hos_name
					},
					success: function(data){
						alert(data);
						self.close();
					}
				})
			} 
		})
	</script>
</body>
</html>