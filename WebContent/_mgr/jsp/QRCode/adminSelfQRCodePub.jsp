<%@page import="java.util.Calendar"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.vo.SelfcostVo"%>
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
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");
SelectBoxDao boxDao = new SelectBoxDao();
SelfcostVo vo1 = (SelfcostVo)request.getAttribute("vo1");
DateC datec = new DateC();

String selName = request.getParameter("selName");

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

Calendar cal = Calendar.getInstance();
int currentYear = cal.get(Calendar.YEAR);
int startYear = DateC.getKorapisBillYear();

session.setAttribute("selName", selName);


String selName1 = (String)session.getAttribute("selName");

String idx = "";

%>
<!DOCTYPE html>
<html>
<head>
	<title>QR코드 배포</title>
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
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
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
	$("#org_manager_pub").val("양봉자조금위원회 ");	
	$("#org_inspecter_pub").val("한국양봉협회 양봉산물연구소");	
	$("input[name='quality_mgr']").val('(사)한국양봉협회');
	
	$("#btn_update_cancel").click(function(){
		history.back(-1);
	})

	
	$("#pub_sts_pub").val("2").prop("selected",true);
	
	
    $("#dp").datepicker({
   		dateFormat: "yy-mm-dd",
        onSelect: function(dateText, inst) {
            $("#subdiv_date_pub").val(dateText);
        }
    });

    $("#subdiv_date_calendar").click(function() {
        $("#dp").datepicker("show");
    });
    
    $("select[name='prod_orign']").change(function(){
    	
    	
    
    	var option = $(this).val();
    	if(option == "야생화"){
    		$("tr[name='prod_orign_row']").removeAttr("style");
    	}else{
    		$("tr[name='prod_orign_row']").attr("style","display:none;");
    	}
    })
   
    $(document).on("change", "select[name='prod_orign_owner']", function() {
    	
    	var data = $(this).closest("tr").attr("data-num")-1;
    	var option = $(this).val();
    	if($("select[name='prod_orign_owner']").eq(data).val() == "야생화"){
    		$("tr[name='prod_orign_owner_row']").eq(data).removeAttr("style");
    	}else{
    		$("tr[name='prod_orign_owner_row']").attr("style","display:none;");
    	}
    	
    	
    	//for (var i=1; i<$("select[name='prod_orign_owner'").length; i++) {
		//	if($(this).val() == "야생화"){
		//		$("select[name='prod_orign_owner']").eq(i).after("<input type='text' value='test'>");
		//	}
	    //
    	//}
    });
    
    $(".old_menu").hide();
    $("#prod_category_text").change(function(){
    	var $category = $(this).val();
    	var useNewCategory = !('LA' == $category || 'SA' == $category);

    	if(useNewCategory){
    		$(".old_menu").hide();
    	}else{
    		$(".old_menu").show();
    	}
    	
    });
 	
	
});

function validate(){
	
	prodName = 0;
	prodNo = 0;
	prodOrign = 0;
	prodProvince = 0;
	prodDate = 0;
	prodRating = 0;

	var size = $("input[name=prod_name_owner]").length-1;
	var arrSize = $("input[name=prod_name_owner]").length;
	var from = $("#prod_seq_from_range").val();
	var to = $("#prod_seq_to_range").val()
	
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
	
	if((from=="" || to=="")){
		alert('필증코드 범위를 설정해주세요');
		return false;
		
	}else if(isNaN(from)||isNaN(to)){
		alert('필증코드 범위는 숫자만 입력가능합니다');
		return false;
		
	}else if(from>to){
		alert('시작값은 끝값보다 클수 없습니다');
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
}

var idx=1;
var infoHtml = "";
function f_pubOwner_add(){

	var $templates = $("#form_templates");
	
	var last = $("#last_tr");
	var info = $("#owner_infoList").html();
	var lastOwner = $("#owner_table").find(".owner").last();
	var num = 0;
	if(lastOwner.length > 0){
		num = parseInt( lastOwner.attr("data-num") );
	}
	var $owner = $templates.find(".owner").clone();
	var $select = $templates.find("select[name='prod_orign_owner']").clone();
	$select.attr("data-num", num+1);
	$owner.attr("data-num", num+1);
	last.before( $owner );
	
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
	   		orign1: $table.find("input[name='prod_orign_owner1']").eq(i).val(),
	   		province: $table.find("input[name='prod_province_owner']").eq(i).val(),
	   		date: $table.find("input[name='prod_date_owner']").eq(i).val(),
	   		rating: $table.find("input[name='prod_rating_owner']").eq(i).val()
  	    };
  	    
  	    arr.push(owner);
  	    
   });

    console.log(JSON.stringify(arr));
	    document.forms.frmDetail.ownerData.value = JSON.stringify(arr);
	
}

