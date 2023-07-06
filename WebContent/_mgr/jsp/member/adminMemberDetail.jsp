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

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
MiceParam param = (MiceParam)request.getAttribute("param");
FunctionDao fDao = new FunctionDao();


MemberVo vo = (MemberVo)request.getAttribute("vo");
ResultSetEntity d_pay = (ResultSetEntity)request.getAttribute("data_pay");
ResultSetEntity d_certi = (ResultSetEntity)request.getAttribute("data_certi");
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");

Calendar calendar = Calendar.getInstance();
int toYear = calendar.get(Calendar.YEAR);

ResultSetEntity d_pay_n = (ResultSetEntity)request.getAttribute("data_pay_n");

String selName = (String)session.getAttribute("selName");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">


//수정화면으로 이동
function f_goModify(){
	var frm = document.forms.frmDetail;
	frm.method="post";
	frm.target="";
	frm.selAction.value = "MA";
	frm.action = "/adminMember.do";

	frm.submit();
}


//신규추가화면으로 이동
function f_goRegist(){
	var frm = document.forms.frmDetail;
	frm.method="post";
	frm.target="";
	frm.selAction.value = "MA";
	frm.uid.value = "";
	frm.action = "/adminMember.do";

	frm.submit();
}


//삭제
function f_delete(){
	if(confirm("회원정보를 삭제하시겠습니까?")){
		var frm = document.forms.frmDetail;
		frm.method="post";
		frm.target="";
		frm.selAction.value = "delete";
		frm.action = "/adminMember.do";
		frm.submit();
	}

}

//프린트하기전 번호를 먼저확인후 프린트 펑션탄다.
function f_print_ajax(){

	//확인증번호를 가져온다.
	$.ajax({
		url: "/adminJson.do",
		type: "post",
		data: {
			"selAction" : "check_number",
		},
		dataType:"json",
		error: function(){
			alert("값을 불러오는데 실패하였습니다.");
		},
		success: function(data){

			number = data.result;
			f_print(number);
		}
	});

}

//프린트
function f_print(number){

	if($("#print_submission").is(":checked")){

		if(!$(':input:radio[name=print_submission_cat]:checked').val()){
			alert("제출용 체크시 용도를 선택하셔야합니다.");
			return;
		}
	}else{
		$(':input:radio[name=print_submission_cat]').prop("checked", false);
	}
	var top = screen.availHeight/2 - 100;
	var left = screen.availWidth/2 - 180;

	var frm = document.forms.frmPrint;
	var print_rdate = $("#print_rdate").is(":checked") ? "Y" : "";
	var print_breed = $("#print_breed").is(":checked") ? "Y" : "";


	var number = <%=toYear%>+"-"+number;

	var printNo = prompt("확인증 번호를 입력하세요", number);
	if($("#print_submission").is(":checked")){
		var print_submission =  $(':input:radio[name=print_submission_cat]:checked').val();
		var p1 = window.open("/adminMember.do?selAction=print&printNo="+printNo+"&print_breed="+print_breed+"&print_rdate="+print_rdate+"&print_submission="+print_submission+"&uid="+$("#uid").val(),"pop_printmember","top="+top+",left="+left+",status=no,width=880,height=600,scrollbars=yes");
	}else{
		var p1 = window.open("/adminMember.do?selAction=print&printNo="+printNo+"&print_breed="+print_breed+"&print_rdate="+print_rdate+"&uid="+$("#uid").val(),"pop_printmember","top="+top+",left="+left+",status=no,width=880,height=600,scrollbars=yes");
	}



	if(!$("#print_submission").is(":checked")){
		$(':input:radio[name=print_submission_cat]').attr("disabled", true);
	}
	p1.focus();
}


//페이징.
function f_goPage(no){
	var frm = document.forms.frmDetail;
	frm.selAction.value = "detail";
	frm.selPageNo.value = no;
	frm.list_gubun.value = "list2";

	frm.target = "";
	frm.method = "post";
	frm.action = "/adminMember.do";
	frm.submit();
}


//회원목록으로 이동
function f_golist(){
	var frm = document.forms.frmMenu;
	frm.selAction.value = "V";
	frm.selName.value = "<%=selName %>";
	frm.target = "";
	frm.method = "post";
	frm.action = "/adminMember.do";
	frm.submit();
}


