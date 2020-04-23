<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList" import="worry.model.vo.*" %>
<%
	ArrayList<Worry> list = (ArrayList<Worry>)request.getAttribute("list");
	ArrayList<Worry> top10List = (ArrayList<Worry>)request.getAttribute("top10List");
	ArrayList<Worry> lowList = (ArrayList<Worry>)request.getAttribute("lowList");
	
	String value = (String)request.getAttribute("value");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
	Member m = ((Member)request.getSession().getAttribute("loginUser"));


%>	
	

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="/views/layout/import.jsp"%>
<style>
/*공통*/
	a:link{color: black;text-decoration: none;}
	a:visited{color: black; text-decoration: none;}
	a:hover{color: green; text-decoration: none;}
	
	.worry-table td:link{color: black;text-decoration: none;}
	.worry-table td:visited{color: black; text-decoration: none;}
	.worry-table td:hover{ text-decoration: none;}

/*고민게시판*/
	.worry-board{padding: 0 20px;}
	.sub-title{font-size : small;
				color: #666;}
	
	.board-best-wrap, .wait-comment-wrap{
		height : 190px;
		vertical-align:center;
		display:none;
		margin-left: 70px;}
	
	.board-best-wrap{display : block;} 
	
	#rank10>li, #old-list>li{
		display:inline-block; 
		width: 450px; 
		margin: 0px 35px 0px 55px;
		border-bottom: 1px solid black;
}
		

	

	
	.rank-num, .rank-dash{margin:2px 5px 2px 2px;}
			
	
	    
	.worry-board-top{position: relative;}
	    
	
	
	/*게시글*/
	.worry-list{
				position: relative;
				height: 480px;
				margin-top: 35px;}
				
	.list-order{display:flex;
				justify-content:flex-end;
				padding:5px 7px 0 0;
				margin-bottom:5px;}
				
	.worry-table{collapse:collapse;
			     border-top:1px solid #666;
			     border-bottom:1px solid #666;
				 width:1095px;
				 margin-left: 55px;}
		  
	.worry-table>thead>tr>th,
	.worry-table>tbody>tr>td{border-bottom : 1px solid #666;
		  					 text-align: center;
		  					 }
		  					 
	.worry-table>thead>tr>th{background: #f8f8f8;}

		  					 
						  	
	.tdtd{height:35px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
	#td1{width:110px; nowrap}
	#td2{width:468px; nowrap}
	#td3{width:110px; nowrap}
	#td4{width:110px; nowrap}
	#td5{width:110px; nowrap}
	#td6{width:110px; nowrap} 
	
	#write-btn{color:white;
			   background-color:black;
			   position:absolute;
			   bottom: -11px;
			   right: 114px;}
	
	#worry-table-btn{position:absolute;
					 bottom:0;
					 left:50%;}
	
	.worry-list-filter{display:flex;
					   justify-content:center;}
					   
	#worry-list-select{margin:36px 8px;}	
	
	

	
	#rankrank1{background:#f8f8f8; border-bottom: 1px solid black; border-top: 1px solid black; display: inline-block; margin-left: 57px; margin-right: 90px; width:450px;}
	#rankrank2{background:#f8f8f8; border-bottom: 1px solid black; border-top: 1px solid black; display: inline-block; width:450px;}
	
	#rank11{width:50px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; text-align: center; }
	#rank21{width:330px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; margin-left:0; text-align: center;}
	#rank31{width:50px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; margin-left:0; text-align: center;}
	
	#rank12{width:50px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; text-align: center; margin-left: 0px;}
	#rank22{width:330px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; margin-left: 0x; text-align: center;}
	#rank32{width:50px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; margin-left: 0px; text-align: center;}
	
	#rank1{width:20px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; background:LightGrey; text-align: center; margin-left:20px; margin-top: 6px; }
	#rank2{width:300px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; margin-left:30px; }
	#rank3{width:30px; height: 20px; display:inline-block; overflow:hidden; text-overflow: ellipsis; white-space: nowrap; margin-left: 30px;}
  	#topListNum{display: none;} 
 	#fail{text-align:center;}
 	.best{display: inline-block; font-size:2em;} 
 	.reply{display: inline-block; cursor:pointer;}
 	.reply:hover{text-decoration: underline;}
 	.pagingArea{position:absolute; top:460px; left:50%; transform:translateX(-50%);} 

	select {
    position: relative;
    width: 150px;
    height: 40px;
    background: url(select_arrow.png) 180px center no-repeat; /* 화살표 이미지 */
    border: 1px solid #E9DDDD;
    
	}
	.sch{margin-left: 10px;}
	#select{left: -106px;}
	#worry-list-select{margin-top: 29px; margin-left: -101px;}
</style>


