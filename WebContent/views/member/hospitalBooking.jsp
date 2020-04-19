<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="book.model.vo.Book, java.util.*,
    org.json.simple.*, org.json.simple.parser.JSONParser,
    org.json.simple.parser.ParseException"%>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
	String json;
	JSONArray ja = new JSONArray();
	for(int i=0; i<list.size(); i++){
		JSONObject inner = new JSONObject();
		inner.put("end", list.get(i).getBooking_date()+"T"+(Integer.parseInt(list.get(i).getBooking_time())+1));
		inner.put("start", list.get(i).getBooking_date()+"T"+list.get(i).getBooking_time());
		inner.put("title", list.get(i).getBooking_name() +" : "+ list.get(i).getBooking_content());
		ja.add(inner);
	}
	
	json = ja.toJSONString();
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
</style>
<link  rel='stylesheet'  href='<%=request.getContextPath() %>/fullcalendar/fullcalendar.css'  />  
<script src='<%=request.getContextPath() %>/lib/jquery.min.js'></script>  <script src='<%=request.getContextPath() %>/lib/moment.min.js'></script>  
<script src='<%=request.getContextPath() %>/fullcalendar/fullcalendar.js'></script>
</head>
<body>
   <div class="contents">
      <%@ include file="/views/layout/header.jsp"%>
      <hr>
      <section id="page-name">
         <h2>병원 마이 페이지</h2>
      </section>
      <hr>
      <div id="main-div">
         <section id="nav-tab">
            <ul id="nav-tab-ul">
               <li onclick="location.href = '<%= request.getContextPath()%>/mypage.hos'">내정보관리</li>
               <li style="background: #f2d0e0" onclick="location.href = '<%= request.getContextPath()%>/bookControl.hos'">예약 관리</li>
               <li onclick="location.href = '<%= request.getContextPath()%>/hospitalJoin.admin'">1대1 문의</li>
            </ul>
         </section>
         
         <section id="tab-myControl" class="tab-mypage">
				<div id="tab-title">예약 관리</div>
				<div id="tab-title-detail"></div>
				<hr>
				<div id="calendar" style="width: 1024px;"> </div>
				<script>
					$(function () {
						var json = <%= json %>;
					 $('#calendar').fullCalendar({
					  header:{
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaWeek, agendaDay,listMonth'
					  },
					  /* defaultDate : '2020-04-12',  */
					  weekNumbers:false,
					  navLinks:true,
					  editable:false,
					  eventLimit: true,
					  lang:'ko',
					  
					  selectable : true,
					  selectHelper:true,
					  
					  events: json,
					  eventClick: function(event) {
						    if (event.url) {
						        window.open(event.url, "_blank");
						        return false;
						    }
						}
					 })
					});
				</script>
				
		</section>		      
      </div>
   </div>   

   <%@ include file="/views/layout/footer.jsp"%>
   
   <script>


   </script>
   <script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
   
</body>
</html>