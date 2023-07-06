<%@page import="kr.or.korapis.db.ResultSetEntity"%><%@page import="kr.or.korapis.util.TextFormatter"%><%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="kr.or.korapis.member.MemberDao"%><%@page import="kr.or.korapis.vo.UserInfoVo"%><%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr"%><%@ page import="java.io.*" %><%
	
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");

MiceParam param = (MiceParam)request.getAttribute("param");
ResultSetEntity d = (ResultSetEntity)request.getAttribute("dataList");
String fname = "회비납부내역.csv";



response.setHeader("Content-Type", "text/csv; charset=euc-kr"); //컨텐츠 타입
response.setHeader("Content-Description", "JSP Generated Data");
response.setHeader("Content-Disposition", "attachment; filename=\""+new String((fname).getBytes("MS949"),"8859_1")+"\";");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");


//번호	이름	지회	지부	아이디	회비구분	납부	금액	납부일자

%>"번호","이름","지회","지부","아이디","회비구분","납부","납부금액","납부일자"
<%

if(d!=null && d.size()>0){
	int tot = d.size();
	for(int i=0; i<d.size(); i++){
		d.next();
	

%>"<%=tot-- %>","<%=d.getString("name") %>","<%=d.getString("branch1") %>","<%=d.getString("branch2") %>","<%=d.getString("member_uid") %>","<%=d.getString("gubun") %>","<%=d.getString("pay") %>","<%="".equals(d.getString("price")) ? "-" : TextFormatter.formatNum(d.getString("price")) %>","<%=d.getString("paydate") %>"
<%
	}
} 
%>