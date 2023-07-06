<%@page import="kr.or.korapis.vo.PayVo"%>
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


PayVo vo = (PayVo)request.getAttribute("vo");


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
	$("#paydate").datepicker({changeYear:true});
	$("#paydate").datepicker("option", "dateFormat", "yymmdd");
	$("#paydate").datepicker("option", "yearRange", "-10:+0");
	$("#paydate").datepicker("setDate", "<%=param.getString("paydate") %>");
});



//수정
function f_update(){
	var frm = document.forms.frmRegist;
	frm.method="post";
	frm.target="";
	frm.selAction.value = "update";
	frm.action = "/adminPay.do";
	frm.submit();
}


//사용자 찾기
function f_searchuser(){
	var top = screen.availHeight/2 - 100;
	var left = screen.availWidth/2 - 180;
	
	var p1 = window.open("/adminMember.do?selAction=searchpopup","pop_searchmember","top="+top+",left="+left+",status=no,width=600,height=400");
	p1.focus();
}


//사용자 선택.
function f_setUser(user_uid, user_id, user_name){
	$("#area_member_id").html(user_id);
	$("#area_member_name").html(user_name);
	
	$("#member_uid").val(user_id);
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
	<div id="container">

<!-- Content.s -->
		<div id="content">
		
			<p class="cont_header bold">
				<span class="f_left">회비납부 등록</span>
			</p>
			

			
			<form name="frmRegist" method="post">
			<input type="hidden" name="selAction" value=""/>
			
			<div class="form_wrap" style="">


				<p class="form_title">회비납부 정보</p>
				<table class="form" style="">
					<tr>
						<td class="cat" style="width:13%">NO</td>
						<td style="width:37%">
							<%=vo.getUid() %>
							<input type="hidden" name="uid" value="<%=vo.getUid() %>"/>
							<%if(vo.isEmpty()){ %>(자동으로 부여됩니다)<%} %>
						</td>
						<td class="cat" style="width:13%">아이디</td>
						<td>
							<span id="area_member_id"><%=vo.getMember_id() %></span>
							<input type="hidden" name="member_uid" id="member_uid" value="<%=vo.getMember_uid() %>"/>
						</td>
					</tr>
					<tr>
						<td class="cat" style="width:13%">이름</td>
						<td style="width:37%">
							<span id="area_member_name" style="padding-right:10px"><%=vo.getMember_name() %></span>
							<%if(vo.isEmpty()){ %>
							<a href="javascript: f_searchuser()" class="btn grey">사용자찾기</a>							
							<%} %>
						</td>
						<td class="cat" style="width:13%">회비구분</td>
						<td>
							<select name="gubun">
								<option value="2015" <%="2015".equals(vo.getGubun()) ? "selected" : "" %>>2015</option>
								<option value="2014" <%="2014".equals(vo.getGubun()) ? "selected" : "" %>>2014</option>
								<option value="2013" <%="2013".equals(vo.getGubun()) ? "selected" : "" %>>2013</option>
								<option value="2012" <%="2012".equals(vo.getGubun()) ? "selected" : "" %>>2012</option>
								<option value="2011" <%="2011".equals(vo.getGubun()) ? "selected" : "" %>>2011</option>
								<option value="2010" <%="2010".equals(vo.getGubun()) ? "selected" : "" %>>2010</option>
								<option value="2009" <%="2009".equals(vo.getGubun()) ? "selected" : "" %>>2009</option>
								<option value="가입비" <%="가입비".equals(vo.getGubun()) ? "selected" : "" %>>가입비</option>
							</select>
							
						</td>
					</tr>
					<tr>
						<td class="cat" >금액</td>
						<td>
							<input type="text" name="price" value="<%=vo.getPrice() %>"/>
						</td>
						<td class="cat" >납부일자</td>
						<td>
							<input type="text" style="width:60px;" name="paydate" id="paydate" value="<%=param.getString("paydate") %>"  maxlength="8"/>
						</td>
					</tr>
					<tr>
						<td class="cat" >납부</td>
						<td colspan="3">
							<select name="pay">
								<option value="N" <%="N".equals(vo.getPay()) ? "selected" : "" %>>N</option>
								<option value="Y" <%="Y".equals(vo.getPay()) ? "selected" : "" %>>Y</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			</form>
			
			
			<div class="mt10">
				<span style="float:left">
				</span>
			
				<span style="float:right">
					<a href="javascript: history.back(-1)" class="btn grey f_right">취소</a>
					<a href="javascript: f_update()" class="btn grey f_right">등록</a>
				</span>
				<br style="clear:both"/>
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