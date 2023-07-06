<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<%

//로그인 사용자만 가능
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null){%><script>alert('인증되지 않았거나 오랜시간 사용하지 않아 로그오프 합니다.');</script><% response.sendRedirect("/");}


String subMenu = TextFormatter.convNvl(request.getParameter("subMenu"), "");

String app = TextFormatter.convNvl(request.getParameter("app"), "");

String funcSrc = "";
String viewerSrc = "";
if("member".equals(subMenu)){
	funcSrc = "/leftMenu.do?subMenu=member";
	viewerSrc = "/adminMember.do";	
}else if("certi".equals(subMenu)){
	funcSrc = "/leftMenu.do?subMenu=certi";
	viewerSrc = "/adminCerti.do";
}else if("selfcost".equals(subMenu)){
	funcSrc = "/leftMenu.do?subMenu=selfcost";
	viewerSrc = "/adminSelfcost.do";
}else if("selfQRCode".equals(subMenu)){
	funcSrc = "/leftMenu.do?subMenu=selfQRCode";
	viewerSrc = "/adminselfQRCode.do";
}else if("bbs".equals(subMenu)){
	funcSrc = "/leftMenu.do?subMenu=bbs";
	viewerSrc = "/adminBbs.do?bflag=02";
}else if("notification".equals(subMenu)){
	funcSrc = "/leftMenu.do?subMenu=notification";
	viewerSrc = "/adminSms.do";
}else{
	if("app".equals(app)){
		response.sendRedirect("/adminselfQRCode.do");
	}else{
		funcSrc = "/leftMenu.do?subMenu=member";
		viewerSrc = "/adminMember.do";			
	}
	//funcSrc = "/leftMenu.do?subMenu=member";
	//viewerSrc = "/adminMember.do";	
	
}
%>
<html>
<head>
<title>:: 양봉협회 관리자 시스템 ::</title>
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/admstyle.css">
<script type="text/javascript" src="/_mgr/js/jquery-latest.min.js"></script>
<LINK rel="SHORTCUT ICON" href="http://www.kotra-auto.org/img/bizmatch.ico"> 
<script type="text/javascript">
$(function(){
	$("#frame_func").css({height:$(window).height()-50});
	$("#frame_viewer").css({height:$(window).height()-50});
	$(window).on("resize",function(){
		$("#frame_func").css({height:$(window).height()-50});
		$("#frame_viewer").css({height:$(window).height()-50});
	});
});
</script>
</head>
<body style="margin:0;height:100%;overflow:hidden;">
<!-- 
<frameset id=mainframe rows="50,*" cols="*" style="padding:0px; margin:0px;" frameborder="0">
	<frame id="topFrame" src="/adminTopMenu.do" scrolling=no noresize style="padding:0px; margin:0px; background-color:#033266; border-bottom:1px solid #999;">
	<frameset name="mainFrame" id="main_view" rows="*" cols="160,*" noresize frameborder="0">
		<frame id="frame_func" name="func" src="<%=funcSrc %>" scrolling=yes>
		<frame id="frame_viewer" name="viewer" src="<%=viewerSrc %>" scrolling=yes>
	</frameset>
</frameset>
 -->
 
 <div id="mainframe">
 	<div style="height:50px;">
 		<iframe id="topFrame" src="/topMenu.do" scrolling="no" noresize style="width:100%;height:50px;" frameborder="0"></iframe>
 	</div>
 	<div style="position:relative;">
 		<div id="func_frame" style="float:left;width:180px;height:100%;overflow:hidden;">
 			<iframe id="frame_func" name="func" src="<%=funcSrc %>" scrolling="yes" frameborder="0" style="width:200px;height:100%;"></iframe>
 		</div>
 	</div>
 	<div id="viewer_frame" style="margin-left:180px;">
 		<div style="height:100%;">
 			<iframe id="frame_viewer" name="viewer" src="<%=viewerSrc %>" scrolling="yes" frameborder="0" style="width:100%;height:100%;"></iframe>
 		</div>
 	</div>
 </div>
 
 </body>
</html>

