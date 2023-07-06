<%@page import="kr.or.korapis.util.DefaultCode"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	MiceParam param = (MiceParam)request.getAttribute("param");
	int script_act = (int)(Integer)request.getAttribute("script_act");
	int script_ret = (int)(Integer)request.getAttribute("script_ret");
	
	String msg = "";
	String location = "";
	
	if(script_act == DefaultCode.ACT_UPD){
		
		switch(script_ret){
		
		case DefaultCode.SUCCESS:
			location = "/adminselfQRCode.do";
			break;
		
		case DefaultCode.FAIL:
			location = "/adminselfQRCode.do";
			msg = "오류가 발생하였습니다";
			break;
			
		default:
			msg = "관리자에게 문의바랍니다.";
			location = "/adminselfQRCode.do";
			break;
		}
	}else if(script_act == DefaultCode.ACT_ADD){
		switch(script_ret){
		
		case DefaultCode.SUCCESS:
			location = "/adminselfQRCode.do";
			break;
		
		case DefaultCode.FAIL:
			location = "/adminselfQRCode.do";
			msg = "오류가 발생하였습니다";
			break;
			
		default:
			msg = "관리자에게 문의바랍니다.";
			location = "/adminselfQRCode.do";
			break;
		}
		
	}else if(script_act == DefaultCode.ACT_PUB){
		
		int pubCnt = (int)(Integer)request.getAttribute("pubCnt");
		int to = (Integer)request.getAttribute("prod_seq_to");
		
		switch(script_ret){
		
		case DefaultCode.SUCCESS:
			msg = "배포에 성공하였습니다";
			location = "/adminselfQRCode.do";
			break;
		
		case DefaultCode.FAIL:
			if(pubCnt>0){
				msg = "이미 발급된 필증코드 번호가 있습니다.";
			}else{
				msg = "오류가 발생하였습니다";
			}
			location = "/adminselfQRCode.do";
			break;
		
		case DefaultCode.FAIL_CNT:
			msg = "등록되있는 범위의 값만 입력가능합니다";	
			location = "/adminselfQRCode.do";
			break;	
		
		default:
			msg = "관리자에게 문의바랍니다.";
			location = "/adminselfQRCode.do";
			break;
		}
		
	}
	
%>
<form name="frmScript" method="post" target="">
<input type="hidden" name="selAction" value="V">
</form>
<script type="text/javascript">
	<%if(!"".equals(msg)){%>
	alert('<%=msg%>');
	<%}%>
	var frm = document.forms.frmScript;
	frm.action = "<%=location%>";
	frm.submit();

</script>