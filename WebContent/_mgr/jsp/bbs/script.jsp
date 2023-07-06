<%@page import="kr.or.korapis.util.DefaultCode"%>
<%@page import="kr.or.korapis.member.MemberAction"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	MiceParam param = (MiceParam)request.getAttribute("param");

	String msg = "";
	String location = "/";
	String errcode= "";

	int script_act = (int)(Integer)request.getAttribute("script_act");
	int script_ret = (int)(Integer)request.getAttribute("script_ret");
	
	String selAction = "V";
	
	if(script_act == DefaultCode.ACT_DEL){
		switch(script_ret){
		case DefaultCode.SUCCESS:
			location = "/adminBbs.do";
			break;

		case DefaultCode.FAIL:
			msg = "오류가 발생했습니다.";
			location = "/adminBbs.do";
			break;
			
		default:
			msg = "관리자에게 문의바랍니다.";	
			location = "/adminBbs.do";
			break;
		}
	}else if(script_act == DefaultCode.ACT_MOVE){
		
		switch(script_ret){
		case DefaultCode.SUCCESS:
			location = "/adminBbs.do";
			break;

		case DefaultCode.FAIL:
			msg = "오류가 발생했습니다.";
			location = "/adminBbs.do";
			break;
			
		default:
			msg = "관리자에게 문의바랍니다.";	
			location = "/adminBbs.do";
			break;
		}
	}


%>
<form name="frmScript" method="post" target="">
<input type="hidden" name="selAction" value="<%=selAction %>" />
<input type="hidden" name="bflag" value="<%=param.getString("bflag") %>" />
</form>
<script>
	<% if(!"".equals(msg)){%>
	alert("<%=msg %>");
	<%}%>
	var frm = document.forms.frmScript;
	frm.action = "<%=location %>";
	frm.submit();
</script>