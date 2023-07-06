<%@page import="kr.or.korapis.vo.SelfcostVo"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.FunctionDao"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
MiceParam param = (MiceParam)request.getAttribute("param");
SelfcostVo svo = (SelfcostVo)request.getAttribute("svo");
ResultSetEntity dataList_Print = (ResultSetEntity)request.getAttribute("dataList_Print");
String printNo = TextFormatter.convNvl(request.getParameter("printNo"), "0000-0");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사단법인 한국양봉협회</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<style type="text/css">	
	@media print {
    html { height:100%; }
    body { height:100%;padding:0; font-family:'굴림', 'gulim' ;}
    #wrap, #container, #content { height:100%; }
    .print_area {
        display:none
    }
    
   	}
   	
   	
   	.logo_img{
   		position:absolute; 
   		left:35%; top:40%; 
   		width:250px; 
   		height:250px; 
   		background-image:url('/images/logo.jpg');
   		opacity: 0.2; 
   		filter: alpha(opacity=20);
   		background-repeat: no-repeat;
   	}
   	.table_001{
   		line-height:36px;
   	}
   	
   .table_001 td {padding: 12px 5px; vertical-align: top;}
</style>
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">

function CheckNumber(fl) {
	t = fl.value ;
	if(t!="수량"){		// 451 주문선택사항 입력 확대에서 수정
		for(i=0;i<t.length;i++) 
		if (t.charAt(i)<'0' || t.charAt(i)>'9') {
			alert("숫자만 입력해주세요.") ;
			fl.value="";
			fl.focus() ;
			return false ;
		}
	}	
}

function keyCheck(e) {
	var n4=(document.layers)?true:false;
	var e4=(document.all)?true:false;

	if(n4) var keyValue = e.which;
	else if(e4) var keyValue = event.keyCode;

	if ( ((keyValue >= 48) && (keyValue <= 57)) || keyValue == 8)
		return true;
	else return false;

}

arrKor1 = new Array ('영','일','이','삼','사','오','육','칠','팔','구' );
arrKor2 = new Array ('일', '만', '억', '조' );
arrKor3 = new Array ('일','십', '백', '천' );


function NumbToKorean(obj,target) {
	//CheckNumber(obj);
	//num = obj.value;
	var num = obj;
	delimiter = ' ';

	bPos = 0;
	sPos = 0;
	digit = 0;

	szDigit = '';
	is_start = true;
	appendFF = false;
	len = num.length;
	szHan = '';
	for (i=len-1;i>=0;i--) {
		szDigit=num.substring(i,i+1);
		digit=parseInt(szDigit);

		if (digit!=0) {
			if (bPos!=0 && sPos==0) {
				if (is_start==true) szHan += delimiter;
				szHan += arrKor2[bPos];
				appendFF=false;
			}
			if (bPos!=0 && appendFF==true) {
				if (is_start==true) szHan += delimiter;
				szHan += arrKor2[bPos];
				appendFF=false;
			}
			if (sPos!=0) szHan += arrKor3[sPos];
			szHan += arrKor1[digit];
			is_start=true;
		}
		else if (sPos==0 && bPos!=0) appendFF=true;
		sPos++;
		if (sPos%4==0) {
			sPos=0;
			bPos++;
			if (bPos>=4) return "(범위초과)";
		}
	}
	if (is_start==false) szHan += "영";

	rslt = '';
	for(i = szHan.length - 1; i >= 0; i--) {
		rslt += szHan.substring(i, i + 1);
	}
	target.innerText = rslt;
	//document.all("pricetokorean").innerText = rslt + " 원";
}

</script>


</head>
<body style="font-family:'궁서', 'gungsuh'; box-sizing:border-box;width:840px; min-height:100px; margin: 0 auto;padding:20px; " onload="NumbToKorean('<%=svo.getIns_price()%>')"><!-- border:2px solid #eeeeee; -->
<!-- Global Wrapper.s -->
<div id="wrap" style="width:800px;margin:0 auto;">

