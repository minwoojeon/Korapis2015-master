<%@page import="java.util.Calendar"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Calendar oCalendar = Calendar.getInstance();
int toYear = oCalendar.get(Calendar.YEAR);
//int StartYear = 1992;
int StartYear = 2010;

BbsDao dao = new BbsDao();
int selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), 1);
String PYEAR = TextFormatter.convNvl(request.getParameter("PYEAR"), String.valueOf(toYear));
String bflag = TextFormatter.convNvl(request.getParameter("bflag"), "08");

MiceParam param = new MiceParam();
param.put("PYEAR", PYEAR);
param.put("selPageNo", selPageNo);
param.put("bflag", bflag);




PagesVo pagesVo = new PagesVo(selPageNo, 20);
ResultSetEntity d = dao.getBbsList(param, pagesVo.fromNumber(), pagesVo.toNumber(),true);
int tot = dao.getBbsList_tot(param);
pagesVo.setTotalRows(tot);

int tot_page = (tot%10==0) ? (int)(tot/10) : (int)tot/10+1; 


String naviTitle = "";
String naviTitle2 = "";

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
<link rel="stylesheet" href="/css/style1.css">
<link rel="stylesheet" href="/css/style2.css">
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
             <jsp:param value="07" name="bflag"/>
         </jsp:include>

        <!-- sub_contents START -->
        <div id="sub_contents">

            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">양봉협회보</h2>
                    <div class="location">홈  &gt; 홍보센터 &gt; <span>양봉협회보</span></div>
                </div>
                <div class="sub_body_box" >



<!-- 게시판 목록 시작 -->
<div id="bo_img" style="width:100%;">
    <div class="bo_fx">
        <div id="bo_list_total">
            <span>Total <%=tot %>건</span> <%=tot_page %> 페이지
        </div>
	</div>


    <h2>이미지 목록</h2>
    <ul id="bo_img_list">
    
      	<%if(d!=null && d.size()>0){
      		int no = pagesVo.getTopNo();
      		for(int i=0; i<d.size(); i++){
      			d.next();
      	%>    
		<li class="bo_img_list_li ">
            <span class="sound_only"><%=no-- %></span>
			<ul class="bo_img_con"> 
                <li class="bo_img_href">
                    <!--  <a href="/jsp/sub6-2_01.jsp"> -->
                    <img src="/datafile/upData/bbs7/thumbs/<%=d.getString("file_path")+"."+d.getString("file_ext") %>" alt="" width="188" height="238">
                    <!-- </a> -->
                </li>
            </ul>  
			<ul class="bo_img_con2"> 
                <li class="bo_img_text_href">양봉협회보</li>
                <li>
					<span class="sv_member">한국양봉협회</span> <span class="bo_gubun">|</span>       
					<%=d.getString("cdate").substring(0, Math.min(d.getString("cdate").length(), 10)) %> <span class="bo_gubun">|</span>  
					<span class="bo_img_subject">조회 </span><%=d.getString("bbs_hit") %> 
	                <span class="bo_gubun">|</span><span class="bo_img_subject">추천 </span><strong><%=d.getInt("bbs_like", 0) %></strong>		            				
	            </li>
				<li style="border-top:1px #ccc dotted;height:7px;"></li>
				<li class="bo_content"></li>
				<li><a href="javascript:" onclick="window.open('/datafile<%=d.getString("bbs_link") %>','webzine','fullscreen')" title="새창으로 열림"><strong style="color:darkorange;font-size:12pt;">※e-book 보기</strong></a></li>				            
			</ul>
        </li>

                
        <%
   			}
        }else{ 
        %>
        
        
		<li class="bo_img_list_li ">
            <span class="sound_only">데이터가없습니다.</span>
            <ul class="bo_img_con"> 
                <li class="bo_img_href">
                    &nbsp;
                </li>
            </ul>
			<ul class="bo_img_con2"> 
                <li style="line-height:30px">데이터가없습니다.</li>
			</ul>
        </li>
        <%} %>        
        
   </ul>

    
</div>


<!-- 페이지 -->

<fieldset id="bo_sch">
    <legend>게시물 검색</legend>

    <form name="fsearch" method="get" action="sub6-2.jsp">
    <label for="sfl" class="sound_only">발간년도</label>
    발간년도
    <select name="PYEAR" id="PYEAR" onchange="this.form.submit();">
    	<%
    	for(int i = toYear; i >= StartYear; i--){ 
    	%>
    	<option value="<%=i %>" <%=  String.valueOf(i).equals(PYEAR) ? "selected" : "" %>><%=i %>년도</option>
    	<%} %>
    </select>
    <input type="submit" value="검색" class="btn_submit">
    </form>
</fieldset>

<!-- 게시판 목록 끝 -->
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
