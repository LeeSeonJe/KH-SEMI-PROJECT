<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<%@ include file="/views/layout/import.jsp"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/commonCss/foundPw.css"
	type="text/css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/toggle.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/radio.css"
	type="text/css">
</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<!-- 작성 -->

	</div>
	<div
		style="background-color: lightgray; padding-bottom: 75px; margin-bottom: -50px;">
		<div class="foundIDForm">
			<div>
				<br> <br> <br>
			</div>
			<div class="mLogin" id = "mLogin1">
				<div class="logoDiv">
					<br> <br> <br> <br> <br>
				</div>
				<div class="sideDiv1"></div>
				<div class="bLogin" id="foundId" >
					<div class="titlebox">
						아이디 찾기
					</div>
					<br> <br>
				</div>
				<div class="fLogin" id="foundPw" style = "cursor : pointer;">
					<div class="titlebox">
						비밀번호 찾기
					</div>
				</div>
				<div class="sideDiv2"></div>
				<div class="foundIdF">
					<br> <br> <br> <br>
					<div class="foundIdI">
						등록된 회원정보 또는 본인인증을 통해 아이디를 찾으실 수 있으십니다.<br> <br>
						<div class="foundIdFF" id="foundIdFF1">
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioId1" name="radioId" checked readonly>
								<span class="label"> </span> 등록된 회원정보로 찾기
							</label>
							<div class="foundIdFFS">
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								· 회원정보에 등록된 이름, 주민번호가 일치해야만 아이디를 확인할 수 있습니다. <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								· 조회된 아이디는 일부 마스킹처리되어 표시되며, 전체 아이디를 확인하시려면 본인인증을 진행해주세요.
							</div>
							<br>
							<div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">이름</div>
								</div>
								<div class="rightBox">
									<input type="text" id="nameBox"
										style="width: 179px; height: 40px; font-size: 12pt; float: left">
									<input type="button" class="imgAlert1" id="imgAlert1"
										value="      비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다."
										disabled> <input type="button" class="imgAlert2"
										id="imgAlert2" disabled>
								</div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">주민번호</div>
								</div>
								<div class="rightBox">
									<input type="text" class="PID" id="PID1"
										style="width: 135px; height: 40px; font-size: 12pt; float: left;"
										maxlength="6"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									<div style="float: left">&nbsp;-&nbsp;</div>
									<input type="text" class="PID" id="PID2"
										style="width: 28px; height: 40px; font-size: 12pt; float: left"
										maxlength="1"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
									<input type="button" class="imgAlert1" id="imgAlert3"
										value="      비밀번호는 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다."
										disabled> <input type="button" class="imgAlert2"
										id="imgAlert4" style="float: left;" disabled>
								</div>
								<div class="leftBox">
									<br>
								</div>
								<div class="rightBox" style="font-size: 12pt; color: gray">
									주민번호 앞자리, 뒤 첫번째 자리 입력. ex) 000213 - 3</div>
							</div>
							<div style="width: 100%; height: 1px; float: left;">
								<br>
							</div>
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioId2" name="radioId" readonly> <span
								class="label"> </span> 본인인증으로 찾기
							</label>
							<div class="SUB" style="margin-left: 33%; margin-top: 150px;">
								<input name="nextAfter" class="SUBC" type="button"
									value="아이디 찾기" onclick="location.href='SignUpCustomer3.jsp' "
									id="submit1"
									style="background-color: #595959; color: white; border: none;"
									disabled> <input name="nextAfter" class="SUBC"
									type="button" value="아이디 찾기"
									onclick="location.href='SignUpCustomer3.jsp' " id="submit2"
									style="background-color: #DF1758; color: white; border: none;">
							</div>
						</div>
	

						<div class="foundIdFF2" id="foundIdFF2">
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioIdd1" name="radioIdd" readonly> <span
								class="label"> </span> 등록된 회원정보로 찾기
							</label>
							<div style="width: 100%; height: 40px;">
								<br>
							</div>
							<label style="font-weight: 100;"> <input type="radio"
								class="radio" id="radioIdd2" name="radioIdd" readonly checked>
								<span class="label"> </span> 본인인증으로 찾기
							</label>
							<div class="SUIdenI" onmouseover="iconChange1()"
								onmouseout="iconChange2()" onclick="openEmailIden();"
								style="cursor: pointer; margin-left: 39%;">
								<img class="SUImg" id="SUImgg1"
									src="<%=request.getContextPath()%>/resources/images/SUEmail2-1.png">
								<img class="SUImg" id="SUImgg2"
									src="<%=request.getContextPath()%>/resources/images/SUEmail1-1.png">
							</div>
							<div class="SUB" style="margin-top: 80px; margin-left: 33%;">
								<input name="nextAfter" class="SUBC" type="button"
									value="아이디 찾기" onclick="location.href='SignUpCustomer3.jsp' "
									disabled
									style="background-color: #595959; color: white; border: none;"
									id="submitt1"> <input name="nextAfter" class="SUBC"
									type="button" value="아이디 찾기"
									onclick="location.href='SignUpCustomer3.jsp' "
									style="background-color: #DF1758; color: white; border: none;"
									id="submitt2">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mLogin" id = "mLogin2">
				<div class="logoDiv">
					<br> <br> <br> <br> <br>
				</div>
				<div class="sideDiv1"></div>
				<div class="bLogin" id="foundId2" style = "border-top : none; border-left : none; border-bottom : 1px solid black; background-color : lightgray ;cursor : pointer;">
					<div class="titlebox">
						아이디 찾기
					</div>
					<br> <br>
				</div>
				<div class="fLogin" id="foundPw2" style = "border-top : 1px solid black; border-right : 1px solid black; background-color : white; border-bottom : none; ">
					<div class="titlebox">
						비밀번호 찾기
					</div>
				</div>
				<div class="sideDiv2"></div>
				<div class="foundIdF" id = "foundIdFEC1">
					<br> <br> <br> <br>
					<div class="foundIdI">
						비밀번호를 찾고자 하는 아이디를 입력해 주세요.<br> <br>
						<div class="foundIdFF" style = "height : 160px;">
							<div style = "float : left; width : 15%; margin-left : 25%; margin-top : 17px; font-size : 12pt;" >
								아이디
							</div>
							<div style = "float : left; width : 30%;  margin-top : 6px; " >
								<input type = "text" id = "foundIdPw" style = "height : 45px; width : 280px; border: 1px solid black;">
							</div>
							
						</div>
						<div>
							<br><br>
						</div>
						<div>
								<input type = "button"  class = "SUBC" id = "next1" value = "다음" style = "background-color : #595959; color : white; border:none;">
						</div>
						<div>
								<input type = "button"  class = "SUBC" id = "next2" value = "다음" style = "background-color : #DF1758; color : white; border:none;">
						</div>
					</div>
				</div>
				<div class="foundIdF" id = "foundIdFEC2">
					<br> <br> 
					<div class="foundIdI">
						<div class="foundIdFF" style = "height : 350px;">
							<div style = "float : left; width : 50%; margin-left : 30%; margin-top : -15px; font-size : 13pt;" >
								본인인증을 통해 비밀번호를 재설정하실 수 있습니다.
							</div>
							<div style = "width : 100%; height : 30px;">
								<br>
							</div>
							<div class="SUIdenI" onmouseover="iconChange3()"
								onmouseout="iconChange4()" onclick="openEmailIden()"
								style="cursor: pointer; margin-left: 39%;">
								<img class="SUImg" id="SUImggg1"
									src="<%=request.getContextPath()%>/resources/images/SUEmail2-1.png">
								<img class="SUImg" id="SUImggg2"
									src="<%=request.getContextPath()%>/resources/images/SUEmail1-1.png">
							</div>	
						</div>
						<div>
							<br><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		function openEmailIden(){
			window.open("<%=request.getContextPath()%>/views/common/findIdByMail.jsp", "이메일 인증", "height = 450 , width = 500, left = 300, top = 50");
		}
	
		$(function() {
			$("#mLogin2").hide();
			$("#foundIdFF2").hide();
			$("#foundIdFF1").show();
			$("#submit2").hide();
			$("#submitt2").hide();
			$(".imgAlert1").hide();
			$(".imgAlert2").hide();
			$("#next2").hide();
			$("#foundIdFEC2").hide();
		});

		$("#radioId2").click(function() {
			$("#foundIdFF1").hide();
			$("#foundIdFF2").show();
			$("#radioIdd2").prop("checked", true);
			$(".mLogin").height("920px");
		});

		$("#radioIdd1").click(function() {
			$("#foundIdFF2").hide();
			$("#foundIdFF1").show();
			$("#radioId1").prop("checked", true);
			$(".mLogin").height("1000px");
		});

		$(".PID").keyup(function() {
			var charLimit = $("#PID1").attr("maxlength");
			if (this.value.length >= charLimit) {
				$("#PID2").focus();
				return false;
			}
		});

		$(function() {
			$('#SUImgg2').hide();
			$('#SUImgg1').show();
		});
		function iconChange1() {
			$('#SUImgg1').hide();
			$('#SUImgg2').show();
			style = "cursor : pointer";
		}

		function iconChange2() {
			$('#SUImgg2').hide();
			$('#SUImgg1').show();
		}

		$('input').keyup(function() {
			var name = $("#nameBox").val();

			var PID = $("#PID1").val();
			var PID2 = $("#PID2").val();

			var flag1 = false;
			var flag3 = false;

			if (name.length < 1) {
				$("#imgAlert1").hide();
				$("#imgAlert2").hide();
			} else {
				if (name.length > 0) {
					$("#imgAlert1").hide();
					$("#imgAlert2").show();
					flag1 = true;
				} else {
					flag1 = false;
					$("#imgAlert2").hide();
					$("#imgAlert1").show();
				}
			}

			if ((PID.length < 6) || (PID2.length < 1)) {
				$("#imgAlert3").hide();
				$("#imgAlert4").hide();
			} else {
				if ((PID.length == 6) && (PID2.length == 1)) {
					$("#imgAlert3").hide();
					$("#imgAlert4").show();
					flag3 = true;
				} else {
					$("#imgAlert4").hide();
					$("#imgAlert3").show();
					flag3 = false;
				}
			}

			if ((flag1 == true) && (flag3 == true)) {
				$("#submit1").hide();
				$("#submit2").show();
			} else {
				$("#submit2").hide();
				$("#submit1").show();
			}

		});
		
		$("#foundPw").click(function(){
			$("#mLogin1").hide();
			$("#mLogin2").show();
			$(".mLogin").height("650px");
			$("#foundIdFEC2").hide();
			$("#foundIdFEC1").show();
		});
		
		$("#foundId2").click(function(){
			$("#mLogin2").hide();
			$("#mLogin1").show();
			if($("#radioId1").prop("checked") == true){
				$(".mLogin").height("1000px");
			}else if ($("#radioIdd2").prop("checked") == true){
				$(".mLogin").height("920px");
			}
		});
		
		$("#mLogin2").keyup(function(){
			var id = $("#foundIdPw").val();
			
			var flag1 = false;
			var flag2 = false;
			
			if(id.length > 0){
				flag1 = true;
			}else{
				flag1 = false;
			}
			
			if(id.length <8){
				flag2 = false;
			}else{
				flag2 = true;
			}
			
			if((flag1 == true)&&(flag2 == true)){
				$("#next1").hide();
				$("#next2").show();
			}else{
				$("#next2").hide();
				$("#next1").show();
			}
			
		});
		
		$("#next2").click(function(){
			$("#foundIdFEC1").hide();
			$("#foundIdFEC2").show();
		});
		
		$(function() {
			$('#SUImggg2').hide();
			$('#SUImggg1').show();
		});
		function iconChange3() {
			$('#SUImggg1').hide();
			$('#SUImggg2').show();
			style = "cursor : pointer";
		}

		function iconChange4() {
			$('#SUImggg2').hide();
			$('#SUImggg1').show();
		}
	
	</script>
</body>
</html>