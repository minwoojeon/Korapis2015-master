<%@page import="java.util.Date"%>
<%@page import="kr.or.korapis.vo.BbsFileVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="java.util.Calendar"%>
<%@page import="kr.or.korapis.vo.BbsVo"%>
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
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

BbsVo bbsVo = (BbsVo)request.getAttribute("bbsVo");

SelectBoxDao boxDao = new SelectBoxDao();
DateC datec = new DateC();

String bflag = param.getString("bflag");
String bbsFid = param.getString("bbs_fid");
boolean isReply = !"".equals(bbsFid);
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
$(function(){
	$(".datetimepicker").datetimepicker({
		dateFormat:"yy-mm-dd",
		timeFormat:"HH:mm:ss"
	});
});

function f_regist(){
	var iframe = document.getElementById("hidFrame") || document.createElement("iframe");
	iframe.id = iframe.name = "hidFrame";
	iframe.src = "";
	iframe.style.display="none";
	
	var frm = document.forms.frmRegist;

	if( typeof oEditors != "undefined" )
		oEditors.getById['bbs_content'].exec("UPDATE_CONTENTS_FIELD", []);
	if(frm.bbs_title.value.length == 0){
		alert("제목을 입력하십시오.");
		return;
	}
	if(frm.bbs_content.value.length == 0){
		alert("내용을 입력하십시오.");
		return;
	}
	
	if(frm.bbs_link_type && frm.bbs_link_type.value && frm.bbs_link_type.value == 'video'){
		frm.bbs_link.value = youtube_parser(frm.bbs_link.value);
	}
	
	frm.target="hidFrame";
	frm.action="/_mgr/jsp/bbs/adminBbsRegist_trx.jsp";
	frm.method="post";
	frm.enctype="multipart/form-data";
	
	document.body.appendChild(iframe);
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

function f_goList(){
	var frm = document.forms.frmMenu;
	frm.selAction.value = "V";
	frm.submit();
}

function f_addFile(){
	var tr = $("tr.file_input");
	var idx = tr.length;
	if(idx >= 5){
		alert("첨부파일은 5개까지 올릴 수 있습니다");
		return;
	}
	var btn = tr.find("button");
	var newtr = $("<tr class='file_input'><td class='cat'><label for='bbs_file"+idx+"'>첨부파일 #"+(idx+1)+"</label></td><td class='inp' colspan='3'><input type='file' name='bbs_file"+idx+"' /></td></tr>");
	tr.eq(-1).after(newtr);
	newtr.find("td.inp").append(btn);
}

function f_delFile(i){
	var btn = $("tr.file_input").find("button");
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		if($("tr.file_input").length==1){
			var newtr = $("<tr class='file_input'><td class='cat'><label for='bbs_file0'>첨부파일 #1</label></td><td class='inp' colspan='3'><input type='file' name='bbs_file0' /></td></tr>");
			$("tr.file_input").after(newtr);
		}
		$("tr.file_input").eq(i).remove();
		$("tr.file_input").eq(-1).find("td.inp").append(btn);
	}
}

function f_fileDownload(i){
	var iframe = document.getElementById("iframe_fileDownload")?document.getElementById("iframe_fileDownload"):document.createElement("iframe");
	iframe.style.display = "none";
	iframe.name = "_fileDownload";
	iframe.id = "iframe_fileDownload";
	document.body.appendChild(iframe);
	
	var form = document.createElement("form");
	var attach_idx = document.createElement("input");
	attach_idx.type = "hidden";
	attach_idx.name = "file_idx";
	attach_idx.value = i;
	form.appendChild(attach_idx);
	
	form.method = "post";
	form.action = "/jsp/common/download_bbs.jsp";
	form.target = "_fileDownload";
	
	document.body.appendChild(form);
	form.submit();
	document.body.removeChild(form);
}

function youtube_parser(str){
	var regExp =  /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
	var match = str.match(regExp);
	return (match&&match[2].length==11)?match[2]:str;
}
</script>


