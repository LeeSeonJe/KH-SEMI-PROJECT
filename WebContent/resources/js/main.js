console.log("clear");

var isPopup = false;

$(".gnb>form>ul>li>span").on("mouseenter", function(){
    /*console.log("enter1");*/
    $(".popup").css({"display": "block"});
});

$(".popup").on("mouseenter", function(){
   event.stopPropagation();
   event.preventDefault();
   isPopup = true;
   /*console.log("isPopup2: " + isPopup);*/
});

$(".popup>ul>li>span").on("mouseenter", function(){
   event.stopPropagation();
   event.preventDefault();
   $($(this).parent().siblings().children("ul")).css({"display": "none"});
   $($(this).siblings()).css({"display": "block"});
   isPopup = true;
});

$(".popup").on("mouseleave", function(){
   isPopup = false;
   
   if(!isPopup){
      $(this).css({"display": "none"});
      $(this).children().children().children("ul").css({"display": "none"});
      $(this).children().children().siblings().children("ul").css({"display": "none"});
   }
});

$(".gnb").on("mouseleave", function(){
   $(".popup").css({"display":"none"})
});

$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
});