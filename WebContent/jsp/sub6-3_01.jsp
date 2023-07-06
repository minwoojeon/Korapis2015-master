<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.or.korapis.vo.BbsFileVo"%>
<%@page import="java.util.ArrayList"%>
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

//조회수 올리기 Start
JSONObject bbsHitMap = (JSONObject) session.getAttribute("bbsHitMap"); 
if(bbsHitMap == null){
	bbsHitMap = new JSONObject();
}
if(!bbsHitMap.optBoolean(no, false)){
	dao.bbsHit(no);
	bbsHitMap.put(no, true);
	session.setAttribute("bbsHitMap", bbsHitMap);
}
//조회수 올리기 End

BbsVo vo = dao.getBbsDetail(no);


DecimalFormat df = new DecimalFormat("#,##0.0");

String naviTitle = "";
String naviTitle2 = "";
if("01".equals(bflag)){
	naviTitle = "공지사항/공고";
	naviTitle2 = "공지사항<span>/</span>공고";
}else if("04".equals(bflag)){
	naviTitle = "종봉분양";
	naviTitle2 = "종봉분양";
	
	
}else if("05".equals(bflag)){
	naviTitle = "자유게시판";
	naviTitle2 = "자유게시판";
}else if("03".equals(bflag)){
	naviTitle = "양봉뉴스";
	naviTitle2 = "양봉뉴스";
}else if("06".equals(bflag)){
	naviTitle = "Q&A";
	naviTitle2 = "Q&A";
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

function f_modify(){
	var frm = document.forms.frmMenu;
	frm.target = "";
	frm.mehotd = "post";
	frm.action = "/jsp/sub6-3_02.jsp";
	frm.submit();
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
</head>
<body>
<form name="frmMenu" method="post" target="">
<input type="hidden" name="no" value="<%=no %>" />
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
                    <h2 class="page_title"><%=naviTitle %></h2>
                    <div class="location">홈 &gt; 홍보센터 &gt; <span><%=naviTitle %></span></div>
                </div>
                <div class="sub_body_box p20">

					
					<article id="bo_v" style="width:100%">
					    <header>
					        <h1 id="bo_v_title"><%=vo.getBbsTitle() %></h1>
					    </header>
					
					    <section id="bo_v_info">
							<h2>페이지 정보</h2>
							작성자 <strong><span class="sv_member"><%=vo.getUserName() %></span></strong>
							<span class="sound_only">작성일</span><strong><%=vo.getCdate().substring(0, Math.min(vo.getCdate().length(), 10)) %></strong>
							조회<strong><%=vo.getBbsHit() %>회</strong>
					    </section>
					    
					    <%
					    ArrayList<BbsFileVo> files = vo.getFiles();
					    int size = files.size();
					    if(size > 0){
					    %>
					    <section id="bo_v_file">
					    	<h2>첨부파일</h2>
					    	<ul>
							<%
							for(int i=0; i<size; i++){
								BbsFileVo file = files.get(i);
								int fileSize = file.getFileSize();
							%>
								<li>
									<a href="javascript:f_fileDownload('<%=file.getFileIdx() %>')" class="view_file_download" style="width:auto;">
										<img src="/images/icon_file.gif" alt="첨부" title />
										<strong><%=file.getFileName() %></strong> (<%=fileSize>1000000?(df.format(fileSize/1000000)+"M"):fileSize>1000?(df.format(fileSize/1000)+"K"):(fileSize+"Byte") %>)
									</a>
									<span class="bo_v_file_cn"><%=file.getFileHit() %>회 다운로드, </span>
									<span>Date : <%=file.getCdate() %></span>
								</li>
							<%
							}
							%>
					    	</ul>
					    </section>
					    <%
					    }
					    %>
					
					
					    <section id="bo_v_atc">
					        <h2 id="bo_v_atc_title">본문</h2>
					        <div id="bo_v_img"></div>
					        <div id="bo_v_con"><div><%=vo.getBbsContent() %></div></div>
					    </section>
					
					
					    <div id="bo_v_bot">
					        <ul class="bo_v_com">
					        <%
					        if(userInfo != null && !"".equals(userInfo.getId()) && vo.getUserID().equals(userInfo.getId())){
					        %>
					        	<li><a href="javascript:f_modify()" class="btn_b01">수정</a></li>
					        <%
					        } 
					        %>
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

</body>
</html>
