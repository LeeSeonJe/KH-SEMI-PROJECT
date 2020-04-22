<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 쪽지함</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	body {
    position: relative;
    font-size: 0.75em;
    line-height: 17px;
    color: #666;
    font-family: dotum, arial, sans-serif;
    }
    #popwrap03 {
    float: left;
    width: 680px;
    background: url(http://eclass.kpu.ac.kr/ilos/images/common/popup/pop_bg03.gif) repeat-y;
	}
	div.pop-team-intop {
    height: 20px;
    font-size: 0;
    line-height: 0;
    background: url(http://eclass.kpu.ac.kr/ilos/images/common/popup/pop_top03.gif) no-repeat 0 top;
	}
	div.pop-team-inbtm {
    float: left;
    width: 680px;
    height: 20px;
    font-size: 0;
    line-height: 0;
    background: url(http://eclass.kpu.ac.kr/ilos/images/common/popup/pop_bottom03.gif) no-repeat 0 bottom;
	}
	div.pop-teambox {
    width: 619px;
    margin: 20px auto 0 auto;
	}
	#pop_container {
    width: 619px;
    margin: 0 auto;
    float: left;
	}
	.tab_container {
    border: 1px solid #FFFFFF;
    border-top: none;
    clear: both;
    float: left;
    width: 619px;
    background: #FFFFFF;
	}
	span#searchbox{
	float: right;
    padding-right: 0px;
	}
	
	div.pop-questionbox {
    width: 100%;
    margin-top: 20px;
	}
	
	table, th, td {
    border: 0;
    border-spacing: 0;
    }
	table.bbslist {
    clear: both;
    width: 100%;
    table-layout: auto;
    /* table-layout: fixed; */
    /* background: url(/ilos/images/common/board/data_bgbar.gif) no-repeat 0 top; */
    border-bottom: 1px solid #dadada !important;
	}
	
	table.bbslist thead th.first {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
    border-right: 1px solid #8b8b8b;
    padding-left: 1px;
	}
	table.bbslist th {
    height: 26px;
    padding: 0;
    padding-top: 2px;
    vertical-align: middle;
    text-align: center;
    font-size: 12px;
    color: #FFFFFF;
    background: none;
    font-weight: normal;
    background-color: #8B8B8B;
	}
	table.bbslist thead th.last {
    /* border-top-left-radius: 3px; */
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    /* border-bottom-left-radius: 3px; */
    border-left: 1px solid #8b8b8b;
    padding-right: 1px;
	}
	table.bbslist td {
    padding: 7px 0 5px 0;
    text-align: center;
    background: none;
    font-size: 12px;
    border-bottom: 1px solid #dadada !important;
	}
	table.bbslist td.chk {
    padding: 7px 0 5px 0;
	}
	table.bbslist td.left {
    padding-left: 10px !important;
    text-align: left;
	}
	table.bbslist td.number {
    padding: 6px 0;
    font-size: 95%;
    font-family: "tahoma";
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


	div.bbs-rbutton-paging {
    float: right;
    margin-top: -18px;
	}
	.site_button {
    color: #444;
    background-color: #f7f7f7;
    display: inline-block;
    min-width: 31px;
    text-align: center;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-family: 'Malgun Gothic';
    font-weight: bold;
    font-size: 12px;
    box-shadow: 0px 1px 2px 0px rgba(0,0,0,0.1);
    cursor: pointer;
    user-select: none;
	}
</style>
</head>
<body id="bodyPop" style="background: none;">
<div id="popwrap03">
<div class="pop-team-intop"></div>



<div class="pop-teambox" style="margin-top: 0px;">
  	<div id="pop_container" class="">
		<div class="tab_container">
			<label id="sendMessage">쪽지쓰기</label>
			<label id="recvMessage" style="font-weight: bold;">받은쪽지</label>
			<label id="outgoingMessage">보낸쪽지</label>
			
			<span id="searchbox">검색
			<input type="text" style="width: 100px; height:15px;">
			<button>search</button>
			</span>
		</div>
	</div>
	
	<div class="pop-questionbox">
		<table class="bbslist" border="1" summary="받은쪽지 목록(아이디,이름,제목,날짜 항목)">
			<caption>받은쪽지목록</caption>
			<colgroup>
				<col style="width:40px;">
				<col style="width:80px;">
				<col>
				<col style="width:120px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" class="first"><label style="display: inline;"><input type="checkbox" id="allchk" name="allchk" value="Y" class="chktype01"></label></th>
					<th scope="col">보낸사람</th>
					<th scope="col">제목</th>
					<th scope="col" class="last">날짜</th>
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<td class="chk"><input type="checkbox" id="wrtInform" name="wrtInform" value="479886" class="chktype01"></td>
					<td>김혜경</td>
					<td class="left" style="letter-spacing:-1px;"><a class="site-link" href="#" style="font-weight:normal">감사합니다</a></td>
					<td class="number last">2019.12.26 오후 7:10</td>
				</tr>
		  
				<tr>
					<td class="chk"><input type="checkbox" id="wrtInform" name="wrtInform" value="479867" class="chktype01"></td>
					<td>김혜경</td>
					<td class="left" style="letter-spacing:-1px;"><a class="site-link" href="#" style="font-weight:normal">영어2 기말 성적</a></td>
					<td class="number last">2019.12.26 오후 5:30</td>
				</tr>
		  
				<tr>
					<td class="chk"><input type="checkbox" id="wrtInform" name="wrtInform" value="469591" class="chktype01"></td>
					<td>김혜경</td>
					<td class="left" style="letter-spacing:-1px;"><a class="site-link" href="#" style="font-weight:normal">영어2 금일출석</a></td>
					<td class="number last">2019.11.28 오후 3:09</td>
				</tr>
			</tbody>
		</table>
	</div>
	
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
	
	<div class="bbs-rbutton-paging" style="margin-top:10px">
      <div class="site_button" id="deleteBtn">삭제</div>
      <div class="site_button" id="closeBtn">닫기</div>
	</div>
</div>
<div class="pop-team-inbtm"></div>
</div>

<script>
$("#deleteBtn").click(function() {
    var ids = "";

    if(!confirm("정말로 삭제하시겠습니까?")) {
      return;
    }
    
    $("input:checkbox[name=wrtInform]").each(function(index) {
      if($(this).prop("checked")) {
    	  ids += ids == "" ? $(this).val() : ","+ $(this).val();
      };
    });

    if(ids == "") {
      alert("삭제 대상자를 선택하세요.");
      return;
    }
/* 
    $.ajax({
      url: "/ilos/message/received_delete_pop.acl",
      type: "POST",
      data: {
        IDs :  ids,
        encoding : "utf-8"
      },
      async: false,
      success: function(data) {
    	  if(data.isError) {
    		  alert(data.message);
    	  } else {
    		  listPage();
    	  }
      },
      error : ajaxErrorMsg
    });   */
  }); //deleteBtn
  
  $("#closeBtn").click(function() {
  	window.close();
  });
</script>

</body>
</html>