<!-- Container.s -->
	<div id="container" >

		
		<div id="content" style="box-sizing:border-box;border:1px solid #000;background-color:rgb(249, 249, 249);">
  		<div class="logo_img">
		</div>
		
			<div style="padding-top:30px; padding-left:20px; font-size:17px">
			 <br/>
			</div>
			
			<div style="padding-top:80px; font-size:26px; text-align:center; font-weight:bold">
				양봉자조금 수령 확인증
			</div>
			
			
			<div style="padding-top:80px; font-size:19px; text-align:left; padding-left:100px; ">
				<%-- 
				성<span style="width:75px; display:inline-block">&nbsp;</span>명 : <%=vo.getName()%><br/>
				주<span style="width:75px; display:inline-block">&nbsp;</span>소 : <%= "H".equals(vo.getMailreceive()) ? vo.getHaddr1() /* + " "+vo.getHaddr1() */  : vo.getOaddr1()+" "+vo.getOaddr2() %><br/>
				주민등록번호 : <%=vo.getRegnumber() %> - <%=!"".equals(vo.getRegnumber2()) ? vo.getRegnumber2().substring(0,1)+"******" : "" %>
				 --%>
				<table class="table_001">
					<tr>
						<td>제<span style="width:75px; display:inline-block">&nbsp;</span>목 : </td>
						<td>&nbsp;<span id="target_year"></span> 양봉자조금</td>
					</tr>
					<tr>
						<td>납<span style="width:30px; display:inline-block">&nbsp;</span>부<span style="width:30px; display:inline-block">&nbsp;</span>자 : </td>
						<td>&nbsp;(사)한국양봉협회 <%=svo.getIns_branch1() %>지회 <%=svo.getIns_branch2() %>지부 <%=svo.getIns_name() %></td>
					</tr>
					<tr>
						<td>수<span style="width:30px; display:inline-block">&nbsp;</span>령<span style="width:30px; display:inline-block">&nbsp;</span>처 : </td>
						<td>&nbsp;양봉자조금관리위원회</td>
					</tr>				
					<tr>
						<td>납&nbsp;&nbsp;부&nbsp;&nbsp;금&nbsp;&nbsp;액 : </td> 
						<td>
						
						<%
						int i=0;
						String Target_Year = "";
						while(dataList_Print!=null&&dataList_Print.next()){
							i++;
							System.out.println("price11 : " +dataList_Print.getString("price"));
							if(i==1){
								Target_Year = dataList_Print.getString("regdate_yymmdd").substring(0, 4)+"년";
							} else {
								Target_Year += ", " + dataList_Print.getString("regdate_yymmdd").substring(0, 4)+"년"; 
							}
						%>
						<div >
						&nbsp;<%= dataList_Print.getString("regdate_yymmdd").substring(0, 4) %>년&nbsp;\&nbsp;<%=TextFormatter.formatNum(dataList_Print.getString("price")) %>(일금 <span id="NumbToKor_<%=i%>" value="<%=dataList_Print.getString("price")%>"></span> 원정)
						<script type="text/javascript">
						NumbToKorean("<%=dataList_Print.getString("price") %>",NumbToKor_<%=i%>);
						</script>
						</div>
						
						<%} %>
						<script type="text/javascript">
						document.getElementById("target_year").innerText = "<%=Target_Year%>";
						</script>
						</td>
					</tr>
				
				</table>
			</div>
			
			
			
			<div style="text-align:center; padding-top:250px; font-size:20px">
				위와 같이 양봉자조금을 수령하였음을 확인합니다.
			</div>
			
			
			<div style="text-align:center; padding-top:40px; font-size:18px">
				<%=DateC.getCurrentYYYY() %>년 <%=DateC.getCurrentMM() %>월 <%=DateC.getCurrentDD() %>일 
			</div>
			
			<div style="text-align:center; padding-top:70px; padding-bottom:30px">
				<span style="font-size:20px; line-height:40px; display:inline-block; vertical-align: 7px;">
				양&nbsp;&nbsp;
				봉&nbsp;&nbsp;
				자&nbsp;&nbsp;
				조&nbsp;&nbsp;
				금&nbsp;&nbsp;
				관&nbsp;&nbsp;
				리&nbsp;&nbsp;
				위&nbsp;&nbsp;
				원&nbsp;&nbsp;
				회
				</span>
				<span style="font-size:13px; line-height:18px; display:inline-block;  vertical-align: 7px;"><img src="/images/in01.png" alt="직인"/></span>
			</div>
			
		</div>

		<div style="text-align:center; margin-top:20px" class="print_area">
			<a class="btn grey" href="javascript: window.print();">Print</a>
		</div>	
		
	
	</div>
<!-- Container.e -->

</div>
<!-- Global Wrapper.e -->
</body>
</html>