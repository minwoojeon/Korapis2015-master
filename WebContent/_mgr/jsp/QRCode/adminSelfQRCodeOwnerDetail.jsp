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

%>
<!DOCTYPE html>
<html>
<head>
	<title>QR코드 생산자정보수정</title>
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
.ref {font-size:12px; word-break:keep-all; word-wrap:break-word;}
.fcRed {color:#ff0000;}
</style>

<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">
$(function(){
	if($("select[name='prod_orign']").val() == "야생화"){
		
		$("#prod_orign_etc").removeAttr("style");
	}
	
	$(document).on("change","select[name='prod_orign']",function(){
		if($("select[name='prod_orign']").val() == "야생화"){
			$("#prod_orign_etc").removeAttr("style");
			
		}else{
			$("#prod_orign_etc").attr("style","display:none;")
		}
		
	})
	
})
function f_update_owner(idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "update_owner";
	frm.idx.value = idx;
	frm.submit();	
}


</script>
<body>
<form name="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="from" value=""/>
<input type="hidden" name="prod_idx" value=""/>
<input type="hidden" name="idx" value=""/>
<input type="hidden" name="o_idx" value=""/>

<input type="hidden" name="ownerData" value="" />

<p class="ref">생산자의 정보의 수정은 선택한 <b class="fcRed">단일 건의 수정이 아니라</b> 연결된 QR코드의 모든 생산자 정보에 반영이 됩니다.</p>
<table class="form">
	<%
	int idx = 0;
	while(dataList!=null&&dataList.next()){
		idx = 0;
		idx+=dataList.getInt("idx");
	%>
		<colgroup>
			<col style="width:40%;">
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">생산자명</th>
				<td><input type="text" class="registinput w100" name="prod_name" value="<%=dataList.getString("prod_name") %>" maxlength=""></td>
			</tr>
			<tr>
				<th scope="row">봉인번호</th>
				<td><input type="text" class="registinput w100" name="prod_no" value="<%=dataList.getString("prod_no") %>" maxlength=""></td>
			</tr>
			<tr>
				<th scope="row">밀원</th>
				<td>
					<select name="prod_orign" class="w100">
						<option value="아카시아" <%="아카시아".equals(dataList.getString("prod_orign"))?"selected":"" %>>아카시아</option>
						<option value="야생화" <%="야생화".equals(dataList.getString("prod_orign"))?"selected":"" %>>야생화</option>
						<option value="밤" <%="밤".equals(dataList.getString("prod_orign"))?"selected":"" %>>밤</option> 
					</select>
				</td>
			</tr>
			<tr id="prod_orign_etc" style="display:none;">
				<th scope="row">야생화명</th>
				<td><input type="text" class="registinput w100" name="prod_orign1" value="<%=dataList.getString("prod_orign1") %>" maxlength=""></td>
			</tr>
			<tr>
				<th scope="row">채밀지역</th>
				<td><input type="text" class="registinput w100" name="prod_province" value="<%=dataList.getString("prod_province") %>" maxlength=""></td>
			</tr>
			<tr>
				<th scope="row">채밀날짜</th>
				<td><input type="text" class="registinput w100" name="prod_date" value="<%=dataList.getString("prod_date") %>" maxlength=""></td>
			</tr>
			<tr>
				<th scope="row">등급판정</th>
				<td>
					<select name="prod_rating" class="w100">
						<option value="1+" <%="1+".equals(dataList.getString("prod_rating"))?"selected":"" %>>1+</option>
						<option value="1" <%="1".equals(dataList.getString("prod_rating"))?"selected":"" %>>1</option>
					</select>
				</td>
			</tr>
		<%} %>
	</tbody>
</table>
<div class="taR keyBtnArea">
	<a href="javascript:f_update_owner('<%=idx %>')">확인</a>
</div>
</form>
</body>
</html>