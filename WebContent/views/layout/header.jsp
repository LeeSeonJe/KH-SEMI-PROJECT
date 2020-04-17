<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
   String msg = (String)request.getAttribute("msg");
%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/layoutCss/cosTalk.css"
	type="text/css">

<header>

   <div>
      <a href="<%= request.getContextPath()%>">
      	<img class="logo" src="<%= request.getContextPath() %>/resources/images/logopink.png"></a>
      <nav class="gnb"> <!-- 글로벌네비게이션 -->
      <form action="<%= request.getContextPath() %>/cosmetic.li">
         <ul>
            <li>
            <span>화장품</span>
               <div class="popup">
                  <ul>
                     <li>
                        <span>스킨케어</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="1">스킨</button></li>
                           <li><button type="submit" name="cos_middle_no" value="2">에센스</button></li>
                           <li><button type="submit" name="cos_middle_no" value="3">로션</button></li>
                           <li><button type="submit" name="cos_middle_no" value="4">크림</button></li>
                           <li><button type="submit" name="cos_middle_no" value="5">토너/필링패드</button></li>
                           <li><button type="submit" name="cos_middle_no" value="6">페이스오일</button></li>
                           <li><button type="submit" name="cos_middle_no" value="7">미스트</button></li>
                           <li><button type="submit" name="cos_middle_no" value="8">메이크업픽스</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>클렌징</span>
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
                        </ul>
                     </li>
                     <li>
                        <span>베이스메이크업</span>
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
                        </ul>
                     </li>
                     <li>
                        <span>색조메이크업</span>
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
                        </ul>
                     </li>
                     <li>
                        <span>마스크/팩</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="46">마스크시트</button></li>
                           <li><button type="submit" name="cos_middle_no" value="47">수면팩</button></li>
                           <li><button type="submit" name="cos_middle_no" value="48">워시오프</button></li>
                           <li><button type="submit" name="cos_middle_no" value="49">필오프</button></li>
                           <li><button type="submit" name="cos_middle_no" value="50">수딩젤/팩</button></li>
                           <li><button type="submit" name="cos_middle_no" value="51">코팩</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>선케어</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="52">선블럭</button></li>
                           <li><button type="submit" name="cos_middle_no" value="53">선스프레이</button></li>
                           <li><button type="submit" name="cos_middle_no" value="54">선스틱</button></li>
                           <li><button type="submit" name="cos_middle_no" value="55">선쿠션</button></li>
                           <li><button type="submit" name="cos_middle_no" value="56">태닝</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>기능성화장품</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="57">링클케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="58">트러플케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="59">화이트닝케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="60">모공케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="61">아이케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="62">넥케어</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>바디/핸드/풋</span>
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
                        </ul>
                     </li>
                     <li>
                        <span>헤어</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="77">샴푸</button></li>
                           <li><button type="submit" name="cos_middle_no" value="78">린스/컨디셔너</button></li>
                           <li><button type="submit" name="cos_middle_no" value="79">트리트먼트/팩</button></li>
                           <li><button type="submit" name="cos_middle_no" value="80">헤어소품</button></li>
                           <li><button type="submit" name="cos_middle_no" value="81">헤어에센스</button></li>
                           <li><button type="submit" name="cos_middle_no" value="82">헤어스타일링</button></li>
                           <li><button type="submit" name="cos_middle_no" value="83">염색제/퍼머제</button></li>
                           <li><button type="submit" name="cos_middle_no" value="84">헤어기기</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>네일</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="85">네일컬러</button></li>
                           <li><button type="submit" name="cos_middle_no" value="86">베이스/탑코트/퀵드라이</button></li>
                           <li><button type="submit" name="cos_middle_no" value="87">네일아트/소품</button></li>
                           <li><button type="submit" name="cos_middle_no" value="88">네일영양</button></li>
                           <li><button type="submit" name="cos_middle_no" value="89">네일리무버</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>여성용품</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="90">소형</button></li>
                           <li><button type="submit" name="cos_middle_no" value="91">중형</button></li>
                           <li><button type="submit" name="cos_middle_no" value="92">대형</button></li>
                           <li><button type="submit" name="cos_middle_no" value="93">오버나이트</button></li>
                           <li><button type="submit" name="cos_middle_no" value="94">팬티라이너</button></li>
                           <li><button type="submit" name="cos_middle_no" value="95">체내형</button></li>
                           <li><button type="submit" name="cos_middle_no" value="96">청결제</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>미용렌즈</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="97">컬러렌즈</button></li>
                           <li><button type="submit" name="cos_middle_no" value="98">렌즈관리용품</button></li>
                           <li><button type="submit" name="cos_middle_no" value="99">투명렌즈</button></li>                        
                        </ul>
                     </li>
                     <li>
                        <span>향수</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="100">여성향수</button></li>
                           <li><button type="submit" name="cos_middle_no" value="101">남성향수</button></li>
                           <li><button type="submit" name="cos_middle_no" value="102">방향제</button></li>
                           <li><button type="submit" name="cos_middle_no" value="103">향초</button></li>
                           <li><button type="submit" name="cos_middle_no" value="104">디퓨저</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>기타제품</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="105">브러쉬</button></li>
                           <li><button type="submit" name="cos_middle_no" value="106">스펀지/퍼프</button></li>
                           <li><button type="submit" name="cos_middle_no" value="107">뷰러</button></li>
                           <li><button type="submit" name="cos_middle_no" value="108">페이스소품</button></li>
                           <li><button type="submit" name="cos_middle_no" value="109">아이소품</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>베이비&맘</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="110">베이비스킨케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="111">베이비바디</button></li>
                           <li><button type="submit" name="cos_middle_no" value="112">베이비클렌저/샴푸</button></li>
                           <li><button type="submit" name="cos_middle_no" value="113">베이비선케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="114">키즈제품</button></li>
                           <li><button type="submit" name="cos_middle_no" value="115">맘케어</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>바디라인</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="116">바디슬리밍</button></li>
                           <li><button type="submit" name="cos_middle_no" value="117">제모제/용품</button></li>
                           <li><button type="submit" name="cos_middle_no" value="118">건강/다이어트식품</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>남성화장품</span>
                        <ul>
                           <li><button type="submit" name="cos_middle_no" value="119">클렌징</button></li>
                           <li><button type="submit" name="cos_middle_no" value="120">스크럽/필링</button></li>
                           <li><button type="submit" name="cos_middle_no" value="121">쉐이빙</button></li>
                           <li><button type="submit" name="cos_middle_no" value="122">애프터쉐이브</button></li>
                           <li><button type="submit" name="cos_middle_no" value="123">마스크/팩</button></li>
                           <li><button type="submit" name="cos_middle_no" value="124">메이크업</button></li>
                           <li><button type="submit" name="cos_middle_no" value="125">선케어</button></li>
                           <li><button type="submit" name="cos_middle_no" value="126">헤어/바디</button></li>
                        </ul>
                     </li>  
                  </ul>
               </div>
            </li>
            <li><a href="<%= request.getContextPath()%>/brand.li">브랜드</a></li>
            <li><a href="<%= request.getContextPath() %>/list.re">리뷰</a></li>

			<li><a href="<%= request.getContextPath()%>/hospital.li">병원</a></li>
			<li><a href="<%= request.getContextPath() %>/worryList.bo">고민</a></li>
			</ul>
			</form>
		</nav>
		
		<% if(loginUser == null) { %>
		<span id="login" class="login"><a style =  "color : #DF1758;" href="<%= request.getContextPath() %>/views/common/login.jsp">로그인</a></span>
		<% } else if(loginUser.getUser_id().equals("admin")) { %>
		<span id="login" class="login"><label onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</label></span>
		<span id="login" class="login"><label><%= loginUser.getUser_name() %></label></span>
		<span id="login" class="login"><label onclick="location.href='<%= request.getContextPath() %>/user.admin'">관리자페이지</label></span>
		<% } else { %>
		
		<span id="login" class="login"><label onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</label></span>
		<span id="login" class="login"><label><a href="<%= request.getContextPath()%>/views/member/myPage.jsp"><%= loginUser.getUser_name() %></a></label></span>
		<span id="login" class="login"><img src="resources/images/mail1.png" style = "width : 50px; height : 50px; margin-top : -15px;" onclick = "cosTalkOpen();" id = "cosTalkBtn"></span>
		<% } %>
		<%-- <span class="sch">
			<button type="button"><img src="<%= request.getContextPath() %>/resources/images/search_icon.png"></button>
			<input type="text" placeholder="검색어를 입력하세요.">
		</span> --%>
	</div>
	<div>
		<div id = "cosTalk" class = "modal">
			<div>
				<div><input class = "cTfunction" type = "button" id = "xBtn" ></div>
			</div>
			<div class = "cosTalk-content">
				<div style = "margin-top : 40px; margin-left : 5px; float : left">
					<input type = "button" class = "friendBtn" id = "friendBtnn1">
				</div>
				<div style = "margin-top : 20px; margin-left : 5px;float : left">
					<input type = "button" class = "chatBtn" id = "chatBtnn1">
				</div>
				<div style = "margin-top : 40px; margin-left : -5px;float : left">
					<input type = "button" class = "friendBtn" id = "friendBtnn2">
				</div>
				<div style = "margin-top : 20px; margin-left : 5px;float : left">
					<input type = "button" class = "chatBtn" id = "chatBtnn2">
				</div>				
			</div>
			<div class = "cosTalk-friendTab" id = "fTab">
				<div style = "font-size : 15pt; margin-left : -5px; font-weight : 600;">
					친구
				</div>
				<div style = "width : 100% ; height : 40px; margin-top : 18px;">
					<input type = "button" class = "friendPersonBtn" id = "friendCustomerBtnn" value = "              이선제">
				</div>
			</div>
			<div class = "cosTalk-chatTab" id = "cTab">
				<div style = "font-size : 15pt; margin-left : -4px; font-weight : 600;">
					채팅
					<div style = "float : right; margin-right : 10px;">
					</div>
					<div style = "width : 90% ; height : 40px; margin-top : 18px; margin-left : 4px; cursor : pointer" id = "chatCustomerBtn" >
						<input type = "button" class = "friendPersonBtn" id = "chatCustomerBtnn" >
						<div style = "float : left; font-size : 9pt; margin-top : 11px; margin-left : 8px; width : 70%;">이선제</div>
						<div style = "float : left; font-size : 8pt; margin-left : 8px; font-weight : 100; margin-top : 2px;">규혁아 뒤질래?</div>
					</div>
				</div>
			</div>
			<div class = "cosTalk-chatFunction" id = "cFuc">
				<div class = "cosTalk-chatFunctionT">
					<input type = "button" id = "bBtn">
					<img src = "<%=request.getContextPath()%>/resources/images/face.png" style = "margin-top : 15px; margin-left : 12px; float : left">
					<div>
					<h3 style = "font-size : 11pt; font-weight : 600; margin-left : 6px; margin-top : 32px; float : left;">
						이선제
					</h3>
					</div>
				</div>
				<div id = "chatView">
				</div>
				<form id = "submitForm" onsubmit = "return false">
					<div class = "cosTalk-chatFunctionW">
						<div style = "float : left; width : 80%; height : 48%;">
							<textarea id = "msg" style = "background-color : white; width : 98%; height : 50px; border: none; outline : none; resize : none; margin-left : 4%; margin-top : 8px; font-size : 10pt;"></textarea>
						</div>
						<input type = "submit" id = "send" value = "전송" style = "background-color : yellow; width : 17%; height : 60px; border : none; outline : none; reslize : none; margin-top : 3px; margin-left : 6px;">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	function cosTalkOpen(){
		//외부기능
		$("#chatBtnn2").hide();
		$("#friendBtnn2").hide();
		$("#cTab").hide();
		$("#cFuc").hide();
	
		
        var modal = document.getElementById('cosTalk');
        var btn = document.getElementById("cosTalkBtn");
         
        var btn2 = document.getElementById("xBtn");
 		
        var fTab = document.getElementById("fTab");
        var cTab = document.getElementById("cTab");
        
        var fBtn1 = document.getElementById("friendBtnn1");
        var cBtn1 = document.getElementById("chatBtnn1");
        var fBtn2 = document.getElementById("friendBtnn2");
        var cBtn2 = document.getElementById("chatBtnn2");
        
        var member = document.getElementById("friendCustomerBtnn");
        
        var bBtn = document.getElementById("bBtn");
        var chatM = document.getElementById("chatCustomerBtnn");
        var chat = document.getElementById("chatCustomerBtn");
        
        btn.onclick = function() {
            modal.style.display = "block";
        }
 
        btn2.onclick = function() {
            modal.style.display = "none";
        }
        
        cBtn1.onclick = function(){
        	$("#fTab").hide();
        	$("#friendBtnn1").hide();
        	$("#chatBtnn1").hide();
        	$("#cTab").show();
        	$("#friendBtnn2").show();
        	$("#chatBtnn2").show();
        	$("#cFuc").hide();
        	
        }
        
        fBtn2.onclick = function(){
        	$("#cTab").hide();
        	$("#friendBtnn2").hide();
        	$("#chatBtnn2").hide();
        	$("#fTab").show();
        	$("#friendBtnn1").show();
        	$("#chatBtnn1").show();
        	$("#cFuc").hide();
        }
        
        member.onclick = function(){
        	$("#cTab").hide();
        	$("#friendBtnn2").hide();
        	$("#chatBtnn2").hide();
        	$("#fTab").hide();
        	$("#friendBtnn1").show();
        	$("#chatBtnn1").show();
        	$(".cosTalk-content").hide();
        	$("#cFuc").show();
        }
        
        chatM.onclick = function(){
        	$("#cTab").hide();
        	$("#friendBtnn2").hide();
        	$("#chatBtnn2").hide();
        	$("#fTab").hide();
        	$("#friendBtnn1").show();
        	$("#chatBtnn1").show();
        	$(".cosTalk-content").hide();
        	$("#cFuc").show();
        }
        
        chat.onclick = function(){
        	$("#cTab").hide();
        	$("#friendBtnn2").hide();
        	$("#chatBtnn2").hide();
        	$("#fTab").hide();
        	$("#friendBtnn1").show();
        	$("#chatBtnn1").show();
        	$(".cosTalk-content").hide();
        	$("#cFuc").show();
        }
        
        bBtn.onclick = function(){
        	$("#cFuc").hide();
        	$(".cosTalk-content").show();
        	$("#fTab").show();
        	$("#friendBtnn2").hide();
        	$("#chatBtnn2").hide();
        }
        
        //채팅기능
        
		var socket = io();
        
	    var chatView = document.getElementById('chatView');
	    var chatForm = document.getElementById('chatForm');
 
 	   chatForm.addEventListener('submit', function() {
 	       var msg = $('#msg');
 
 	       if (msg.val() == '') {
 	           return;
                 
  	       } else {
  	          socket.emit('SEND', msg.val());
 
    	        var msgLine = $('<div class="msgLine">');
    	        var msgBox = $('<div class="msgBox">');
 
   	 	        msgBox.append(msg.val());
	            msgBox.css('display', 'inline-block');
       	        msgLine.css('text-align', 'right');
       	        msgLine.append(msgBox);
 
    	        $('#chatView').append(msgLine);
 
      	        msg.val('');
    	        chatView.scrollTop = chatView.scrollHeight;
             }
  	    });
        
        socket.on('SEND', function(msg) {
            var msgLine = $('<div class="msgLine">');
            var msgBox = $('<div class="msgBox">');
                    
            msgBox.append(msg);
            msgBox.css('display', 'inline-block');
     
            msgLine.append(msgBox);
            $('#chatView').append(msgLine);
     
            chatView.scrollTop = chatView.scrollHeight;
        });
 


	}
	
	</script>
</header>