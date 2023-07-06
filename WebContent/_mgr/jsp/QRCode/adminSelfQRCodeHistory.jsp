<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.vo.SelfcostVo"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

MiceParam param = (MiceParam)request.getAttribute("param");
ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
ResultSetEntity categoryList = (ResultSetEntity)request.getAttribute("categoryList");
PagesVo pagesVo = (PagesVo) request.getAttribute("pagesVo");
int dataCnt = (Integer)request.getAttribute("dataCnt");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">

var idxList ="";

function f_get_qrcdRange(category,qrcd_from,qrcd_to){
	
	var frm = document.forms.frmDetail;
	frm.category.value = category;
	frm.qrcd_from.value = qrcd_from;
	frm.qrcd_to.value = qrcd_to;
	frm.target = "";
	frm.method = "post";
	frm.action = "/adminselfQRCode.do";
	frm.selAction.value = "V";
	frm.prod_category.value = category;
	frm.prod_seq_from.value = qrcd_from;
	frm.prod_seq_to.value = qrcd_to;
	frm.submit();
	
}

function f_pubPage(){
	var frm = document.forms.frmDetail;
	frm.selAction.value='pub';
	frm.submit();
}

$(function(){

	$("td[name='qr_code']").hover(
		function(){
			$(this).css("text-decoration", "underline");
		},	
		function(){
			$(this).css("text-decoration", "none");
		}
	)
	
});

$(function(){

	$( "#pdate_search" ).datepicker({
		showButtonPanel: true, 
		dateFormat: "yy-mm-dd"
	});
})

function f_goPage(from){
	var frm = document.forms.frmList;
	frm.selPageNo.value = from;
	frm.submit();
}
function f_goFirstPage(){
	var frm = document.forms.frmList;
	frm.selPageNo.value=1;
	frm.submit();
	location.href="/adminselfQRCode.do";
}

function f_search(){
	var frm = document.forms.frmList;
	frm.selAction.value = "history";
	frm.selPageNo.value=1;
	frm.target = "";
	frm.method = "post";
	frm.action = "/adminselfQRCode.do";
	frm.submit();
	
}

</script>



</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
</form>

<form name="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="from" value=""/>
<input type="hidden" name="prod_idx" value=""/>
<input type="hidden" name="prod_title" value=""/>
<input type="hidden" name="prod_orign" value=""/>
<input type="hidden" name="prod_name" value=""/>
<input type="hidden" name="rating_date" value=""/>
<input type="hidden" name="rating_no" value=""/>
<input type="hidden" name="org_manager" value=""/>
<input type="hidden" name="org_inspecter" value=""/>
<input type="hidden" name="org_producer" value=""/>
<input type="hidden" name="pub_sts" value=""/>
<input type="hidden" name="prod_province" value=""/>
<input type="hidden" name="prod_owner" value=""/>
<input type="hidden" name="prod_date" value=""/>
<input type="hidden" name="category" value="">
<input type="hidden" name="qrcd_from" value="">
<input type="hidden" name="qrcd_to" value="">
<input type="hidden" name="prod_category" value="">
<input type="hidden" name="prod_seq_from" value="">
<input type="hidden" name="prod_seq_to" value="">





</form>
<!-- 공통폼 E. -->
<iframe name="hidFrame" style="display:none"></iframe>

<!-- Global Wrapper.s -->
<div id="wrap">
<!-- TNB.s -->
	<div id="tnb">
	
	</div>
<!-- TNB.e -->

<!-- Container.s -->
	<div id="container">

<!-- Content.s -->
<div id="content">
	<p class="cont_header bold">
		<span class="f_left">QR코드 배포이력</span>
		<span class="f_right">총  <%=TextFormatter.formatNum(dataCnt) %> 건</span>
	</p>
	
	<form name="frmList" method="post" target="">
		<input type="hidden" name="selAction" value=""/>
		<input type="hidden" name="popup_idx" value="" />
		<input type="hidden" name="EX_IDX" value="" />
		<input type="hidden" name="selPageNo" value="" />
		<input type="hidden" name="from" value="" />
		<input type="hidden" name="prod_idx" value=""/>
	
		<input type="hidden" name="uid" value="" />
		<input type="hidden" name="regnum" value="" />
		<input type="hidden" name="chk_disp" value="" />
		<input type="hidden" name="chk_add" value="" />
		<input type="hidden" name="chk_food" value="" />
		<input type="hidden" name="chk_reference" value="" />
		<input type="hidden" name="subSelAction" value="" />
		<input type="hidden" name="no" value="" />
	
		<div class="search_form">					
			<div>	
				<div class="search_input">
					<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">발급일</span>
					<input name="pdate" type="text" id="pdate_search" class="searchinput" style="width:100px;" value="<%=param.getString("pdate")%>" autocomplete="off"/>
					<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">생산자</span>
					<input name="owner_history" type="text" id="pdate_search" class="searchinput" style="width:100px;" value="<%=param.getString("owner_history")%>" />				
					<span style="text-align:right; display:inline-block; padding-left:20px; width:200px">
						<a href="javascript: f_search()" class="btn grey">검색</a>
					</span>
				</div>									
				<br style="clear:both;" />
			</div>		
		</div>	
	<div class="list_wrap">
		<table class="list rowhover" style="width:100%;">
			<tr>
				<th>QR코드 범위</th>
				<th>생산자</th>
				<th>발급일</th>
			</tr>
			<%
			int no = pagesVo.getTopNo();
			while(dataList!=null&&dataList.next()){
				
				String category = dataList.getString("category");
				String from = dataList.getString("seq_from");
				String to = dataList.getString("seq_to");
			%>
			
			<tr>
				<td onclick="f_get_qrcdRange('<%=category %>',<%=from%>,<%=to%>)"class="first ta_center"><%=category %><%=from %>~<%=to %></td>
				<td class="first ta_center"><%=dataList.getString("owner_info") %></td>
				<td class="first ta_center"><%=dataList.getString("pdate") %></td>
			</tr>
			<%} %>
		</table>
		
		<div class="page">
			 <%=pagesVo.getPageHtml() %>
		</div>
	</div>
</form>

	
	
</div>
<!-- Content.e -->

<!-- Footer.s -->
		<div id="footer">
		</div>
<!-- Footer.e -->
	
	</div>
<!-- Container.e -->

</div>
<!-- Global Wrapper.e -->
</body>
</html>