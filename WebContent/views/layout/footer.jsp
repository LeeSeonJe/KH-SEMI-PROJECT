<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/layoutCss/footer.css"
	type="text/css">

<footer>
	<div class="footer_wraper">
		<a href="#" class="footer_log">
			<img src="<%= request.getContextPath() %>/resources/images/logopink.png" alt="cosmedic skincare">
		</a>
		<ul class="about_us">
			<li><span>COSMEDIC</span> (조장: 김경섭)</li>
			<li>팀원: 김경섭, 김민주, 송도훈, 이선제, 정무지개, 최규혁</li>
			<li>KH정보교육원</li>
		</ul>
		<div class="used_badge">
			<img src="<%= request.getContextPath() %>/resources/images/java_logo.png" alt="최신 웹표준 기술인 JAVA를 적용하였습니다.">
			<img src="<%= request.getContextPath() %>/resources/images/html5_logo.png" alt="최신 웹표준 기술인 HTML5를 적용하였습니다.">
			<img src="<%= request.getContextPath() %>/resources/images/css3_logo.png" alt="최신 웹표준 기술인 CSS3를 적용하였습니다.">
			<img src="<%= request.getContextPath() %>/resources/images/javascript_logo.png" alt="최신 웹표준 기술인 JAVASCRIPT를 적용하였습니다.">
		</div>
	</div>
</footer>