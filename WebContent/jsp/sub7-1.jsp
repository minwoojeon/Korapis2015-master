<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String redirectUrl = TextFormatter.convNvl(request.getParameter("redirectUrl"), "");

%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>사단법인 한국양봉협회</title>
<link rel="stylesheet" href="/css/default.css" >
<link href="/css/sub.css"  rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.8.3.min.js" ></script>
<style type="text/css">

</style>
<script>
//로그인 
function login(){
	
	var frm = document.forms.frmLogin;
	
	frm.id.value = frm.id.value.split(" ").join("");
	frm.password.value = frm.password.value.split(" ").join("");
    
	var id = frm.id.value;
    var password = frm.password.value;

	if (id.length==0) {
        alert('사용자명을 입력하세요.\n');
		frm.id.focus();
		return;
	} 

	if(password.length == 0){
        alert('비밀번호를 입력하세요.\n');
		frm.password.focus();
		return
    }
	
	
	
	if($("input[name='mflag']:checked").val() == "02"){
		//alert("일반회원은 현재 로그인이 불가능합니다.\n\n이전 홈페이지로 이동합니다.");
		//window.location.href="http://apiary.mireene.co.kr";
		//return;
		frm.action="/loginmember.do"; 
		frm.method="post";
	    frm.submit();
		
	}else{
		frm.action="/loginmember.do"; 
		frm.method="post";
	    frm.submit();
	}
		
	
}





//엔터키 입력.
function formsubmit(){
    if(event.keyCode == 13)
        login();
}



//==쿠키 시작
function setCookie (name,value,path,domain,secure) {
   var expires = new Date();
   expires.setMonth(expires.getMonth() + 1)

  document.cookie = name + "=" + escape (value) +
    ((expires) ? "; expires=" + expires.toGMTString() : "") +
    ((path) ? "; path=" + path : "") +
    ((domain) ? "; domain=" + domain : "") +
    ((secure) ? "; secure" : "");
}

function getCookie (name) {
 var arg = name + "=";
 var alen = arg.length;
 var clen = document.cookie.length;
 var i = 0;
 while (i < clen) {
     var j = i + alen;
     if (document.cookie.substring(i, j) == arg)
       return getCookieVal (j);
     i = document.cookie.indexOf(" ", i) + 1;
     if (i == 0) break;
 }
 return null;
}

function getCookieVal (offset) {
  var endstr = document.cookie.indexOf (";", offset);
  if (endstr == -1)
    endstr = document.cookie.length;
  return unescape(document.cookie.substring(offset, endstr));
}

function reset(){
   // 동일한 키(name)값으로
    // 1. 만료날짜 과거로 쿠키저장
    // 2. 만료날짜 설정 않는다. 
    //    브라우저가 닫힐 때 제명이 된다   
    var date = new Date(); // 오늘 날짜 
    var validity = -1;
    date.setDate(date.getDate() + validity);
    document.cookie = "id.contact.korapis.or.kr=;expires=" + date.toGMTString();

}
//==쿠키 종료

$(function(){
	var frm = document.forms.frmLogin;
	$(frm.id).on("kedown",function(e){
		if(e.which == 13)
			if(!frm.password.value) frm.password.focus();
			else frm.submit();
	});
	$(frm.password).on("keydown",function(e){
		if(e.which == 13)
			login();
	});
});
</script>
</head>
<body>
<div id="skipToContent" title="스킵네비게이션">
		<a href="#main_menu">메뉴 바로가기</a>
		<a href="#search">프로그램 검색 바로가기</a>
		<a href="#footer">카피라이터 바로가기</a>
</div>

<!-- sub_wrap_main START -->
<div id="sub_wrap_main">
    
<jsp:include page="inc/header.jsp" />
    
<!-- sub_wrap START -->
    <div id="sub_wrap">
        
        <jsp:include page="inc/leftmenu.jsp" />
        
        <!-- sub_contents START -->
        <div id="sub_contents">
            
            
            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">로그인</h2>
                    <div class="location">홈  &gt; 운영체제 &gt; <span>로그인</span></div>
                </div>
                <div class="sub_body_box">
					<div class="login">
					<form name="frmLogin" id="frmLogin" method="post">
						<input type="hidden" name="redirectUrl" value="<%=redirectUrl %>" />
					
							<p class="login_top"><img src="/images/t_logo.png" alt="" style="float:left; padding-top:7px">
								<span style="display:block; margin-left:110px">자연이 살아숨쉬는 양봉산물 <br/>
								<strong>사단법인 한국양봉협회</strong>가 함께합니다.</span>
							</p>
							<p class="DN" style="text-align: center;  border-bottom:1px solid #cfcfcf; margin-bottom:10px; padding-bottom:7px"> 
								<input name="mflag" type="radio" id="mflag" value="01" checked="checked">
                  				협회 회원&nbsp;&nbsp; 
                  			</p>	
							<p class="error" style="display:none;"><img src="/images/ex_mark.png" alt="" style="float:left;">
								<span style="display:block; margin-left:50px">가입된 회원이 아니거나 비밀번호가 틀립니다.<br/>
								아이디와 비밀번호는 대소문자를 구분합니다.</span></p>	
							<div class="j_login">
								<p class="item">
									<label for="login_uid" class="i_label" >아이디</label>
									<input type="text" name="id" class="in_txt" value="" tabindex="">
								</p>
								<p class="item">
									<label for="login_upw" class="i_label" >비밀번호</label>
									<input type="password" name="password" class="in_txt" value="" tabindex="">
								</p>
								
								<p class="taC">
									<a href="javascript: login()" class="btn full sub2">로 &nbsp;그  &nbsp;인</a>
								</p>
							</div>
							<div class="join_btn">
								<a href="/jsp/sub7-2.jsp" class="jB_f">회원가입</a> &nbsp; | &nbsp;
								<a href="/jsp/sub7-3.jsp">아이디/비밀번호 찾기</a>
							</div>
							
							
					</form>
					</div>
                </div>
            </div>
            <!--// sub_con END -->
            
			<jsp:include page="inc/partner.jsp" />
			
        </div>
        <!--// sub_contents END -->
	</div>
    <!--// sub_wrap END -->
</div>
<!--// sub_wrap_main END -->

<jsp:include page="inc/footer.jsp" />


<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>
