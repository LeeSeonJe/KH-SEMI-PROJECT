
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	String profile_image = (String) session.getAttribute("profile_image");
%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/layoutCss/cosTalk.css"
	type="text/css">

<header>

	<div>
		<a href="<%=request.getContextPath()%>"> <img class="logo"
			src="<%=request.getContextPath()%>/resources/images/logopink.png"></a>
		<nav class="gnb">
			<!-- 글로벌네비게이션 -->
			<form action="<%=request.getContextPath()%>/cosmetic.li">
				<ul>
					<li><span>화장품</span>
						<div class="popup">
							<ul>
								<li><span>스킨케어</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="1">스킨</button></li>
										<li><button type="submit" name="cos_middle_no" value="2">에센스</button></li>
										<li><button type="submit" name="cos_middle_no" value="3">로션</button></li>
										<li><button type="submit" name="cos_middle_no" value="4">크림</button></li>
										<li><button type="submit" name="cos_middle_no" value="5">토너/필링패드</button></li>
										<li><button type="submit" name="cos_middle_no" value="6">페이스오일</button></li>
										<li><button type="submit" name="cos_middle_no" value="7">미스트</button></li>
										<li><button type="submit" name="cos_middle_no" value="8">메이크업픽스</button></li>
									</ul></li>
								<li><span>클렌징</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="9">클렌징폼</button></li>
										<li><button type="submit" name="cos_middle_no" value="10">클렌징오일</button></li>
										<li><button type="submit" name="cos_middle_no" value="11">클렌징말크</button></li>
										<li><button type="submit" name="cos_middle_no" value="12">클렌징크림</button></li>
										<li><button type="submit" name="cos_middle_no" value="13">클렌징워터</button></li>
										<li><button type="submit" name="cos_middle_no" value="14">클렌징젤</button></li>
										<li><button type="submit" name="cos_middle_no" value="15">스크렙/필링</button></li>
										<li><button type="submit" name="cos_middle_no" value="16">포인트리무버</button></li>
										<li><button type="submit" name="cos_middle_no" value="17">클렌징티슈</button></li>
										<li><button type="submit" name="cos_middle_no" value="18">클렌징비누</button></li>
									</ul></li>
								<li><span>베이스메이크업</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="19">메이크업베이스</button></li>
										<li><button type="submit" name="cos_middle_no" value="20">톤업크림</button></li>
										<li><button type="submit" name="cos_middle_no" value="21">베이스프라이머</button></li>
										<li><button type="submit" name="cos_middle_no" value="22">포인트프라이머</button></li>
										<li><button type="submit" name="cos_middle_no" value="23">파운데이션</button></li>
										<li><button type="submit" name="cos_middle_no" value="24">비비크림</button></li>
										<li><button type="submit" name="cos_middle_no" value="25">씨씨크림</button></li>
										<li><button type="submit" name="cos_middle_no" value="26">쿠션타입</button></li>
										<li><button type="submit" name="cos_middle_no" value="27">컨실러</button></li>
										<li><button type="submit" name="cos_middle_no" value="28">팩트</button></li>
										<li><button type="submit" name="cos_middle_no" value="29">파우더</button></li>
										<li><button type="submit" name="cos_middle_no" value="30">트윈케익</button></li>
									</ul></li>
								<li><span>색조메이크업</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="31">립스틱</button></li>
										<li><button type="submit" name="cos_middle_no" value="32">립글로스/락커</button></li>
										<li><button type="submit" name="cos_middle_no" value="33">립틴트</button></li>
										<li><button type="submit" name="cos_middle_no" value="34">립밤</button></li>
										<li><button type="submit" name="cos_middle_no" value="35">립라이너</button></li>
										<li><button type="submit" name="cos_middle_no" value="36">아이라이너-펜슬&젤</button></li>
										<li><button type="submit" name="cos_middle_no" value="37">마스카라</button></li>
										<li><button type="submit" name="cos_middle_no" value="38">픽서/영양제</button></li>
										<li><button type="submit" name="cos_middle_no" value="39">아이섀도우</button></li>
										<li><button type="submit" name="cos_middle_no" value="40">아이브로우-펜슬</button></li>
										<li><button type="submit" name="cos_middle_no" value="41">아이브로우-파우더</button></li>
										<li><button type="submit" name="cos_middle_no" value="42">아이브로우-마스카라&리퀴드</button></li>
										<li><button type="submit" name="cos_middle_no" value="43">하이라이터</button></li>
										<li><button type="submit" name="cos_middle_no" value="44">쉐딩</button></li>
										<li><button type="submit" name="cos_middle_no" value="45">블러셔</button></li>
									</ul></li>
								<li><span>마스크/팩</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="46">마스크시트</button></li>
										<li><button type="submit" name="cos_middle_no" value="47">수면팩</button></li>
										<li><button type="submit" name="cos_middle_no" value="48">워시오프</button></li>
										<li><button type="submit" name="cos_middle_no" value="49">필오프</button></li>
										<li><button type="submit" name="cos_middle_no" value="50">수딩젤/팩</button></li>
										<li><button type="submit" name="cos_middle_no" value="51">코팩</button></li>
									</ul></li>
								<li><span>선케어</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="52">선블럭</button></li>
										<li><button type="submit" name="cos_middle_no" value="53">선스프레이</button></li>
										<li><button type="submit" name="cos_middle_no" value="54">선스틱</button></li>
										<li><button type="submit" name="cos_middle_no" value="55">선쿠션</button></li>
										<li><button type="submit" name="cos_middle_no" value="56">태닝</button></li>
									</ul></li>
								<li><span>기능성화장품</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="57">링클케어</button></li>
										<li><button type="submit" name="cos_middle_no" value="58">트러플케어</button></li>
										<li><button type="submit" name="cos_middle_no" value="59">화이트닝케어</button></li>
										<li><button type="submit" name="cos_middle_no" value="60">모공케어</button></li>
										<li><button type="submit" name="cos_middle_no" value="61">아이케어</button></li>
										<li><button type="submit" name="cos_middle_no" value="62">넥케어</button></li>
									</ul></li>
								<li><span>바디/핸드/풋</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="63">바디워시</button></li>
										<li><button type="submit" name="cos_middle_no" value="64">바디스크럽</button></li>
										<li><button type="submit" name="cos_middle_no" value="65">바디로션</button></li>
										<li><button type="submit" name="cos_middle_no" value="66">바디크림</button></li>
										<li><button type="submit" name="cos_middle_no" value="67">바디오일</button></li>
										<li><button type="submit" name="cos_middle_no" value="68">바디미스트</button></li>
										<li><button type="submit" name="cos_middle_no" value="69">바디에센스</button></li>
										<li><button type="submit" name="cos_middle_no" value="70">바디팜/파우더</button></li>
										<li><button type="submit" name="cos_middle_no" value="71">핸드케어</button></li>
										<li><button type="submit" name="cos_middle_no" value="72">풋케어</button></li>
										<li><button type="submit" name="cos_middle_no" value="73">데오도란트</button></li>
										<li><button type="submit" name="cos_middle_no" value="74">목욕비누</button></li>
										<li><button type="submit" name="cos_middle_no" value="75">입욕제</button></li>
										<li><button type="submit" name="cos_middle_no" value="76">아로마테라피</button></li>
									</ul></li>
								<li><span>헤어</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="77">샴푸</button></li>
										<li><button type="submit" name="cos_middle_no" value="78">린스/컨디셔너</button></li>
										<li><button type="submit" name="cos_middle_no" value="79">트리트먼트/팩</button></li>
										<li><button type="submit" name="cos_middle_no" value="80">헤어소품</button></li>
										<li><button type="submit" name="cos_middle_no" value="81">헤어에센스</button></li>
										<li><button type="submit" name="cos_middle_no" value="82">헤어스타일링</button></li>
										<li><button type="submit" name="cos_middle_no" value="83">염색제/퍼머제</button></li>
										<li><button type="submit" name="cos_middle_no" value="84">헤어기기</button></li>
									</ul></li>
								<li><span>네일</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="85">네일컬러</button></li>
										<li><button type="submit" name="cos_middle_no" value="86">베이스/탑코트/퀵드라이</button></li>
										<li><button type="submit" name="cos_middle_no" value="87">네일아트/소품</button></li>
										<li><button type="submit" name="cos_middle_no" value="88">네일영양</button></li>
										<li><button type="submit" name="cos_middle_no" value="89">네일리무버</button></li>
									</ul></li>
								<li><span>여성용품</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="90">소형</button></li>
										<li><button type="submit" name="cos_middle_no" value="91">중형</button></li>
										<li><button type="submit" name="cos_middle_no" value="92">대형</button></li>
										<li><button type="submit" name="cos_middle_no" value="93">오버나이트</button></li>
										<li><button type="submit" name="cos_middle_no" value="94">팬티라이너</button></li>
										<li><button type="submit" name="cos_middle_no" value="95">체내형</button></li>
										<li><button type="submit" name="cos_middle_no" value="96">청결제</button></li>
									</ul></li>
								<li><span>미용렌즈</span>
									<ul>
										<li><button type="submit" name="cos_middle_no" value="97">컬러렌즈</button></li>
										<li><button type="submit" name="cos_middle_no" value="98">렌즈관리용품</button></li>
										<li><button type="submit" name="cos_middle_no" value="99">투명렌즈</button></li>
									</ul></li>
								<li><span>향수</span>
									<ul>
										<li><button type="submit" name="cos_middle_no"
												value="100">여성향수</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="101">남성향수</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="102">방향제</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="103">향초</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="104">디퓨저</button></li>
									</ul></li>
								<li><span>기타제품</span>
									<ul>
										<li><button type="submit" name="cos_middle_no"
												value="105">브러쉬</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="106">스펀지/퍼프</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="107">뷰러</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="108">페이스소품</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="109">아이소품</button></li>
									</ul></li>
								<li><span>베이비&맘</span>
									<ul>
										<li><button type="submit" name="cos_middle_no"
												value="110">베이비스킨케어</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="111">베이비바디</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="112">베이비클렌저/샴푸</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="113">베이비선케어</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="114">키즈제품</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="115">맘케어</button></li>
									</ul></li>
								<li><span>바디라인</span>
									<ul>
										<li><button type="submit" name="cos_middle_no"
												value="116">바디슬리밍</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="117">제모제/용품</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="118">건강/다이어트식품</button></li>
									</ul></li>
								<li><span>남성화장품</span>
									<ul>
										<li><button type="submit" name="cos_middle_no"
												value="119">클렌징</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="120">스크럽/필링</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="121">쉐이빙</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="122">애프터쉐이브</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="123">마스크/팩</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="124">메이크업</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="125">선케어</button></li>
										<li><button type="submit" name="cos_middle_no"
												value="126">헤어/바디</button></li>
									</ul></li>
							</ul>
						</div></li>
					<li><a href="<%=request.getContextPath()%>/brand.li">브랜드</a></li>
					<li><a href="<%=request.getContextPath()%>/list.re">리뷰</a></li>

					<li><a href="<%=request.getContextPath()%>/hospital.li">병원</a></li>
					<li><a href="<%=request.getContextPath()%>/worryList.bo">고민</a></li>
				</ul>
			</form>
		</nav>
		<%
			if (loginUser == null) {
		%>
		<span id="login" class="login"><a style="color: #DF1758;"
			href="<%=request.getContextPath()%>/views/common/login.jsp">로그인</a></span>
		<%
			} else if (loginUser.getUser_id().equals("admin")) {
		%>
		<span id="login" class="login"><label
			onclick="location.href='<%=request.getContextPath()%>/logout.me'">로그아웃</label></span>
		<span id="login" class="login"><label><%=loginUser.getUser_name()%></label></span>
		<span id="login" class="login"><label
			onclick="location.href='<%=request.getContextPath()%>/user.admin'">관리자페이지</label></span>
		<%
			} else {
		%>

		<span id="login" class="login"><label
			onclick="location.href='<%=request.getContextPath()%>/logout.me'">로그아웃</label></span>
		<%
			if (loginUser.getUser_category().equals("C")) {
		%>
		<span id="login" class="login"><label><a
				href="<%=request.getContextPath()%>/mypage.me"><%=loginUser.getUser_name()%></a></label></span>
		<%
			} else if (loginUser.getUser_category().equals("H")) {
		%>
		<span id="login" class="login"><label><a
				href="<%=request.getContextPath()%>/mypage.hos"><%=loginUser.getUser_name()%></a></label></span>
		<%
			}
		%>
		<%
			if (loginUser.getUser_category().equals("C")) {
		%>
		<img id="login" class="login"
			style="width: 50px; height: 50px; border-radius: 50px; float: right; margin-top: 40px"
			src="<%=request.getContextPath()%>/member_images/<%=profile_image%>"
			alt="" />
		<%
			} else if (loginUser.getUser_category().equals("H")) {
		%>
		<%
			String[] profiles = profile_image.split(",");
		%>
		<img id="login" class="login"
			style="width: 50px; height: 50px; border-radius: 50px; float: right; margin-top: 40px"
			src="<%=request.getContextPath()%>/hospital_images/<%=profiles[0]%>"
			alt="" />
		<%
			}
		%>
		<span id="login" class="login"><img
			src="resources/images/mail1.png"
			style="width: 50px; height: 50px; margin-top: -15px;"
			onclick="cosTalkOpen();" id="cosTalkBtn"></span>
		<%
			}
		%>
		<%-- <span class="sch">
			<button type="button"><img src="<%= request.getContextPath() %>/resources/images/search_icon.png"></button>
			<input type="text" placeholder="검색어를 입력하세요.">
		</span> --%>
	</div>
	
	<!-- <div> -->
	<div id="cosTalk" class="modal" name="modal">
		<div>
			<div>
				<input class="cTfunction" type="button" id="xBtn">
			</div>
		</div>
		<div class="cosTalk-content">
			<div style="margin-top: 40px; margin-left: 5px; float: left">
				<input type="button" class="friendBtn" id="friendBtnn1">
			</div>
			<div style="margin-top: 20px; margin-left: 5px; float: left">
				<input type="button" class="chatBtn" id="chatBtnn1">
			</div>
			<div style="margin-top: 40px; margin-left: -5px; float: left">
				<input type="button" class="friendBtn" id="friendBtnn2">
			</div>
			<div style="margin-top: 20px; margin-left: 5px; float: left">
				<input type="button" class="chatBtn" id="chatBtnn2">
			</div>
		</div>
		<!--  
		<div class="cosTalk-friendTab" id="fTab">
			<div style="font-size: 15pt; margin-left: -5px; font-weight: 600;">
				히스토리</div>
			<div style="width: 100%; height: 40px; margin-top: 18px;">

				<form id="friendViewForm" style="height: 400px; width: 100%;">
				</form>
			</div>
		</div>
		-->
		<div class="cosTalk-chatTab" id="cTab">
			<div style="font-size: 15pt; margin-left: -4px; font-weight: 600;">
				채팅
				<div style="float: right; margin-right: 10px;">
					<img
						src="<%=request.getContextPath()%>/resources/images/addchat_1_1.png" style = "margin-top : -4px;"
						onclick="addChat();" onMouseOver="this.style.cursor='pointer'"> <!-- addchat() 채팅추가 탭 -->
				</div>
				<form id="chatChatBoxx" style = "margin-top : 14px;"></form>
			</div>
		</div>
		<div class="cosTalk-chatFunction" id="cFuc">
			<div class="cosTalk-chatFunctionT">
				<input type="button" id="bBtn">
				<form id="chatNameBoxx"></form>
			</div>
			<div id="chatView" class = "chatVieww" style = "margin-left : -34px; width : 324px;"></div>
			<form id="submitForm"
				action="<%=request.getContextPath()%>/CosTalkSendServlet"
				method="post">
				<div class="cosTalk-chatFunctionW">
					<div style="float: left; width: 80%; height: 48%;">
						<textarea id="msg"
							style="background-color: white; width: 98%; height: 50px; border: none; outline: none; resize: none; margin-left: 4%; margin-top: 8px; font-size: 10pt;"
							name="sMessage"></textarea>
					</div>
					
				</div>
			</form>
		</div>
		<div class="chatAdd" id="chatAddd">
			<input type="button" id="bBtnn" style = "background-color : #FFD2D7;">
			<div style = "font-size : 14pt; margin-top : 25px; float : left; margin-left : 12px; font-weight : 600;">채팅 추가</div>
			<div>
				<input type="text" value="이름을 입력해 주세요" class="chatAddW" id="rName" style = "padding : 10px;">
			</div>
			<form id="memberViewForm"></form>
		</div>
	</div>
	<!-- </div> -->

	<script>
		
		function cosTalkOpen() {
////////////0.코스톡 버튼 눌러서 켰을 시 처음 실행되는 화면/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			$("#chatBtnn1").hide();
			$("#friendBtnn2").hide();
			$("#cTab").show();
			$("#chatBtnn2").hide();
			$("#cFuc").hide();
			$("#chatAddd").hide();
			
			//0-1.변수 선언
			var modal = document.getElementById('cosTalk'); //코스톡 창 자체
			var btn = document.getElementById("cosTalkBtn"); //코스톡 켤때 아이콘 버튼
			var btn2 = document.getElementById("xBtn"); //x버튼
			var costalkOn = 1; //코스톡 실행했을 시에만 setinterval돌도록 하기
			//0-2.코스톡 켜기
			btn.onclick = function() {
				modal.style.display = "block";
			}
			//0-3.코스톡 끄기
			btn2.onclick = function() {
				modal.style.display = "none";
			}
			
			//0-4.하위 변수 선언
			
			var cTab = document.getElementById("cTab"); //채팅 탭
			var fBtn2 = document.getElementById("friendBtnn2");//채팅 탭에서의 하트
			var cBtn2 = document.getElementById("chatBtnn2");//채팅 탭에서의 말풍선

			var bBtn = document.getElementById("bBtn"); //채팅추가 탭에서의 뒤로가기 버튼
			var bBtnn = document.getElementById("bBtnn"); //채팅방에서의 뒤로가기 버튼
			
			var chat = document.getElementById("chatCustomerBtn");//?
			
			//0-6.채팅추가 뒤로가기  -> 채팅으로 가기
			bBtn.onclick = function() {
				$("#chatBtnn1").hide();
				$("#chatBtnn2").hide();
				$("#friendBtnn2").hide();
				$("#chatBtnn2").hide();
				$("#cFuc").hide();
				$("#chatAddd").hide();
				$(".cosTalk-content").show();
				$("#friendBtnn1").show();
				$("#cTab").show();

// 				var currentLocation = window.location.href;
// 				//$("#cosTalk").load(currentLocation + ' #cosTalk');
// 				console.log(currentLocation + '#cosTalk');

// 				location.reload();
// 				$(".cosTalk-content").show();
// 				$("#friendBtnn1").show();
// 				$("#cTab").show();
			}
			
			//0-7.채팅방 뒤로가기 -> 채팅으로 가기
			bBtnn.onclick = function() {
				$("#chatBtnn1").hide();
				$("#chatBtnn2").hide();
				$("#friendBtnn2").hide();
				$("#chatBtnn2").hide();
				$("#cFuc").hide();
				$("#chatAddd").hide();
				$(".cosTalk-content").show();
				$("#friendBtnn1").show();
				$("#cTab").show();
			}
			
			//채팅방 하단정렬
			

		}
		//2.채팅 탭/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
		//2-1.채팅 탭 리프레쉬 form id = "chatChatBoxx"  // 마지막인거 if(i==data.size() -1)
			setInterval(function(){
				$.ajax({
					url : '<%= request.getContextPath() %>/CosTalkChatBoxRefreshServlet',
					success : function(data){
						$('#chatChatBoxx').html("");
						for(var i in data){
							var msgLine = $('<div class="msgLine">');
							var msgBox = $('<div class="msgBox" id="msgBox' + i + '" onclick="thisChatOpen(this);" >');
							var msgInside = $('<div class="msgInside"id="msgBoxx' + i + '" " onclick="thisChatOpen(this);" >');
							var memberValue = $('<div class="memberValue">');
							var msgBoxValue = $('<div class="msgBoxValue">');
							//보이는정보들
							msgBox.text(data[i].user_id + " " + data[i].user_name );
							
							//숨기는정보들
							memberValue.text(data[i].user_id + " " + data[i].user_name);
							memberValue.css('display', 'none');
							msgBoxValue.text(data[i].reception_no);
							msgBoxValue.css('display', 'none');
							
							//메시지
							msgInside.text("  -    " + data[i].message);
							
							msgBox.css('display','inline-block');
							msgBox.css('font-size' , '10pt');
							msgBox.css('font-weight' , '200');
							msgBox.css('width', '240px');
							msgBox.css('margin-left', '-20px');
							msgBox.css('height' , '30px');
							msgBox.css('background-color' , 'pink');
							msgBox.css('text-align','left');
							msgBox.css('float' , 'left');
							
						
							msgInside.css('font-size' , '9pt');
							msgInside.css('background-color', 'pink');
							msgInside.css('width' , '240px');
							msgInside.css('height', ' 24px');
							msgInside.css('margin-left','-20px');
							msgInside.css('margin-top' , '30px');
							msgInside.css('text-align' ,'left');
							msgInside.css('text-overflow','elipsis');
							msgInside.css('white-space', 'nowrap');
							msgInside.css('max-width' , '240px');
							msgInside.css('overflow','hidden');
							msgInside.css('font-weight' , '200');
							msgInside.css('color','#595959');
							
							msgLine.css('text-align','right');
							msgLine.css('float' , 'left');
							msgLine.css('width' , '220px');
							msgLine.css('height' , '28px');
							
							
							
							msgLine.append(msgBox, memberValue, msgBoxValue,msgInside);
							$('#chatChatBoxx').append(msgLine);
							
						
							}
						}
						
					}) 
				},200);	
		//채팅 탭에서 열기 $(document).on('click','.chatChatBoxxB12',function() {
			function thisChatOpen(t){	
				$('#chatNameBoxx').html("");
				console.log("채팅방을 눌렀습니다.");
				//선택한 회원의 정보만 변수에 담기	
				//console.log(t);
				//console.log($('#' + t.id).parent().children().eq(1).text());
				//console.log($('#' + t.id).parent().children().eq(2).text());
				var rMName = $('#' + t.id).parent().children().eq(1).text();
				var rMNum = $('#' + t.id).parent().children().eq(2).text();
				
// 				var rr = $('#' + t.id).parent().children().eq(2).text();
				//채팅 추가 탭 숨기기 채팅방 보이기 
				$(".cosTalk-content").hide();
				$("#cTab").hide();
				$("#chatAddd").hide();
				$("#cFuc").show();
				$("#chatNameBoxx").show();
				$("#submitForm").show();
				$("#chatView").show();
				
				
				var friendBox = $('<div class="friendBox">');
				friendBox.text(rMName);
				friendBox.css('display', 'inline-block');
				friendBox.css('background-color' , '#FFB6C1');
				friendBox.css('margin-left', '24px');
				friendBox.css('margin-top', '24px');
				//채팅방 형성될 때 맨 마지막 메시지만 보게하고 싶은데..
				$("#chatView").scrollTop($("#chatView")[0].scrollHeight);
				//전송한 내용 controller보냄
				$("#chatNameBoxx").append(friendBox);
				$.ajax({
					url : 'CosTalkSendServlet',
					cache:false,
					data : {
						rMNum : rMNum
					}
				
				})
				var rrrrset = setInterval(function() {	
					var rr = $('#' + t.id).parent().children().eq(2).text();
					$.ajax({url : 'CosTalkRefreshServlet',
							data : {
							rMNum : rMNum
							},
							success : function(data) {
								$('#chatView').html("");							
								for ( var i in data) {
									if (data[i].reception_no == rr) {
										var msgLine = $('<div class="msgLine">');
										var msgBox = $('<div class="msgBox">');
										msgBox.text(data[i].message);
										msgBox.css('display','inline-block');	
										msgLine.css('text-align',	'right');		
										msgLine.append(msgBox);	
										$('#chatView').append(msgLine);
											
									} else {
										var msgLine = $('<div class="msgLine">');
										var msgBox = $('<div class="msgBox">');
										msgBox.text(data[i].message);
										msgBox.css('display','inline-block');
										msgLine.css('text-align','left');
										msgBox.css('background','white');
										msgLine.append(msgBox);
										$('#chatView').append(msgLine);				
									}
								}
								$('#bBtn').on('click', function(){
									clearInterval(rrrrset);
								})
							}
						});
					}, 200);			
					//채팅방에서엔터 누르기 //채팅방에 들어간 횟수만큼 메시지가 입력되어있는거아님? 그럼 뭐가문제일까
					$("#cFuc").keyup(function() {
						if (window.event.keyCode == 13) {	
							var sMessage = $("#msg").val();	
							//var rName = $("#rName").val();	
							$.ajax({
								url : 'CosTalkSendServlet',
								data : {
									rMNum : rMNum,
									sMessage : sMessage
								},
								success : function(data) {
									for ( var i in data) {
										var msgLine = $('<div class="msgLine">');
										var msgBox = $('<div class="msgBox">');		
										msgBox.text(data[i].message);
										msgBox.css('display','inline-block');
										msgLine.css('text-align','right');	
										msgLine.append(msgBox);
										$('#chatView').append(msgLine);
									}
									document.getElementById("msg").value = '';	
									document.getElementById("msg").focus();
									$("#chatView").scrollTop($("#chatView")[0].scrollHeight);		
									console.log("그니까 이게 두번도는거죠?");
								},
								
							});
						}
					});
			}

						
		//3.친구 찾기 탭/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

			function addChat() {
				$("#cTab").hide();
				$("#friendBtnn2").hide();
				$("#chatBtnn2").hide();
				$("#fTab").hide();
				$("#friendBtnn1").hide();
				$("#chatBtnn1").hide();
				$(".cosTalk-content").hide();
				$("#cFuc").hide();
				$("#chatAddd").show();

				var search = document.getElementById("search");

				$("#rName").keyup(function() {
					var rName = $("#rName").val();
					$.ajax({
						url : '/COSMEDIC/CosTalkFindServlet',
						data : {
							rName : rName
						},success : function(data) {
							$('#memberViewForm').html("");
									for ( var i in data) {
										var rNamee = data[i].user_name;
										var rIdd = data[i].user_id;
										var rNoo = data[i].reception_no;//해당 유저의 user_no를 받아와야 함

										var memberLine = $('<div class="memberLine">');
										var memberBox = $('<div class="memberBox">');
										var memberValue = $('<div class = "memberValue">');
										var memberButton = $('<input type="button" value = "채팅 접속" class = "memberButton">');
										var dummy = $('<div class = "dummy">');
										
										memberBox.text(rNamee + " "+ rIdd);
										memberBox.css('display','inline-block');
										memberBox.css('width' , '252px');
										memberBox.css('margin-left' , '2%');
										memberBox.css('height' , '40px');
										memberBox.css('padding','10px');
										memberButton.css('height' , '40px');
										memberButton.css('margin-left' , '3px');
										memberValue.text(rNoo);
										memberValue.css('display','none');	
										dummy.css('height' , '4px');
										dummy.css('width' , '250px');
										dummy.css('float','left');
										
										memberLine.css('height','4px');
										memberLine.css('margin-top' ,'4px');
										memberLine.css('text-align','right');			
										memberLine.append(memberBox);
										$('#memberViewForm').append(memberLine,memberBox,memberValue,memberButton,dummy);				
										}			
									}
								});					
							});

			//친구 찾기 자동 비우기
				var rName = document.getElementById("rName");
				rName.onclick = function() {
					var el = document.getElementById('rName');
					el.value = '';
					}
				}
		//4.채팅방 탭/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		//4-1.채팅 추가 버튼 클릭 - > 히스토리 추가 + 채팅 추가 + 채팅방으로 이동 

			$(document).on('click','.memberButton',function() {
				$('#chatNameBoxx').html("");
				//선택한 회원의 정보만 변수에 담기
				var rMName = $(this).prev().prev().filter('div').text();
				var rMNum = $(this).prev().filter('div').text();
				//채팅방 보이기
				$("#chatAddd").hide();
				$("#chatNameBoxx").show();
				$("#chatView").show();
				$("#cFuc").show();

				var friendBox = $('<div class="friendBox">');
				friendBox.text(rMName);
				friendBox.css('display', 'inline-block');
				friendBox.css('background-color',' #FFB6C1');
				friendBox.css('margin-top','25px');

				//전송한 내용 controller보냄
				$("#chatNameBoxx").append(friendBox);
				$.ajax({
					url : 'CosTalkSendServlet',
					data : {
						rMNum : rMNum					}
				});			
				// 채팅 내역 갱신 setInterval(function(){}, 지연시간);
				setInterval(function() {
					
					$.ajax({url : 'CosTalkRefreshServlet',
							data : {
							rMNum : rMNum
							},
							success : function(data) {
								$('#chatView').html("");
								for ( var i in data) {
									if (data[i].reception_no == rMNum) {
										var msgLine = $('<div class="msgLine">');
										var msgBox = $('<div class="msgBox">');
										msgBox.text(data[i].message);
										msgBox.css('display','inline-block');	
										msgLine.css('text-align',	'right');		
										msgLine.append(msgBox);	
										$('#chatView').append(msgLine);
											
									} else {
										var msgLine = $('<div class="msgLine">');
										var msgBox = $('<div class="msgBox">');
										msgBox.text(data[i].message);
										msgBox.css('display','inline-block');
										msgLine.css('text-align','left');
										msgBox.css('background','white');
										msgLine.append(msgBox);
										$('#chatView').append(msgLine);				
									}	
								
								}
								
							}
						});
					}, 200);					
							//친추하고 엔터 누르기
							$("#cFuc").keyup(function() {
								if (window.event.keyCode == 13) {	
									var sMessage = $("#msg").val();
									//마지막 줄 enter로 공백처리되는 부분 없애주고 싶다.
									$.ajax({
										url : 'CosTalkSendServlet',
										data : {
											rMNum : rMNum,
											sMessage : sMessage
										},
										success : function(data) {
											for ( var i in data) {
												var msgLine = $('<div class="msgLine">');
												var msgBox = $('<div class="msgBox">');		
												msgBox.text(data[i].message);
												msgBox.css('display','inline-block');
												msgLine.css('text-align','right');	
												msgLine.append(msgBox);
												$('#chatView').append(msgLine);
											}	
											
											document.getElementById("msg").value = '';		
											document.getElementById("msg").focus();
											$("#chatView").scrollTop($("#chatView")[0].scrollHeight);	
										},
										
									});
								}
							});	
							
});				
		
								
	</script>
</header>