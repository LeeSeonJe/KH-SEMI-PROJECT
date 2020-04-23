<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, inquiry.model.vo.Inquiry"%>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/views/layout/import.jsp" %>
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

#myReservation {
	text-align: center;
}

#myReservation>thead>tr>th {
    width: 99px;
    text-align: center;
    font-size: 16px;
    border-block-end: 1px solid black;
    height: 48px;
}

#myReservation>tbody>tr>td {
	height: 45px;
}

#myQnA-writer {
	text-align: center;
}

#myQnA-writer {
	text-align: center;
}

#myQnA-writer {
	text-align: center;
}
.title{
	text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    width: 150px;
}
</style>
</head>
<body>
	<div class="contents">
      <%@ include file="/views/layout/header.jsp"%>
      <hr>
      <section id="page-name">
         <h2>병원 1대1 문의 페이지</h2>
      </section>
      <hr>
      <div id="main-div">
         <section id="nav-tab">
            <ul id="nav-tab-ul">
               <li onclick="location.href = '<%= request.getContextPath()%>/mypage.hos'">내정보관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/bookControl.hos'">예약 관리</li>
               <li style="background: #f2d0e0" onclick="location.href = '<%= request.getContextPath()%>/hospitalQnA.hos'">1대1 문의</li>
            </ul>
         </section>
		<section id="tab-myQnA" class="tab-mypage">
				<div id="tab-title">1대1 문의</div>
				<div id="tab-title-detail">고객님께서 불편을 드려서 죄송합니다. 최선을 다하겠습니다.</div>
				<hr>
				<table id="myReview" class="table-standard">
					<thead>
						<tr>
							<th class="review-title">번호</th>
							<th id="title2" class="review-title">제목</th>
							<th class="review-title">작성일</th>
							<th class="review-title">답변여부</th>
							<th class="review-title">조회</th>
						</tr>
					</thead>
					<tbody id="tbody">
	               	  <% if(list.isEmpty()) { %>
	               	  	 <tr>
	               	  	 	<td colspan="5">조회된 리스트가 없습니다.</td>
	               	  	 </tr>
	               	  <% } else { %>
		               	  <% for(Inquiry i : list) { %>
		               	  <tr>
		                     <td><%=i.getBoard_no() %></td>
		                     <td><div class="title"><%=i.getBoard_title() %></div></td>
		                     <td><%= i.getBoard_date() %></td>
		                     <% if(i.getAnswer_yn().equals("N")){ %>
		                     	<td style="font: bold;">대기중</td>
		                     <% } else { %>
		                     	<td style="font: bold;">답변완료</td>
		                     <% } %>
		                     
		                     <% if(i.getAnswer_yn().equals("Y")){ %>
		                     	<td style="font: bold; color: red;"><label id="answerStatus">조회</label></td>
		                     <% } else { %>
		                     	<td></td>
		                     <% } %>
		                  </tr>
		               	  <% } %>
	               	  <% } %>
	               </tbody>
				</table>
				<div>
					<button id="QnA-btn"class="btn-standard">문의하기</button> 				
				</div> 
			</section>
		</div>
	</div>
	<script>
	$('#QnA-btn').on('click', function(){
		window.open('<%=request.getContextPath()%>/views/customer/sendQnA.jsp', "sendQnA", "width=550, height=600");
	})
	
	$('#answerStatus').click(function(){
		var board_no = $(this).parent().parent().children().eq(0).text();
		var popup = window.open("<%=request.getContextPath()%>/InqDetail.hos?board_no="+ board_no, "answerStatusPopUp", "width=550, height=820");
	});
	</script>
</body>
</html>