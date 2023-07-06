<%@page import="kr.or.korapis.util.DateC"%><%@page import="kr.or.korapis.db.ResultSetEntity"%><%@page import="kr.or.korapis.util.TextFormatter"%><%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="kr.or.korapis.member.MemberDao"%><%@page import="kr.or.korapis.vo.UserInfoVo"%><%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr"%><%@ page import="java.io.*" %><%
	
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");

MiceParam param = (MiceParam)request.getAttribute("param");
ResultSetEntity d = (ResultSetEntity)request.getAttribute("dataList");
String fname = "자조금납부.csv";

response.setHeader("Content-Type", "text/csv; charset=euc-kr"); //컨텐츠 타입
response.setHeader("Content-Description", "JSP Generated Data");
response.setHeader("Content-Disposition", "attachment; filename=\""+new String((fname).getBytes("MS949"),"8859_1")+"\";");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");
%>"납부일","지회","지부","납부자","금액","비고","수정일시"
<%
if(d!=null && d.size()>0){

for(int i=0; i<d.size(); i++){
	d.next();
	
%>"<%=d.getString("regdate").replace("\"","\"\"") %>","<%=d.getString("branch1").replace("\"","\"\"") %>","<%=d.getString("branch2").replace("\"","\"\"") %>","<%=d.getString("membername").replace("\"","\"\"") %>","<%="".equals(d.getString("price")) ? "-" : TextFormatter.formatNum(d.getString("price").replace("\"","\"\"")) %>","<%=d.getString("etc").replace("\"","\"\"") %>","<%=DateC.chgMysqlDate(d.getString("ts"), "yyyy-MM-dd HH:mm:ss") %>"
<%
	}
} 
%>