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
String selAction = request.getParameter("selAction");
String from = request.getParameter("prod_seq_from");

String qrcd_from = (String)session.getAttribute("qrcd_from") ;
if(qrcd_from.equals("")){
	qrcd_from = from;
}
String qrcd_to = (String)session.getAttribute("qrcd_to");
String qrcd_category = (String)session.getAttribute("category");

%>
<!DOCTYPE html>
<html>
<head>
	<title>QR코드 생산자 추가</title>
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
.addBtnArea {overflow:hidden; padding:10px 0; border-left:1px solid #969696; border-right:1px solid #969696; border-bottom:1px solid #969696;}
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
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">

var prodName = "";
var prodNo = "";
var prodOrign = "";
var prodProvince = "";
var prodDate = "";
var prodRating = "";

var isValidate = false;


$(function(){
	
	$("#prod_seq_from_range").val('<%=qrcd_from%>');
	$("#prod_seq_to_range").val('<%=qrcd_to%>');
	$("#prod_category_range").val('<%=qrcd_category%>');
	
})

function f_update(prod_idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value= 'update';
	frm.prod_idx.value=prod_idx;
	frm.submit();
}

function f_update_QRCode(prod_idx){
	
	var frm = document.forms.frmDetail;
	frm.selAction.value = "update_QRCode";
	frm.prod_idx.value=prod_idx;
	frm.submit();
}


$(function(){
	
	$("#org_manager_pub").val("양봉자조급협회");	
	$("#org_inspecter_pub").val("(사)한국양봉협회");	
	
	$("#btn_update_cancel").click(function(){
		history.back(-1);
	})
	
	$("#subdiv_date_pub").datepicker({
        showButtonPanel: true, 
        dateFormat: "yy-mm-dd"
	});
	
	$("#pub_sts_pub").val("2").prop("selected",true);
	
})

function validate(){
	
	prodName = 0;
	prodNo = 0;
	prodOrign = 0;
	prodProvince = 0;
	prodDate = 0;
	prodRating = 0;

	var size = $("input[name=prod_name_owner]").length-1;
	var arrSize = $("input[name=prod_name_owner]").length;
	
	for(var i=0;i<arrSize;i++){
		
		if($("input[name=prod_name_owner]")[i].value!=""){
			prodName+=1;
		}
		if($("input[name=prod_no_owner]")[i].value!=""){
			prodNo+=1;
		}
		if($("input[name=prod_province_owner]")[i].value!=""){
			prodProvince+=1;
		}
		if($("input[name=prod_date_owner]")[i].value!=""){
			prodDate+=1;
		}	
	}
	
	if(($("#prod_seq_from_range").val()=="" || $("#prod_seq_to_range").val()=="")){
		alert('필증코드 범위를 설정해주세요');
		return false;
		
	}else if($("#subdiv_date_pub").val()==""){
		alert('품질유지기한을 입력해주세요');
		return false;
		
	}else if($("#sale_shop_pub").val()==""){
		alert('판매자를 입력해주세요');
		return false;
		
	}else if(prodName != size){		
		alert('생산자명을 입력해주세요');	
		return false;
		
	}else if(prodNo != size){	
		alert('봉인번호를 입력해주세요');	
		return false;
		
	}else if(prodProvince != size){	
		alert('채밀지역을 입력해주세요');	
		return false;
		
	}else if(prodDate != size){			
		alert('채밀날짜를 입력해주세요');	
		return false;
		
	}else {
		isValidate = true;
		return true;
		
	}	
	alert(isValidate);
}

var idx=1;
var infoHtml = "";
function f_pubOwner_add(){

	var $templates = $("#form_templates");
	
	var last = $("#first_tr");
	var info = $("#owner_infoList").html();
	var lastOwner = $("#owner_table").find(".owner-row-1").last();
	var num = 0;
	if(lastOwner.length > 0){
		num = parseInt( lastOwner.attr("data-num") );
	}
	var $owner = $templates.find(".owner").clone();
	$owner.attr("data-num", num+1);
	last.after( $owner );
	
	console.log($templates);
	console.log(info);
	console.log(lastOwner);
	console.log($owner);
	
	idx++;
}

function f_pubOwner_del(element){
	var num = $(element).closest(".owner").attr("data-num");
	$("#owner_table").find("[data-num='"+num+"']").remove();
}


function f_pub_owner(){
	var frm = document.forms.frmDetail;

	var arr=[];
	var $table = $("#owner_table");
	$table.find("input[name='prod_name_owner']").each(function (i) {
 	  
  	    var owner = {
	   		name: $table.find("input[name='prod_name_owner']").eq(i).val(),
	   		no: $table.find("input[name='prod_no_owner']").eq(i).val(),
	   		orign: $table.find("input[name='prod_orign_owner']").eq(i).val(),
	   		province: $table.find("input[name='prod_province_owner']").eq(i).val(),
	   		date: $table.find("input[name='prod_date_owner']").eq(i).val(),
	   		rating: $table.find("select[name='prod_rating_owner']").eq(i).val()
  	    };
  	    
  	    arr.push(owner);
  	    
   });

    console.log(JSON.stringify(arr));
	    document.forms.frmDetail.ownerData.value = JSON.stringify(arr);
	
}

function f_add_owner(){
	
	var frm = document.forms.frmDetail;
	var arr=[];
	
	validate();
	
	frm.selAction.value = "add_owner";
	frm.target = "";
	frm.method = "post";
	frm.action = "/adminselfQRCode.do";
	frm.prod_category.value = $("#prod_category_range option:selected").val();
	frm.prod_seq_from.value = $("#prod_seq_from_range").val();
	frm.prod_seq_to.value = $("#prod_seq_to_range").val();
	frm.from.value = 0;
	
	if(isValidate == false){
		return false;
	
	}else{
		var $table = $("#owner_table");
		$table.find("input[name='prod_name_owner']").each(function (i) {
	 	  
	  	    var owner = {
		   		name: $table.find("input[name='prod_name_owner']").eq(i).val(),
		   		no: $table.find("input[name='prod_no_owner']").eq(i).val(),
		   		orign: $table.find("select[name='prod_orign_owner']").eq(i).val(),
		   		province: $table.find("input[name='prod_province_owner']").eq(i).val(),
		   		date: $table.find("input[name='prod_date_owner']").eq(i).val(),
		   		rating: $table.find("select[name='prod_rating_owner']").eq(i).val()
	  	    };
	  	    
	  	    arr.push(owner);
	  	    
	   });

	    console.log(JSON.stringify(arr));
		    document.forms.frmDetail.ownerData.value = JSON.stringify(arr);
	     
		frm.submit();
		
		f_pub_owner();	
	
	}
		
}
</script>
<body>
<form name="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="from" value=""/>
<input type="hidden" name="prod_idx" value=""/>
<input type="hidden" name="prod_no" value=""/>
<input type="hidden" name="prod_title" value=""/>
<input type="hidden" name="rating_date" value=""/>
<input type="hidden" name="rating_no" value=""/>
<input type="hidden" name="org_producer" value=""/>
<input type="hidden" name="prod_province" value=""/>
<input type="hidden" name="prod_name" value=""/>
<input type="hidden" name="prod_date" value=""/>
<input type="hidden" name="quality_adm" value=""/>
<input type="hidden" name="prod_category" value=""/>
<input type="hidden" name="prod_seq_from" value=""/>
<input type="hidden" name="prod_seq_to" value=""/>
<input type="hidden" name="prod_rating" value=""/>

<input type="hidden" name="ownerData" value="" />
<table class="form" id="owner_table">
	<colgroup>
		<col style="width:28%;">
		<col />
	</colgroup>
	<tbody>
		<tr id="first_tr">
			<th scope="row">필증코드 범위 *</th>
			<td>
				<select id="prod_category_range" class="w100">
					<option value="LA">LA</option>
					<option value="SA">SA</option>
			  	</select>
			  	<div class="mt5">
					<input type="text" id="prod_seq_from_range" class="searchinput w45" value="" maxlength="7"> ~
					<input type="text" id="prod_seq_to_range" class="searchinput w45" value="" maxlength="7">
				</div>
			</td>
		</tr>
	</tbody>
</table>

<div class="taC addBtnArea" id="last_tr">
	<a href="javascript:void(0);" onclick="f_pubOwner_add()">생산자 추가</a>
</div>

<div class="taR keyBtnArea">
	<a href="javascript:history.back()">취소</a>
	<a href="javascript:f_add_owner()">추가</a>
</div>


<!-- 생산자 추가 눌렀을때 -->
<table class="form" id="form_templates" style="display:none">
	<colgroup>
		<col style="width:28%;">
		<col />
	</colgroup>
	<tbody>
		<tr class="owner owner-row-0">
			<td colspan="2"></td>
		</tr>
		<tr class="owner owner-row-1">
			<th scope="row">생산자명</th>
			<td><input type="text" name='prod_name_owner' class="registinput w100" name="" value="" maxlength=""></td>
		</tr>
		<tr class="owner owner-row-2">
			<th scope="row">봉인번호</th>
			<td><input type="text" name='prod_no_owner' class="registinput w100" name="" value="" maxlength=""></td>
		</tr>
		<tr class="owner owner-row-3">
			<th scope="row">밀원</th>
			<td>
				<select name="prod_orign_owner" class="w100">
					<option value="아카시아">아카시아</option>
					<option value="야생화">야생화</option>
					<option value="밤">밤</option> 
				</select>
			</td>
		</tr>
		<tr class="owner owner-row-4">
			<th scope="row">채밀지역</th>
			<td><input type="text" name='prod_province_owner' class="registinput w100" name="" value="" maxlength=""></td>
		</tr>
		<tr class="owner owner-row-5">
			<th scope="row">채밀날짜</th>
			<td><input type="text" name='prod_date_owner' class="registinput w100" name="" value="" maxlength=""></td>
		</tr>
		<tr class="owner owner-row-6">
			<th scope="row">등급판정</th>
			<td>
				<select name="prod_rating_owner" class="w100">
					<option value="1+">1+</option>
					<option value="1">1</option>
				</select>
			</td>
		</tr>
	</tbody>
</table>
</form>
</body>
</html>