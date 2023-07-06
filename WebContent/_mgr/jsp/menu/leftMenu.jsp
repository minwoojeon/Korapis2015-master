<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


//로그인 사용자만 가능
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null){%><script>alert('인증되지 않았거나 오랜시간 사용하지 않아 로그오프 합니다.');</script><% response.sendRedirect("/");}

String subMenu = TextFormatter.convNvl(request.getParameter("subMenu"), "member");

String title = "";
if("member".equals(subMenu)){
	title = "협회회원관리";
}else if("certi".equals(subMenu)){
	title = "시험성적서관리";
}else if("selfcost".equals(subMenu)){
	title = "자조금관리";
}else if("selfQRCode".equals(subMenu)){
	title = "QRCode 관리";
}else if("bbs".equals(subMenu)){
	title = "게시판관리";
}else if("notification".equals(subMenu)){
	title = "SMS/팩스";
}else{
	title = "회원관리";	
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="robots" content="noindex">
<meta http-equiv="expires" content="0">
<meta http-equiv="pragma" content="no-cache">
<link rel="stylesheet" type="text/css" href="/_mgr/css/admstyle.css">
<script type="text/javascript" src="/_mgr/js/jquery-latest.min.js"></script>
<script	language="javascript">
<!--
	
	function f_moveTime(mName){
		return f_move(mName, '검색결과를 불러오는 시간이 길어질 수 있습니다.\n계속하시겠습니까?');
	}
	
	//메뉴클릭, msg가 있을 경우 확인.
	function f_move(mName, msg) {
		if(mName !="") {
			if(msg!=undefined){
				if(confirm(msg)){
					frmLeftMenu.target = "viewer";
					frmLeftMenu.action = mName;
					frmLeftMenu.submit();
				}
			}else{
				frmLeftMenu.target = "viewer";
				frmLeftMenu.action = mName;
				frmLeftMenu.submit();
			}
			
		}else {
			alert("준비중입니다.");
			return;
		}
		
	}
	
	
	
	$(function(){
		var btn = $("<a>").attr("href","javascript:;").addClass("btn_hide").addClass("bg_gradient");
		btn.append("<span></span>");
		btn.data("status","on");
		$("#leftmenu_title").append(btn);
		btn.on("click",function(){
			if($(this).data("status") == "on"){
				btn.find("span").css({"background-position":"0 -41px"});
				btn.data("status","off");
				$("#func_frame",top.document).css({"width":"20px"});
				$("#viewer_frame",top.document).css({"margin-left":"20px"});
				$("#leftmenu_title").css({"left":"-160px"});
				$("#left_menu_area").hide();
			}else{
				btn.find("span").css({"background-position":"0 0px"});
				btn.data("status","on");
				$("#func_frame",top.document).css({"width":"180px"});
				$("#viewer_frame",top.document).css({"margin-left":"180px"});
				$("#leftmenu_title").css({"left":"0"});
				$("#left_menu_area").show();
			}
		});
		
		$("ul.sub1 li").on("click",function(e){
			$("ul.main li").removeClass("selected");
			$(this).addClass("selected");
		});
		
		top.window.selectList = function(id){
			$("ul.main li").removeClass("selected");
			$("#"+id).addClass("selected");
		}
		
	});
	
//-->
</script>
<style>
html{width:180px;height:100%;}
</style>

<body style="background:#4c4c4c url('/_mgr/image/bg_leftmenu.png');">
<form name="frmLeftMenu" method="post"></form>
<input type="hidden" name="eventIdx" value="">

<div id="leftmenu_title"><span><%=title %></span></div>
<div id="left_menu_area" style="position:relative;">
	<ul class="main">
	
<%if("member".equals(subMenu)){ %>	
		<li><a class="bg_gradient">회원정보</a>
			<ul class="sub1">
				<li><a href="javascript: f_move('/adminMember.do')">회원 목록</a></li>
				<li><a href="javascript: f_move('/adminMember.do?selAction=MA')">회원 신규등록</a></li>
				<li><a href="javascript: f_move('/adminPay.do')">회비 납부내역</a></li>
			</ul>
		</li>
<%}else if("certi".equals(subMenu)){ %>	
		<li><a class="bg_gradient">시험성적서정보</a>
			<ul class="sub1">
				<li><a href="javascript: f_move('/adminCerti.do')">시험성적서 목록</a></li>
				<li><a href="javascript: f_move('/adminCerti.do?selAction=upload_data')">시험성적서 업로드</a></li>
			</ul>
		</li>
<%}else if("certi".equals(subMenu)){ %>	
		<li><a class="bg_gradient">QRCode관리</a>
			<ul class="sub1">
				<li><a href="javascript: f_move('/adminQRCode.do')">QRCode 목록</a></li>
			</ul>
		</li>
<%}else if("bbs".equals(subMenu)){ %>	
		<li><a class="bg_gradient">게시판 정보</a>
			<ul class="sub1">
				<li><a href="javascript: f_move('/adminBbs.do?bflag=02')">홍보동영상</a></li>
				<li><a href="javascript: f_move('/adminBbs.do?bflag=08')">양봉협회보</a></li>
				<li><a href="javascript: f_move('/adminBbs.do?bflag=01')">공지사항</a></li>
				<li><a href="javascript: f_move('/adminBbs.do?bflag=10')">협회소식</a></li>
				<li><a href="javascript: f_move('/adminBbs.do?bflag=04')">종봉분양</a></li>
				<li><a href="javascript: f_move('/adminBbs.do?bflag=05')">자유게시판</a></li>
				<li><a href="javascript: f_move('/adminBbs.do?bflag=06')">QnA</a></li>
				
			</ul>
		</li>
				
<%}else if("selfcost".equals(subMenu)){ %>	
		<li><a class="bg_gradient">자조금 정보</a>
			<ul class="sub1">
				<li><a href="javascript: f_move('/adminSelfcost.do')">자조금 목록</a></li>
				<li><a href="javascript: f_move('/adminSelfcost.do?selAction=stat_year')">년간 자조금 현황</a></li>
				<li><a href="javascript: f_move('/adminSelfcost.do?selAction=stat_month&selYear=<%=DateC.getCurrentYYYY()%>')">월별 자조금 현황</a></li>
			</ul>
		</li>
<%}else if("notification".equals(subMenu)){ %>	
		<li><a class="bg_gradient">SMS/팩스 관리</a>
			<ul class="sub1">
				<li><a href="javascript: f_move('/adminSms.do')">SMS 관리</a></li>
				<!-- <li><a href="javascript: f_move('/adminReady.do')">이메일 관리</a></li> -->
				<li><a href="http://enfax.ppurio.com/mgr/index.qri" target="_blank" >팩스 관리</a></li>
			</ul>
		</li>

<%} else if("selfQRCode".equals(subMenu)){%>
	<li>
		<a href="javascript: f_move('/adminselfQRCode.do')" class="bg_gradient">QR코드 발급목록</a>
		<a href="javascript: f_move('/adminselfQRCode.do?selAction=history')" class="bg_gradient">QR코드 배포이력</a>	
		<a href="javascript: f_move('/_mgr/jsp/KorapisApp.html')" class="bg_gradient">QR코드 앱 다운로드</a>	
	</li>
<%} %>
	</ul>
</div>

</body>
</html>

