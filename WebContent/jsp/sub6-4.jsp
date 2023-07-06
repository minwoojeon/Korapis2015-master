<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BbsDao dao = new BbsDao();
int selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), 1);
String bflag = TextFormatter.convNvl(request.getParameter("bflag"), "10");

MiceParam param = new MiceParam();
param.put("bflag", "10");
param.put("selPageNo", selPageNo);


PagesVo pagesVo = new PagesVo(selPageNo, 10);
ResultSetEntity d = dao.getBbsList(param, pagesVo.fromNumber(), pagesVo.toNumber(),true);
int tot = dao.getBbsList_tot(param);
pagesVo.setTotalRows(tot);

int tot_page = (tot%10==0) ? (int)(tot/10) : (int)tot/10+1; 



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
<link rel="stylesheet" href="/css/style1.css">
<link rel="stylesheet" href="/css/style2.css">
<script src="/js/jquery-1.8.3.min.js" ></script>
<script>


//페이징.
function f_goPage(no){
	var frm = document.forms.frmList;
	frm.selAction.value = "V";
	frm.selPageNo.value = no;
	
	frm.target = "";
	frm.method = "post";
	frm.action = "/jsp/sub6-4.jsp";
	frm.submit();
}

</script>
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
        
        <jsp:include page="inc/leftmenu.jsp" />
        
        <!-- sub_contents START -->
        <div id="sub_contents">
            
            
            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">협회소식</h2>
                    <div class="location">홈 &gt; 홍보센터 &gt; <span>협회소식</span></div>
                </div>
                <div class="sub_body_box pl20" >



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
            <span class="sound_only">1</span>

			<ul class="bo_img_con"> 
                <li class="bo_img_href" style="padding:4px; border:1px solid #ddd;">
                	<a href="sub6-4_01.jsp?no=<%=d.getString("bbs_idx") %>">
                	<img src="/datafile/upData/bbs01/thumbs/<%=d.getString("file_path")+("".equals(d.getString("file_name"))?"":"."+d.getString("file_ext")) %>" alt="" width="140" height="100">
                	</a>
               </li>
            </ul>  
			<ul class="bo_img_con2"> 
                <li class="bo_img_text_href">
					협회소식
				</li>
                <li>
					<span class="sv_member"><%=d.getString("user_name") %></span> <span class="bo_gubun">|</span>       
					<%=d.getString("cdate").substring(0, Math.min(d.getString("cdate").length(), 10)) %> <span class="bo_gubun">|</span>  
					<span class="bo_img_subject">조회 </span><span><%=d.getString("bbs_hit") %></span> 
	                <span class="bo_gubun">|</span>
	                <span class="bo_img_subject">추천 </span><strong><%=d.getString("bbs_like") %></strong>		            				
	            </li>
				<li style="border-top:1px #ccc dotted;height:7px;"></li>
				<li class="bo_content"></li>
				<li><a href="sub6-4_01.jsp?no=<%=d.getString("bbs_idx") %>"><%=d.getString("bbs_title") %></a></li>
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

             
                <div style="text-align:center">
                	<%=pagesVo.getPageHtml() %>
            	</div>
            	


<!-- 페이지 -->

<fieldset id="bo_sch">
    <legend>게시물 검색</legend>

    <form name="frmList" >
    <input type="hidden" name="selAction" value=""/>
    <input type="hidden" name="selPageNo" value="<%=selPageNo %>">
    <input type="hidden" name="bflag" value="<%=bflag %>">
   
    <label for="sfl" class="sound_only">검색대상</label>
    <select name="sfl" id="sfl">
        <option value="wr_subject">제목</option>
        <option value="wr_content">내용</option>
        <option value="wr_subject||wr_content">제목+내용</option>
    </select>
    <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
    <input type="text" name="stx" value="<%=param.getString("stx") %>" id="stx" class="frm_input required" size="15" maxlength="30">
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
