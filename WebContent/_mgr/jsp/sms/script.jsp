<%@page import="kr.or.korapis.admin.sms.AdminSmsAction"%>
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
	String ext = "";
			
	//등록 수정
	if(script_act == AdminSmsAction.ACT_SMSSEND){
		switch(script_ret){
		case DefaultCode.SUCCESS:
			location = "/adminSms.do";
			
			msg = "성공적으로 발송되었습니다.";
			ext = "\\n GROUP_ID:"+param.getString("GROUP_ID");
			ext += "\\n RESULT_CODE:"+param.getString("RESULT_CODE");
			ext += "\\n RESULT_MESSAGE:"+param.getString("RESULT_MESSAGE");
			ext += "\\n SUCCESS_COUNT:"+param.getString("SUCCESS_COUNT");
			ext += "\\n ERROR_COUNT:"+param.getString("ERROR_COUNT");
			msg += ext;
			
			break;

		case DefaultCode.FAIL:
			msg = "오류가 발생했습니다.";

			ext = "\\n GROUP_ID:"+param.getString("GROUP_ID");
			ext += "\\n RESULT_CODE:"+param.getString("RESULT_CODE");
			ext += "\\n RESULT_MESSAGE:"+param.getString("RESULT_MESSAGE");
			ext += "\\n SUCCESS_COUNT:"+param.getString("SUCCESS_COUNT");
			ext += "\\n ERROR_COUNT:"+param.getString("ERROR_COUNT");
			ext += "\\n ERROR_STRING:"+param.getString("ERROR_STRING");
			msg += ext;
			
			location = "/adminSms.do";
			break;
			
		default:
			msg = "관리자에게 문의바랍니다.";	
			location = "/adminMember.do";
			break;
		}
	}


%>
<form name="frmScript" method="post" target="">
<input type="hidden" name="selAction" value="<%=selAction %>" />
</form>
<script>
	<%if(!"".equals(msg)){%>
	alert("<%=msg %>");
	<%}%>
	var frm = document.forms.frmScript;
	frm.action = "<%=location %>";
	frm.submit();
</script>