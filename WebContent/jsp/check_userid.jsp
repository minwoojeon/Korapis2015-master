<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.admin.AdminJsonDao"%>
<%

String id = TextFormatter.convNvl(request.getParameter("id"), "");
AdminJsonDao dao = new AdminJsonDao();
String ret = dao.check_userid(id);
String str = "";
if("Y".equals(ret)){
	str = "SUCCESS";
}else{
	str = "FAIL";
}

%>
<%="{\"result\":\""+str+"\"}" %>