</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="bflag" value="<%=param.getString("bflag") %>" />
<input type="hidden" name="bbs_idx" value="" />
</form>
<!-- 공통폼 E. -->
<iframe id="hidFrame" name="hidFrame" style="display:none"></iframe>

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
				<span class="f_left"><%=bbsName %> 등록/수정</span>
				<span class="f_right">&nbsp;</span>
			</p>
			
			<div class="mb10">
				<span style="float:left">
				</span>
			
				<span style="float:right">
					<a href="javascript: history.go(-1)" class="btn grey f_right">취소</a>
					<%if(bbsVo.isEmpty() || isReply){ %>
					<a href="javascript: f_regist()" class="btn grey f_right">등록</a>
					<%}else{ %>
					<a href="javascript: f_regist()" class="btn grey f_right">수정</a>
					<a href="javascript: f_reply('<%=bbsVo.getBbsIdx() %>')" class="btn grey f_right">답변</a>
					<%} %>
				</span>
				<br style="clear:both"/>
			</div>
			
			<form name="frmRegist" method="post" enctype="multipart/form-data" target="" action="">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="bflag" value="<%=param.getString("bflag") %>" />
				<%if(!isReply){ %>
				<input type="hidden" name="bbs_idx" value="<%=param.getString("bbs_idx")%>" />
				<input type="hidden" name="bbs_thread" value="<%=bbsVo.getBbsThread() %>" />
				<%}else{ %>
				<input type="hidden" name="bbs_idx" value="" />
				<input type="hidden" name="bbs_thread" value="<%=bbsVo.getBbsThread() %>" />
				<%} %>
				<input type="hidden" name="bbs_fid" value="<%=bbsVo.getBbsFID() %>" />
				<input type="hidden" name="bbs_banner_yn" value="<%=bbsVo.isBanner()?"Y":"" %>" />
				<table class="form">
					<tr>
						<td class="cat">제목</td>
						<td class="inp" colspan="3"><input type="text" name="bbs_title" value="<%=bbsVo.getBbsTitle() %>" style="width:80%;" />
					</tr>
					<tr>
						<td class="cat" style="width:15%;">작성자</td>
						<td class="inp" style="width:35%;">
							<input type="hidden" name="user_id" value="<%=bbsVo.isEmpty() || isReply?userInfo.getId():bbsVo.getUserID() %>" />
							<input type="hidden" name="user_pwd" value="<%=bbsVo.isEmpty() || isReply?userInfo.getPasswd():bbsVo.getUserPwd() %>" />
							<input type="hidden" name="user_name" value="<%=bbsVo.isEmpty() || isReply?userInfo.getName():bbsVo.getUserName() %>">
							<%=bbsVo.isEmpty() || isReply?userInfo.getName():bbsVo.getUserName() %>
						</td>
						<td class="cat" style="width:15%;">작성일</td>
						<td class="inp" style="width:35%;">
							<input type="text" class="datetimepicker" name="cdate" value="<%=bbsVo.isEmpty() || isReply?datec.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"):DateC.chgMysqlDate(bbsVo.getCdate(), "yyyy-MM-dd HH:mm:ss") %>" style="width:200px;" />
						</td>
					</tr>
					<tr>
						<td class="cat">옵션</td>
						<td class="inp" colspan="3">
							<input type="checkbox" name="bbs_notice_yn" value="Y" <%=bbsVo.isNotice()?"checked":"" %> /> 공지사항 &nbsp; &nbsp;
							<input type="checkbox" name="bbs_secret_yn" value="Y" <%=bbsVo.isSecret()?"checked":"" %> /> 비밀글 &nbsp; &nbsp;
						</td>
					</tr>
					<% if("02".equals(param.getString("bflag"))){ %>
					<tr>
						<td class="cat">동영상 링크</td>
						<td class="inp" colspan="3">
							<input type="hidden" name="bbs_link_type" value="video" />
							<input type="text" name="bbs_link" value="<%=bbsVo.getBbsLink() %>" style="width:300px;" /> * YouTube 주소를 넣으면 동영상 ID로 자동 변환됩니다.
						</td>
					</tr>
					<% }else if("08".equals(param.getString("bflag"))){ %>
					<tr>
						<td class="cat">양봉협회보 업로드</td>
						<td class="inp" colspan="3">
							<input type="hidden" name="bbs_link_type" value="paper" />
							<select name="bbs_pyear">
								<%=boxDao.getNumberOptionHtml(Calendar.getInstance().get(Calendar.YEAR)+2, 1970, 1, TextFormatter.convNvl(bbsVo.getBbsPyear(),Calendar.getInstance().get(Calendar.YEAR)) ) %>
							</select>
							<span id="paper"><%=bbsVo.getBbsLink() %></span>
							<input type="file" name="bbs_link_file" />
						</td>
					</tr>
					<% } %>
					<tr>
						<td class="inp" colspan="4">
							<textarea name="bbs_content" id="bbs_content" style="width:95%;height:400px;">
							<%if(isReply){ %>&gt;&gt;<%} %><%=bbsVo.getBbsContent() %>
							</textarea>
						</td>
					</tr>
					<%
						if(bbsVo.getBbsIdx().equals("") || isReply){
					%>
					<tr class="file_input">
						<td class="cat"><label for="bbs_file0">첨부파일 #1</label></td>
						<td class="inp" colspan="3">
							<input type="file" name="bbs_file0" />
							<button onclick="f_addFile()" class="f_right" type="button">+파일추가</button>
						</td>
					</tr>
					<%
					}else{ 
						ArrayList<BbsFileVo> files = bbsVo.getFiles();
						int i = 0;
						while(i != files.size()){
							BbsFileVo file = files.get(i);
					%>
					<tr class="file_input">
						<td class="cat"><label for="attached">첨부파일 #<%=i+1 %></label></td>
						<td class="inp" colspan="3">
							<span>
								<input type="hidden" name="attached" value="<%=file.getFileIdx() %>" />
								<a href="javascript:f_fileDownload('<%=file.getFileIdx() %>')" title="첨부파일 다운로드"><strong><%=file.getFileName() %></strong></a>
								<a href="javascript:f_delFile(<%=i++ %>);" title="첨부파일 삭제" class="btn grey">삭제</a>
							</span>	
							<%
							if(i == files.size()){
							%>
							<button onclick="f_addFile()" class="f_right" type="button">+파일추가</button>
							<%
							}
							%>
						</td>
					</tr>
					<%
						}
						if(files==null || files.size() == 0){
					%>
					<tr class="file_input">
						<td class="cat"><label for="bbs_file0">첨부파일 #1</label></td>
						<td class="inp" colspan="3">
							<input type="file" name="bbs_file0" />
							<button onclick="f_addFile()" class="f_right" type="button">+파일추가</button>
						</td>
					</tr>
					<%
						}
					} 
					%>
				</table>
			</form>

			<div class="mt10">
				<span style="float:left">
				</span>
			
				<span style="float:right">
					<a href="javascript: history.go(-1)" class="btn grey f_right">취소</a>
					<%if(bbsVo.isEmpty() || isReply){ %>
					<a href="javascript: f_regist()" class="btn grey f_right">등록</a>
					<%}else{ %>
					<a href="javascript: f_regist()" class="btn grey f_right">수정</a>
					<a href="javascript: f_reply('<%=bbsVo.getBbsIdx() %>')" class="btn grey f_right">답변</a>
					<%} %>
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
<script type="text/javascript" src="/_mgr/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({

	oAppRef : oEditors,
		elPlaceHolder : "bbs_content",
		sSkinURI : "/_mgr/se2/SmartEditor2Skin.html",
		fCreator : "createSEditor2",
		htParams : {
			fOnBeforeUnload : function() {
			}
		}

	});
</script>
</body>
</html>