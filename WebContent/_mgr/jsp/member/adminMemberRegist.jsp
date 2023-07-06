<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
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
SelectBoxDao boxDao = new SelectBoxDao();

MemberVo vo = (MemberVo)request.getAttribute("vo");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
	
	
	
	$(function(){
		$("#registdate").datepicker({
				changeYear : true
				, dateFormat : "yy-mm-dd"
				, yearRange : "-10:+0"
			});
	<%if(vo.isEmpty()){%>
		$("#registdate").datepicker("setDate", "<%=param.getString("registdate", DateC.getCurrent_str("yyyy-MM-dd")) %>");
	<%}else{
		String s = vo.getRegistDate();
		if(s.length()<10){ //2014-3-1
			String[] arr = s.split("-");
			if(arr.length==3){
				s = arr[0];
				s +="-";
				s += arr[1].length()==1 ? "0"+arr[1] : arr[1];
				s +="-";
				s += arr[2].length()==1 ? "0"+arr[2] : arr[2];
			}else{
				if(s.length()==8){
					s = s.substring(0,4)+"-"+s.substring(4,6)+"-"+s.substring(6,8);
				}
			}
		}
	%>
		$("#registdate").datepicker("setDate", "<%=s %>");
	<%}%>
		
		
		//주민번호에 따라서 나이 자동 지정
		$("#regnumber").on("focusout", function(){
			var currentYear = (new Date).getFullYear();
			var i_age = currentYear - Number("19"+$(this).val().substring(0,2)) +1;
			//$("#age_disp").val(i_age);
			$("#age").val(i_age);
		});
		
		//주민번호에 따라서 성별 자동 지정
		$("#regnumber2").on("focusout", function(){
			if(1==$(this).val().substring(0,1)){
				$("input[name='sex_disp'][value='M']").attr("checked", true);
				$("#sex").val("M");
			}else{
				$("input[name='sex_disp'][value='F']").attr("checked", true);
				$("#sex").val("F");
			}
		});
		
		
		$("input[name=sex_disp]").on("click", function(){
			$("#sex").val(this.value);
		});
		
		$("#regnumber").val("<%=vo.getRegnumber() %>").change(function(){
			$("#check_regnumber").val("N");
		});
		$("#regnumber2").val("<%=vo.getRegnumber2() %>").change(function(){
			$("#check_regnumber").val("N");
		});
		
	});
	
	



//수정 
function f_update(){
	if(f_validate() && confirm("수정하시겠습니까?")){
		
		$("#sex").val($("input[name='sex_disp']:checked").val());
		
		var frm = document.forms.frmRegist;
		frm.method="post";
		frm.target="";
		frm.selAction.value = "update_member";
		frm.action = "/adminMember.do";
		
		frm.submit();
	}
}
//등록
function f_insert(){
	if(f_validate() && confirm("등록하시겠습니까?")){

		$("#sex").val($("input[name='sex_disp']:checked").val());
		
		var frm = document.forms.frmRegist;
		frm.method="post";
		frm.target="";
		frm.selAction.value = "insert_member";
		frm.action = "/adminMember.do";
		
		frm.submit();
	}
}

//확인작업
function f_validate(){
	var frm = document.forms.frmRegist;
	if(frm.name.value==""){
		alert("회원명을 입력해주세요!");
		frm.name.focus();
		return false;
	}
	
	
	if(frm.contact_status.value==""){
		alert("연락상태를 선택해주세요!");
		frm.contact_status.focus();
		return false;
	}
	
	
	/*
	//주민번호체크 해제
	if($("#check_regnumber").val() != 'Y'){
		alert("주민번호 중복체크를 확인 해주세요!");
		return false;
	}
	*/
	
	return true;
}


//지부정보를 가져온다
function f_get_branch2(){
	$.ajax({
		url: "/adminJson.do", 
		type: "post",
		data: {
			"selAction" : "get_branch2",
			"ins_branch1" : $("#branch1").val()
		},
		dataType:"json",
		error: function(){
			alert("지부정보를 불러올 수 없습니다.");
		},
		success: function(data){
			$("#branch2").empty();
			$("#branch2").append( new Option("= 선택 =", "") );
			$.each(data, function(key, ele){
				$("#branch2").append( new Option(data[key].id, data[key].name) );
			});
		}
	});
}

