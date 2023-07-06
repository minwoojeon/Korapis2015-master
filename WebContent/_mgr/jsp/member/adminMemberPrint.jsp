<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
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
MemberVo vo = (MemberVo)request.getAttribute("vo");
String print_rdate = TextFormatter.convNvl(request.getParameter("print_rdate"), "");
String print_breed = TextFormatter.convNvl(request.getParameter("print_breed"), "");
String print_submission = TextFormatter.convNvl(request.getParameter("print_submission"), "");
String printNo = TextFormatter.convNvl(request.getParameter("printNo"), "0000-0");

String changePrintNo = printNo.substring(5,printNo.length());

System.out.println(">>>>"+changePrintNo);

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
    body { height:100%;padding:0; }
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
</style>
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">
//<![CDATA[
function f_print(){
	
	//프린트를한다면 확인번호를 DB인서트한다.
		
	//확인증번호를 가져온다.
	$.ajax({
		url: "/adminJson.do", 
		type: "post",
		data: {
			"selAction" : "insert_printNumber",
			"PRINT_NUMBER" : "<%=changePrintNo %>"
		},
		dataType:"json",
		error: function(){
			alert("ajax 확인증번호 DB입력 실패");
		},
		success: function(data){
			
			window.print();
		}
	});
}
//]]>

</script>


</head>
<body style="box-sizing:border-box;width:840px; min-height:100px; margin: 0 auto;padding:20px; "><!-- border:2px solid #eeeeee; -->
<!-- Global Wrapper.s -->
<div id="wrap" style="width:800px;margin:0 auto;">

<!-- Container.s -->
	<div id="container" >

		<div style="text-align:left; margin-bottom:10px;" class="print_area">
			<!-- <a class="btn grey" href="javascript: window.print();">Print</a> -->
			<a class="btn grey" href="javascript: f_print();">Print</a>
		</div>	
		<div id="content" style="box-sizing:border-box;border:1px solid #000;background-color:rgb(249, 249, 249);">
  		<div class="logo_img">
		</div>
		
			<div style="padding-top:30px; padding-left:20px; font-size:17px">
			제 <%=printNo %> 호 <br/>
			</div>
			
			<div style="padding-top:80px; font-size:26px; text-align:center; font-weight:bold">
				회&nbsp;&nbsp;&nbsp;&nbsp;
				원&nbsp;&nbsp;&nbsp;&nbsp;
				확&nbsp;&nbsp;&nbsp;&nbsp;
				인&nbsp;&nbsp;&nbsp;&nbsp;
				증
			</div>
			
			
			<div style="padding-top:80px; font-size:19px; text-align:left; padding-left:100px; line-height:60px;">
				<%-- 
				성<span style="width:75px; display:inline-block">&nbsp;</span>명 : <%=vo.getName()%><br/>
				주<span style="width:75px; display:inline-block">&nbsp;</span>소 : <%= "H".equals(vo.getMailreceive()) ? vo.getHaddr1() /* + " "+vo.getHaddr1() */  : vo.getOaddr1()+" "+vo.getOaddr2() %><br/>
				주민등록번호 : <%=vo.getRegnumber() %> - <%=!"".equals(vo.getRegnumber2()) ? vo.getRegnumber2().substring(0,1)+"******" : "" %>
				 --%>
				<table >
					<tr>
						<td>성<span style="width:75px; display:inline-block">&nbsp;</span>명 : </td>
						<td>&nbsp;<%=vo.getName()%></td>
					</tr>
					<tr>
						<td>주<span style="width:75px; display:inline-block">&nbsp;</span>소 : </td>
						<td>&nbsp;<%= "H".equals(vo.getMailreceive()) ? vo.getHaddr1() /* + " "+vo.getHaddr1() */  : vo.getOaddr1()+" "+vo.getOaddr2() %></td>
					</tr>
					<tr>
						<td>주민등록번호 : </td>
						<td>&nbsp;<%=vo.getRegnumber() %> - <%=!"".equals(vo.getRegnumber2()) ? vo.getRegnumber2().substring(0,1)+"******" : "" %></td>
					</tr>
				<%if("Y".equals(print_rdate)){ %>
					<tr>
						<td>가&nbsp;&nbsp;입&nbsp;&nbsp;일&nbsp;&nbsp;자 : </td> 
						<td>&nbsp;<%=vo.getRegistDate() %></td>
					</tr>
				<%}else{ %>
					<tr>
						<td>&nbsp;</td> 
						<td>&nbsp;</td>
					</tr>
				<%} %>
				<%if("Y".equals(print_breed)){ %>
					<tr>
						<td>사&nbsp;&nbsp;육&nbsp;&nbsp;군&nbsp;&nbsp;수 : </td>
						<td>&nbsp;<%=vo.getBreednumber() %></td>
					</tr>
				<%}else{ %>
					<tr>
						<td>&nbsp;</td> 
						<td>&nbsp;</td>
					</tr>
				<%} %>
				<%if(!"".equals(print_submission)){ %>
					<tr>
						<td>제&nbsp;&nbsp;출&nbsp;&nbsp;용&nbsp;&nbsp;도 : </td>
						<td>
							<%if("1".equals(print_submission)){ %>
							&nbsp;은행
							<%}else if("2".equals(print_submission)){ %>
							&nbsp;경영체등록
							<%}else if("3".equals(print_submission)){ %>
							&nbsp;기술센터
							<%}else if("4".equals(print_submission)){ %>
							&nbsp;농협
							<%}else if("5".equals(print_submission)){ %>
							&nbsp;품질관리등록
							<%}else if("6".equals(print_submission)){ %>
							&nbsp;보험회사
							<%}else if("7".equals(print_submission)){ %>
							&nbsp;대출
							<%} %>
						</td>
						
					</tr>
				<%}else{ %>
					<tr>
						<td>&nbsp;</td> 
						<td>&nbsp;</td>
					</tr>
				<%} %>
				
				
				
				</table>
			</div>
			
			
			
			<div style="text-align:center; padding-top:250px; font-size:20px">
				위 사람은 (사)한국양봉협회 회원임을 증명함.
			</div>
			
			
			<div style="text-align:center; padding-top:40px; font-size:18px">
				<%=DateC.getCurrentYYYY() %>년 <%=DateC.getCurrentMM() %>월 <%=DateC.getCurrentDD() %>일 
			</div>
			
			<div style="text-align:center; padding-top:70px; padding-bottom:30px">
				<span style="font-size:13px; line-height:18px; display:inline-block; width:30px">사단법인</span>
				<span style="font-size:20px; line-height:40px; display:inline-block; vertical-align: 7px;">한국양봉협회장</span>
				<span style="font-size:13px; line-height:18px; display:inline-block; vertical-align: 7px; "><img src="/images/in01.png" alt="직인"/></span>
			</div>
			
		</div>
	</div>
<!-- Container.e -->

</div>
<!-- Global Wrapper.e -->
</body>
</html>