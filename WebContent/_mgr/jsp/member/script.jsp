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
	String retStr = (String)request.getAttribute("retStr");
	
	String selAction = "V";
	
	String uid = "";
	
	//등록 수정
	if(script_act == DefaultCode.ACT_UPD){
		selAction = "detail";
		uid = param.getString("uid");
		
		switch(script_ret){
		case DefaultCode.SUCCESS:
			location = "/adminMember.do";
			break;

		case DefaultCode.FAIL:
			msg = "오류가 발생했습니다.";
			location = "/adminMember.do";
			break;
			
		default:
			msg = "관리자에게 문의바랍니다.";	
			location = "/adminMember.do";
			break;
		}
		
		
	//등록
	}else if(script_act == DefaultCode.ACT_INS){
		
		if(!"".equals(retStr)){
			uid = retStr;
			selAction = "detail";
			location = "/adminMember.do";
		}else{
			msg = "오류가 발생했습니다.";
			location = "/adminMember.do";
		}
		
	//삭제
	}else if(script_act == DefaultCode.ACT_DEL){
		switch(script_ret){
		case DefaultCode.SUCCESS:
			location = "/adminMember.do";
			break;

		case DefaultCode.FAIL:
			msg = "오류가 발생했습니다.";
			location = "/adminMember.do";
			break;
			
		default:
			msg = "관리자에게 문의바랍니다.";	
			location = "/adminMember.do";
			break;
		}
			
		
	}else if(script_act == DefaultCode.ACT_COST||script_act == DefaultCode.ACT_SELF){
		switch(script_ret){
		
		case DefaultCode.SUCCESS:
			location = "/adminMember.do";
			break;
			
		case DefaultCode.FAIL:
			msg = "오류가 발생했습니다.";
			location = "/adminMember.do";
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
<input type="hidden" name="uid" value="<%=uid %>" />
</form>
<script>
	<%if(!"".equals(msg)){%>
	alert("<%=msg %>");
	<%}%>
	var frm = document.forms.frmScript;
	frm.action = "<%=location %>";
	frm.submit();
</script>