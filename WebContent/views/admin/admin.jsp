<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="/views/layout/import.jsp" %>
<style>
hr {
    margin-top: 15px;
    margin-bottom: 15px;
    border: 0;
    border-top: 5px solid #eee;
}

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

div>section.tab-adminpage {
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

#adminCustomer{
	text-align: center;
	border-top: 1px solid #444444;
}
#adminCustomer>thead>tr>th {
	height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:150px;
}
#adminCustomer>tbody>tr>td {
   height: 45px;
}


.detail, .grant{color: blue; cursor: pointer;}
.quit, .refuse, .remove, #answerStatus{color: red; cursor: pointer;}
.detail:hover, .quit:hover, .grant:hover, .refuse:hover, .remove:hover,
#answerStatus:hover{
	text-decoration:underline;
}

#adminHospital {
   text-align: center;
}
#adminHospital>thead>tr>th {
    height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:90px;
}
#adminHospital>thead>tr>th#title2 {
   width:420px;
}
#adminHospital>tbody>tr>td {
   height: 45px;
}

#adminEnrollHospital {
   text-align: center;
}
#adminEnrollHospital>thead>tr>th {
    height: 48px;
    font-size: 16px;
    border-block-end: 1px solid black;
    text-align: center;
    width:90px;
}
table#adminEnrollHospital>thead>tr>th#title2 {
   width:420px;
}
table#adminEnrollHospital>tbody>tr>td{
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

