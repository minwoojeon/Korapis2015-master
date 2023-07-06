<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.korapis.vo.BbsFileVo"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.vo.BbsVo"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String no = TextFormatter.convNvl(request.getParameter("no"), "");
String selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), "1");
String bflag = TextFormatter.convNvl(request.getParameter("bflag"), "10");
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



%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>사단법인 한국양봉협회</title>
<link rel="stylesheet" href="/css/default.css" >
<link href="/css/sub.css"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="/css/style2.css">           
<link rel="stylesheet" href="/css/style1.css">
<script src="/js/jquery-1.8.3.min.js" ></script>

</head>
<body>
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
        
        <jsp:include page="inc/leftmenu.jsp">
                <jsp:param value="10" name="bflag"/>
            </jsp:include>
        
        <!-- sub_contents START -->
        <div id="sub_contents">
            
            
            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">협회소식</h2>
                    <div class="location">홈 &gt; 홍보센터 &gt; <span>협회소식</span></div>
                </div>
                <div class="sub_body_box pl20" >

<!-- 게시물 읽기 시작 { -->
<article id="bo_v" style="width:100%">
    <header>
        <h1 id="bo_v_title">협회소식</h1>
    </header>

    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        작성자 <strong><span class="sv_member"><%=vo.getUserName() %></span></strong>
        <span class="sound_only">작성일</span><strong><%=vo.getCdate().substring(0, Math.min(vo.getCdate().length(), 10)) %></strong>
        조회<strong><%=vo.getBbsHit() %></strong>
    </section>

    


    <section id="bo_v_atc">
        <h2 id="bo_v_atc_title">본문</h2>

<!--         <div id="bo_v_video">
			<a href="/view_image.php?bo_table=bbs_letter&amp;fn=3718138848_gr5EA27O_201405.png" target="_blank" class="view_image">
			<img src="/3718138848_gr5EA27O_201405.png" alt="" title="" style="width: 188px; height: 238px;">
			</a>
		</div> -->
        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con">
        
					    <%
					    ArrayList<BbsFileVo> files = vo.getFiles();
					    int size = files.size();
					    if(size > 0){
							BbsFileVo file = files.get(0);
							%>
								<img src="/datafile/upData/bbs01/thumbs/<%=file.getFilePath()+("".equals(file.getFileName())?"":"."+file.getFileExt()) %>" alt="" style="max-width:100%;">
							<%
					    }
					    %>
		</div>
        <div id="bo_v_con"><div><%=vo.getBbsContent() %></div></div>
        <!-- } 본문 내용 끝 -->

        

    </section>

    


    <!-- 링크 버튼 시작 { -->
    <div id="bo_v_bot">
                
        <ul class="bo_v_com">
        	<li><a href="sub6-4.jsp" class="btn_b01">목록</a></li>
		</ul>
            </div>
    <!-- } 링크 버튼 끝 -->

</article>
<!-- } 게시판 읽기 끝 -->
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



</body>
</html>
