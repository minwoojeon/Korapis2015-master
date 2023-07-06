<%@page import="kr.or.korapis.util.DefaultCode"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
<%@page import="kr.or.korapis.member.MemberDao"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
System.out.println("syb7-2_insert.jsp");

MemberDao dao = new MemberDao();

Enumeration<String> en = request.getParameterNames();
String name;
MiceParam param = new MiceParam();
while(en.hasMoreElements()){
	name = en.nextElement();
	param.put(name, request.getParameterValues(name));
}

int ret = dao.insert_member_ilban(param); 


%>    

<script>
<%
if(ret == DefaultCode.SUCCESS){
%>
	alert("회원정보가 등록되었습니다.");
	parent.location.href="/jsp/main.jsp";
<%
}else{
%>
	alert("회원정보 등록에 실패하였습니다.");
	parent.location.reload();
<%
} 
%>
	
</script>    
