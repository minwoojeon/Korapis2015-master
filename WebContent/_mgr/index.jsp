<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.util.FunctionDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
FunctionDao fDao = new FunctionDao();

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo!=null){
	response.sendRedirect("/_mgr/jsp/default.jsp");
}


%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/layout.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/board.css">
<style type="text/css">
#mgr_wrap {width:700px; margin:200px auto}
#mgr_wrap>.bgM {width:700px; height:2px;}
.mgr_login {padding:30px 0 25px 45px; border: 1px solid #cdcdcd; border-top:0 none;}
.mgr_login form {height:93px;}
.mgr_login h1 {float: left; padding:2px 36px 3px 0; border-right: 1px solid #cdcdcd;}
.mgr_login .j_login {margin-left:290px; width:290px; padding-top:4px;position:relative;}
.mgr_login .j_login>p {padding:2.5px}
.mgr_login .j_login>p input {width:143px;border:1px solid #a3a3a3; font-size:14px; line-height:14px; height:14px; padding:6px; font-family:'dotum'; font-weight:bold; color:#787878}
.mgr_login .j_login .j_login_btn a{display:block; width:83px; height:65px; position:absolute; top:4px; right:0; overflow: hidden; text-indent: -9999px; font-size:0;
background-image: url(/_mgr/img/login/login2_btn_bg.png);}
.mgr_login .j_login .j_login_btn a:hover {background-position: 100% 100%}
.mgr_footer {font: 9px/35px Verdana, 'Dotum', sans-serif; color:#7E7D7D; text-align:center}
</style>
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script>
<!--



$(function(){
	$("#login_uid").focus();
});


//로그인 
function login(){
	
	document.frmLogin.id.value = document.frmLogin.id.value.split(" ").join("");
	document.frmLogin.password.value = document.frmLogin.password.value.split(" ").join("");
    
	var id = document.frmLogin.id.value;
    var password = document.frmLogin.password.value;

	if (id.length==0) {
        alert('사용자명을 입력하세요.\n');
		frmLogin.id.focus();
		return;
	} 

	if(password.length == 0){
        alert('비밀번호를 입력하세요.\n');
		frmLogin.password.focus();
		return
    }
	
	
	document.frmLogin.action="/login.do"; 
    document.frmLogin.submit();
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
    document.cookie = "id.contact.apimondia.or.kr=;expires=" + date.toGMTString();

}
//==쿠키 종료



//-->
</script>
</head>

 <body>
<div id="mgr_wrap">
	<div style="text-align:center; margin-bottom:10px">
		<p style="font-size:15px; font-weight:bold">양봉협회 관리자 시스템</p>
	</div>
	
	<p class="bgM"> </p>
	<div id="" class="mgr_login">		
		
		<form name="frmLogin" method="post">
		<input type="hidden" name="selAction" value="meeting_login">
		
		<%--<h1><a href="#;"><img src="/home/default/fair/top_logo.jpg" alt=""></a></h1>--%>
		<h1>
		<a href="/">
			<img src="/_mgr/img/logo.gif" title="Apimondia 2015" alt="Apimondia 2015">
		</a>
		</h1>
			<div class="j_login">
				<p>
					<label for="login_uid" class="i_label"><img src="/_mgr/img/login/label_id.png" alt="아이디"></label>
					<input type="text" name="id" id="login_uid" class="in_txt" value="" tabindex="" onKeyPress="javaScript:formsubmit();">
				</p>
				<p>
					<label for="login_upw" class="i_label"><img src="/_mgr/img/login/label_pw.png" alt="비밀번호"></label>
					<input type="password" id="login_upw" name="password" class="in_txt" value="" tabindex="" onKeyPress="javaScript:formsubmit();">
				</p>
				<p class="j_login_btn">
					<a href="javascript:login();" class="bgM">로그인</a>
				</p>							
			</div>	
			
			
		</form>
 </div>
 <script language="javascript">
<!--
    today=new Date();
    curYear=today.getFullYear();
//-->
</script>
 <div class="mgr_footer">Copyright. &copy;  <script language="javascript">document.write(curYear);</script> MediaCore inc. All Rights Reserved. IS BIZ Tower 606 6F, Seongsu i(2)-ro, Seongdonggu, Seoul, Korea</div>
 </div><!--//wrap-->

			

</body>
</html>






