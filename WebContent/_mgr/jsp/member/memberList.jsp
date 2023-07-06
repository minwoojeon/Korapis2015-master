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

ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");
SelectBoxDao boxDao = new SelectBoxDao();


UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		$("input[name='searchText']").on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				f_search();
			}
		});
	});

	//페이징.
	function f_goPage(no){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		frm.selPageNo.value = no;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/memberList.do";
		frm.submit();
	}
	
	


	//검색조건 초기화
	function f_reset(){
		$("#selUserlevel").val("");
		$("#selPageNo").val("1");
		f_search();
	}
	
	
	
	
	
	
	//상세화면 이동
	function f_goDetail(i_uid){
		alert("준비중입니다.");
		return false;
		
		
		var frm = document.forms.frmList;
		frm.selAction.value = "detail";
		frm.uid.value = i_uid;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/memberList.do";
		frm.submit();
	}
	
	
	
	
	//검색
	function f_search(){
		var frm = document.forms.frmList;
		
		frm.selAction.value = "V";
		frm.selPageNo.value = "1";
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/memberList.do";
		frm.submit();	
	}
	
	//엑셀다운로드
	function f_downExcel(){
		alert("준비중입니다. ");
		return false;
		
		var frm = document.forms.frmList;
		
		frm.selAction.value = "XLS";
		frm.target = "hidFrame";
		frm.method="post";
		frm.action = "/memberList.do";
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
				<span class="f_left">회원 목록</span>
				<span class="f_right">총 <%=param.get("tot") %></span>
			</p>
			
			

<!-- 검색엔진 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->			
						
									
			<div class="search_form">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="" />
				<input type="hidden" name="uid" value="" />
				
				<div>
		
					<div class="search_input f_left">
						<select name="selUserlevel" id="selUserlevel" style="width:150px" onchange="f_search()">
							<option value="">== 가입여부 ==</option>
							<option value="Y" <%="Y".equals(param.getString("selUserlevel")) ? "selected" : "" %>>O</option>
							<option value="N" <%="N".equals(param.getString("selUserlevel")) ? "selected" : "" %>>X</option>
						</select>&nbsp;	
						
						
						
						&nbsp;&nbsp;<a href="javascript: f_reset()">[검색조건 초기화]</a>
					
					</div>
					
					<div class="f_right">
						<select name="searchGubun">
							<option value="username" <%="username".equals(param.getString("searchGubun")) ? "selected" : "" %>>회원명</option>
							<option value="useremail" <%="username".equals(param.getString("searchGubun")) ? "selected" : "" %>>회원이메일</option>
							<option value="userid" <%="userid".equals(param.getString("searchGubun")) ? "selected" : "" %>>아이디</option>
						</select>
						<input type="text" name="searchText" id="searchText" value="<%=param.get("searchText") %>" />
						<a href="javascript: f_search()" class="btn grey">검색</a>
						
						<a href="javascript: f_downExcel()" class="btn grey">엑셀다운로드</a>
						
					</div>
					
					<br style="clear:both;" />
				</div>
				
				</form>
			</div>			
<!-- 검색엔진 END -->		
			
			<div class="list_wrap">
				<table class="list rowhover">
					<tr>
						<th>#</th>
						<th>관리번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>가입여부</th>
						<th>가입일자</th>
						<th>탈퇴일자</th>
					</tr>
						
					<%
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
					%>
					<tr>
						<td class="first ta_center"><%=no-- %></td>
						<td class="ta_center"><%=dataList.getString("uid") %></td>
						<td class="ta_center"><%=dataList.getString("id") %></td>
						<td class="ta_center">
							<span  onclick="javascript: f_goDetail('<%=dataList.getString("uid") %>');"><u><%=dataList.getString("name") %></u></span>
						</td>
						<td class="ta_center"><%=dataList.getString("email") %></td>
						<td class="ta_center"><%=dataList.getString("userlevel") %></td>
						<td class="ta_center"><%=dataList.getString("registdate") %></td>
						<td class="last ta_center"><%=dataList.getString("outdate", "-") %></td>
					</tr>					
					<%
					}
					%>
				</table>
				
				<div class="page">
					<%=pagesVo.getPageHtml() %>				
				</div>
			
			</div>
			
			<div class="mt10">
				&nbsp;
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