.paging .hide {display:block;height:0;width:0;font-size:0;line-height:0;margin:0;padding:0;overflow:hidden;}
.paging{padding:19px;text-align:center;}
.paging a{display:inline-block;width:23px;height:23px;padding-top:2px;vertical-align:middle;}
.paging a:hover{text-decoration:underline;}
.paging .btn_arr{text-decoration:none;}
.paging .btn_arr, .paging .on{margin:0 3px;padding-top:0;border:1px solid #ddd; border-radius:30px;
/* background:url(/front/img/com/btn_paging.png) no-repeat; */}
.paging .on{padding-top:1px;height:22px;color:#fff;font-weight:bold;background:#000;}
.paging .on:hover{text-decoration:none;}

</style>
</head>
<body>
   <div class="contents">
      <%@ include file="/views/layout/header.jsp"%>
      <hr>
      <section id="page-name">
         <h2>관리자 페이지</h2>
      </section>
      <hr>
      <div id="main-div">
         <section id="nav-tab">
            <ul id="nav-tab-ul">
               <li>회원 관리</li>
               <li>병원 관리</li>
               <li>병원 가입 관리</li>
               <li>제품 등록 관리</li>
               <li>리뷰 관리</li>
               <li>게시판 관리</li>
               <li>1대1문의 관리</li>
            </ul>
         </section>
         
         <!-- 회원관리 -->
         <section id="tab-adminCustomer" class="tab-adminpage">
            <div id="tab-title">회원 관리</div>
            <div id="tab-title-detail"></div>
            <br><br>
            <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>회원번호</th>
                     <th>회원이름</th>
                     <th>가입일자</th>
                     <th>상세</th>                     
                     <th>탈퇴처리</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>1011</td>
                     <td>아이유</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="quit">탈퇴처리</label></td>
                  </tr>
                  <tr>
                     <td>1010</td>
                     <td>데프콘</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="quit">탈퇴처리</label></td>
                  </tr>
                  <tr>
                     <td>1009</td>
                     <td>노홍철</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="quit">탈퇴처리</label></td>
                  </tr>
               </tbody>
            </table>
            <br><br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
         </section>      
         
         <!-- 병원관리 -->
         <section id="tab-adminHospital" class="tab-adminpage">
            <div id="tab-title">병원 관리</div>
            <div id="tab-title-detail"></div>
            <br><br>
            <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>병원번호</th>
                     <th>회원이름</th>
                     <th>가입일자</th>
                     <th>상세</th>                     
                     <th>탈퇴처리</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>34</td>
                     <td>KH피부과</td>
                     <td>2020-03-19</td>
                     <td><a href="#" style="font-weight: bold;">조회</a></td>
                     <td><label class="quit">탈퇴처리</label></td>
                  </tr>
                  <tr>
                     <td>33</td>
                     <td>제일피부과</td>
                     <td>2020-03-19</td>
                     <td><a href="#" style="font-weight: bold;">조회</a></td>
                     <td><label class="quit">탈퇴처리</label></td>
                  </tr>
                  <tr>
                     <td>32</td>
                     <td>감동피부과</td>
                     <td>2020-03-19</td>
                     <td><a href="#" style="font-weight: bold;">조회</a></td>
                     <td><label class="quit">탈퇴처리</label></td>
                  </tr>
               </tbody>
            </table>
            <br><br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
         </section>
         
         <!-- 병원가입관리 -->
         <section id="tab-adminEnrollHospital" class="tab-adminpage">
            <div id="tab-title">병원 가입 관리</div>
            <div id="tab-title-detail"></div>
            <br><br>
            <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>요청번호</th>
                     <th>회원이름</th>
                     <th>가입일자</th>
                     <th>상세</th>     
                     <th>승인</th>                
                     <th>거절처리</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>34</td>
                     <td>KH피부과</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
                  <tr>
                     <td>33</td>
                     <td>제일피부과</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
                  <tr>
                     <td>32</td>
                     <td>감동피부과</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
               </tbody>
            </table>
            <br><br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
         </section>
         
          <!-- 제품등록관리 -->
         <section id="tab_adminEnrollProduct" class="tab-adminpage">
            <div id="tab-title">제품 등록 관리</div>
            <div id="tab-title-detail"></div>
            <br><br>
            <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>요청번호</th>
                     <th>회원이름</th>
                     <th>등록요청일자</th>
                     <th>상세</th>                     
                     <th>승인</th>                
                     <th>거절처리</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>7</td>
                     <td>박명수</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
                  <tr>
                     <td>6</td>
                     <td>유재석</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
                  <tr>
                     <td>5</td>
                     <td>정형돈</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="grant">승인</label></td>
                     <td><label class="refuse">거절</label></td>
                  </tr>
               </tbody>
            </table>
            <br>
            <div style="margin-right: 45px" align="right">
            	<button class="btn-standard" style="width: 100px; height: 30px;" id="cosmeticReq">등록</button>
            </div>
            <br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
         </section>
         
          <!-- 리뷰관리 -->
         <section id="tab-adminReview" class="tab-adminpage">
            <div id="tab-title">리뷰 관리</div>
            <br><br>
            <div id="search" align="right">브랜드명&nbsp;
            	<input type="text" placeholder="브랜드명을 기입해주세요" size="15">
            	카테고리
            	<select>
            		<option selected>대분류</option>
            		<option>스킨케어</option>
            		<option>클렌징</option>
            		<option>베이스메이크업</option>
            		<option>색조메이크업</option>
            		<option>마스크/팩</option>
            		<option>선케어</option>
            	</select>
            	
            	<select>
            		<option selected>중분류</option>
            		<option>스킨</option>
            		<option>에센스</option>
            		<option>로션</option>
            		<option>크림</option>
            		<option>토너/필링패드</option>
            		<option>미스트</option>
            		<option>메이크업픽스</option>
            	</select>
            	&nbsp;제품명&nbsp;
            	<input type="text" placeholder="제품명을 입력해주세요" size="15">
            </div>
            <br>
           <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>리뷰번호</th>
                     <th>리뷰 내용</th>
                     <th>작성자</th>
                     <th>작성일자</th>                     
                     <th>상세</th>                
                     <th>삭제처리</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>3542</td>
                     <td class="title">처음엔 향이 퍼지나 싶더니 나중에는 별로에요</td>
                     <td>정준하</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="remove">삭제</label></td>
                  </tr>
                  <tr>
                     <td>3541</td>
                     <td class="title">이거 안사면 손해입니다.</td>
                     <td>박신우</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="remove">삭제</label></td>
                  </tr>
                  <tr>
                     <td>3540</td>
                     <td class="title">좋아요~!</td>
                     <td>감스트</td>
                     <td>2020-03-19</td>
                     <td><label class="detail">조회</label></td>
                     <td><label class="remove">삭제</label></td>
                  </tr>
               </tbody>
            </table>
            <br><br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
         </section>
         
          <!-- 게시판관리 -->
         <section id="tab-adminBoard" class="tab-adminpage">
            <div id="tab-title">게시판 관리</div>
            <div id="tab-title-detail"></div>
            <br><br>
            <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>번호</th>
                     <th>제목</th>
                     <th>작성자</th>
                     <th>작성일</th>   
              		 <th>상세</th>                    
                     <th>삭제처리</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>70</td>
                     <td class="title">여드름 관리 어떻게들 하세요?ㅠㅠ</td>
                     <td>박명수</td>
                     <td>2020-03-19</td>
                     <td><a href="#" style="font-weight: bold;">조회</a></td>                     
                     <td><label class="remove">삭제</label></td>
                  </tr>
                  <tr>
                     <td>69</td>
                     <td class="title">대구 5만원 피부 압출 관리숍 추천받아요!</td>
                     <td>유재석</td>
                     <td>2020-03-19</td>
                     <td><a href="#" style="font-weight: bold;">조회</a></td> 
					 <td><label class="remove">삭제</label></td>
                  </tr>
                  <tr>
                     <td>68</td>
                     <td class="title">점 빼고 난 후 붉은 반점 언제 사라지나요?</td>
                     <td>정형돈</td>
                     <td>2020-03-19</td>
                     <td><a href="#" style="font-weight: bold;">조회</a></td> 
					 <td><label class="remove">삭제</label></td>
                  </tr>
               </tbody>
            </table>
            <br><br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
         </section>
         
         <!-- 1대1문의관리 -->
         <section id="tab-adminQnA" class="tab-adminpage">
           <div id="tab-title">1대1 문의</div>
           <div id="tab-title-detail"></div>
           <br><br>
           <table id="adminCustomer" class="table-standard">
                <thead>
                  <tr>
                     <th>문의번호</th>
                     <th>문의내용</th>
                     <th>작성자</th>
                     <th>작성일</th>                     
                     <th>상태</th>                
                     <th>답변작성</th>                     
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td>10</td>
                     <td class="title">리뷰 삭제는 어떻게 하나요?</td>
                     <td>안정환</td>
                     <td>2020-03-19</td>
                     <td><label id="status">대기중</label></td>
                     <td><label id="answerStatus">답변작성</label></td>
                  </tr>
                  <tr>
                     <td>9</td>
                     <td class="title">계정을 삭제하고 싶습니다</td>
                     <td>김희철</td>
                     <td>2020-03-19</td>
                     <td><label id="status">답변완료</label></td>
                     <td><label id="answerStatus"></label></td>
                  </tr>
                  <tr>
                     <td>8</td>
                     <td class="title">랭킹은 어떤 기준인가요?</td>
                     <td>강호동</td>
                     <td>2020-03-19</td>
                     <td><label id="status">대기중</label></td>
                     <td><label id="answerStatus">답변작성</label></td>
                  </tr>
               </tbody>
            </table>
            <br><br>
            <div class="paging">
			  <a href="#" class="btn_arr first"><span class="hide">처음페이지</span></a>            
			  <a href="#" class="btn_arr prev"><span class="hide">이전페이지</span></a>     
			  <a href="#" class="on">1</a><!-- D : 활성화페이지일 경우 : on 처리 -->
			  <a href="#">2</a>
			  <a href="#">3</a>
			  <a href="#">4</a>
			  <a href="#">5</a>
			  <a href="#" class="btn_arr next"><span class="hide">다음페이지</span></a>            
			  <a href="#" class="btn_arr last"><span class="hide">마지막페이지</span></a>           
			</div>
        </section>
      </div>
   </div>   

   <%@ include file="/views/layout/footer.jsp"%>
   
   <script>
   	$(function(){
       $('.tab-adminpage').hide();
       $('.tab-adminpage:first').show();
       
       $('#nav-tab-ul li').click(function(){
          if($(this).text() == '회원 관리'){
             $('.tab-adminpage').hide();
             $('#tab-adminCustomer').css('display','block');
          } else if($(this).text() == '병원 관리'){
             $('.tab-adminpage').hide();
             $('#tab-adminHospital').css('display','block');
          } else if($(this).text() == '병원 가입 관리'){
             $('.tab-adminpage').hide();
             $('#tab-adminEnrollHospital').css('display','block');
          } else if($(this).text() == '제품 등록 관리'){
             $('.tab-adminpage').hide();
             $('#tab_adminEnrollProduct').css('display','block');
          } else if($(this).text() == '리뷰 관리'){
             $('.tab-adminpage').hide();
             $('#tab-adminReview').css('display','block');
          } else if($(this).text() == '게시판 관리'){
             $('.tab-adminpage').hide();
             $('#tab-adminBoard').css('display','block');
          } else if($(this).text() == '1대1문의 관리'){
             $('.tab-adminpage').hide();
             $('#tab-adminQnA').css('display','block');
          }
       });
       
    });
      
    $('.btn-standard').click(function(){
       if($(this).text() === '문의하기'){
          $('#tab-myQnA').css('display','none');
          $('#tab-myQnA-writer').css('display','block')            
       }
    });
     
   
	$('.detail').click(function(){
		var popup = window.open("adminUserDetail.jsp", "detailPopUp", "width=500, height=300");
		

	});
	$('.quit').click(function(){
		var result = window.confirm('정말로 탈퇴처리 하시겠습니까?');
		
		if(result){
			alert('정상적으로 탈퇴처리되었습니다!');
		} else{
			alert('취소!');
		}
	});
	
	$('.grant').click(function(){
		var result = window.confirm('회원가입요청을 승인처리 하시겠습니까?');
		
		if(result){
			alert('승인 처리 완료!');
		} else{
			alert('취소!');
		}
	});
	$('.refuse').click(function(){
		var result = window.confirm('회원가입요청을 거절처리 하시겠습니까?');
		
		if(result){
			alert('거절 처리 완료!');
		} else{
			alert('취소!');
		}
	});
	$('#register').click(function(){
		var popup = window.open("", "registerDetailPopUp", "width=500, height=300");
		
		popup.document.write('<html><body><h2>등록 요청 상세 정보</h2><body><html>')
	});
	$('.remove').click(function(){
		var result = window.confirm('해당 리뷰를 삭제처리 하시겠습니까?');
		
		if(result){
			alert('삭제 처리 완료!');
		} else{
			alert('취소!');
		}
	});
	$('#answerStatus').click(function(){
		var popup = window.open("", "answerStatusPopUp", "width=500, height=300");
		
		popup.document.write('<html><body><h2>답변 작성 팝업</h2><body><html>')
	});
	$('#cosmeticReq').click(function(){
		var popup = window.open("cosmeticReqPopup.jsp", "cosmeticReqPopup", "width=800, height=700");
	});
   </script>
   <script src="../../resources/js/main.js"></script>
   
</body>
</html>