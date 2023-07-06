<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.korapis.vo.BbsFileVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.vo.BbsVo"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

String no = TextFormatter.convNvl(request.getParameter("no"), "");
String selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), "1");
String bflag = TextFormatter.convNvl(request.getParameter("bflag"), "01");
String selGubun = TextFormatter.convNvl(request.getParameter("selGubun"), "");
String selSearch = TextFormatter.convNvl(request.getParameter("selSearch"), "");


BbsDao dao = new BbsDao();
BbsVo vo = dao.getBbsDetail(no);

//페이지 접근 검증
if(userInfo == null || "".equals(userInfo.getId()) || ( !"".equals(no) && !vo.getUserID().equals(userInfo.getId()) ) ){
	response.sendRedirect("/jsp/sub6-3.jsp?bflag="+bflag+"&selPageNo="+selPageNo
			+"&selGubun="+URLEncoder.encode(selGubun,"UTF-8")
			+"&selSearch="+URLEncoder.encode(selSearch,"UTF-8"));
	out.clear();
}


String naviTitle = "";
String naviTitle2 = "";
if("04".equals(bflag)){
	naviTitle = "종봉분양";
	naviTitle2 = "종봉분양";
}else if("05".equals(bflag)){
	naviTitle = "자유게시판";
	naviTitle2 = "자유게시판";
}else if("06".equals(bflag)){
	naviTitle = "토론방";
	naviTitle2 = "토론방";
}
	


%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="imagetoolbar" content="no">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>사단법인 한국양봉협회</title>
<link rel="stylesheet" href="/css/default.css" >
<link href="/css/sub.css"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/css/style2.css">
<link rel="stylesheet" href="/css/style1.css">
<script src="/js/jquery-1.8.3.min.js" ></script>
<script>

function f_list(){
	var frm = document.forms.frmMenu;
	frm.target = "";
	frm.mehotd = "post";
	frm.action = "/jsp/sub6-3.jsp";
	frm.submit();
	
}

</script>
</head>
<body>
<form name="frmMenu" method="post" target="">
<input type="hidden" name="selPageNo" value="<%=selPageNo %>"/>
<input type="hidden" name="bflag" value="<%=bflag %>"/>
<input type="hidden" name="selGubun" value="<%=selGubun %>"/>
<input type="hidden" name="selSearch" value="<%=selSearch %>"/>
</form>
<div id="skipToContent" title="스킵네비게이션">
		<a href="#main_menu">메뉴 바로가기</a>
		<a href="#search">프로그램 검색 바로가기</a>
		<a href="#footer">카피라이터 바로가기</a>
</div>

<!-- sub_wrap_main START -->
<div id="sub_wrap_main">
    
<jsp:include page="inc/header.jsp" />
    
