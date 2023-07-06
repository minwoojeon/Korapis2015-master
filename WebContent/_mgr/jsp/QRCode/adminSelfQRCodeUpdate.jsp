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
ResultSetEntity ownerList = (ResultSetEntity)request.getAttribute("ownerList");
ResultSetEntity categoryList = (ResultSetEntity)request.getAttribute("categoryList");
String selAction = request.getParameter("selAction");

String qrcd_from = (String)session.getAttribute("qrcd_from");
String qrcd_to = (String)session.getAttribute("qrcd_to");
String qrcd_category = (String)session.getAttribute("category");


String category = "";
int prodNo = 0;

while(dataList.next()&&dataList!=null){
	category = dataList.getString("prod_category");
	prodNo += dataList.getInt("prod_seq");
}


dataList.initCursor();

%>
<!DOCTYPE html>
<html>
<head>
	<title>QR코드 상세정보내수정</title>
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
</style>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">

function f_updatePage(prod_idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value= 'update';
	frm.prod_idx.value=prod_idx;
	<%
		session.setAttribute("category", qrcd_category);
		session.setAttribute("qrcd_from", qrcd_from);
		session.setAttribute("qrcd_to", qrcd_to);
	%>
	frm.submit();
}

function f_update_QRCode(prod_idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "update_QRCode";
	frm.prod_idx.value=prod_idx;
	
	
	if($("#prod_seq_to_range").val()==""){
		alert('필증번호 범위를 입력하세요');
		return false;
	}
	frm.submit();
}

function f_ownerDetail(idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "detail_owner";
	frm.idx.value = idx;
	frm.submit();
}

function f_ownerDelete(idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "delete_owner";
	frm.idx.value = idx;
	<%
		session.setAttribute("category", qrcd_category);
		session.setAttribute("qrcd_from", qrcd_from);
		session.setAttribute("qrcd_to", qrcd_to);
	%>
	frm.submit();
}

function f_move_ownerAdd(){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "add_owner_page";
	frm.submit();
}

function control_form(){
	
	var $category = $("#prod_category_text").val();
	var useNewCategory = !('LA' == $category || 'SA' == $category);

	if(useNewCategory){
		$(".old_menu").remove();
	}
}



$(function(){
	
	
	<%if(category!=null){%>
		$("#prod_category").val("<%=qrcd_category%>").prop("selected", true);
	<%}else{%>
		$("#prod_category").val("<%=category%>").prop("selected", true);
	<%}%>
	
	<%if(qrcd_from!=null){%>
		$("#prod_seq_from").val('<%=qrcd_from%>');
	<%}else{%>
		$("#prod_seq_from").val('<%=prodNo%>');
	<%}%>
	
	<%if(qrcd_to!=null){%>
		$("#prod_seq_to").val('<%=qrcd_to%>');
	<%}%>
	
	$("#btn_update_cancel").click(function(){
		history.back(-1);
	})
	
	
	$("#dp").datepicker({
		dateFormat: "yy-mm-dd",
		onSelect: function(dateText, inst) {
        $("#subdiv_date_pub").val(dateText);
		}
	});
	
	$("#subdiv_date_calendar").click(function() {
		$("#dp").datepicker("show");
	});
	
	if($("select[name='prod_orign']").val() == "야생화"){
		$("#prod_orign_etc").removeAttr("style")
	}	
	
	$(document).on("change","select[name='prod_orign']",function(){
		if($("select[name='prod_orign']").val() == "야생화"){
			$("#prod_orign_etc").removeAttr("style")
		}else{
			$("#prod_orign_etc").attr("style","display:none;");
		}	
		
	});
	control_form();
	

});

</script>

