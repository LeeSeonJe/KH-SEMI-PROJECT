<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form>
			<div id="back">
			<div id="main">예약 페이지</div>
				<div id="white">
					<div class="gray">
						<div class="bookTitle">예약자 정보</div> 
						<div class="input">
							<label>이름</label><input type="text" id="name" name="name" placeholder='이름을 입력해주세요.'>
						</div>
						<div class="input">
							<label>연락처</label><input type="tel" id="tel" name="tel" placeholder='연락처를 입력해주세요.'>
						</div>
					</div>
					<br>
					<div class="gray">
					<div class="bookTitle">예약 일시</div>
						<div class="input">
							<label >예약 날짜</label><input type="date" id="date" name="date" placeholder='예약 날짜를 선택해주세요.' >
						</div>
						<div class="input">
							<label>예약 시간</label>
							<select id="time" name="time">
							<option>예약 시간을 선택해주세요</option>
							<option>10:00</option>
							<option>11:00</option>
							<option>13:00</option>
							<option>14:00</option>
							<option>15:00</option>
							<option>16:00</option>
							<option>17:00</option>
							<option>18:00</option>
							</select> 
						</div>
					</div>
					<br>
					<div class="gray">
					<div class="bookTitle">상담 내용</div>
						<div>
							<textarea id="textbox" name="textbox"></textarea>
						</div>
					</div>]
					<br>
					<input type="submit" class="button" id="apply" value="예약 신청하기">
					<input type="button" class="button" id="cancle" value="취소" onclick="window.close();">
				</div>
			</div>
		</form>
		
		

		

		
		</section>
		
		
		
		
		
		
		
		
	</div>

	<script src="/cosMedic/resources/js/main.js"></script>
</body>
</html>