</head>
<body>
	<div class="contents">
		<%@ include file="/views/layout/header.jsp"%>
		<hr>
            <h2>고민 게시판 <span class="sub-title">여러분의 피부고민 다른 분들과 공유해보세요</span></h2>
			<hr>
			<div class="worry-board">
				<div class="worry-board-top">
					<section class="board-best">
						<div class="board-best-wrap">
	                    <div class ="best">베스트 고민</div>&nbsp;&nbsp;&nbsp;&nbsp; <div id="worry-btn2" class="reply">답글을 기다리는 고민</div>
	                    	<br><br>
	                    	<div id="rankrank1">
			                    	<div class="rank-num" id="rank11">순위</div><div class="rank-num" id="rank21">제목</div><div class="rank-num" id="rank31">추천수</div>
			                </div>
			                <div id="rankrank2">   	
			                    	<div class="rank-num" id="rank12">순위</div><div class="rank-num" id="rank22">제목</div><div class="rank-num" id="rank32">추천수</div>
		       				</div>
		                    <ol id="rank10">
		                    	<% for(int i = 0; i < 10; i++){ %>
		                    		<%if (i < top10List.size()){ %> 	
		                    			<li><div id="topListNum"><%= top10List.get(i).getWorryNo() %></div><div class="rank-num" id="rank1"><%= i +1 %></div><div class="rank-num" id="rank2"><%= top10List.get(i).getTitle() %></div><div class="rank-num" id="rank3"><%= top10List.get(i).getWorryThumbUp() %></div></li>                    						
		                    		<%} else{ %>
		                        		<li><div id="topListNum">0</div><div class="rank-num" id="rank1"><%= i +1 %></div><div class="rank-num" id="rank2">조회된 게시글이 없습니다.</div><div class="rank-num" id="rank3"> - </div></li>
									<%} %>
								<%} %>	
							</ol>
	                    </div> 
	                </section>
					<section class="wait-comment">
						<div class="wait-comment-wrap">
	                    <div class ="best">답글을 기다리는 고민</div>&nbsp;&nbsp;&nbsp;&nbsp; <div class="reply" id="worry-btn1">베스트 고민</div>
	                    	<br><br>
	                    	<div id="rankrank1">
			                    	<div class="rank-num" id="rank11">순위</div><div class="rank-num" id="rank21">제목</div><div class="rank-num" id="rank31">추천수</div>
			                </div>
			                <div id="rankrank2">   	
			                    	<div class="rank-num" id="rank12">순위</div><div class="rank-num" id="rank22">제목</div><div class="rank-num" id="rank32">추천수</div>
		       				</div> 
		                    <ol id="rank10">
		                    	<% for(int i = 0; i < 10; i++){ %>
		                    		<%if (i < lowList.size()){ %> 
		                    				
		                    			<li><div id="topListNum"><%= lowList.get(i).getWorryNo() %></div><div class="rank-num" id="rank1"><%= i +1 %></div><div class="rank-num" id="rank2"><%= lowList.get(i).getTitle() %></div><div class="rank-num" id="rank3"><%= lowList.get(i).getWorryThumbUp() %></div></li>                    						
		                    		<%} else{ %>
		                        		<li><div id="topListNum">0</div><div class="rank-num" id="rank1"><%= i +1 %></div><div class="rank-num" id="rank2">조회된 게시글이 없습니다.</div><div class="rank-num" id="rank3"> - </div></li>	
									<%} %>
								<%} %>	
							</ol>
	                    </div>
	                </section>
	               
	               </div>
	            <form></form>   
	            <br><br><br>
                <section class="worry-list">
                	<div class="list-order">
                	<% if(value.equals("hit")){ %>
	                    <select id ="select" name="select-view" onchange="change()">
	                        <option value="hit" selected>최신순</option>
	                        <option value="thumb">인기순</option>
	                    </select>
	                    <%} else { %>
	                    	<select id ="select" name="select-view" onchange="change()">
	                        <option value="hit">최신순</option>
	                        <option value="thumb" selected>인기순</option>
	                    </select>
	                    <%} %>
                    </div>
                    
  
                    <table class="worry-table" style="table-layout: fixed">
                    	<thead>
                        <tr>
                            <th class="tdtd" id="td1">글 번호</th>
                            <th class="tdtd" id="td2">게시글 제목</th>
                            <th class="tdtd" id="td3">글쓴이</th>
                            <th class="tdtd" id="td4">작성일</th>
                            <th class="tdtd" id="td5">추천수</th>
                            <th class="tdtd" id="td6">조회수</th>
                        </tr>
                        </thead>
                        
                        <tbody>
                        	<% if(list.size() == 0){ %>
	                        	<tr>
	                        		<th colspan = "6" id="fail">조회 결과가 없습니다.</th>
	                        	</tr>
                        	<% } else{ %>
	                        		<% for(int i = 0; i< list.size(); i++){ %>
	                        	<tr>
	                        		<td class="tdtd" id="td1"><%= list.get(i).getWorryNo() %></td>
	                        		<td class="tdtd" id="td2"><%=list.get(i).getTitle() %></td>
	                        		<td class="tdtd" id="td3"><%=list.get(i).getUserName() %></td>
	                        		<td class="tdtd" id="td4"><%= list.get(i).getDate() %></td>
	                        		<td class="tdtd" id="td5"><%= list.get(i).getWorryThumbUp() %></td>
	                        		<td class="tdtd" id="td6"><%= list.get(i).getHit() %></td>
	                        	</tr>
                        		<%} %>
                      		<% } %>	
                        </tbody>
                        
                    </table>
                    				
                    
                    
                   	<div class="pagingArea" align="center">
	                   	<%if(!list.isEmpty()){ %>
							<!-- 맨 처음으로 -->
							<button class="btn-standard" onclick="location.href='<%= request.getContextPath() %>/worryList2.bo?currentPage=1'">&lt;&lt;</button>
						
							<!-- 이전 페이지로 -->
							<button class="btn-standard" onclick="location.href='<%= request.getContextPath() %>/worryList2.bo?currentPage=<%=currentPage - 1 %>'" id="beforeBtn">&lt;</button>
							
							<script>
								if(<%= currentPage %> <= 1){
									$('#beforeBtn').attr('disabled', 'ture');
								}
							</script>
							
							<!-- 10개 페이지 목록 -->
							<% for(int p = startPage; p <= endPage;p++){ %>
								<% if(p == currentPage){ %>
									<button id="choosen"  class="btn-standard" disabled style="background:DarkTurquoise"style="background:DarkTurquoise"><%= p %></button>		
								<%} else{ %>
									<button id="numBtn"  class="btn-standard" onclick="location.href='<%=request.getContextPath() %>/worryList2.bo?currentPage=<%=p%>'"><%= p %></button>
								<%} %>
							<%} %>
							
							<!-- 다음 페이지로 -->
							<button id="afterBtn"  class="btn-standard" onclick="location.href='<%= request.getContextPath()%>/worryList2.bo?currentPage=<%= currentPage +1%>'">&gt;</button>
							<script>
								if(<%= currentPage %> >= <%= maxPage %>){
									$('#afterBtn').attr('disabled', 'ture');
								}
							</script>
							
							<!-- 맨 끝으로 -->
							<button class="btn-standard" onclick="location.href='<%=request.getContextPath()%>/worryList2.bo?currentPage=<%=maxPage %>'">&gt;&gt;</button>
						<%} %>	
                   	</div>
                   	
                   	
	
					<% if(m == null){ %>
                    <button id="write-btn" class="btn-standard" type="button" value="글쓰기" onclick="login()">글쓰기</button>
       				<%} else{ %>
       
                    <button id="write-btn" class="btn-standard" type="button" value="글쓰기" onclick="location.href='<%= request.getContextPath() %>/views/worry/worryWrite.jsp'">글쓰기</button>
 					<% } %>																						
                </section>
                <form class="worry-list-filter" name="worry-board-form" action="worryList3.bo">
                
                    <div class="worry-list-filter-wrap">
		            <select id="worry-list-select" name="select-worry">
		                <option value="total">전체</option>
		                <option value="name">작성자</option>
		                <option value="content">내용</option>
		            </select>
		                <span class="sch">
		                <input name="text" type="text">
		                 <button><img src="<%= request.getContextPath() %>/resources/images/search_icon.png"></button>

		                </span>
		            </div>
                </form>
		</div>
	</div>

	<script>
	$(function(){
		$('#worry-btn1').click(function(){
			$('.board-best-wrap').css('display','block');
			$('.wait-comment-wrap').css('display','none');
		});
		$('#worry-btn2').click(function(){
			$('.wait-comment-wrap').css('display','block');
			$('.board-best-wrap').css('display','none');
		});
		
		$('.worry-table td').click(function(){
			var worryNo = $(this).parent().children().eq(0).text();
			location.href='<%=request.getContextPath() %>/worryDetail.bo?worryNo=' + worryNo;
			
		});
		$('.worry-table td').mouseenter(function(){
			$('.worry-table td').css('cursor', 'pointer');
			$(this).parent().css('background', 'PaleTurquoise');
		});
		
		$('.worry-table td').mouseout(function(){
			$('.worry-table td').css('cursor', 'pointer');
			$(this).parent().css('background', 'white');
		});
		
		$('#rank10 div').click(function(){
			var worryNo = $(this).parent().children().eq(0).text();	
			if(worryNo != 0){
				location.href='<%=request.getContextPath() %>/worryDetail.bo?worryNo=' + worryNo;
			} else { 
			}
		});
		$('#rank10 div').mouseenter(function(){
				$('#rank10 li').css('cursor', 'pointer');
				$(this).parent().css('background', 'PaleTurquoise')
		});
		
		$('#rank10 div').mouseout(function(){
			$('.worry-table td').css('cursor', 'pointer');
			$(this).parent().css('background', 'white');
		});
		
	});
	
	
	
	
	
	function change(){
		var change = document.getElementById('select');
		console.log(change);
		var change2 = change.options[change.selectedIndex].value;
		console.log(change2);
		
		if(change2 == 'thumb'){
			window.open("worryList2.bo", "_self");
// 			$('#select').val("thumb").attr("selected", "selected");
		} else {
			window.open("worryList.bo", "_self");
		}
		
	}
	
	function login(){
		alert("로그인이 필요합니다.");
	}
	
	
	
	</script>
	<%@ include file="/views/layout/footer.jsp" %>

	<script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
	
</body>
</html>