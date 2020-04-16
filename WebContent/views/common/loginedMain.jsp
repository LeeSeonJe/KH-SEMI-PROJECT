<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
/* 슬라이드 css*/
#slide {
   width: 100%;
   min-height: 300px;
   text-align: center;
}

#slide>img{
   width: 80%;
   height: 400px;
   text-align: center;
}

#next {
   width: 50px;
    height: 50px;
   display: inline-block; 
}

#prev {
   width: 50px;
   height: 50px;
   display: inline-block;
}

.btn-direction {
   border: none;
   background: none;
/*    display: inline-block; */
}
/* 슬라이드css끝 */
#div-ranklist {
   text-align: center;
}

#ranking-title {
   padding: 20px;
   text-align: left;
}

h3 {
   margin-left: 50px;
}

.rank-list {
   display: inline-block;
   text-align: left;
}

#center-list {
   margin-left: 120px;
   margin-right: 120px;
}
</style>
<%@ include file="/views/layout/import.jsp"%>

</head>
<body>
   <div class="contents">
      <%@ include file="/views/layout/header.jsp"%>
      <hr>
         <!-- 작성 -->
   <div id="slide"><!-- 슬라이드 -->
	   <button class="btn-direction"><img id="prev" src="<%= request.getContextPath() %>/resources/images/prev.png"></button>
	   <img class="slides" id="slide1" src="<%= request.getContextPath() %>/resources/images/manbw-1000x400.jpg">
	   <img class="slides" id="slide2" src="<%= request.getContextPath() %>/resources/images/mountain4-1000x400.jpg">
	   <img class="slides" id="slide3" src="<%= request.getContextPath() %>/resources/images/galaxy-1000x400.jpg">
	   <button class="btn-direction"><img id="next" src="<%= request.getContextPath() %>/resources/images/next.png"></button>
   </div><!-- 슬라이드 끝 -->      
 
<script type="text/javascript">

$(function(){
   $('#slide3').hide();
   $('#slide2').hide();


    var currentSlide = 1;
   $('#next').click(function(){
      if(currentSlide == 1){
         $('#slide1').hide();
         $('#slide2').fadeIn(300);
         currentSlide = 2;      
      }else if(currentSlide ==2){
         $('#slide2').hide();
         $('#slide3').fadeIn(300);
         currentSlide = 3;
      }else if(currentSlide == 3){
         $('#slide3').hide();
         $('#slide1').fadeIn(300);
         currentSlide = 1;
      }});
   
    var currentSlide = 1;
   $('#prev').click(function(){
      if(currentSlide == 1){
         $('#slide1').hide();
         $('#slide2').fadeIn(300);
         currentSlide = 2;      
      }else if(currentSlide ==2){
         $('#slide2').hide();
         $('#slide3').fadeIn(300);
         currentSlide = 3;
      }else if(currentSlide == 3){
         $('#slide3').hide();
         $('#slide1').fadeIn(300);
         currentSlide = 1;
      }});
   });
</script>

   <hr>   
   
   <div id="div-ranklist"><!-- 랭킹 리스트 -->
      <div id="ranking-title"><h3>인기 뷰티 랭킹</h3></div>

         <ol class="rank-list">
            <li>샤넬 어쩌고 립스틱</li>
            <li>생로랑 어쩌고 립스틱</li>
            <li>바비브라운 어쩌고 립스틱</li>
            <li>링딩동 링딩동 링딩동</li>
            <li>제품명이 엄청 길면 어디까지 늘어나는 거지???</li>
         </ol>
         <ol class="rank-list" id="center-list">
            <li>이름이 긴긴긴긴긴긴긴긴 로션</li>
            <li>이름없는 로션</li>
            <li>항목3</li>
            <li>항목4</li>
            <li>항목5</li>
         </ol>
            <ol class="rank-list">
            <li>제품명이 엄청 길면 줄바꿈돼버림</li>
            <li>항목2</li>
            <li>항목3</li>
            <li>항목4</li>
            <li>항목5</li>
         </ol>
   </div>
         
         <!-- 작성끝 -->
   </div>

   <%@ include file="/views/layout/footer.jsp"%>

   <script src="<%= request.getContextPath() %>/resources/js/main.js"></script>
</body>
</html>