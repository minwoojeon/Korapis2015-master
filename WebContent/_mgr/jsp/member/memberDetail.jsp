<%@page import="kr.or.korapis.util.FunctionDao"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
MiceParam param = (MiceParam)request.getAttribute("param");
FunctionDao fDao = new FunctionDao();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">



function f_save(){
	if(confirm("회원정보를 수정하시겠습니까?")){
		var frm = document.forms.frmRegist;
		frm.method="post";
		frm.target="";
		frm.selAction.value = "modify";
		frm.action = "/memberList.do";
		
		frm.submit();
	}
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
				<span class="f_left">
				초록 상세정보</span>
			</p>
			

			
				
			<div class="form_wrap" style="margin:10px 0;">
				<div style="text-align:left; padding:10px 0px"><a href="javascript: f_downPDF()" class="btn grey">Abstract Print</a></div>

			
				<p class="form_title">기본정보</p>
				<table class="form">
					<tr>
						<td class="cat" >관리번호</td>
						<td>...</td>
						<td class="cat" >등록자</td>
						<td>...</td>
					</tr>
					<tr>
						<td class="cat" >등록일시</td>
						<td>...</td>
						<td class="cat" >수정일시</td>
						<td>...</td>
					</tr>
				</table><br/><Br/>
				
				<p class="form_title">Abstract Info</p>
				<table class="form">
					<tr>
						<td class="cat" >Presentation Method</td>
						<td>...</td>
					</tr>
					<tr>
						<td class="cat" >Category Code</td>
						<td>...</td>
					</tr>
					<tr>
						<td class="cat" rowspan="2">Copyright Transfer</td>
						<td>...</td>
					</tr>
								
				</table>
			</div>

			
			<div class="mt10">
				<span style="float:left">
				</span>
			
				<span style="float:right">
					<a href="javascript: f_save()" class="btn grey f_right">Save</a>
					<a href="javascript: history.back(-1)" class="btn grey f_right">Back</a>
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