<!-- sub_wrap START -->
    <div id="sub_wrap">
        
        <jsp:include page="inc/leftmenu.jsp" />
        
        <!-- sub_contents START -->
        <div id="sub_contents">
            
            
            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title"><%=naviTitle2 %></h2>
                    <div class="location">홈  &gt; 홍보센터 &gt; <span><%=naviTitle %></span></div>
                </div>
                <div class="sub_body_box" style="padding-left:20px" >

					
					<article id="bo_v" style="width:100%">
					
						<form name="frmRegist" method="post" enctype="multipart/form-data">
							<div class="tbl_frm01 tbl_wrap">
								<input type="hidden" name="selAction" value="" />
								<input type="hidden" name="bflag" value="<%=bflag %>" />
								<input type="hidden" name="bbs_idx" value="<%=no %>" />
								<input type="hidden" name="bbs_thread" value="<%=vo.getBbsThread() %>" />
								<input type="hidden" name="bbs_fid" value="<%=vo.getBbsFID() %>" />
								<input type="hidden" name="bbs_banner_yn" value="<%=vo.isBanner()?"Y":"" %>" />
								<table>
									<tr>
										<th>제목</th>
										<td colspan="3"><input type="text" name="bbs_title" value="<%=vo.getBbsTitle() %>" style="width:80%;" /></td>
									</tr>
									<tr>
										<th>작성자</th>
										<td>
											<input type="hidden" name="user_id" value="<%=vo.isEmpty()?userInfo.getId():vo.getUserID() %>" />
											<input type="hidden" name="user_name" value="<%=vo.isEmpty()?userInfo.getName():vo.getUserName() %>" />
											<%=vo.isEmpty()?userInfo.getName():vo.getUserName() %>
										</td>
										<th>옵션</th>
										<td>
											<input type="checkbox" name="bbs_secret_yn" value="Y"  <%=vo.isSecret()?"checked":"" %>/> 비밀글
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea name="bbs_content" id="bbs_content" style="width:95%;height:400px;"><%=vo.getBbsContent() %></textarea>
										</td>
									</tr>
									<%
										if(vo.getBbsIdx().equals("")){
									%>
									<tr class="file_input">
										<th><label for="bbs_file0">첨부파일 #1</label></th>
										<td colspan="3">
											<input type="file" name="bbs_file0" />
											<button onclick="f_addFile()" class="f_right" type="button">+파일추가</button>
										</td>
									</tr>
									<%
									}else{ 
										ArrayList<BbsFileVo> files = vo.getFiles();
										int i = 0;
										while(i != files.size()){
											BbsFileVo file = files.get(i);
									%>
									<tr class="file_input">
										<th><label for="attached">첨부파일 #<%=i+1 %></label></th>
										<td colspan="3">
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
										<th><label for="bbs_file0">첨부파일 #1</label></th>
										<td colspan="3">
											<input type="file" name="bbs_file0" />
											<button onclick="f_addFile()" class="f_right" type="button">+파일추가</button>
										</td>
									</tr>
									<%
										}
									} 
									%>
								</table>
							</div>
						</form>
					
					    <div id="bo_v_bot">
					        <ul class="bo_v_com">
					          <li><a href="javascript: f_regist()" class="btn_b01">등록</a></li>
					          <li><a href="javascript: f_delete();" class="btn_b01">삭제</a></li>
					          <li><a href="javascript: f_list()" class="btn_b01">목록</a></li>
							</ul>
						</div>
					</article>
					     

                </div>
            </div>
            
			<jsp:include page="inc/partner.jsp" />
			
        </div>
        <!--// sub_contents END -->
	</div>
    <!--// sub_wrap END -->
</div>
<!--// sub_wrap_main END -->

<jsp:include page="inc/footer.jsp" />


<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->
<script type="text/javascript">

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
	
	frm.target="hidFrame";
	frm.action="/jsp/sub6-3_02_trx.jsp";
	frm.method="post";
	frm.enctype="multipart/form-data";
	
	document.body.appendChild(iframe);
	frm.submit();
	
}

function f_delete(){
	if(!confirm("정말 삭제하시겠습니까?"))
		return;
	
	var iframe = document.getElementById("hidFrame") || document.createElement("iframe");
	iframe.id = iframe.name = "hidFrame";
	iframe.src = "";
	iframe.style.display="none";
	
	var frm = document.forms.frmRegist;

	frm.target="hidFrame";
	frm.action="/jsp/sub6-3_03_trx.jsp";
	frm.method="post";
	frm.enctype="";
	
	document.body.appendChild(iframe);
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
	var newtr = $("<tr class='file_input'><th><label for='bbs_file"+idx+"'>첨부파일 #"+(idx+1)+"</label></th><td colspan='3'><input type='file' name='bbs_file"+idx+"' /></td></tr>");
	tr.eq(-1).after(newtr);
	newtr.find("td").append(btn);
}

function f_delFile(i){
	var btn = $("tr.file_input").find("button");
	if(confirm("첨부파일을 삭제하시겠습니까?")){
		if($("tr.file_input").length==1){
			var newtr = $("<tr class='file_input'><th><label for='bbs_file0'>첨부파일 #1</label></th><td colspan='3'><input type='file' name='bbs_file0' /></td></tr>");
			$("tr.file_input").after(newtr);
		}
		$("tr.file_input").eq(i).remove();
		$("tr.file_input").eq(-1).find("td").append(btn);
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
</script>
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
