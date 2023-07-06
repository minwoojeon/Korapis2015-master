<%@page import="kr.or.korapis.util.DefaultCode"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	MiceParam param = (MiceParam)request.getAttribute("param");
	String msg = "";
	String location = "";

	int script_act = (int)(Integer)request.getAttribute("script_act");
	int script_ret = (int)(Integer)request.getAttribute("script_ret");

	
	if(script_act == DefaultCode.ACT_LOGOUT){
		msg = "로그아웃합니다.";
		location = "/";

	}else if(script_act == DefaultCode.ACT_LOGIN){
		if(script_ret == DefaultCode.FAIL_IDPWD){
			msg = "아이디, 패스워드를 확인해주세요.";
			location = "/jsp/sub7-1.jsp";
		}else{
			msg = "아이디, 패스워드를 확인해주세요.";
			location = "/jsp/sub7-1.jsp";
		}
				
				
	}

%>
<script>
	<%if(!"".equals(msg)){%>
	alert("<%=msg %>");
	<%}%>
	window.location = "<%=location %>";
</script>