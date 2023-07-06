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
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		$("input[name='searchText']").on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				f_search();
			}
		});
		
		
		
	});

	
	//업로드
	function f_up(){
		
		if($("#uplaodfile").val()==""){
			alert("파일을 선택해주시기 바랍니다.");
			return;
		}
		var ext = $('#uplaodfile').val().split('.').pop().toLowerCase();
		if($.inArray(ext, ['xlsx', 'xls']) == -1) {
		    alert("엑셀만 업로드가 가능합니다.");
		    return;
		}
		
		var frm = document.forms.frmUpload;
		frm.submit();
	}
	
	
	function f_Download_SampleFile(){
		
		
		
	}
	
	function f_down(i_path, i_fName){
		var frm = document.forms.pare;
		
		frm.fileURL.value = i_path;
		frm.fileName.value = i_fName;
		
		frm.method = "post";
		frm.target = "hidFrame";
		frm.action = "/_mgr/jsp/download_common.jsp";
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

<form name="pare" method="post">
<input type="hidden" name="fileURL" value="" />
<input type="hidden" name="fileName" value="" />
</form>

<form name="frmExcel" id="frmExcel" method="post">
<input type="hidden" name="selAction" value=""/>
</form>
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
				<span class="f_left">시험성적서 업로드</span>
			</p>
			
			<div class="search_form" style="padding:10px">
				<div>
					<form name="frmUpload" id="frmUpload" method="post" action="/_mgr/jsp/certi/xlsUpload_trx.jsp" enctype="multipart/form-data">
					<input type="hidden" name="selAction" value=""/>
					<span style="padding-left:10px"><input type="file" name="uplaodfile" id="uplaodfile" value=""/></span>
					<span><a href="javascript: f_up()" class="btn grey">업로드</a>(파일을 선택하신 후 업로드 버튼을 눌러주세요)</span>
					
					
					<span style="padding-Right:10px; float: right;"><a href="javascript: f_down('/Files/', 'upload_sample.xls');" class="btn grey">SampleFile 다운로드</a></span>
					</form>
				</div>		
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