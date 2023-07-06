<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

//로그인 사용자만 가능
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null){out.print("<script>alert('인증되지 않았거나 오랜시간 사용하지 않아 로그오프 합니다.');</script>"); response.sendRedirect("/");}
MiceParam param = (MiceParam)request.getAttribute("param");

System.out.println("test:"+userInfo.getId());

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>++ Micehub ++</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/admstyle.css">
<script type="text/javascript" src="/_mgr/js/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	var src = $("#frame_func",top.document).attr("src");
	if(!src) return;
	 if(src.indexOf("meet")!=-1){
		$("li.meet").addClass("selected");
	}else if(src.indexOf("req")!=-1){
		$("li.req").addClass("selected");
	}
	 
	 $("div.topmenu_gnb li").on("click",function(e){
		 $("div.topmenu_gnb li").removeClass("selected");
		 $(this).addClass("selected");
	 });
});
</script>
<style>
.gnb .nav { display:block;float:left;font-family:'맑은 고딕', '돋움', 'tahoma', 'ARIAL'; line-height:19px; font-size:14px;margin-top:8px;padding:4px 10px 6px 10px;border-left:1px solid #D5FDFF;border-right:1px solid #3D8F9E;color:#333;}
.gnb .nav:hover { font-weight:bold; }
</style>
</head>


<body style="margin:0;height: 50px;min-width:1000px;">
<form name="frmMenu" method="post" target="">
<input type="hidden" name="selAction" />
</form>

<div class="topmenu_wrap">
	<div style="position:relative;">
		<div class="logo_container">
			<div class="logo" style="width:500px">
				<a href="/" target="_top"  style="width:500px">양봉협회 관리자 시스템</a>
			</div>
		</div>
		<div class="btn_container">
			<!-- <div class="btn">
				<a href="/" target="_blank"><img src="/_hqmgr/image/ico_arrow_r.png" />홈페이지 바로가기</a>
			</div>
			<div class="btn">
				<a href="/adminMenu.do?subMenu=main" target="_parent"><img src="/_hqmgr/image/ico_arrow_r.png" />관리자 홈 바로가기</a>
			</div> -->
			<div style="width: 400px;color: #eeeeee;line-height: 40px;">
			<%-- <span style="font-weight:bold; font-size: 12px; color:#eeeeee"><%=userInfo.getUSER_NM() %></span> 님 환영합니다. --%>
			</div>
		</div>
	</div>
	<div class="topmenu_gnb">
		<ul>
 			<li class="left bg_gradient meet">
				<a href="/_mgr/jsp/default.jsp?subMenu=member" target="_parent">협회 회원관리</a>
			</li>
 			<li class="left bg_gradient meet">
				<a href="/_mgr/jsp/default.jsp?subMenu=certi" target="_parent">시험성적관리</a>
			</li>
 			<li class="left bg_gradient meet">
				<a href="/_mgr/jsp/default.jsp?subMenu=selfcost" target="_parent">자조금관리</a>
			</li>
 			<li class="left bg_gradient meet">
				<a href="/_mgr/jsp/default.jsp?subMenu=selfQRCode" target="_parent">QR코드관리</a>
			</li>
 			<li class="left bg_gradient meet">
				<a href="/_mgr/jsp/default.jsp?subMenu=bbs" target="_parent">게시판관리</a>
			</li>
 			<li class="left bg_gradient meet">
				<a href="/_mgr/jsp/default.jsp?subMenu=notification" target="_parent">SMS/팩스</a>
			</li>
			<li class="right bg_gradient">
				<a class="nav" href="/logout.do" style="font-weight:normal">Log out</a>
			</li>
		
		</ul>
	</div>
</div>
</body>
</html>