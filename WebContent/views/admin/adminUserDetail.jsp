<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, customer.model.vo.*"%>
<%
	Member m = (Member)request.getAttribute("m");
	Customer c = (Customer)request.getAttribute("c");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		margin: 0 auto;
		padding: 0;
		box-sizing: border-box;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.index{margin: 30px; display: inline-block; width: 100px;}
	
	.info{display: inline-block; border: 1px solid black; min-width: 300px; min-height: 40px;}
	.btn-standard {
    border: 1px solid #ccccce;
    border-radius: 6px;
    background-color: #fff;
    font-weight: 500;
    color: #666;
    cursor: pointer;
    font-size: 12px;
    padding: 7px;
}
</style>
</head>
<body>
	<div class="index">아이디</div>
	<div class="info" id="id"><%= m.getUser_id() %></div><br>
	<div class="index">이름</div>
	<div class="info" id="name"><%= m.getUser_name() %></div><br>
	<div class="index">이메일</div>
	<div class="info" id="email"><%= c.getEmail() %></div><br>
	<div class="index">성별</div>
	<div class="info" id="gender"><%= c.getGender() %></div><br>
	<div class="index">연령대</div>
	<div class="info" id="age"><%= c.getAge() %></div><br>
	<div class="index">피부 타입</div>
	<div class="info" id="skintype"><%= c.getSkintype() %></div><br>
	<div class="index">프로필 사진</div>
	<% if(c.getProfile_image() == null) { %>
		<img src="<%=request.getContextPath()%>/member_images/1.jpg" style="border-radius: 50px; width: 200px; height: 200px;"><br>
	<% } else { %>
		<img src="<%=request.getContextPath()%>/member_images/<%= c.getProfile_image() %>" style="border-radius: 50px; width: 200px; height: 200px;"><br>
	<% } %>
	
	<div style="text-align: center;"><input type="button" class="btn-standard" id="cancle" value="닫기" onclick="window.close();"></div>
</body>
</html>