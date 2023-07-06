<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
MiceParam param = (MiceParam)request.getAttribute("param");
ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");

String Dmgubun = TextFormatter.convNvl(request.getParameter("Dmgubun"), "");
String Visible = "";
if(Dmgubun.equals("N")){
	Visible = "hidden";
} else {
	Visible = "visible";
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<title></title>
<style type="text/css">
.row { clear:both; display:table; table-layout:fixed; }
.item { display:table-cell; min-width: 290px;padding:10px;margin-right:-1px;margin-bottom:-1px;border:1px dashed #999; vertical-align:top; }
.item1 { display:table-cell; min-width: 290px;padding:10px;margin-right:-1px;margin-bottom:-1px;border:1px dashed #999; vertical-align:top; }
.table { width:100%;height:100%; }
.table td { max-width: 250px;height: }

.small {font-size: 11px; visibility: <%=Visible%>; }

#list { padding:20px; }

@media print {
	.print_area { display:none;}
	
	#list { padding:0; }
}
</style>
</head>
<body>
<div style="text-align: right; margin:20px" class="print_area">
	<a class="btn grey" href="javascript: window.print();">Print</a>
</div>
<div id="list">
<div class="row">
<%
	int i=0;
	String strAddr = "";
	String strZipCode = "";
	String PageConfig = "";
	while(dataList!=null&&dataList.next()){
		String gubun = dataList.getString("gubun1");
		String rolePos = dataList.getString("role_pos");
		i++;
		PageConfig = "";
		//보낼주소(자택, 사업장 )
		if("H".equals(dataList.getString("mailreceive"))){
			strZipCode = dataList.getString("Hzipcode3");
			strAddr = "";
			strAddr = "-".equals(strAddr) ? "" : strAddr;
			strAddr += dataList.getString("Haddr1") + " " + dataList.getString("Haddr2");
			
		}else if("O".equals(dataList.getString("mailreceive"))){
			strZipCode = dataList.getString("Ozipcode3");
			strAddr = "";
			strAddr = "-".equals(strAddr) ? "" : strAddr;
			strAddr += dataList.getString("Oaddr1") + " " + dataList.getString("Oaddr2");
			
		}else{
			strAddr = "";
		}
		int regist_year = TextFormatter.convNvl(dataList.getString("registDate").substring(0,4), -1);
		
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String payYn = "";
		//int y1=dataList.getInt("year01_gubun"), 
		//		y2=dataList.getInt("year02_gubun"), 
		//		y3=dataList.getInt("year03_gubun"), 
		//		y4=dataList.getInt("year04_gubun"),
		//		t1=dataList.getInt("year01_tot"), 
		//		t2=dataList.getInt("year02_tot"), 
		//		t3=dataList.getInt("year03_tot") ,
		//		t4=dataList.getInt("year04_tot");
		
%>

<%		
		if( i % 2 == 0){
			if( i % 20 - 18 == 0){
				PageConfig = "page-break-after:always";
			}
%>
		<div class="item">
			<table  class="table" >
				<tr>
					<td colspan="2" height="36" valign="top"><%=strAddr %></td>
				</tr>
				<tr>
					<td rowspan="2" style="padding-top:8px;"><strong><%=dataList.getString("name") %> 귀하</strong></td>
					<%--><td height="18"><div class="small">회비납부내역 가입년도: <%=dataList.getString("registdate") %></div></td> --%>
				</tr>
				<%-- 
				<tr>				
					<td height="18">
					<div class="small">
					<%for(int j=year-3; j<=year; j++) {
						if(gubun.contains(String.valueOf(j))){
							payYn = "O";
						}else{
							payYn = "X";
						}
					%>
						<span class="test"><%=j %>년도(<%=payYn %>)</span>
					<%} %>
					</div>
					</td>
				</tr>
				--%>
				<tr>
					<td colspan="2" style="text-align: right; padding-top:8px;" height="18"><strong><%=strZipCode %></strong></td>
				</tr>
				<%if("_지회장_임원_".contains("_"+rolePos+"_")){ %>
					<tr>
						<td><%=dataList.getString("tel") %></td>
					</tr>
				<%} %>
			</table>
		</div>
	</div>
	<div class="row" style="<%=PageConfig%>">
<% 
		} else {
%>

		<div class="item1">
			<table  class="table" >
				<tr>
					<td colspan="2" height="36" valign="top"><%=strAddr %></td>
				</tr>
				<tr>
					<td rowspan="2" style="padding-top:8px;"><strong><%=dataList.getString("name") %> 귀하</strong></td>
					<%--><td height="18"><div class="small">회비납부내역 가입년도: <%=dataList.getString("registdate") %></div></td> --%>
				</tr>
				
				<%-- 
				<tr>				
					<td height="18">
					<div class="small">
					<%for(int j=year-3; j<=year; j++) {
						if(gubun.contains(String.valueOf(j))){
							payYn = "O";
						}else{
							payYn = "X";
						}
					%>
						<span class="test"><%=j %>년도(<%=payYn %>)</span>
					<%} %>
					</div>
					</td>
				</tr>
				--%>
				<tr>
					<td colspan="2" style="text-align: right; padding-top:8px;" height="18"><strong><%=strZipCode %></strong></td>
				</tr>
				<%if("_지회장_임원_".contains("_"+rolePos+"_")){ %>
					<tr>
						<td><%=dataList.getString("tel") %></td>
					</tr>
				<%} %>
			</table>
		</div>
	
<%
		}
	}  
%>
</div>
<br style="clear:both;" />
</div>
</body>
</html>