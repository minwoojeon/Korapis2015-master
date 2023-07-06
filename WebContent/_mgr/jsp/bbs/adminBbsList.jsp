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

ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");

request.getAttribute("moveIdx");

String bflag = param.getString("bflag");
String bbsName = "";
if("01".equals(bflag))
	bbsName = "공지사항";
else if("02".equals(bflag))
	bbsName = "홍보동영상";
else if("04".equals(bflag))
	bbsName = "종봉분양";
else if("05".equals(bflag))
	bbsName = "자유게시판";
else if("06".equals(bflag))
	bbsName = "Q&amp;A";
else if("08".equals(bflag))
	bbsName = "양봉협회보";
else if("10".equals(bflag))
	bbsName = "협회소식";

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

function f_goPage(i_pageNo){
	var frm = document.forms.frmList;
	
	frm.method="post";
	frm.selPageNo.value = i_pageNo;
	frm.action="/adminBbs.do";
	frm.submit();
}

function f_regist(i_bbsIdx){
	var frm = document.forms.frmMenu;
	frm.bbs_idx.value = i_bbsIdx || '';
	
	frm.selAction.value="MA";
	frm.method="post";
	frm.action = "/adminBbs.do";
	
	frm.submit();
}

function f_reply(i_bbsIdx){
	if( !i_bbsIdx ){
		alert("잘못된 답변 페이지 접근입니다.");
		return;
	}
	var frm = document.forms.frmMenu;
	frm.bbs_idx.value = i_bbsIdx || '';
	
	frm.selAction.value="MA_R";
	frm.method="post";
	frm.action = "/adminBbs.do";
	
	frm.submit();
}

function f_delete(i_bbsIdx){
	if(!confirm("정말 삭제하시겠습니까?")){
		return;
	}
	
	var frm = document.forms.frmMenu;
	frm.bbs_idx.value = i_bbsIdx || '';
	
	frm.selAction.value="DEL";
	frm.method="post";
	frm.action = "/adminBbs.do";
	
	frm.submit();
}

function f_search(){
	var frm = document.forms.frmList;

	frm.method="post";
	frm.action="/adminBbs.do";
	frm.submit();
}
	
	$(function(){
		var frm = document.forms.frmList;
		$(frm).find("input[type='text']").on("keydown",function(e){
			if(e.which == 13)
				f_search();
		});
	});
	
	
	
function f_move(i_bbsIdx){
	
	var alertMsg;
	
	<%if("05".equals(request.getParameter("bflag"))){%>
		alertMsg = "종봉분양 게시판으로 이동하시겠습니까?"
	<%} else if("04".equals(request.getParameter("bflag"))){ %>
		alertMsg = "자유게시판으로 이동하시겠습니까?"
	<%}%>
	
	if(!confirm(alertMsg)){
		return;
	}

	
	var frm = document.forms.frmMenu;
	frm.bbs_idx.value = i_bbsIdx;
	
	frm.selAction.value="MOVE";
	frm.method="post";
	frm.action = "/adminBbs.do";
	
	frm.submit();
}


</script>


</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value="" />
<input type="hidden" name="bflag" value="<%=param.getString("bflag") %>" />
<input type="hidden" name="bbs_idx" value="" />
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
		<div id="content" style="min-width:1050px">
		
			<p class="cont_header bold">
				<span class="f_left"><%=bbsName %> 목록</span>
				<span class="f_right">총 <%=param.get("tot") %></span>
			</p>
			
			

<!-- 검색엔진 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->			
						
									
			<div class="search_form">
				<form name="frmList" method="post" target="" action="">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="" />
				<input type="hidden" name="bflag" value="<%=param.getString("bflag") %>" />
				
				<div>
				
					<div class="search_input">
						<div class="search_item">
							<select name="searchGubun">
								<%String searchGubun = param.getString("searchGubun"); %>
								<option value="title" <%="title".equals(searchGubun)?"selected":"" %>>제목</option>
								<option value="content" <%="content".equals(searchGubun)?"selected":"" %>>내용</option>
								<option value="title|content" <%="title|content".equals(searchGubun)?"selected":"" %>>제목+내용</option>
								<option value="writer" <%="writer".equals(searchGubun)?"selected":"" %>>작성자</option>
								<option value="title|content|writer" <%="title|content|writer".equals(searchGubun)?"selected":"" %>>제목+내용+작성자</option>
							</select>
							<input type="text" name="searchText" value="<%=param.getString("searchText") %>" style="width:200px;" />&nbsp;
							<a href="javascript: f_search()" class="btn grey">검색</a>
						</div>
					</div>
					
					
					<div class="f_right">
						<span style="padding-left:10px">
							<a href="javascript: f_regist()" class="btn grey">등록</a>
						</span>
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
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>조회</th>
						<th>기능</th>
					</tr>
						
					<%
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
					%>
					<tr>
						<td class="first ta_center"><%=no-- %></td>
						<td>
							<a href="javascript:f_regist('<%=dataList.getString("bbs_idx") %>');">
							<%
							String thread = dataList.getString("bbs_thread");
							for(int i=1; i<thread.length(); i++){
								out.println("&nbsp; ");
								if(i == thread.length() - 1) out.println("┗");
							}
							%>
							<%=dataList.getString("bbs_title") %>
               				<%="Y".equals(dataList.getString("bbs_secret_yn")) ? " <img src=\"/images/ico/icon_secret.jpg\" />" : "" %>
							</a>
						</td>
						<td class="ta_center"><%=dataList.getString("user_name") %></td>
						<td class="ta_center"><%=DateC.chgMysqlDate(dataList.getString("cdate")) %></td>
						<td class="ta_center"><%=dataList.getInt("bbs_hit") %></td>
						<td class="last ta_center">
							<a href="javascript:f_regist('<%=dataList.getString("bbs_idx") %>')" class="btn grey">수정</a>
							<% if("06".equals(bflag)){ %>
							<a href="javascript:f_reply('<%=dataList.getString("bbs_idx") %>');" class="btn grey">답변</a>
							<%} %>
							<a href="javascript:f_delete('<%=dataList.getString("bbs_idx")%>')" class="btn grey">삭제</a>
							
							<%if("_04_05_".contains("_"+request.getParameter("bflag")+"_")){%>
								<a href="javascript:f_move('<%=dataList.getString("bbs_idx")%>')" class="btn grey">이동</a>
							<%}%>
							
							
						</td>
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