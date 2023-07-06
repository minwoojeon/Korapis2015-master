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
ResultSetEntity qrcdOwnerList = (ResultSetEntity)request.getAttribute("qrcdOwnerList");
PagesVo pagesVo = (PagesVo) request.getAttribute("pagesVo");

int dataCnt = (Integer)request.getAttribute("dataCnt");

String qrcd_from = request.getParameter("qrcd_from");
String qrcd_to = request.getParameter("qrcd_to");
String category = request.getParameter("category");

session.setAttribute("category", category);
session.setAttribute("qrcd_from", qrcd_from);
session.setAttribute("qrcd_to", qrcd_to);

%>

<!DOCTYPE html>
<html>
<style>

#modalLayer_qrCode{display:none; position:relative;}
#modalLayer_qrCode .modalContent{width:440px; padding:20px; border:1px solid #ccc; position:fixed; left:40%; 
top:40%; z-index:6; background:#fff;}
#modalLayer_qrCode .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}


</style>
<head>
	<title>QR코드 발급목록</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<style type="text/css">
body {min-width:320px; font-family:"맑은 고딕", 돋움, "Segoe UI", ARIAL, sans-serif, tahoma; font-size:12px; line-height:18px; padding:15px; margin:0; box-sizing:border-box;}

div.search_form { position:relative; padding:30px 20px; margin-bottom:10px; border:5px solid #b8b8b8; background:#f7f7f7; }
div.search_input { position:relative; margin-right:10px;margin-bottom:10px; }
div.search_option { position:relative;margin-bottom:10px; }
div.search_option > .f_left { margin-right:10px; }
div.search_option > .f_right { margin-left:10px; }

table.list {width:100%; border-bottom:4px solid #949494; text-align:center; word-break:keep-all; word-wrap:break-word; table-layout:fixed;}
table.list th { font-weight:bold;color:#f7f7f7;padding:5px; background-color:#8F8F8F; border:1px solid #999; border-bottom:4px solid #cccccc; }
table.list th span.item { font-weight:bold;color:black; padding:5px; }
table.list td { color:#666; padding:5px; border:1px solid #e8e8e8; vertical-align:middle; }
table.list td.first { border-left:1px solid #999; }
table.list td.last { border-right: 1px solid #999; }
table.list td.bg { font-weight:bold;color:#535353;background-color:#ded3c2;border:1px solid #999;}
table.list td span.ellipsis { display:inline-block;width:420px;overflow:hidden; white-space:nowrap; text-overflow:ellipsis; }
table.list td.pointer { cursor:pointer; }

table.list.rowhover tr:hover { background-color:#eafeff;cursor:pointer; }

.keywordBox {overflow:hidden; text-align:center;}
.keywordBox input[type=text] {display:inline-block; height:24px;}
.keywordBox select {height:26px;}
.keywordBox  ~ .keywordBox {margin-top:15px;}
.keywordWrap.keyTit {float:left; width:25%; text-align:left;}
.keywordWrap.keyInput {overflow:hidden; font-size:12px; text-align:center;}
.keywordWrap.keyTit span {display:inline-block; height:24px; font-size:12px; vertical-align:middle;}
.keywordWrap.keyTit span:before {content:''; display:inline-block; width:1px; height:100%; margin-left:-1px; vertical-align:middle;}
.keyBtnArea {overflow:hidden; margin-top:20px; text-align:center;}
.keyBtnArea a {display:inline-block; padding:7px 15px; color:#fff; text-decoration:none; background-color:#4d4d4d;}
.searchResultArea {overflow-:hidden;}

.w100 {width:100%; box-sizing:border-box;}
.w48 {width:48%; box-sizing:border-box;}
.w45 {width:45%; box-sizing:border-box;}
</style>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">

var idxList ="";

function f_detail(prod_idx){
	
	var frm = document.forms.frmList;
	frm.prod_idx.value=prod_idx;
	frm.selAction.value='detail';
	frm.submit();
}

function f_pubPage(){
	var frm = document.forms.frmList;
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
	<%if(category!=null){%>
		$("#prod_category").val("<%=category%>").prop("selected", true);
	<%}%>

	<%if(qrcd_from!=null){%>
		$("#prod_seq_from").val('<%=qrcd_from%>');
		
	<%}
	if(qrcd_to!=null){%>
		$("#prod_seq_to").val('<%=qrcd_to%>');
	<%}%>
	
	$( "#subdiv_date_search,#cdate_search" ).datepicker({
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
	frm.selAction.value = "V";
	frm.selPageNo.value=1;
	frm.target = "";
	frm.method = "post";
	frm.action = "/adminselfQRCode.do";
	
	<%
	session.setAttribute("category", param.getString("prod_category"));
	session.setAttribute("qrcd_from",  param.getString("prod_seq_from"));
	session.setAttribute("qrcd_to", param.getString("prod_seq_to"));
	%>
	frm.submit();
	
}


</script>
<body>
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
	
<p class="cont_header bold">
	<span class="f_left">QR코드 발급목록</span>
	<span class="f_right">총  <%=TextFormatter.formatNum(dataCnt) %> 건</span>
</p>
<div class="search_form">
	<div class="search_input">
		<div class="keywordBox">
			<div class="keywordWrap keyTit"><span>QR코드</span></div>
			<div class="keywordWrap keyInput">
				<select name="prod_category" id="prod_category" class="w100">
					<option value="">= 선택 =</option>
						<%while(categoryList.next()&&categoryList!=null){ %>
							<option value="<%=categoryList.getString("prod_category") %>"<%=categoryList.getString("prod_category").equals(param.getString("prod_category")) ? "selected" : "" %>><%=categoryList.getString("prod_category") %></option>
						<%} %>  
  			  	</select>
  			</div>
  		</div>

		<div class="keywordBox">
			  	<input type="text" name="prod_seq_from" id="prod_seq_from" class="searchinput w45" value="<%=param.getString("prod_seq_from")%>">
			  	<span class="wave">~</span>
			<input type="text" name="prod_seq_to" id="prod_seq_to" class="searchinput w45" value="<%=param.getString("prod_seq_to")%>">
		</div>
			
		<div class="keywordBox">
			<div class="keywordWrap keyTit"><span>생산자</span></div>
			<div class="keywordWrap keyInput"><input name="prod_name" type="text" class="searchinput w100" value="<%=param.getString("prod_name")%>"></div>
		</div>

		<div class="keywordBox">
			<div class="keywordWrap keyTit"><span>봉인번호</span></div>
			<div class="keywordWrap keyInput"><input name="prod_no" type="text" class="searchinput w100" value="<%=param.getString("prod_no")%>"></div>
		</div>

		<div class="keywordBox">
			<div class="keywordWrap keyTit"><span>밀원</span></div>
			<div class="keywordWrap keyInput"><input name="prod_orign" type="text" class="searchinput w100" value="<%=param.getString("prod_orign")%>"></div>
		</div>

		<div class="keywordBox">
			<div class="keywordWrap keyTit"><span>품질등급</span></div>
			<div class="keywordWrap keyInput">
				<select name="rating" class="w100">
					<option value="">= 선택 =</option>
					<option value="1+"<%="1+".equals(param.getString("rating")) ? "selected" : "" %>>1+</option>
					<option value="1"<%="1".equals(param.getString("rating")) ? "selected" : "" %>>1</option>
  			  	</select>
  			</div>
			</div>

		<div class="keywordBox">
			<div class="keywordWrap keyTit"><span>품질유지기한</span></div>
			<div class="keywordWrap keyInput"><input name="subdiv_date" type="text" class="searchinput hasDatepicker w100" id="subdiv_date_search" value="<%=param.getString("subdiv_date")%>" autocomplete="off"></div>
		</div>

		<div class="keywordBox">
			<div class="keywordWrap keyTit"><span>등록일</span></div>
			<div class="keywordWrap keyInput"><input name="cdate" type="text" class="searchinput hasDatepicker w100" id="cdate_search" value="<%=param.getString("cdate")%>" autocomplete="off"></div>
		</div>
						
		<div class="keyBtnArea">
			<a href="javascript: f_search()" class="btn grey">검색</a>
			<a href="javascript: f_pubPage()" class="btn grey">QR코드 배포</a>
		</div>
	</div>
</div>

<div class="searchResultArea">
	<table class="list">
		<colgroup>
			<col style="width:10%;">
			<col />
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:15%;">
		</colgroup>
		
		<thead>
			<tr>
				<th scope="col">QR코드</th>
				<th scope="col">생산자(봉인번호)</th>
				<th scope="col">품질 등급</th>
				<th scope="col">품질 유지기한</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		
		<tbody>
				<%
			int no = pagesVo.getTopNo();
			while(dataList!=null&&dataList.next()){
			
			%>
			
			<tr><!-- <%=no--%> -->
				<td class="first ta_center" name="prod_qrcd" onclick="javascript:f_detail('<%=dataList.getString("prod_idx")%>')"><%=dataList.getString("prod_qrcd") %></td>
				<td class="first ta_center"><%=dataList.getString("owner_info") %></td>
				<td class="first ta_center"><%=dataList.getString("rating") %></td>
				<td class="first ta_center"><%=dataList.getString("subdiv_date") %></td>
				<td class="first ta_center"><%=dataList.getString("cdate") %></td>	
			</tr>
			<%
			} %>
		</tbody>
	</table>
	<div class="page">
		<%=pagesVo.getPageHtml() %>
	</div>
</div>
</form>
</body>
</html>