//회비납부, 시험성저서 변경
function f_detail(i_list){
	if(i_list == "list1"){
		$("#list1").show();
		$("#list2").hide();

		$("#list1_title").css({ "font-weight":"bold"} );
		$("#list2_title").css({ "font-weight":"normal"} );

	}else{
		$("#list1").hide();
		$("#list2").show();

		$("#list2_title").css({ "font-weight":"bold"} );
		$("#list1_title").css({ "font-weight":"normal"} );
	}
}

//회비조작
function f_price(i_act){
	if(i_act=="insert" || i_act=="update" || i_act=="delete"){
		var msg = "";
		if(i_act=="insert"){ msg="등록";
		}else if(i_act=="update"){ msg="수정";
		}else if(i_act=="delete"){ msg="삭제";
		}

		if(confirm("회비납부 내역을 ["+msg+"] 하시겠습니까?")){
			$("#price_action").val(i_act);
			$("#price_uid").val($("#ins_uid").val());
			$("#price_gubun").val($("#ins_gubun").val());
			$("#price_paydate").val($("#ins_paydate").val());
			$("#price_pay").val($("#ins_pay").val());
			$("#price_price").val($("#ins_price").val());

			var frm = document.forms.frmDetail;
			frm.selAction.value = "detail";
			frm.list_gubun.value = "list1";
			frm.target = "";
			frm.method = "post";
			frm.action = "/adminMember.do";
			frm.submit();
		}

	}else if(i_act=="cancel"){
		$("#ins_uid, #ins_gubun, #ins_paydate, #ins_pay, #ins_price").val("");

		$("#btn_pay_insert").show();
		$("#btn_pay_update").hide();
		$("#btn_pay_delete").hide();
		$("#btn_pay_cancel").show();


	}



}

//회비선택시
function f_price_sel(i_uid){
	var frm = document.forms.frmDetail;
}


//선택버튼 클릭시
function f_selprice(i_uid){
	$("#ins_uid").val($("#i_uid_"+i_uid).val());
	$("#ins_gubun").val($("#i_gubun_"+i_uid).val());
	$("#ins_paydate").val($("#i_paydate_"+i_uid).val());
	$("#ins_pay").val($("#i_pay_"+i_uid).val());
	$("#ins_price").val($("#i_price_"+i_uid).val());

	$("#btn_pay_insert").hide();
	$("#btn_pay_update").show();
	$("#btn_pay_delete").show();
	$("#btn_pay_cancel").show();
}


$(function(){
	$("#list1").css("{font-weidht:bold}");
	$("#list2").css("{font-weidht:bold}");

	if($("#list_gubun").val()=="list1"){
		$("#list1").show();
		$("#list2").hide();
	}else{
		$("#list1").hide();
		$("#list2").show();
	}

	//제출용 관련.S
	$(':input:radio[name=print_submission_cat]').attr("disabled", true);

	$("#print_submission").click(function(){
		if($("#print_submission").is(":checked")){
			$(':input:radio[name=print_submission_cat]').attr("disabled", false);
		}else{
			$(':input:radio[name=print_submission_cat]').attr("disabled", true);
			$(':input:radio[name=print_submission_cat]').prop("checked", false);
		}
	});
	//제출용 관련.E



	$("#ins_paydate").datepicker({changeYear:true});
	$("#ins_paydate").datepicker("option", "dateFormat", "yy-mm-dd");
	$("#ins_paydate").datepicker("option", "yearRange", "-10:+0");
	//$("#ins_paydate").datepicker("setDate", "<%=param.getString("ins_paydate") %>");
	$("#ins_paydate").datepicker("setDate", "<%=param.getString("ins_paydate", DateC.getCurrent_str("yyyy-MM-dd")) %>");

	$("#btn_pay_insert").show();
	$("#btn_pay_update").hide();
	$("#btn_pay_delete").hide();
	$("#btn_pay_cancel").show();
});


//년도변경시
function f_changeInsGubun(){
	if(($("#ins_gubun").val()|0) >= 2013){
		$("#ins_price").val("100000");
	}else if($("#ins_gubun").val()=="가입비"){
		$("#ins_price").val("50000");
	}else{
		$("#ins_price").val("");
	}
}
</script>


</head>