function pub_qrCode(){
	
	var frm = document.forms.frmDetail;
	var arr=[];
	var $code = $("#prod_category_text").val();
	var $useNewCode = !($code == 'LA' || $code == 'SA');
	
	validate();
	
	frm.selAction.value = "pub_qrcd";
	frm.target = "";
	frm.method = "post";
	frm.action = "/adminselfQRCode.do";
	frm.prod_category.value = $("#prod_category_text option:selected").val();
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
		   		orign1: $table.find("input[name='prod_orign_owner1']").eq(i).val(),
		   		province: $table.find("input[name='prod_province_owner']").eq(i).val(),
		   		date: $table.find("input[name='prod_date_owner']").eq(i).val(),
		   		rating: $table.find("select[name='prod_rating_owner']").eq(i).val()
	  	    };
	  	    
	  	    arr.push(owner);
	  	    
	   });

	    console.log(JSON.stringify(arr));
		document.forms.frmDetail.ownerData.value = JSON.stringify(arr);
		
		if(!$useNewCode && arr.length <= 0){
			alert('생산자 정보를 입력하세요');
		}
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
		<tr id="qrCode_list_range">
			<th scope="row">필증코드 범위 *</th>
			<td>
				<select id="prod_category_text" class="w100">
					<%while(categoryList != null && categoryList.next()){ %>
						<option value="<%=categoryList.getString("prod_category")%>"><%=categoryList.getString("prod_category")%></option>
					<%} %>
			  	</select>
			  	<div class="mt5">
					<input type="text" id="prod_seq_from_range" class="searchinput w45" value=""> ~
					<input type="text" id="prod_seq_to_range" class="searchinput w45" value="">
				</div>
			</td>
		</tr>	
		<tr id="owner_info_list">
			<th scope="row">품질등급</th>
			<td>
				<select name="rating" id="rating_pub" class="w50">
					<option value="1+">1+</option>
					<option value="1">1</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">품질 유지기한</th>
			<td>
				<input type="text" class="registinput" name="subdiv_date" id="subdiv_date_pub" value="" autocomplete="off" >
				<input type="hidden" id="dp">
				<button type="button" id="subdiv_date_calendar" class="btnCal"><img src="https://www.korapis.or.kr/images/calendar.jpg" alt=""></button>
			</td>
		</tr>
		<tr class="old_menu">
			<th scope="row">시행기관</th>
			<td>
				<input type="text" class="registinput w100" name="org_manager" id="org_manager_pub" value="">
			</td>		
		</tr>
		<tr>
			<th scope="row">검사기관</th>
			<td>
				<input type="text" class="registinput w100" name="org_inspecter" id="org_inspecter_pub" value="" >
			</td>
		</tr>
		<tr>
			<th scope="row">판매자</th>
			<td>
				<input type="text" class="registinput w100" name="sale_shop" id="sale_shop_pub" value="" >
			</td>
		</tr>
		<tr>
			<th scope="row">품질관리자</th>
			<td>
				<input type="text" class="registinput w100" name="quality_mgr" value="" >
			</td>			
		</tr>
		<tr class="old_menu">
			<th scope="row">채밀지역</th>
			<td>
				<input type="text" class="registinput w100" name="prod_area" value="">
			</td>	
		</tr>
		<tr>
			<th scope="row">밀원</th>
			<td>
				<select name="prod_orign" class="w100" id="prod_orign_select" data-num="1">
					<option value="아카시아">아카시아</option>
					<option value="야생화">야생화</option>
					<option value="밤">밤</option>  	
				</select>
			</td>
		</tr>
		<tr name="prod_orign_row" style="display:none;">
			<th scope="row">야생화명</th>
			<td>
				<input type="text" class="registinput w100" name="prod_orign1" value="" >
			</td>	
		</tr>
		<tr>
			<th scope="row">배포상태</th>
			<td>
				<select name="pub_sts" id="pub_sts_pub" class="w100">
					<option value="0">필증 인쇄</option>
					<option value="1">필증 제공</option>
					<option value="2">필증 검색</option>  	
				</select>
			</td>
		</tr>
		<tr style="display:none;" id="last_tr">
		</tr>
	</tbody>
</table>
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
			<td><input type="text" name='prod_name_owner' class="registinput w100" name="" value=""></td>
		</tr>
		<tr class="owner owner-row-2">
			<th scope="row">봉인번호</th>
			<td><input type="text" name='prod_no_owner' class="registinput w100" name="" value=""></td>
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
		<tr class="owner owner-row-etc" name="prod_orign_owner_row" style="display:none;">
			<th scope="row">야생화명</th>	
			<td><input type="text" name='prod_orign_owner1' class="registinput w100" name="" value=""></td>		
		</tr>
		<tr class="owner owner-row-4">
			<th scope="row">채밀지역</th>
			<td><input type="text" name='prod_province_owner' class="registinput w100" name="" value="" ></td>
		</tr>
		<tr class="owner owner-row-5">
			<th scope="row">채밀날짜</th>
			<td><input type="text" name='prod_date_owner' class="registinput w100" name="" value="" ></td>
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
<div class="taC addBtnArea">
	<a class="old_menu" href="javascript:f_pubOwner_add()" id="owner_add_btn">생산자 추가</a>
</div>
<div class="taR keyBtnArea">
	<a href="javascript:pub_qrCode()">배포</a>
	<a href="javascript:history.back()">취소</a>
</div>
</form>
</body>
</html>