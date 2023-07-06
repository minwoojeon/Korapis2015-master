<%@page import="java.util.Enumeration"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%><%@page import="kr.or.korapis.util.TextFormatter"%><%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="kr.or.korapis.member.MemberDao"%><%@page import="kr.or.korapis.vo.UserInfoVo"%><%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr"%><%@ page import="java.io.*" %><%
	
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");

MemberDao dao = new MemberDao();
int selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), 1);
String selUserlevel = TextFormatter.convNvl(request.getParameter("selUserlevel"), "");
String searchGubun = TextFormatter.convNvl(request.getParameter("searchGubun"), "");
String searchText = TextFormatter.convNvl(request.getParameter("searchText"), "");
String addPay = TextFormatter.convNvl(request.getParameter("addPay"),"");


//회원정보, 납부정보 모두 납부내역 나오도록 처리
addPay = "Y";


MiceParam param = new MiceParam();
Enumeration<String> en = request.getParameterNames();
String name,  values[];
while( en.hasMoreElements()) {
	name = en.nextElement();
	param.put(name, request.getParameterValues(name));
}



param.put("role_pos", userInfo.getRole_pos());
param.put("branch1", userInfo.getBranch1());
param.put("branch2", userInfo.getBranch2());


String fname = "";
if("지회장".equals(userInfo.getRole_pos())){ 
	fname = userInfo.getBranch1()+"지회 회원정보.csv";
}else if("사무국장".equals(userInfo.getRole_pos())){ 
	fname = userInfo.getBranch1()+"지회 회원정보.csv";
}else if("지부장".equals(userInfo.getRole_pos())){
	fname = userInfo.getBranch2()+"지부 회원정보.csv";
} 


ResultSetEntity d = dao.getList_branch_pay(param, 0, 999999);
response.setHeader("Content-Type", "text/csv; charset=MS949"); //컨텐츠 타입
response.setHeader("Content-Description", "JSP Generated Data");
response.setHeader("Content-Disposition", "attachment; filename=\""+new String((fname).getBytes("MS949"),"8859_1")+"\";");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");
%>"이름","지회","지부"<%if("Y".equals(addPay)){ %>,"2015","2014","2013","2012"<%} %>,"직책","휴대폰","주민등록번호","아이디","나이","성별","사업장명","사업자등록번호","우편번호(자택)","주소1(자택)","주소2(자택)","TEL(자택)","우편번호(사업장)","주소1(사업장)","주소2(사업장)","TEL(사업장1)","TEL(사업장2)","TEL(사업장3)","FAX","E-mail","우편물 수취","가입일자","경력","사육군수"
<%
if(d!=null && d.size()>0){

String str_ho = "";
String str_sex = "";

for(int i=0; i<d.size(); i++){
	d.next();
	
				
	
	//회원구분	이름	아이디	암호	나이
	//성별,주민등록번호,사업장명,사업자등록번호,지회,지부,역할,직책,
	//우편번호(자택),주소1(자택),주소2(자택),TEL(자택),우편번호(사업장),주소1(사업장),주소2(사업장),
	//TEL(사업장1),TEL(사업장2),TEL(사업장3),
	//휴대폰,FAX,E-mail,
	//우편물 수취,가입일자,경력,사육군수,비고

	if("H".equals(d.getString("mailreceive"))){
		str_ho = "자택";
	}else if("O".equals(d.getString("mailreceive"))){
		str_ho = "사업장";
	}
	
	if("M".equals(d.getString("sex"))){
		str_sex = "남";
	}else{
		str_sex = "여";
	}
	
%>"<%=d.getString("name") %>","<%=d.getString("branch1") %>","<%=d.getString("branch2") %>"<%if("Y".equals(addPay)){ %>,"<%=!"".equals(d.getString("pay_2015"))?"O":"" %>","<%=!"".equals(d.getString("pay_2014"))?"O":"" %>","<%=!"".equals(d.getString("pay_2013"))?"O":"" %>","<%=!"".equals(d.getString("pay_2012"))?"O":"" %>"<%} %>,"<%=d.getString("role_pos") %>","<%=d.getString("cp1")+"-"+d.getString("cp2")+"-"+d.getString("cp3") %>","<%=d.getString("regnumber")+"-*******" %>",<%=d.getString("id") %>","<%=d.getString("age") %>","<%=str_sex %>","<%=d.getString("companyname")%>","<%=d.getString("biznumber1")+"-"+d.getString("biznumber2")+"-"+d.getString("biznumber3") %>","<%=d.getString("hzipcode3") %>","<%=d.getString("haddr1") %>","<%=d.getString("haddr2") %>","<%=d.getString("hphone1")+"-"+d.getString("hphone2")+"-"+d.getString("hphone3") %>","<%=d.getString("ozipcode3") %>","<%=d.getString("oaddr1") %>","<%=d.getString("oaddr2") %>","<%=d.getString("ophone1")+"-"+d.getString("ophone2")+"-"+d.getString("ophone3") %>","<%=d.getString("o2phone1")+"-"+d.getString("o2phone2")+"-"+d.getString("o2phone3") %>","<%=d.getString("o3phone1")+"-"+d.getString("o3phone2")+"-"+d.getString("o3phone3") %>","<%=d.getString("ofax1")+"-"+d.getString("ofax2")+"-"+d.getString("ofax3") %>","<%=d.getString("email") %>","<%=str_ho %>","<%=d.getString("registdate") %>","<%=d.getString("carrier") %>","<%=d.getString("breednumber") %>"
<%
	}
} 
%>