<body>
<form name="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="selName" value=""/>
</form>
<!-- 공통폼 S.-->
<form name="frmDetail" id="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="uid" id="uid" value="<%=vo.getUid() %>"/>
<input type="hidden" name="selPageNo" value=""/>
<input type="hidden" name="list_gubun" id="list_gubun" value="<%=param.getString("list_gubun") %>"/>

<input type="hidden" name="price_action" id="price_action" value=""/>
<input type="hidden" name="price_memberuid" 	id="price_memberuid" value="<%=vo.getId() %>"/>
<input type="hidden" name="price_uid" 	id="price_uid" value=""/>
<input type="hidden" name="price_gubun" id="price_gubun" value=""/>
<input type="hidden" name="price_paydate" id="price_paydate" value=""/>
<input type="hidden" name="price_pay" 	id="price_pay" value=""/>
<input type="hidden" name="price_price" id="price_price" value=""/>

</form>
<!-- 공통폼 E. -->
<iframe name="hidFrame" style="display:none"></iframe>
<!-- 공통폼 E. -->

<!-- Global Wrapper.s -->
<div id="wrap">
<!-- TNB.s -->
	<div id="tnb">

	</div>
<!-- TNB.e -->

<!-- Container.s -->
	<div id="container" style="min-width:1050px">