//주민번호 중복체크
function f_check_regnumber(){
	
	if( $("#regnumber").val().length<6 || $("#regnumber2").val().length<7 ){
		alert("주민번호를 모두 입력해주세요");
		return;
	}
	
	$.ajax({
		url: "/adminJson.do", 
		type: "post",
		data: {
			"selAction" : "check_regnumber",
			"regnumber" : $("#regnumber").val(),
			"regnumber2" : $("#regnumber2").val()
		},
		dataType:"json",
		error: function(){
			alert("주민번호 확인 시 오류가 발생했습니다.");
		},
		success: function(data){
			
			
			if(data.result == "SUCCESS"){
				alert("신규가입이 가능한 주민번호입니다.");
				$("#check_regnumber").val("Y");
			}else{
				alert("이미 가입되어 있는 주민번호입니다.");
				$("#check_regnumber").val("N");
				$("#regnumber").val("");
				$("#regnumber2").val("");
			}
			
		}
	});
}

function f_address(i_gubun){
	//var l = screenX || screenLeft,
	//t = screenY || screenTop,
	//w = window.outerWidth || document.documentElement.clientWidth,
	//h = window.outerHeight || document.documentElement.clientHeight;
	
	var opt = "left=200 ,top=100 ,width=750,height=670,status=no,resizable=yes,scrollbars=yes";
	window.open("/_mgr/jsp/member/addressList.jsp?gubun="+i_gubun,"address_popup",opt);
}
function f_addressCallback(gubun, part1, part2, zipno){
	var frm = document.forms.frmRegist;
	frm[gubun+'addr1'].value = part1;
	frm[gubun+'addr2'].value = part2;
	frm[gubun+'zipcode3'].value=zipno;
	$(frm[gubun+'addr2']).trigger("focus").trigger("select");
}



