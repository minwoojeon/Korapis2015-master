<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.util.DateC"%>
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

ResultSetEntity d = (ResultSetEntity)request.getAttribute("dataList");
SelectBoxDao boxDao = new SelectBoxDao();
DateC datec = new DateC();

String balance = (String)request.getAttribute("balance");

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

StringBuilder sb = new StringBuilder();
String cp = "";
while(d!=null && d.next()){
	sb.append(d.getString("name").replace(" ", ""));
	if(!"".equals(d.getString("cp1").replace(" ", "")) 
			&& !"".equals(d.getString("cp2").replace(" ", "")) 
			&& !"".equals(d.getString("cp3").replace(" ", ""))){
		sb.append(" ");
		sb.append(d.getString("cp1").replace(" ", "")).append("-");
		sb.append(d.getString("cp2").replace(" ", "")).append("-");
		sb.append(d.getString("cp3").replace(" ", ""));
	}
	sb.append("\r\n");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<style>
#sms_list li{
	border-bottom:1px dashed #B0ABAB
}


.slist_name{
	display:inline-block; width:60px
}
.slist_cp{
	display:inline-block; width:110px
}
.slist_btn{
	cursor:pointer; padding-left:3px; font-size:11px; 
	border:1px solid gray; background-color:#eeeeee;
}




</style>
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery.autosize.js"></script>
<script type="text/javascript">
	
	var list_tot = 0;
	
	$(function(){
		var frm = document.forms.frmSms;
		$('textarea').autosize();    
		$(frm.sms_content).on("input",function(){
			$("#sms_content_length").text(lengthInUtf8Bytes(this.value));
		});
		function lengthInUtf8Bytes(str) {
			  var m = encodeURIComponent(str).match(/%[89ABab]/g);
			  return str.length + (m ? (m.length/2) : 0);
			}
	});

	//발송목록에서 삭제 클릭시
	function f_slist_btn(o){
		$(o).parent().remove();
		list_tot--;
		$("#sms_list_cnt").html(list_tot+"명");
	}
	
	//실제 발송목록에 추가.
	function f_addlist(){
		var lines = $('#source_list').val().split(/\n/);
		var texts = [];
		for (var i=0; i < lines.length; i++) {
		  // only push this line if it contains a non whitespace character.
		  if (/\S/.test(lines[i])) {
		    texts.push($.trim(lines[i]));
		  }
		}
		//alert(JSON.stringify(texts));

		$("#sms_list").html("");
		var h = "";
		var cnt = 0;
		var overcount = false;
		$.each(texts, function(key, ele){
			if(cnt>1000){
				overcount = true;
				return false;
			}
			var k = texts[key].indexOf(" "); 
			if( k>-1){
				h += '<li>';
				h += '<span class="slist_name">'+texts[key].substring(0,k)+'</span>';
				h += '<span class="slist_cp">'+texts[key].substring(k+1)+'</span>';
				h += '<span class="slist_btn" onclick="javascript: f_slist_btn(this)">삭제</span>';
				h += '</li>';
				cnt++;
			}
		});
		list_tot = cnt;
		$("#sms_list").html(h);
		$("#sms_list_cnt").html(list_tot+"명");
		
		if(overcount){
			alert("한번에 발송할 수 있는 건수는 1000건 입니다.");
		}
	}
	

	//개별추가
	function f_person_add(){
		if($("#person_name").val()=="" || $("#person_cp").val()==""){
			alert("추가하실 이름, 연락처를 입력해주세요!");
			return;	
		}
		
		if(list_tot>1000){
			alert("한번에 1000명 이상은 발송할 수 없습니다.");
			return;
		}
		
		var p = "";
		p += '<li>';
		p += '<span class="slist_name">'+$("#person_name").val()+'</span>';
		p += '<span class="slist_cp">'+$("#person_cp").val()+'</span>';
		p += '<span class="slist_btn" onclick="javascript: f_slist_btn(this)">삭제</span>';
		p += '</li>';
		
		if(list_tot>0){
			$('#sms_list li:eq(0)').before(p);
		}else{
			$('#sms_list').html(p);
		}
		
		list_tot++;
		$("#sms_list_cnt").html(list_tot+"명");
		$("#person_name, #person_cp").val("");
	}
	
	
	
	//sms발송 
	function f_send_sms(){
		//0. 전화번호 목록을 만든다.
		
		var frm = document.forms.frmSms;
		frm.selAction.value = "sendsms";
		var vlist = "";
		var ar_list = $(".slist_cp"); 
		$.each(ar_list, function(k,e){
			vlist += $(ar_list[k]).text()+",";
		});
		$("#sendnumber").val( vlist );
		
		frm.method="post";
		frm.target="";
		frm.action="/adminSms.do";
		frm.submit();
		
	}
	

</script>


</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
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
				<span class="f_left">SMS 발송  <span style="font-size:13px; color:#545454;">(잔액: <%=TextFormatter.formatNum(balance) %> 원)</span></span>
				<span class="f_right">
					
				</span>
			</p>
			

			
				
			<div class="form_wrap">
			<form name="frmSms">
			<input type="hidden" name="selAction" value=""/>
			<input type="hidden" name="sendnumber" id="sendnumber" value=""/>
			
				<div>※ 1건당 SMS: 20원, MMS: 50원</div>
			
				<div style="float:left;">
					<div style="border:1px solid rgb(208, 208, 208); background-color:#eeeeee; padding:7px">			
						<p>대량추가</p>
						<p style="padding-top:5px">
						<textarea id="source_list" style="font-size:12px; width:200px; padding:3px;"><%=sb.toString() %></textarea>
						</p>
						<p style="text-align:right; padding-top:6px">
							<a href="javascript: f_addlist()" class="btn grey">수신자 명단에 추가</a>
						</p>
					</div>
				</div>
				
				
				
				
				<div style="float:left; padding-left:10px">
					<div style="border:1px solid rgb(208, 208, 208); background-color:#eeeeee; padding:7px">
					<div style="float:left">
						<p>
							<input type="text" id="person_name" value="홍길동" maxlength="5" style="width:60px"/>
							<input type="text" id="person_cp" value="000-0000-0000" maxlength="13" style="width:90px"/>
							<a href="javascript: f_person_add()" class="btn grey">추가</a>
						</p>
						<p style="padding-top:10px">수신자 명단 (<span id="sms_list_cnt">0명</span>)</p>
						<div style="background-color:white; border:1px solid gray">
							<ul id="sms_list" style="line-height:20px; padding:5px;">
							</ul>
						</div>
					</div>
					
					<div style="float:left; padding-left:7px">
						<p>발신번호: <input type="text" name="from_number" value="02-3486-0882" maxlength="13" style="width:90px"/></p>
						<p style="padding-top:10px">발신내용 <span id="sms_content_length" style="color:red; padding-left:15px">0</span> Bytes</p>
						<p>
						</p>
							<textarea id="sms_content" name="sms_content" style="height:150px; width:200px; padding:3px; background-color:white"></textarea>
						<p style="text-align:right; padding-top:6px">
							<a href="javascript: f_send_sms()" class="btn grey">발송</a>
						</p>
					</div>
					<br style="clear:both"/>
				</div>
				
				<br style="clear:both"/>				
			</div>

			</form>
			</div>
						

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