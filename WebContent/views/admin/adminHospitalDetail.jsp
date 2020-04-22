<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, hospital.model.vo.Hospital"%>
<%
	Member m = (Member)request.getAttribute("m");
	Hospital h = (Hospital)request.getAttribute("h");
%>
<!DOCTYPE html>
<style>
div>section#nav-tab {
	display: inline-block;
    background-color: #f8f8fb;
    width: 180px;
    min-height: 100px;
    color: black;
	/* position: relative; */
}

#nav-tab>ul>li {
	text-align: center; 
	padding: 25px;
	cursor: pointer;
	font-size: 15px;
}

#nav-tab>ul>li:hover {
	background-color: #f2d0e0;
}

div>section#page-name {
	margin-left: 70px;
}

div>section.tab-mypage {
	display: inline-block;
    /* position: absolute; */
    padding-left: 100px;
    padding-top: 20px;
}

#tab-title {
	width: 170px;
    font-size: 25px;
    font-weight: 900;
    display: inline-block;
}

#tab-title-detail {
	display: inline-block; 
	min-width: 500px;
}

table.table-standard {
	display: inline-block;
}

table#myInform>tbody>tr>td {
    height: 65px;
    padding: 18px;
    border-bottom: 1px solid gray;
}

table#myInform>tbody>tr>td.tab-myControl-category {
	width: 170px;
}

table#myInform>tbody>tr>td.tab-myControl-content {
	width: 700px;
}


table#myInform2>tbody>tr>td {
    height: 65px;
    padding: 18px;
    border-bottom: 1px solid gray;
}

table#myInform2>tbody>tr>td.tab-myControl-category {
	width: 170px;
	text-align: left;
}
table#myInform2>tbody>tr>td.tab-myControl-content1 {
	width: 230px;
}
table#myInform2>tbody>tr>td.tab-myControl-content2 {
	width: 230px;
}

.skinType {
	padding: 10px;
}

#btn-category {
	margin: auto;
    width: 50%;
    margin-top: 20px; 
}

#btn-category>form>button {
	margin-right: 15px;
}
#main-div{
	display: inline-flex;
}

#myReview {
	text-align: center;
}

table#myReview>thead>tr>th {
    height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:90px;
}

table#myReview>thead>tr>th#title2 {
	width:420px;
}

table#myReview>tbody>tr>td {
	height: 45px;
}

#myPost {
	text-align: center;
}

table#myPost>thead>tr>th {
    height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:90px;
}

table#myPost>thead>tr>th#title2 {
	width:420px;
}

table#myPost>tbody>tr>td{
	height: 45px;
}
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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="tab-myControl" class="tab-mypage">
		<div id="tab-title-detail"></div>
		<hr>
		<table id="myInform" class="table-standard">
			<tbody>
				<tr>
					<td class="tab-myControl-category">아이디</td>
					<td class="tab-myControl-content"><%= m.getUser_id() %></td>
				</tr>
				<tr>
					<td class="tab-myControl-category">병원 명</td>
					<td class="tab-myControl-content"><%= m.getUser_name() %></td>
				</tr>
				<tr>
					<td class="tab-myControl-category">이메일</td>
					<td class="tab-myControl-content"><%= h.getEmail() %></td>
				</tr>
				<tr>
					<td class="tab-myControl-category">병원 전화번호</td>
					<td class="tab-myControl-content"><%= h.getTel() %></td>
				</tr>
				<tr>
					<td class="tab-myControl-content-category">병원 주소</td>
					<td class="tab-myControl-content"><%= h.getAddress() %></td>
				</tr>
			</tbody>
		</table>
		<table id="myInform2">
				<tr>
					<td class="tab-myControl-category">사업자 등록증</td>
					<td class="tab-myControl-content1"><img src='<%= request.getContextPath() %>/hospital_images/<%= h.getRegi() %>' width="200" height="200"></td>
					<td class="tab-myControl-content2" style="width="200" height="200""></td>
					<td class="tab-myControl-content2" style="width="200" height="200""></td>
				</tr>
				<tr>
					<td class="tab-myControl-category">병원 이미지</td>
					<% String[] images = h.getHospital_img().split(","); %>
					<% for(int i=0; i<images.length; i++){ %>
						<td class="tab-myControl-content2"><img src='<%= request.getContextPath() %>/hospital_images/<%= images[i] %>' width="200" height="200"></td>
					<% } %>
					<% if(images.length == 1) { %>
						<td class="tab-myControl-content2" style="width="200" height="200""></td>
						<td class="tab-myControl-content2" style="width="200" height="200""></td>
					<% } else if(images.length == 2){%>
						<td class="tab-myControl-content2" style="width="200" height="200""></td>					
					<% } %>
				</tr>
		</table>
		<table id="myInform" class="table-standard">
			<tbody>
				<tr>
					<td class="tab-myControl-category">병원 설명</td>
					<td class="tab-myControl-content"><textarea style = "height : 300px; width : 700px; font-size : 13pt; margin-top : 10px ; padding-top : 5px; resize:none;" name="about"><%= h.getHospital_about() %></textarea></td>
				</tr>
			</tbody>
		</table>
		<div style="text-align: center;"><input type="button" class="btn-standard" id="cancle" value="닫기" onclick="window.close();"></div>
	</section>		      
</body>
</html>