<!-- Content.s -->
		<div id="content">

 			<p class="cont_header bold">
				<span class="f_left">회원정보</span>
			</p>

			<%
			Object age = 0;
			String regnumber = vo.getRegnumber(); 
			int regnumberYear = 1900;
			try{
				if(regnumber.length() >= 2 && Integer.parseInt(regnumber) > 0){
					regnumberYear = 1900 + Integer.parseInt(regnumber.substring(0,2));
					int year = Calendar.getInstance().get(Calendar.YEAR);
					age = year - regnumberYear+1;
				}else {
					age = (String)"-";
				}
			}catch(Exception e){
				System.err.println("Admin Member Detail: regnum parse error");
			}
			
			%>
			<div class="form_wrap">
				<div style="float:left" style="width:600px">
					<p class="form_title">회원 상세정보</p>
					<table class="form" style="width:600px">
						<tr>
							<td class="cat" style="width:18%">가입일자</td>
							<td style="width:37%"><%=vo.getRegistDate() %></td>
							<td class="cat" style="width:18%">회원코드</td>
							<td><%=vo.getMember_code() %></td>
						</tr>
						<tr>
							<td class="cat" >아이디</td>
							<td style="width:37%"><%=vo.getId() %></td>
							<td class="cat" >비밀번호</td>
							<td><%=vo.getPasswd() %></td>
						</tr>
					</table>
					<br/>

					<table class="form" style="width:600px">
						<tr>
							<td class="cat" style="width:18%">이름</td>
							<td style="width:37%"><%=vo.getName() %></td>
							<td class="cat" style="width:18%">주민번호</td>
							<td><%=vo.getRegnumber() %> - <%=vo.getRegnumber2() %></td>
						</tr>
						<tr>
							<td class="cat" >사업장명</td>
							<td><%=vo.getCompanyname() %></td>
							<td class="cat" >사업자번호</td>
							<td><%=vo.getBiznumber1()+"-"+vo.getBiznumber2()+"-"+vo.getBiznumber3() %></td>
						</tr>
						<tr>
							<td class="cat" >나이</td>
							<td><%=age %></td>
							<td class="cat" >성별</td>
							<td><%="M".equals(vo.getSex()) ? "남성" : "F".equals(vo.getSex()) ? "여성" : "<i>성별이 지정되지 않았습니다.</i>" %></td>
						</tr>
						<tr>
							<td class="cat" >지회</td>
							<td><%=vo.getBranch1() %></td>
							<td class="cat" >지부</td>
							<td><%=vo.getBranch2() %></td>
						</tr>
						<tr>
							<td class="cat" >역할</td>
							<td><%=vo.getRole() %></td>
							<td class="cat" >직책</td>
							<td><%=vo.getRole_pos() %></td>
						</tr>


						<tr>
							<td class="cat" >우편번호지역</td>
							<td colspan="3"><%=vo.getHzipcode3() %> (구: <%=vo.getHzipcode1()+"-"+vo.getHzipcode2() %> ※테스트 후 삭제예정)</td>
						</tr>
						<tr>
							<td class="cat" >주소1(자택)</td>
							<td colspan="3"><%=vo.getHaddr1() %></td>
						</tr>
						<tr>
							<td class="cat" >주소2(자택)</td>
							<td colspan="3"><%=vo.getHaddr2() %></td>
						</tr>


						<tr>
							<td class="cat" >우편번호지역</td>
							<td colspan="3"><%=vo.getOzipcode3() %> (구: <%=vo.getOzipcode1()+"-"+vo.getOzipcode2() %> ※테스트 후 삭제예정)</td>
						</tr>
						<tr>
							<td class="cat" >주소1(사업장)</td>
							<td colspan="3"><%=vo.getOaddr1() %></td>
						</tr>
						<tr>
							<td class="cat" >주소2(사업장)</td>
							<td colspan="3"><%=vo.getOaddr2() %></td>
						</tr>
					</table><br/>

					<table class="form" style="width:600px">
						<tr>
							<td class="cat" style="width:18%">TEL자택</td>
							<td style="width:37%"><%=vo.getHphone1() %> - <%=vo.getHphone2() %> - <%=vo.getHphone3() %></td>
							<td class="cat" style="width:18%">TEL사업장1</td>
							<td><%=vo.getOphone1() %> - <%=vo.getOphone2() %> - <%=vo.getOphone3() %></td>
						</tr>
						<tr>
							<td class="cat" >휴대폰</td>
							<td><%=vo.getCp1() %> - <%=vo.getCp2() %> - <%=vo.getCp3() %></td>
							<td class="cat" >TEL사업장2</td>
							<td><%=vo.getO2phone1() %> - <%=vo.getO2phone2() %> - <%=vo.getO2phone3() %></td>
						</tr>
						<tr>
							<td class="cat" >FAX</td>
							<td><%=vo.getOfax1() %> - <%=vo.getOfax2() %> - <%=vo.getOfax3() %></td>
							<td class="cat" >TEL사업장3</td>
							<td><%=vo.getO3phone1() %> - <%=vo.getO3phone2() %> - <%=vo.getO3phone3() %></td>
						</tr>
						<tr>
							<td class="cat" >email</td>
							<td colspan="3"><%=vo.getEmail() %></td>
						</tr>
					</table><br/>


					<table class="form" style="width:600px">
						<tr>
							<td class="cat" style="width:18%">경력</td>
							<td style="width:37%"><%=vo.getCarrier() %></td>
							<td class="cat" style="width:18%">사육군수</td>
							<td><%=vo.getBreednumber() %></td>
						</tr>
						<tr>
							<td class="cat" >우편물수취</td>
							<td><%="H".equals(vo.getMailreceive()) ? "자택" : "사업장" %></td>
							<td class="cat" >연락상태</td>
							<td>
								<%
								String str_contact_status = "";
								if("D".equals(vo.getContact_status())){
									str_contact_status = "사망";
								}else if("N".equals(vo.getContact_status())){
									str_contact_status = "장기미활동";
								}else if("O".equals(vo.getContact_status())){
									str_contact_status = "OK";
								}else if("R".equals(vo.getContact_status())){
									str_contact_status = "반송";
								}else if("K".equals(vo.getContact_status())){
									str_contact_status = "거절";
								}else if("H".equals(vo.getContact_status())){
									str_contact_status = "자격정지";
								}else if("U".equals(vo.getContact_status())){
									str_contact_status = "제명";
								}else if("L".equals(vo.getContact_status())){
									str_contact_status = "탈퇴";
								}
								%>
							<%=str_contact_status %></td>
						</tr>
						<%-- <tr>
							<td class="cat" >우편물발송</td>
							<td><%="Y".equals(vo.getMailsent()) ? "발송" : "미발송" %></td>
							<td class="cat" >가입비납부</td>
							<td><%=vo.getJoin_bill() %></td>
						</tr> --%>
						<tr>
							<td class="cat" >비고</td>
							<td colspan="3"><%=vo.getComment() %></td>
						</tr>
					</table>
					<br/>

					<input type="checkbox" id="print_rdate" value="Y" checked="checked">가입일자
					<input type="checkbox" id="print_breed" value="Y">사육군수
					<input type="checkbox" id="print_submission" value="Y">제출용
					<br/>
					<input type="radio" name="print_submission_cat" id="print_submission_cat" value="1">은행
					<input type="radio" name="print_submission_cat" id="print_submission_cat" value="2">경영체등록
					<input type="radio" name="print_submission_cat" id="print_submission_cat" value="3">기술센터
					<input type="radio" name="print_submission_cat" id="print_submission_cat" value="4">농협
					<input type="radio" name="print_submission_cat" id="print_submission_cat" value="5">품질관리등록
					<input type="radio" name="print_submission_cat" id="print_submission_cat" value="6">보험회사
					<input type="radio" name="print_submission_cat" id="print_submission_cat" value="7">대출
					
					<div class="mt10">
						<span style="float:left">
							<a href="javascript: f_golist()" class="btn grey f_right">회원목록</a>
							<a href="javascript: f_goModify()" class="btn grey f_right">수정</a>
							<a href="javascript: f_delete()" class="btn grey f_right">삭제</a>
							<a href="javascript: f_print_ajax()" class="btn grey f_right">인쇄</a>&nbsp;&nbsp;
						</span>
						<br style="clear:both"/>
					</div>

				</div>

				<div style="float:right; width:400px;">
					<p class="form_title" style="padding-bottom:8px">
						<span id="list1_title" onclick="javascript: f_detail('list1')" style="font-weight:bold" ><a href="javascript: void(-1)">회비내역</a></span>
						| <span id="list2_title" onclick="javascript: f_detail('list2')" style="" ><a href="javascript: void(-1)">시험성적서</a></span>
					</p>
					<div class="list_wrap" id="list1">
						<table class="list">
							<tr>
								<th>회비구분</th>
								<th>납부일자</th>
								<th>납부</th>
								<th>금액</th>
								<th>선택</th>
							</tr>


							<%!
							private class BillPay{
								public String gubun = "2000";
								public String paydate = "";
								public String pay = "";
								public String price = "";
								public String uid = "";
								public BillPay(String gubun, String paydate, String pay, String price, String uid){
									this.gubun = gubun;
									this.paydate = paydate;
									this.pay = pay;
									this.price = price;
									this.uid = uid;
								}
							}
							%>
							<%
							Map<String, BillPay> payMap = new HashMap<String, BillPay>();
							while(d_pay!=null && d_pay.next()){
								payMap.put(d_pay.getString("gubun"),
										new BillPay(d_pay.getString("gubun"),
											d_pay.getString("paydate"), d_pay.getString("pay"),
											d_pay.getString("price"), d_pay.getString("uid"))
										);
							}

							int startYear = Calendar.getInstance().get(Calendar.YEAR)+2;
							SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
							Date regDateObj = sdf.parse(vo.getRegistDate());
							Calendar regDateCal = Calendar.getInstance();
							regDateCal.setTime(regDateObj);
							int registYear = Math.max(regDateCal.get(Calendar.YEAR), 2000);
							for( int i = startYear; i >= registYear; i--){
								BillPay pay = payMap.get(String.valueOf(i));
								if(pay == null){
									pay = new BillPay(String.valueOf(i), "", "", "-", vo.getUid());
								}
							%>
							<tr>
								<td class="first ta_center" style="width:80px"><%=pay.gubun %></td>
								<td class="ta_center" style="width:80px"><%=pay.paydate %></td>
								<td class="ta_center" style="width:50px"><%=pay.pay %></td>
								<td class="ta_right"><%=pay.price.matches("[0-9]+") ? TextFormatter.formatNum(pay.price) : pay.price %></td>
								<td class="last ta_center" style="width:80px">
									<%if(!"".equals(pay.pay)){ %>
									<a href="javascript: f_selprice('<%=pay.uid %>')" class="btn grey">선택</a>
									<input type="hidden" id="i_uid_<%=pay.uid %>" value="<%=pay.uid %>"/>
									<input type="hidden" id="i_gubun_<%=pay.uid %>" value="<%=pay.gubun %>"/>
									<input type="hidden" id="i_paydate_<%=pay.uid %>" value="<%=pay.paydate %>"/>
									<input type="hidden" id="i_pay_<%=pay.uid %>" value="<%=pay.pay %>"/>
									<input type="hidden" id="i_price_<%=pay.uid %>" value="<%=pay.price %>"/>
									<%} %>
								</td>
							</tr>
							<%
							}
							BillPay pay = payMap.get("가입비");
							if(pay == null) pay = new BillPay("가입비", "", "", "-", vo.getUid());
							%>
							<tr>
								<td class="first ta_center" style="width:80px"><%=pay.gubun %></td>
								<td class="ta_center" style="width:80px"><%=pay.paydate %></td>
								<td class="ta_center" style="width:50px"><%=pay.pay %></td>
								<td class="ta_right"><%=pay.price.matches("[0-9]+") ? TextFormatter.formatNum(pay.price) : pay.price %></td>
								<td class="last ta_center" style="width:80px">
									<%if(!"".equals(pay.pay)){ %>
									<a href="javascript: f_selprice('<%=pay.uid %>')" class="btn grey">선택</a>
									<input type="hidden" id="i_uid_<%=pay.uid %>" value="<%=pay.uid %>"/>
									<input type="hidden" id="i_gubun_<%=pay.uid %>" value="<%=pay.gubun %>"/>
									<input type="hidden" id="i_paydate_<%=pay.uid %>" value="<%=pay.paydate %>"/>
									<input type="hidden" id="i_pay_<%=pay.uid %>" value="<%=pay.pay %>"/>
									<input type="hidden" id="i_price_<%=pay.uid %>" value="<%=pay.price %>"/>
									<%} %>
								</td>
							</tr>
						</table><br/>
						<table class="list" style="border-bottom:2px solid #949494;border-top:2px solid #949494;">
							<tr>
								<th>회비구분</th>
								<th>납부일자</th>
								<th>납부</th>
								<th>금액</th>
							</tr>
							<tr>
								<td class="first ta_center">
									<input type="hidden" name="ins_uid" id="ins_uid" value=""/>
									<select name="ins_gubun" id="ins_gubun" style="width:60px; min-width:40px" onchange="f_changeInsGubun()">
										<%
										for( int i = startYear; i > 1999; i--){
										%>
										<option value="<%=i %>" <%=i == (startYear-1) ? "selected" : "" %>><%=i %></option>
										<%
										}
										%>
										<option value="가입비">가입비</option>
									</select>
								</td>
								<td class="ta_center">
									<input type="text" name="ins_paydate" id="ins_paydate" value="" style="width:70px;" maxlength="8"/>
								</td>
								<td class="ta_center">

									<select name="ins_pay" id="ins_pay" style="width:50px; min-width:40px">
										<option value="Y">Y</option>
										<option value="N">N</option>
									</select>
								</td>
								<td class="last">
									<input type="text" name="ins_price" id="ins_price" value="100000" style="width:100px;"/>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="first last ta_right">
									<a href="javascript: f_price('insert')" class="btn grey" id="btn_pay_insert">등록</a>
									<a href="javascript: f_price('update')" class="btn grey" id="btn_pay_update">수정</a>
									<a href="javascript: f_price('delete')" class="btn grey" id="btn_pay_delete">삭제</a>
									<a href="javascript: f_price('cancel')" class="btn grey" id="btn_pay_cancel">취소</a>
								</td>
							</tr>
						</table>
						<br/>


						<table class="list">
							<tr>
								<th>미납내역</th>
							</tr>
							<%
							while(d_pay_n!=null && d_pay_n.next()){
							%>
							<tr>
								<td class="first last ta_center"><%=d_pay_n.getString("gubun") %></td>
							</tr>
							<%
							}
							%>
						</table>

					</div>


					<div class="list_wrap" id="list2">
						<table class="list rowhover">
							<tr>
								<th>접수번호</th>
								<th>시험완료일</th>
								<th>시험항목</th>
								<th>판정</th>
							</tr>


							<%
							while(d_certi!=null && d_certi.next()){
							%>
							<tr>
								<td class="first ta_center"><%=d_certi.getString("regnum") %></td>
								<td class="ta_center"><%=d_certi.getString("test_endd_date") %></td>
								<td class="ta_center"><%=d_certi.getString("rqst_prdt_name") %></td>
								<td class="last ta_right"><%=d_certi.getString("test_rslt") %></td>
							</tr>
							<%
							}
							%>
						</table>
						<div style="text-align:center"><%=pagesVo.getPageHtml() %></div>
					</div>

				</div>

				<br style="clear:both"/>
			</div>

			<div style="height:30px">
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