//회원목록으로 이동
function f_golist(){
	var frm = document.forms.frmMenu;
	frm.selAction.value = "V";
	
	frm.target = "";
	frm.method = "post";
	frm.action = "/adminMember.do";
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
			

			
				
			<div class="form_wrap">
			<form name="frmRegist" method="post">
			<input type="hidden" name="selAction" value=""/>
			<input type="hidden" name="uid" value="<%=vo.getUid() %>" />
			
			
				<p class="form_title">상세정보</p>
				<table class="form" style="width:800px">
					<tr>
						<td class="cat" style="width:13%">가입일자</td>
						<td style="width:37%">
							<input type="text" name="registdate" id="registdate" value="" maxlength="10" style="width:90px"/>
						</td>
						<td class="cat" style="width:13%">회원코드</td>
						<td>
							<%if(vo.isEmpty()){ %>
								<input type="hidden" name="id" value="<%=vo.getId() %>"/>
								(등록시 자동으로 부여됩니다)
							<%}else{ %>
								<input type="hidden" name="id" value="<%=vo.getId() %>"/>
								<%=vo.getMember_code() %>
							<%} %>
						</td>
					</tr>
					<tr>
						<td class="cat" >아이디 *</td>
						<td>
							<%if(vo.isEmpty()){ %>
								<input type="hidden" name="id" value="<%=vo.getId() %>"/>
								(등록시 자동으로 부여됩니다)
							<%}else{ %>
								<input type="hidden" name="id" value="<%=vo.getId() %>"/>
								<%=vo.getId() %>
							<%} %>
						</td>
						<td class="cat" >비밀번호 *</td>
						<td>
							<input type="text" name="passwd" value="<%=TextFormatter.convNvl(vo.getPasswd(), "1111") %>" maxlength="20"/>
						</td>
					</tr>
				</table>
				<br/>
				
				<table class="form" style="width:800px">
					<tr>
						<td class="cat" style="width:13%">이름 *</td>
						<td style="width:37%">
							<input type="text" name="name" value="<%=vo.getName() %>" style="ime-mode:active;"/>
						</td>
						<td class="cat" style="width:13%">주민번호</td>
						<td>
							<input type="text" name="regnumber" id="regnumber" value="<%=vo.getRegnumber() %>" style="width:50px;" maxlength="6"/>
							- <input type="text" name="regnumber2" id="regnumber2" value="<%=vo.getRegnumber2() %>" style="width:50px;" maxlength="7"/>
							
							<input type="hidden" name="check_regnumber" id="check_regnumber" value="<%=vo.isEmpty() ? "N" : "Y" %>"/>
							<a href="javascript: f_check_regnumber()" class="btn grey">중복확인</a> 
						</td>
					</tr>
					<tr>
						<td class="cat" >나이</td>
						<td>
							<input type="text" name="age" id="age" value="<%=vo.getAge() %>" maxlength="3" style="width:55px"/> 
							<%-- <input type="text" id="age_disp" value="<%=vo.getAge() %>" style="width:50px; background-color:#eeeeee" readonly/> --%>
						</td>
						<td class="cat" >성별</td>
						<td>
							<input type="hidden" name="sex" id = "sex" value="<%=vo.getSex() %>" style="width:55px"/>
							<input type="radio" name="sex_disp" value="M" <%="".equals(vo.getSex()) || "M".equals(vo.getSex()) ? "checked" : "" %>/> 남자
							<input type="radio" name="sex_disp" value="F" <%="F".equals(vo.getSex()) ? "checked" : "" %>/> 여자
						</td>
					</tr>
					
					
					<tr>
						<td class="cat" >사업장명</td>
						<td>
							<input type="text" name="companyname" value="<%=vo.getCompanyname() %>"/>
						</td>
						<td class="cat" >사업자번호</td>
						<td>
							<input type="text" name="biznumber1" value="<%=vo.getBiznumber1() %>" style="width:50px;" maxlength="10" />
							- <input type="text" name="biznumber2" value="<%=vo.getBiznumber2() %>" style="width:50px;" maxlength="10" />
							- <input type="text" name="biznumber3" value="<%=vo.getBiznumber3() %>" style="width:50px;" maxlength="10" />
						</td>
					</tr>
					<tr>
						<td class="cat" >지회</td>
						<td>
							<select name="branch1" id="branch1"  onchange="javascript: f_get_branch2()">
				            	<option value="">= 선택 =</option>
				            	<%=boxDao.getBranch1(vo.getBranch1()) %>
			            	</select>
						</td>
						<td class="cat" >지부</td>
						<td>
							<select name="branch2" id="branch2">
				            	<option value="">= 선택 =</option>
				            	<%=boxDao.getBranch2(vo.getBranch1(), vo.getBranch2()) %>
				            </select>
			            </td>
					</tr>
					<tr>
						<td class="cat" >역할</td>
						<td>
						<select name="role">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getYrole(vo.getRole()) %>
			            </select>
						<td class="cat" >직책</td>
						<td>
						<select name="role_pos">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getGrole(vo.getRole_pos()) %>
			            </select>
					</tr>
					
					
					<tr>
						<td class="cat" >우편번호지역</td>
						<td colspan="3">
							<input type="text" name="hzipcode3" value="<%=vo.getHzipcode3() %>" style="width:70px;" maxlength="5" />
							<%-- (구)우편번호 --%>
							<input type="hidden" name="hzipcode1" value="<%=vo.getHzipcode1() %>" style="width:50px;" />
							<input type="hidden" name="hzipcode2" value="<%=vo.getHzipcode2() %>" style="width:50px;" />
							<a href="javascript:f_address('h')" class="btn grey">주소검색</a>
						</td>
					</tr>
					<tr>
						<td class="cat" >주소1(자택)</td>
						<td colspan="3">
							<input type="text" name="haddr1" value="<%=vo.getHaddr1() %>" style="width:95%;"/>
						</td>
					</tr>
					<tr>
						<td class="cat" >주소2(자택)</td>
						<td colspan="3">
							<input type="text" name="haddr2" value="<%=vo.getHaddr2() %>" style="width:95%;"/>
						</td>
					</tr>
					
					
					<tr>
						<td class="cat" >우편번호지역</td>
						<td colspan="3">
							<input type="text" name="ozipcode3" value="<%=vo.getOzipcode3() %>" style="width:70px;" maxlength="5" />
							<%-- (구)우편번호 --%>
							<input type="hidden" name="ozipcode1" value="<%=vo.getOzipcode1() %>" style="width:50px;"/>
							<input type="hidden" name="ozipcode2" value="<%=vo.getOzipcode2() %>" style="width:50px;"/>
							<a href="javascript:f_address('o')" class="btn grey">주소검색</a>
						</td>
					</tr>
					<tr>
						<td class="cat" >주소1(사업장)</td>
						<td colspan="3">
							<input type="text" name="oaddr1" value="<%=vo.getOaddr1() %>" style="width:95%;"/>
						</td>
					</tr>
					<tr>
						<td class="cat" >주소2(사업장)</td>
						<td colspan="3">
							<input type="text" name="oaddr2" value="<%=vo.getOaddr2() %>" style="width:95%;"/>
						</td>
					</tr>
				</table><br/>
				
				<table class="form" style="width:800px">
					<tr>
						<td class="cat" style="width:13%">TEL자택</td>
						<td style="width:37%">
							<input type="text" name="hphone1" value="<%=vo.getHphone1() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="hphone2" value="<%=vo.getHphone2() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="hphone3" value="<%=vo.getHphone3() %>" style="width:50px;" maxlength="4"/>
						</td>
						<td class="cat" style="width:13%">TEL사업장1</td>
						<td>
							<input type="text" name="ophone1" value="<%=vo.getOphone1() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="ophone2" value="<%=vo.getOphone2() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="ophone3" value="<%=vo.getOphone3() %>" style="width:50px;" maxlength="4"/>
						</td>
					</tr>
					<tr>
						<td class="cat" >휴대폰</td>
						<td>
							<input type="text" name="cp1" value="<%=vo.getCp1() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="cp2" value="<%=vo.getCp2() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="cp3" value="<%=vo.getCp3() %>" style="width:50px;" maxlength="4"/>
						</td>
						<td class="cat" >TEL사업장2</td>
						<td>
							<input type="text" name="o2phone1" value="<%=vo.getO2phone1() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="o2phone2" value="<%=vo.getO2phone2() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="o2phone3" value="<%=vo.getO2phone3() %>" style="width:50px;" maxlength="4"/>
						</td>
					</tr>
					<tr>
						<td class="cat" >FAX</td>
						<td>
							<input type="text" name="ofax1" value="<%=vo.getOfax1() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="ofax2" value="<%=vo.getOfax2() %>" style="width:50px;" maxlength="4"/>
							- <input type="text" name="ofax3" value="<%=vo.getOfax3() %>" style="width:50px;" maxlength="4"/>
						</td>
						<td class="cat" >email</td>
						<td>
							<input type="text" name="email" value="<%=vo.getEmail() %>" style="width:250px;"/>
						</td>
					</tr>
				</table><br/>
				
				
				<table class="form" style="width:800px">
					<tr>
						<td class="cat" style="width:13%">경력</td>
						<td style="width:37%">
							<input type="text" name="carrier" value="<%=vo.getCarrier() %>" style="width:50px;"/> 년
						</td>
						<td class="cat" style="width:13%">사육군수</td>
						<td>
							<input type="text" name="breednumber" value="<%=vo.getBreednumber() %>" style="width:50px;"/>
						</td>
					</tr>
					<tr>
						<td class="cat" >우편물수취</td>
						<td>
							<select name="mailreceive">
								<option value="" <%="".equals(vo.getMailreceive()) ? "selected" : "" %>>= 선택해주세요 =</option>
								<option value="H" <%="H".equals(vo.getMailreceive()) ? "selected" : "" %>>자택</option>
								<option value="O" <%="O".equals(vo.getMailreceive()) ? "selected" : "" %>>사업장</option>
							</select>
						</td>
						<td class="cat" >연락상태</td>
						<td>
							<select name="contact_status">
								<option value="" <%="".equals(vo.getContact_status()) ? "selected" : "" %>>= 선택해주세요 =</option>
								<option value="D" <%="D".equals(vo.getContact_status()) ? "selected" : "" %>>사망</option>
								<option value="N" <%="N".equals(vo.getContact_status()) ? "selected" : "" %>>장기미활동</option>
								<option value="O" <%="O".equals(vo.getContact_status()) ? "selected" : "" %>>OK</option>
								<option value="R" <%="R".equals(vo.getContact_status()) ? "selected" : "" %>>반송</option>
								<option value="K" <%="K".equals(vo.getContact_status()) ? "selected" : "" %>>거절</option>
								<option value="H" <%="H".equals(vo.getContact_status()) ? "selected" : "" %>>자격정지</option>
								<option value="U" <%="U".equals(vo.getContact_status()) ? "selected" : "" %>>제명</option>
								<option value="L" <%="L".equals(vo.getContact_status()) ? "selected" : "" %>>탈퇴</option>
							</select>
							
						</td>
					</tr>
					<tr>
						<td class="cat" >비고</td>
						<td colspan="3">
							<input type="text" name="comment" value="<%=vo.getComment() %>" style="width:95%;"/>
						</td>
					</tr>
				</table>
			
			</form>
			</div>
			
			<div class="mt10">
				<span style="float:left">
				</span>
			
				<span style="float:left">
					<a href="javascript: f_golist()" class="btn grey f_right">취소</a>
					<%if(vo.isEmpty()){ %>
					<a href="javascript: f_insert()" class="btn grey f_right">등록</a>
					<%}else{ %>
					<a href="javascript: f_update()" class="btn grey f_right">수정</a>
					<%} %>
				</span>
				<br style="clear:both"/>
			</div>
			
			
			
			<div style="height:90px">
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