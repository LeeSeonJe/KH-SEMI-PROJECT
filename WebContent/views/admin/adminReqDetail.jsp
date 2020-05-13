<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="review.model.vo.*, java.util.*"%>
<%
	Review r = (Review)request.getAttribute("board");
	ArrayList<AddFile> fileList = (ArrayList<AddFile>)request.getAttribute("fileList");
//	AddFile af = fileList.get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<h1>아래 제품의 등록을 요청합니다. </h1>
	<hr>
	<h2>이미지를 클릭하면 다운로드됩니다.</h2>
	<div id="reqImg">
		<% for(int i = 0; i<fileList.size(); i++){ %>
		<a download="<%= fileList.get(i).getChange_name() %>"
			href="<%= request.getContextPath() %>/AddFile/<%= fileList.get(i).getChange_name()%>">
			<img style="width: 200px; height: 200px;" src="<%= request.getContextPath() %>/AddFile/<%= fileList.get(i).getChange_name() %>">
		</a>
		<% } %>
	</div>
	<hr>
	<h2>등록 요청 내용</h2>
	<div id="reqContent">
		<p>
		<% String content = r.getContent();
			if(content == null){ %>
			(내용 없음)
		<% } else { %>
			<%= r.getContent() %>
			<% } %>
		</p>
	</div>
</body>
</html>