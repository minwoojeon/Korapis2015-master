<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%><%@page import="kr.or.korapis.util.TextFormatter"%><%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="kr.or.korapis.member.MemberDao"%><%@page import="kr.or.korapis.vo.UserInfoVo"%><%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr"%><%@ page import="java.io.*" %><%

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");

MiceParam param = (MiceParam)request.getAttribute("param");
ResultSetEntity d = (ResultSetEntity)request.getAttribute("dataList");
String fname = "협회회원.csv";



response.setHeader("Content-Type", "text/csv; charset=euc-kr"); //컨텐츠 타입
response.setHeader("Content-Description", "JSP Generated Data");
response.setHeader("Content-Disposition", "attachment; filename=\""+new String((fname).getBytes("MS949"),"8859_1")+"\";");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");

int startYear = DateC.getKorapisBillYear();
int countYear = 5;

// 이름,지회,지부, 직책, 핸드폰번호, 받을주소, 가입년도, 회비납부현황(2011-2014), 연락처, 팩스, 이메일, ~~~

%>"이름","지회","지부","역할","직책","우편물받을주소(우편번호)","우편물받을주소(주소)","가입년도",<%
for(int i = startYear; i > startYear - countYear; i--){
%>"<%=i%>년 납부",<%} %>"휴대폰","FAX","E-mail","아이디","암호","나이","성별","주민등록번호","사업장명","사업자등록번호","우편번호(자택)","주소1(자택)","주소2(자택)","TEL(자택)","우편번호(사업장)","주소1(사업장)","주소2(사업장)","TEL(사업장1)","TEL(사업장2)","TEL(사업장3)","우편물 수취","연락상태","가입일자","경력","사육군수","비고"
<%
if(d!=null && d.size()>0){

String str_userlevel = "";
String str_ho = "";
String str_sex = "";
String str_receiveAddr = "";
String str_receiveZipcode = "";

String[] totArr = new String[countYear];
String tot_2017 = "";
String tot_2016 = "";
String tot_2015 = "";
String tot_2014 = "";


for(int i=0; i<d.size(); i++){
	d.next();

	int regist_year = TextFormatter.convNvl(d.getString("registDate").substring(0,4), -1);

/* 	if("O".equals(d.getString("userlevel"))){
		str_userlevel = "정회원";
	}else if("R".equals(d.getString("userlevel"))){
		str_userlevel = "준회원";
	}else if("X".equals(d.getString("userlevel"))){
		str_userlevel = "탈퇴회원";
	} */


	//회원구분	이름	아이디	암호	나이
	//성별,주민등록번호,사업장명,사업자등록번호,지회,지부,역할,직책,
	//우편번호(자택),주소1(자택),주소2(자택),TEL(자택),우편번호(사업장),주소1(사업장),주소2(사업장),
	//TEL(사업장1),TEL(사업장2),TEL(사업장3),
	//휴대폰,FAX,E-mail,
	//우편물 수취,가입일자,경력,사육군수,비고

	if("H".equals(d.getString("mailreceive"))){
		str_ho = "자택";
		//str_receiveZipcode = d.getString("hzipcode1")+"-"+d.getString("hzipcode2");
		str_receiveZipcode = d.getString("hzipcode3");
		str_receiveAddr = d.getString("haddr1") + " " +d.getString("haddr2");

	}else if("O".equals(d.getString("mailreceive"))){
		str_ho = "사업장";
		//str_receiveZipcode = d.getString("ozipcode1")+"-"+d.getString("ozipcode2");
		str_receiveZipcode = d.getString("ozipcode3");
		str_receiveAddr = d.getString("oaddr1") + " " +d.getString("oaddr2");
	}

	if("M".equals(d.getString("sex"))){
		str_sex = "남";
	}else{
		str_sex = "여";
	}


	for(int y = startYear; y > startYear - countYear; y--){
		if(y == 2013){
			totArr[startYear-y] = d.getInt("tot_"+y) < 100000 ? "X" : "O";
		}else{
			totArr[startYear-y] = (d.getString("tot_"+y).equals("0") ? "X" : "O");
		}
		if(regist_year > y){
			totArr[startYear-y] = "-";
		}
	}
	/*
	//2017년납부
	tot_2017 = (d.getString("tot_2017").equals("0")) ? "X" :"O";
	//2016년납부
	tot_2016 = (d.getString("tot_2016").equals("0")) ? "X" :"O";
	//2015년 납부
	tot_2015 = (d.getString("tot_2015").equals("0")) ? "X" :"O";
	if(d.getInt("tot_2014") < 100000) {
		tot_2014 = "X";
	}else{
		tot_2014 = "O";
	}

	if(regist_year>=2017){
		tot_2014 = "-";
		tot_2015 = "-";
		tot_2016 = "-";
	}else if(regist_year>=2016){
		tot_2014 = "-";
		tot_2015 = "-";
	}else if(regist_year>=2015){
		tot_2014 = "-";
	}else if(regist_year>=2014){
	}
	*/


	String str_contact_status = "";
	if("D".equals(d.getString("contact_status"))){
		str_contact_status = "사망";
	}else if("N".equals(d.getString("contact_status"))){
		str_contact_status = "장기미활동";
	}else if("O".equals(d.getString("contact_status"))){
		str_contact_status = "OK";
	}else if("R".equals(d.getString("contact_status"))){
		str_contact_status = "반송";
	}else if("K".equals(d.getString("contact_status"))){
		str_contact_status = "거절";
	}else if("H".equals(d.getString("contact_status"))){
		str_contact_status = "자격정지";
	}else if("U".equals(d.getString("contact_status"))){
		str_contact_status = "제명";
	}else if("L".equals(d.getString("contact_status"))){
		str_contact_status = "탈퇴";
	}




%>"<%=d.getString("name") %>","<%=d.getString("branch1") %>","<%=d.getString("branch2") %>","<%=d.getString("role") %>","<%=d.getString("role_pos") %>",="<%=str_receiveZipcode %>","<%=str_receiveAddr %>","<%=d.getString("registdate") %>",<%
for(String tot : totArr){
	out.print("\""+tot+"\",");
}
%>"<%=d.getString("cp1")+"-"+d.getString("cp2")+"-"+d.getString("cp3") %>","<%=d.getString("ofax1")+"-"+d.getString("ofax2")+"-"+d.getString("ofax3") %>","<%=d.getString("email") %>","<%=d.getString("id") %>","<%=d.getString("passwd") %>","<%=d.getString("age") %>","<%=str_sex %>","<%=d.getString("regnumber")+"-"+d.getString("regnumber2") %>","<%=d.getString("companyname")%>","<%=d.getString("biznumber1")+"-"+d.getString("biznumber2")+"-"+d.getString("biznumber3") %>",="<%=d.getString("hzipcode3") %>","<%=d.getString("haddr1") %>","<%=d.getString("haddr2") %>","<%=d.getString("hphone1")+"-"+d.getString("hphone2")+"-"+d.getString("hphone3") %>",="<%=d.getString("ozipcode3") %>","<%=d.getString("oaddr1") %>","<%=d.getString("oaddr2") %>","<%=d.getString("ophone1")+"-"+d.getString("ophone2")+"-"+d.getString("ophone3") %>","<%=d.getString("o2phone1")+"-"+d.getString("o2phone2")+"-"+d.getString("o2phone3") %>","<%=d.getString("o3phone1")+"-"+d.getString("o3phone2")+"-"+d.getString("o3phone3") %>","<%=str_ho %>","<%=str_contact_status %>","<%=d.getString("registdate") %>","<%=d.getString("carrier") %>","<%=d.getString("breednumber") %>","<%=d.getString("comment") %>"
<%
	}
}
%>