<body>
<form name="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="selName" value=""/>
<input type="hidden" name="prod_idx" value=""/>
<input type="hidden" name="test_uid" value=""/>
<input type="hidden" name="idx" value=""/>
<table class="form">
	<colgroup>
		<col style="width:28%;">
		<col />
	</colgroup>
	<% while(dataList.next()&&dataList!=null){ %>
		<tbody>
			<tr>
				<th scope="row">필증번호</th>
				<td>
					<select name="prod_category" id="prod_category_text" class="w100"  >
						<%while(categoryList.next()&&categoryList!=null){ %>
							<option value="<%=categoryList.getString("prod_category") %>"<%=categoryList.getString("prod_category").equals(category) ? "selected" : "" %>><%=categoryList.getString("prod_category") %></option>
						<%} %>  
				  	</select>
				  	<div class="mt5">
						<input type="text" name="prod_seq_from"  id="prod_seq_from_range" class="searchinput w45" value="<%=dataList.getString("prod_seq")%>"> ~
						<input type="text" name="prod_seq_to"  id="prod_seq_to_range" class="searchinput w45" value="" >
					</div>
				</td>
			</tr>
			<tr>
				<th scope="row">QR코드 암호화</th>
				<td>
					<input type="text" class="registinput w100" name="prod_qrcd_enc" id="" value="<%=dataList.getString("prod_qrcd_enc")%>" autocomplete="off">
				</td>
			</tr>
			<tr>
				<th scope="row">품질등급</th>
				<td>
					<select name="rating" id="rating_pub" class="w50">
						<option value="1+"<%="1+".equals(dataList.getString("rating")) ? "selected" : "" %>>1+</option>
						<option value="1"<%="1".equals(dataList.getString("rating")) ? "selected" : "" %>>1</option> 
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">품질 유지기한</th>
				<td>
					<input type="text" class="registinput" name="subdiv_date" id="subdiv_date_pub" value="<%=dataList.getString("subdiv_date") %>" autocomplete="off" >
					<input type="hidden" id="dp">
					<button type="button" id="subdiv_date_calendar" class="btnCal"><img src="https://www.korapis.or.kr/images/calendar.jpg" alt=""></button>
				</td>
			</tr>
			<tr class="old_menu">
				<th scope="row">시행기관</th>
				<td>
					<input type="text" class="registinput w100" name="org_manager" id="org_manager_pub" value="<%=dataList.getString("org_manager") %>" >
				</td>		
			</tr>
			<tr>
				<th scope="row">검사기관</th>
				<td>
					<input type="text" class="registinput w100" name="org_inspecter" id="org_inspecter_pub" value="<%=dataList.getString("org_inspecter") %>" >
				</td>
			</tr>
			<tr>
				<th scope="row">판매자</th>
				<td>
					<input type="text" class="registinput w100" name="sale_shop" id="sale_shop_pub" value="<%=dataList.getString("sale_shop") %>" >
				</td>
			</tr>
			<tr>
				<th scope="row">품질관리자</th>
				<td>
					<input type="text" class="registinput w100" name="quality_mgr" value="<%=dataList.getString("quality_mgr") %>" >
				</td>			
			</tr>
			<tr class="old_menu">
				<th scope="row">채밀지역</th>
				<td>
					<input type="text" class="registinput w100" name="prod_area" value="<%=dataList.getString("prod_area") %>" >
				</td>	
			</tr>
			<tr>
				<th scope="row">밀원</th>
				<td>
					<select name="prod_orign" class="w100">
						<option value="아카시아"<%="아카시아".equals(dataList.getString("prod_orign")) ? "selected" : "" %>>아카시아</option>
						<option value="야생화"<%="야생화".equals(dataList.getString("prod_orign")) ? "selected" : "" %>>야생화</option>
						<option value="밤"<%="밤".equals(dataList.getString("prod_orign")) ? "selected" : "" %>>밤</option>	
					</select>
				</td>
			</tr>
			<tr id="prod_orign_etc" style="display:none;">
				<th scope="row">야생화명</th>
				<td><input type="text" class="registinput w100" name="prod_orign1" value="<%=dataList.getString("prod_orign1") %>" ></td>
			</tr>
			<tr>
				<th scope="row">배포상태</th>
				<td>
					<select name="pub_sts" id="pub_sts_pub" class="w100">
						<option value="0"<%="0".equals(dataList.getString("pub_sts")) ? "selected" : "" %>>필증 인쇄</option>
						<option value="1"<%="1".equals(dataList.getString("pub_sts")) ? "selected" : "" %>>필증 제공</option>
						<option value="2"<%="2".equals(dataList.getString("pub_sts")) ? "selected" : "" %>>필증 검색</option>  	
					</select>
				</td>
			</tr>
			<tr id="last_tr">
				<td colspan="2">
					<div class="addBtnArea taC">
						<a href="javascript: f_update_QRCode('<%=dataList.getString("prod_idx") %>')">확인</a>
						<a href="javascript: history.back()" >취소</a>
					</div>
				</td>
			</tr>
		</tbody>
	<%} %>
</table>
</form>
</body>
</html>