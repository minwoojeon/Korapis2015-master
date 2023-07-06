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
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		$(".searchinput").on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				f_search();
			}
		});
		
		
	});

	//페이징.
	function f_goPage(no){
		var frm = document.forms.frmList;
		frm.selAction.value = "searchpopup";
		frm.selPageNo.value = no;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminMember.do";
		frm.submit();
	}
	
	


	
	//상세화면 이동
	function f_setuser(i_uid, i_id, i_name){
		opener.f_setUser(i_uid, i_id, i_name);
		window.close();
	}
	
	
	//검색
	function f_search(){
		var frm = document.forms.frmList;
		
		frm.selAction.value = "searchpopup";
		frm.selPageNo.value = "1";
		
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

<!-- Global Wrapper.s -->
<div id="wrap">

<!-- Container.s -->
	<div id="container" style="width:100%">

<!-- Content.s -->
		<div id="content">
		
									
			<div class="search_form" style="width:500px">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="" />
				<input type="hidden" name="uid" value="" />
				
				<div>
					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">이름</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selName" value="<%=param.getString("selName") %>"/>
						</span>
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">아아디</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selId" value="<%=param.getString("selId") %>"/>
						</span>
						<span style="float:right">
							<a href="javascript: f_search()" class="btn grey">검색</a>
						</span>
					</div>
					<br style="clear:both;" />
				</div>
				
				</form>
			</div>			
<!-- 검색엔진 END -->		
			
			<div class="list_wrap" style="width:500px">
				<table class="list rowhover">
					<tr>
						<th style="width:120px">아이디</th>
						<th style="">이름</th>
						<th style="width:120px">지회</th>
						<th style="width:120px">지부</th>
					</tr>
						
					<%
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
						
						
					%>
					<tr>
						<td class="first ta_center"><%=dataList.getString("id") %></td>
						<td class="ta_center">
							<span style="text-decoration:underline" onclick="javascript: f_setuser('<%=dataList.getString("uid") %>', '<%=dataList.getString("id") %>', '<%=dataList.getString("name") %>')"><%=dataList.getString("name") %></span>
						</td>
						<td class="ta_center"><%=dataList.getString("branch1") %></td>
						<td class="last ta_center"><%=dataList.getString("branch2") %></td>
					</tr>					
					<%
					}
					%>
				</table>
				
				<div class="page">
					<%=pagesVo.getPageHtml() %>				
				</div>
			</div>
			
			
		</div>
<!-- Content.e -->
	
	</div>
<!-- Container.e -->

</div>
<!-- Global Wrapper.e -->
</body>
</html>