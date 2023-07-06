<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.FunctionDao"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
MiceParam param = new MiceParam();
ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
ResultSetEntity categoryList = (ResultSetEntity)request.getAttribute("categoryList");

String qrcd_from = (String)session.getAttribute("qrcd_from");
String qrcd_to = (String)session.getAttribute("qrcd_to");
String qrcd_category = (String)session.getAttribute("category");

%>
<!DOCTYPE html>
<html>
<head>
	<title>QR코드 생산자정보삭제</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
</head>
<style type="text/css">
body {min-width:320px; font-family:"맑은 고딕", 돋움, "Segoe UI", ARIAL, sans-serif, tahoma; font-size:12px; line-height:18px; padding:15px; margin:0; box-sizing:border-box;}

table.form {width:100%; border-collapse:collapse; border-top:3px solid #666; word-break:keep-all; word-wrap:break-word; table-layout:fixed}
table.form ~ table.form {margin-top:15px;}
table.form th, table.form td { border:1px solid #969696; padding:5px; }
table.form th { background-color:#D1D1D1; font-weight:bold; color:#555; line-height:15px; text-align:center;}
table.form td.cat_def { background:#D1D1D1; font-weight:bold; color:#555; }
table.form td.inp { }
table.form td.hr { background-color:#949494; padding:2px;  }

table.form input, table.form textarea { border:1px solid #999; background-color:#fdfeff; font-family:"돋움", "맑은 고딕", "malgun gothic", ARIAL, "sans-serif";resize:none;}
table.form input[type=text],table.form input[type=password] { padding:2px 3px; color:#666 }
table.form input[type=checkbox] { border:0; }
table.form input:focus, table.form textarea:focus { background-color:#ffffff;color:#333;  }
table.form input:hover, table.form textarea:hover { background-color:#e9faff;color:#000; }

table.form .person_photo { width:100%; }

table.form input[type=text] {display:inline-block; height:24px; box-sizing:border-box; vertical-align:middle;}
table.form select {height:26px;}
table.form .btnCal {display:inline-block; width:25px; height:25px; padding:0; border:0; vertical-align:middle;}
table.form .btnCal img {width:100%;}

.qrAppTit {display:block; margin-top:30px; font-size:17px; font-weight:600; color:#000;}

.keyBtnArea {overflow:hidden; margin:20px 0;}
.keyBtnArea a {display:inline-block; padding:7px 15px; color:#fff; text-decoration:none; background-color:#4d4d4d;}
.addBtnArea a {display:inline-block; padding:7px 15px; color:#fff; text-decoration:none; background-color:#717171;}

.w100 {width:100%; box-sizing:border-box;}
.w50 {width:50%; box-sizing:border-box;}
.w48 {width:48%; box-sizing:border-box;}
.w45 {width:45%; box-sizing:border-box;}
.mt5 {margin-top:5px;}
.mt10 {margin-top:10px;}
.taC {text-align:center;}
.taR {text-align:right;}
.ref {font-size:12px; word-break:keep-all; word-wrap:break-word;}
.fcRed {color:#ff0000;}
</style>
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">
function f_update_owner(idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "update_owner";
	frm.idx.value = idx;
	frm.submit();	
}

function f_update_history_owner(idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "update_history_owner";
	frm.o_idx.value = idx;
	
	if($("#h_seq_from_owner").val()==""||$("#h_seq_to_owner").val()==""){
		alert('범위를 입력해주세요');
		
	}else if(confirm("해당 사용자를 필증코드 범위에서 삭제 하시겠습니까")){
		frm.submit();	
	}
		
}

$(function(){
	
	$("#h_category_owner").val('<%=qrcd_category%>').prop('selected',true);
	$("#h_seq_from_owner").val('<%=qrcd_from%>');
	$("#h_seq_to_owner").val('<%=qrcd_to%>');
	
	$("#prod_date_owner").datepicker({
        showButtonPanel: true, 
        dateFormat: "yy-mm-dd"
	});
})



</script>

<body>
<form name="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="from" value=""/>
<input type="hidden" name="prod_idx" value=""/>
<input type="hidden" name="idx" value=""/>
<input type="hidden" name="o_idx" value=""/>

<p class="ref">생산자의 정보의 삭제는 삭제할 범위를 지정하여 삭제할 수 있습니다.<br><b class="fcRed">연결된 QR코드의 시작과 끝 번호를 입력</b>하십시오.</p>
<table class="form">
	<colgroup>
		<col style="width:25%;">
		<col style="width:25%;">
		<col style="width:25%;">
		<col>
	</colgroup>
	<tbody>
		<%
		int idx = 0;
		while(dataList!=null&&dataList.next()){
			idx = 0;
			idx+=dataList.getInt("idx");
		%>
		<tr>
			<th scope="row">생산자명</th>
			<td><%=dataList.getString("prod_name") %></td>
			<th scope="row">봉인번호</th>
			<td><%=dataList.getString("prod_no") %></td>
		</tr>
		<tr>
			<th scope="row">밀원</th>
			<td><%=dataList.getString("prod_orign") %></td>
			<th scope="row">채밀지역</th>
			<td><%=dataList.getString("prod_province") %></td>
		</tr>
		<tr>
			<th scope="row">채밀날짜</th>
			<td><%=dataList.getString("prod_date") %>년</td>
			<th scope="row">등급판정</th>
			<td><%=dataList.getString("prod_rating") %></td>
		</tr>
		<%} %>
	</tbody>
</table>

<strong class="qrAppTit">생산자 배포범위</strong>
<table class="form">
	<colgroup>
		<col style="width:28%;">
		<col>
	</colgroup>
	<tbody>
		<tr id="qrCode_list_range">
			<th scope="row">필증코드 범위</th>
			<td>
				<select name="h_category" id="prod_category_range" class="w100">
					 <%while(categoryList.next()&&categoryList!=null){ %>
						<option value="<%=categoryList.getString("prod_category") %>"<%=categoryList.getString("prod_category").equals(param.getString("prod_category")) ? "selected" : "" %>><%=categoryList.getString("prod_category") %></option>
					<%} %>  
			  	</select>
			  	<div class="mt5">
					<input type="text" name="h_seq_from" id="prod_seq_from_range" class="searchinput w45" value="" maxlength="7"> ~
					<input type="text" name="h_seq_to" id="prod_seq_to_range" class="searchinput w45" value="" maxlength="7">
				</div>
			</td>
		</tr>
	</tbody>
</table>
<div class="taR keyBtnArea">
	<a href="javascript:f_update_history_owner('<%=idx%>')">삭제</a>
</div>
</form>
</body>
</html>