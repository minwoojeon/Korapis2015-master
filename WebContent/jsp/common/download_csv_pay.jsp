<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%><%@page import="kr.or.korapis.util.TextFormatter"%><%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="kr.or.korapis.member.MemberDao"%><%@page import="kr.or.korapis.vo.UserInfoVo"%><%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr"%><%@ page import="java.io.*" %><%

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");

MemberDao dao = new MemberDao();
int selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), 1);
String selUserlevel = TextFormatter.convNvl(request.getParameter("selUserlevel"), "");
String searchGubun = TextFormatter.convNvl(request.getParameter("searchGubun"), "");
String searchText = TextFormatter.convNvl(request.getParameter("searchText"), "");


int startYear = DateC.getKorapisBillYear();

MiceParam param = new MiceParam();
param.put("selPageNo", selPageNo);
param.put("selUserlevel", selUserlevel);
param.put("searchGubun", searchGubun);
param.put("searchText", searchText);
param.put("selUserlevel", selUserlevel);
param.put("role_pos", userInfo.getRole_pos());
param.put("branch1", userInfo.getBranch1());
param.put("branch2", userInfo.getBranch2());




String fname = "";
if("지회장".equals(userInfo.getRole_pos())){
	fname = userInfo.getBranch1()+"지회 회비내역.csv";
}else if("사무국장".equals(userInfo.getRole_pos())){
	fname = userInfo.getBranch1()+"지회 회비내역.csv";
}else if("지부장".equals(userInfo.getRole_pos())){
	fname = userInfo.getBranch2()+"지부 회비내역.csv";
}

ResultSetEntity d = dao.getList_branch_pay(param, 0, 999999);

response.setHeader("Content-Type", "text/csv; charset=MS949"); //컨텐츠 타입
response.setHeader("Content-Description", "JSP Generated Data");
response.setHeader("Content-Disposition", "attachment; filename=\""+new String((fname).getBytes("MS949"),"8859_1")+"\";");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");
%>"이름","지회","지부","우편번호","주소","TEL","hp",<%
for(int i = startYear; i > startYear - 4; i--){
%>"<%=i %>",<%
} %>"가입일자"
<%
if(d!=null && d.size()>0){

		String[] payArr = new String[4];
		String str2017 = "";
		String str2016 = "";
		String str2015 = "";
		String str2014 = "";

		String str_zipcode = "";
		String str_addr = "";
		String str_phone = "";
		String str_cp = "";
		for(int i=0; i<d.size(); i++){
			d.next();


			str_cp = d.getString("cp1")+"-"+d.getString("cp2")+"-"+d.getString("cp3");

			//str2015 = "".equals(d.getString("pay_2015")) ? "-" : "O";
			//str2014 = "".equals(d.getString("pay_2014")) ? "X" : "O";
			//str2013 = "".equals(d.getString("pay_2013")) ? "X" : "O";
			//str2012 = "".equals(d.getString("pay_2012")) ? "X" : "O";


			for(int y = startYear; y > startYear - 4; y--){
				if(y == 2013){
					payArr[startYear-y] = d.getInt("pay_"+y) < 100000 ? "X" : "O";
				}else{
					payArr[startYear-y] = (d.getInt("pay_"+y) > 0 ? "O" : "X");
				}
			}
	/*
			str2017 = d.getInt("pay_2017")>0 ? "O" : "-";
			str2016 = d.getInt("pay_2016")>0 ? "O" : "X";
			str2015 = d.getInt("pay_2015")>0 ? "O" : "X";
			str2014 = d.getInt("pay_2014")>0 ? "O" : "X";
*/


			if("H".equals(d.getString("mailreceive"))){
				str_zipcode = d.getString("hzipcode3");
				str_addr = d.getString("haddr1")+" "+d.getString("haddr2");
				str_phone = d.getString("hphone1")+"-"+d.getString("hphone2")+"-"+d.getString("hphone3");
			}else if("O".equals(d.getString("mailreceive"))){
				str_zipcode = d.getString("ozipcode3");
				str_addr = d.getString("oaddr1")+" "+d.getString("oaddr2");
				str_phone = d.getString("ophone1")+"-"+d.getString("ophone2")+"-"+d.getString("ophone3");
			}



%>"<%=d.getString("name") %>","<%=d.getString("branch1") %>","<%=d.getString("branch2") %>","<%=str_zipcode %>","<%=str_addr %>","<%=str_phone %>","<%=str_cp %>","<%=payArr[0] %>","<%=payArr[1] %>","<%=payArr[2] %>","<%=payArr[3] %>","<%=d.getString("registdate") %>"
<%
	}
}
%>