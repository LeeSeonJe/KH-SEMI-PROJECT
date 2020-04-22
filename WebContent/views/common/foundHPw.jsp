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
	href="<%=request.getContextPath()%>/resources/commonCss/foundHPw.css"
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
		<%@ include file="/views/layout/header2.jsp"%>
		<!-- 작성 -->

	</div>
	<div
		style="background-color: lightgray; padding-bottom: 75px; margin-bottom: -50px;">
		<div class="foundIDForm">
			<div>
				<br> <br> <br>
			</div>
			<div class="mLogin" id="mLogin1">
				<div class="logoDiv">
					<br> <br> <br> <br> <br>
				</div>
				<div class="sideDiv1"></div>
				<div class="bLogin" id="foundId">
					<div class="titlebox">아이디 찾기</div>
					<br> <br>
				</div>
				<div class="fLogin" id="foundPw" style="cursor: pointer;">
					<div class="titlebox">비밀번호 찾기</div>
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
								· 회원정보에 등록된 병원 상호명, 이메일이 일치해야만 아이디를 확인할 수 있습니다. <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								· 조회된 아이디는 일부 마스킹처리되어 표시되며, 전체 아이디를 확인하시려면 본인인증을 진행해주세요.
							</div>
							<br>
							<div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">병원 상호명</div>
								</div>
								<div class="rightBox">
									<input type="text" id="nameBox"
										style="width: 179px; height: 40px; font-size: 12pt; float: left">
									<input type="button" class="imgAlert2" style = "margin-left : 18px; margin-top : 5px;"
										id="imgAlert2" disabled>
								</div>
								<div class="leftBox">
									<div style="margin-top: 8px; margin-left: 35%;">이메일</div>
								</div>
								<div class="rightBox">
									<input type="text" name="	" id="str_email01"
										style="width: 150px; height : 40px; font-size : 13pt;"> @ <input type="text"
										name="str_email02" id="str_email02" 
										style="width: 150px; height : 40px; font-size : 13pt;"
										disabled value="naver.com"> <select
										style="width: 150px; height : 40px; margin-right: 10px; font-size : 13pt;" 
										name="selectEmail"
										id="selectEmail">
										<option value="1">직접입력</option>
										<option value="naver.com" selected>naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="empas.com">empas.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="korea.com">korea.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmir.com">hanmir.com</option>
										<option value="paran.com">paran.com</option>
									</select>
									<input type="button" class="imgAlert2" style = "float : right; margin-right : 23%; margin-top : 5px;"
										id="imgAlert4" disabled>
								</div>
								<div class="leftBox">
									<br>
								</div>
								<div class="rightBox" style="font-size: 12pt; color: gray">
									회원가입 당시 입력했던 이메일을 작성해 주세요.
								</div>
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
									style="background-color: #4BD763; color: white; border: none;">
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
								onmouseout="iconChange2()" onclick="openEmailIden()"
								style="cursor: pointer; margin-left: 39%;">
								<img class="SUImg" id="SUImgg1"
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_1-1_1.png">
								<img class="SUImg" id="SUImgg2"
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_2-1_1.png">
							</div>
							<div class="SUB" style="margin-top: 80px; margin-left: 33%;">
								<input name="nextAfter" class="SUBC" type="button"
									value="아이디 찾기" onclick="location.href='SignUpCustomer3.jsp' "
									disabled
									style="background-color: #595959; color: white; border: none;"
									id="submitt1"> <input name="nextAfter" class="SUBC"
									type="button" value="아이디 찾기"
									onclick="location.href='SignUpCustomer3.jsp' "
									style="background-color: #4BD763; color: white; border: none;"
									id="submitt2">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mLogin" id="mLogin2">
				<div class="logoDiv">
					<br> <br> <br> <br> <br>
				</div>
				<div class="sideDiv1"></div>
				<div class="bLogin" id="foundId2"
					style="border-top: none; border-left: none; border-bottom: 1px solid black; background-color: lightgray; cursor: pointer;">
					<div class="titlebox">아이디 찾기</div>
					<br> <br>
				</div>
				<div class="fLogin" id="foundPw2"
					style="border-top: 1px solid black; border-right: 1px solid black; background-color: white; border-bottom: none;">
					<div class="titlebox">비밀번호 찾기</div>
				</div>
				<div class="sideDiv2"></div>
				<div class="foundIdF" id="foundIdFEC1">
					<br> <br> <br> <br>
					<div class="foundIdI">
						비밀번호를 찾고자 하는 아이디를 입력해 주세요.<br> <br>
						<div class="foundIdFF" style="height: 160px;">
							<div
								style="float: left; width: 15%; margin-left: 25%; margin-top: 17px; font-size: 12pt;">
								아이디</div>
							<div style="float: left; width: 30%; margin-top: 6px;">
								<input type="text" id="foundIdPw"
									style="height: 45px; width: 280px; border: 1px solid black;">
							</div>

						</div>
						<div>
							<br> <br>
						</div>
						<div>
							<input type="button" class="SUBC" id="next1" value="다음"
								style="background-color: #595959; color: white; border: none;">
						</div>
						<div>
							<input type="button" class="SUBC" id="next2" value="다음"
								style="background-color: #4BD763; color: white; border: none;">
						</div>
					</div>
				</div>
				<div class="foundIdF" id="foundIdFEC2">
					<br> <br>
					<div class="foundIdI">
						<div class="foundIdFF" style="height: 350px;">
							<div
								style="float: left; width: 50%; margin-left: 30%; margin-top: -15px; font-size: 13pt;">
								본인인증을 통해 비밀번호를 재설정하실 수 있습니다.</div>
							<div style="width: 100%; height: 30px;">
								<br>
							</div>
							<div class="SUIdenI" onmouseover="iconChange3()"
								onmouseout="iconChange4()" 
								style="cursor: pointer; margin-left: 39%;">
								<img class="SUImg" id="SUImggg1"
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_1-1_1.png">
								<img class="SUImg" id="SUImggg2"
									src="<%=request.getContextPath()%>/resources/images/SUHChkE_2-1_1.png">
							</div>
						</div>
						<div>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/views/layout/footer.jsp"%>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	<script>
		$('#selectEmail').change(function(){ 
			$("#selectEmail option:selected").each(function () { 
				if($(this).val()== '1'){ //직접입력일 경우 
					$("#str_email02").val(''); //값 초기화
					$("#str_email02").attr("disabled",false); //활성화 
					}else{ //직접입력이 아닐경우 
						$("#str_email02").val($(this).text()); //선택값 입력 
						$("#str_email02").attr("disabled",true); //비활성화 
						} 
				}); 
			});

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

			var PID = $("#str_email01").val();
			var PID2 = $("#str_email02").val();

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

			if ((PID.length < 1) || (PID2.length < 1)) {
				$("#imgAlert3").hide();
				$("#imgAlert4").hide();
			} else {
				if ((PID.length > 0) && (PID2.length > 0)) {
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

		$("#foundPw").click(function() {
			$("#mLogin1").hide();
			$("#mLogin2").show();
			$(".mLogin").height("650px");
			$("#foundIdFEC2").hide();
			$("#foundIdFEC1").show();
		});

		$("#foundId2").click(function() {
			$("#mLogin2").hide();
			$("#mLogin1").show();
			if ($("#radioId1").prop("checked") == true) {
				$(".mLogin").height("1000px");
			} else if ($("#radioIdd2").prop("checked") == true) {
				$(".mLogin").height("920px");
			}
		});

		$("#mLogin2").keyup(function() {
			var id = $("#foundIdPw").val();

			var flag1 = false;
			var flag2 = false;

			if (id.length > 0) {
				flag1 = true;
			} else {
				flag1 = false;
			}

			if (id.length < 8) {
				flag2 = false;
			} else {
				flag2 = true;
			}

			if ((flag1 == true) && (flag2 == true)) {
				$("#next1").hide();
				$("#next2").show();
			} else {
				$("#next2").hide();
				$("#next1").show();
			}

		});

		$("#next2").click(function() {
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