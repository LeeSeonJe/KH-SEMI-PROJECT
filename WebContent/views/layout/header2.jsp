<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="member.model.vo.Member"%>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg");
%>
<header>
   <div>
      <a  href="<%= request.getContextPath() %>">
      	<img class="logo" src="<%= request.getContextPath() %>/resources/images/logopink_2.png">
      </a> <!-- 로고 -->
      <nav class="gnb"> <!-- 글로벌네비게이션 -->
      <form action="<%= request.getContextPath() %>/views/cosmetic/cosmeticRank.jsp">
         <ul>
         	<li>
         	</li>
            <li>
            <span >화장품</span>
               <div class="popup">
                  <ul>
                     <li>
                        <span>스킨케어</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="1">스킨</button></li>
                           <li><button type="submit" name="cosmetic" value="2">에센스</button></li>
                           <li><button type="submit" name="cosmetic" value="3">로션</button></li>
                           <li><button type="submit" name="cosmetic" value="4">크림</button></li>
                           <li><button type="submit" name="cosmetic" value="5">토너/필링패드</button></li>
                           <li><button type="submit" name="cosmetic" value="6">페이스오일</button></li>
                           <li><button type="submit" name="cosmetic" value="7">미스트</button></li>
                           <li><button type="submit" name="cosmetic" value="8">메이크업픽스</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>클렌징</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="9">클렌징폼</button></li>
                           <li><button type="submit" name="cosmetic" value="10">클렌징오일</button></li>
                           <li><button type="submit" name="cosmetic" value="11">클렌징말크</button></li>
                           <li><button type="submit" name="cosmetic" value="12">클렌징크림</button></li>
                           <li><button type="submit" name="cosmetic" value="13">클렌징워터</button></li>
                           <li><button type="submit" name="cosmetic" value="14">클렌징젤</button></li>
                           <li><button type="submit" name="cosmetic" value="15">스크렙/필링</button></li>
                           <li><button type="submit" name="cosmetic" value="16">포인트리무버</button></li>
                           <li><button type="submit" name="cosmetic" value="17">클렌징티슈</button></li>
                           <li><button type="submit" name="cosmetic" value="18">클렌징비누</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>베이스메이크업</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="19">메이크업베이스</button></li>
                           <li><button type="submit" name="cosmetic" value="20">톤업크림</button></li>
                           <li><button type="submit" name="cosmetic" value="21">베이스프라이머</button></li>
                           <li><button type="submit" name="cosmetic" value="22">포인트프라이머</button></li>
                           <li><button type="submit" name="cosmetic" value="23">파운데이션</button></li>
                           <li><button type="submit" name="cosmetic" value="24">비비크림</button></li>
                           <li><button type="submit" name="cosmetic" value="25">씨씨크림</button></li>
                           <li><button type="submit" name="cosmetic" value="26">쿠션타입</button></li>
                           <li><button type="submit" name="cosmetic" value="27">컨실러</button></li>
                           <li><button type="submit" name="cosmetic" value="28">팩트</button></li>
                           <li><button type="submit" name="cosmetic" value="29">파우더</button></li>
                           <li><button type="submit" name="cosmetic" value="30">트윈케익</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>색조메이크업</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="31">립스틱</button></li>
                           <li><button type="submit" name="cosmetic" value="32">립글로스/락커</button></li>
                           <li><button type="submit" name="cosmetic" value="33">립틴트</button></li>
                           <li><button type="submit" name="cosmetic" value="34">립밤</button></li>
                           <li><button type="submit" name="cosmetic" value="35">립라이너</button></li>
                           <li><button type="submit" name="cosmetic" value="36">아이라이너-펜슬&젤</button></li>
                           <li><button type="submit" name="cosmetic" value="37">마스카라</button></li>
                           <li><button type="submit" name="cosmetic" value="38">픽서/영양제</button></li>
                           <li><button type="submit" name="cosmetic" value="39">아이섀도우</button></li>
                           <li><button type="submit" name="cosmetic" value="40">아이브로우-펜슬</button></li>
                           <li><button type="submit" name="cosmetic" value="41">아이브로우-파우더</button></li>
                           <li><button type="submit" name="cosmetic" value="42">아이브로우-마스카라&리퀴드</button></li>
                           <li><button type="submit" name="cosmetic" value="43">하이라이터</button></li>
                           <li><button type="submit" name="cosmetic" value="44">쉐딩</button></li>
                           <li><button type="submit" name="cosmetic" value="45">블러셔</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>마스크/팩</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="46">마스크시트</button></li>
                           <li><button type="submit" name="cosmetic" value="47">수면팩</button></li>
                           <li><button type="submit" name="cosmetic" value="48">워시오프</button></li>
                           <li><button type="submit" name="cosmetic" value="49">필오프</button></li>
                           <li><button type="submit" name="cosmetic" value="50">수딩젤/팩</button></li>
                           <li><button type="submit" name="cosmetic" value="51">코팩</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>선케어</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="52">선블럭</button></li>
                           <li><button type="submit" name="cosmetic" value="53">선스프레이</button></li>
                           <li><button type="submit" name="cosmetic" value="54">선스틱</button></li>
                           <li><button type="submit" name="cosmetic" value="55">선쿠션</button></li>
                           <li><button type="submit" name="cosmetic" value="56">태닝</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>기능성화장품</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="57">링클케어</button></li>
                           <li><button type="submit" name="cosmetic" value="58">트러플케어</button></li>
                           <li><button type="submit" name="cosmetic" value="59">화이트닝케어</button></li>
                           <li><button type="submit" name="cosmetic" value="60">모공케어</button></li>
                           <li><button type="submit" name="cosmetic" value="61">아이케어</button></li>
                           <li><button type="submit" name="cosmetic" value="62">넥케어</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>바디/핸드/풋</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="63">바디워시</button></li>
                           <li><button type="submit" name="cosmetic" value="64">바디스크럽</button></li>
                           <li><button type="submit" name="cosmetic" value="65">바디로션</button></li>
                           <li><button type="submit" name="cosmetic" value="66">바디크림</button></li>
                           <li><button type="submit" name="cosmetic" value="67">바디오일</button></li>
                           <li><button type="submit" name="cosmetic" value="68">바디미스트</button></li>
                           <li><button type="submit" name="cosmetic" value="69">바디에센스</button></li>
                           <li><button type="submit" name="cosmetic" value="70">바디팜/파우더</button></li>
                           <li><button type="submit" name="cosmetic" value="71">핸드케어</button></li>
                           <li><button type="submit" name="cosmetic" value="72">풋케어</button></li>
                           <li><button type="submit" name="cosmetic" value="73">데오도란트</button></li>
                           <li><button type="submit" name="cosmetic" value="74">목욕비누</button></li>
                           <li><button type="submit" name="cosmetic" value="75">입욕제</button></li>
                           <li><button type="submit" name="cosmetic" value="76">아로마테라피</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>헤어</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="77">샴푸</button></li>
                           <li><button type="submit" name="cosmetic" value="78">린스/컨디셔너</button></li>
                           <li><button type="submit" name="cosmetic" value="79">트리트먼트/팩</button></li>
                           <li><button type="submit" name="cosmetic" value="80">헤어소품</button></li>
                           <li><button type="submit" name="cosmetic" value="81">헤어에센스</button></li>
                           <li><button type="submit" name="cosmetic" value="82">헤어스타일링</button></li>
                           <li><button type="submit" name="cosmetic" value="83">염색제/퍼머제</button></li>
                           <li><button type="submit" name="cosmetic" value="84">헤어기기</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>네일</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="85">네일컬러</button></li>
                           <li><button type="submit" name="cosmetic" value="86">베이스/탑코트/퀵드라이</button></li>
                           <li><button type="submit" name="cosmetic" value="87">네일아트/소품</button></li>
                           <li><button type="submit" name="cosmetic" value="88">네일영양</button></li>
                           <li><button type="submit" name="cosmetic" value="89">네일리무버</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>여성용품</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="90">소형</button></li>
                           <li><button type="submit" name="cosmetic" value="91">중형</button></li>
                           <li><button type="submit" name="cosmetic" value="92">대형</button></li>
                           <li><button type="submit" name="cosmetic" value="93">오버나이트</button></li>
                           <li><button type="submit" name="cosmetic" value="94">팬티라이너</button></li>
                           <li><button type="submit" name="cosmetic" value="95">체내형</button></li>
                           <li><button type="submit" name="cosmetic" value="96">청결제</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>미용렌즈</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="97">컬러렌즈</button></li>
                           <li><button type="submit" name="cosmetic" value="98">렌즈관리용품</button></li>
                           <li><button type="submit" name="cosmetic" value="99">투명렌즈</button></li>                        
                        </ul>
                     </li>
                     <li>
                        <span>향수</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="100">여성향수</button></li>
                           <li><button type="submit" name="cosmetic" value="101">남성향수</button></li>
                           <li><button type="submit" name="cosmetic" value="102">방향제</button></li>
                           <li><button type="submit" name="cosmetic" value="103">향초</button></li>
                           <li><button type="submit" name="cosmetic" value="104">디퓨저</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>기타제품</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="105">브러쉬</button></li>
                           <li><button type="submit" name="cosmetic" value="106">스펀지/퍼프</button></li>
                           <li><button type="submit" name="cosmetic" value="107">뷰러</button></li>
                           <li><button type="submit" name="cosmetic" value="108">페이스소품</button></li>
                           <li><button type="submit" name="cosmetic" value="109">아이소품</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>베이비&맘</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="110">베이비스킨케어</button></li>
                           <li><button type="submit" name="cosmetic" value="111">베이비바디</button></li>
                           <li><button type="submit" name="cosmetic" value="112">베이비클렌저/샴푸</button></li>
                           <li><button type="submit" name="cosmetic" value="113">베이비선케어</button></li>
                           <li><button type="submit" name="cosmetic" value="114">키즈제품</button></li>
                           <li><button type="submit" name="cosmetic" value="115">맘케어</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>바디라인</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="116">바디슬리밍</button></li>
                           <li><button type="submit" name="cosmetic" value="117">제모제/용품</button></li>
                           <li><button type="submit" name="cosmetic" value="118">건강/다이어트식품</button></li>
                        </ul>
                     </li>
                     <li>
                        <span>남성화장품</span>
                        <ul>
                           <li><button type="submit" name="cosmetic" value="119">스킨</button></li>
                           <li><button type="submit" name="cosmetic" value="120">로션</button></li>
                           <li><button type="submit" name="cosmetic" value="121">에센스</button></li>
                           <li><button type="submit" name="cosmetic" value="122">크림</button></li>
                           <li><button type="submit" name="cosmetic" value="123">클렌징</button></li>
                           <li><button type="submit" name="cosmetic" value="124">스크럽/필링</button></li>
                           <li><button type="submit" name="cosmetic" value="125">쉐이빙</button></li>
                           <li><button type="submit" name="cosmetic" value="126">애프터쉐이브</button></li>
                           <li><button type="submit" name="cosmetic" value="127">마스크/팩</button></li>
                           <li><button type="submit" name="cosmetic" value="128">메이크업</button></li>
                           <li><button type="submit" name="cosmetic" value="129">선케어</button></li>
                           <li><button type="submit" name="cosmetic" value="130">헤어/바디</button></li>
                           <li><button type="submit" name="cosmetic" value="131">헤어스타일링</button></li>
                        </ul>
                     </li>	
                  </ul>
               </div>
            </li>
            <li>브랜드</li>
            <li><a href="<%= request.getContextPath() %>/views/review/reviewMain.jsp">리뷰</a></li>
			<li>병원</li>
			<li><a href="<%= request.getContextPath() %>/views/worry/worryMain.jsp">고민</a></li>
			</ul>
			</form>
		</nav>
		
		<% if(loginUser == null) { %>
		<span id="login" class="login">
			<a style =  "color : #4BD763;"  href="<%= request.getContextPath() %>/views/common/login.jsp">로그인</a>
		</span>
		<% } else { %>
		<span id="login" class="login"><label onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</label></span>
		<span id="login" class="login"><label><%= loginUser.getUser_name() %></label></span>
		<% } %>
		<%-- <span class="sch">
			<button type="button"><img src="<%= request.getContextPath() %>/resources/images/search_icon.png"></button>
			<input type="text" placeholder="검색어를 입력하세요.">
		</span> --%>
	</div>

</header>