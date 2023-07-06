<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
MiceParam param = MiceParam.parseRequest(request);
BbsDao dao = new BbsDao();
int selPageNo = param.getInt("selPageNo", 1);
String bflag = param.getString("bflag", "01");

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

PagesVo pagesVo = new PagesVo(selPageNo, 10);
ResultSetEntity d = dao.getBbsList(param, pagesVo.fromNumber(), pagesVo.toNumber(),true);
int tot = dao.getBbsList_tot(param);
pagesVo.setTotalRows(tot);

int tot_page = (tot%10==0) ? (int)(tot/10) : (int)tot/10+1; 


String naviTitle = "";
String naviTitle2 = "";
if("01".equals(bflag)){
	naviTitle = "공지사항";
	naviTitle2 = "공지사항";
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
	frm.action = "/jsp/sub6-3.jsp";
	frm.submit();
}

function f_goDetail(no){
	var frm = document.forms.frmDetail;
	frm.selAction.value = "V";
	frm.no.value = no;
	
	frm.target = "";
	frm.method = "post";
	frm.action = "/jsp/sub6-3_01.jsp";
	frm.submit();
}


</script>
</head>
<body>
<form name="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="no" value=""/>
<input type="hidden" name="selPageNo" value="<%=selPageNo %>"/>
<input type="hidden" name="bflag" value="<%=bflag %>"/>
<input type="hidden" name="selGubun" value=""/>
<input type="hidden" name="selSearch" value=""/>
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




<h2 id="container_title"><span class="sound_only"><%=naviTitle %></span><span class="sound_only"> 목록</span></h2>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">


    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div class="bo_fx">
        <div id="bo_list_total">
            <span>Total <%=tot %>건</span> <%=tot_page %> 페이지
        </div>	
    </div>



    <div class="tbl_head01 tbl_wrap">
        <table style="font-size:14px">
        <caption>공지사항 목록</caption>
        <thead>
	        <tr>
	            <th scope="col">번호</th>
	            <th scope="col">제목</th>
	            <th scope="col">글쓴이</th>
	            <th scope="col"><a href="">날짜</a></th>
	            <th scope="col"><a href="">조회</a></th>
			</tr>
        </thead>
        <tbody>
        	<%if(d!=null && d.size()>0){
        		int no = pagesVo.getTopNo();
        		for(int i=0; i<d.size(); i++){
        			d.next();
        			boolean isSecret = "Y".equals(d.getString("bbs_secret_yn"));
        			boolean isSecretToUser = isSecret && (userInfo == null || !userInfo.getId().equals(d.getString("top_user_id")));

					String repDepth = "";
					for(int j=1;j<d.getString("bbs_thread").length();j++){
						repDepth += "&nbsp;&nbsp;";
					}
					if(!"A".equals(d.getString("bbs_thread"))){
						repDepth += "┖ ";
					}
        	%>
                <tr class="" <%if("Y".equals(d.getString("bbs_notice_yn"))){%>style="background-color:#f8f8f8;"<%} %>>
            		<td class="td_num"><%if("Y".equals(d.getString("bbs_notice_yn"))){%>공지<%}else{%><%=no-- %><%} %></td>
                    <%if(!isSecretToUser){ %>
                    <td class="td_subject">
               			<a href="javascript: f_goDetail('<%=d.getString("bbs_idx") %>')"><%=repDepth %> <%=d.getString("bbs_title") %></a>
               			<%="new".equals(d.getString("isnew")) ? "<img src='/images/ico/news_ico.gif' />" : "" %>
               			<%="Y".equals(d.getString("bbs_secret_yn")) ? " <img src=\"/images/ico/icon_secret.jpg\" />" : "" %>
               		</td>
		            <td class="td_name sv_use"><span class="sv_member"><%=d.getString("user_name") %></span></td>
               		<%}else{ %>
               			<td class="td_subject" style="color:#999;"><%=repDepth %> 비공개 게시글입니다. <img src="/images/ico/icon_secret.jpg" /></td>
               			<td class="td_name sv_use">비공개</td>
               		<%} %>
		            <td class="td_date"><%=d.getString("cdate").substring(2, Math.min(d.getString("cdate").length(), 10)) %></td>
		            <td class="td_num"><%=d.getString("bbs_hit") %></td>
              </tr>
             <%
        		}
             }else{ 
             %>
                <tr class="">
            		<td class="td_num" colspan="5">데이터가 없습니다.</td>
            	</tr>
             <%} %>
             
             
                <tr class="">
                	<td colspan="5" style="text-align:center"><%=pagesVo.getPageHtml() %></td>
            	</tr>
            	
			</tbody>
        </table>
		<%
		if( ("04".equals(bflag) || "05".equals(bflag) || "06".equals(bflag)) 
				&& userInfo != null && !"".equals( userInfo.getId() ) ){
		%>
        <div class="tbl_btns">
        	<a href="/jsp/sub6-3_02.jsp?bflag=<%=bflag %>" class="btn_b01">글쓰기</a>
        </div>
        <%} %>
    </div>



<!-- 페이지 -->
<!-- 게시판 검색 시작 { -->
<fieldset id="bo_sch">
    <legend>게시물 검색</legend>

    <form name="frmList" method="get" action="/jsp/sub6-3.jsp">
	    <input type="hidden" name="selAction" value=""/>
	    <input type="hidden" name="selPageNo" value="<%=selPageNo %>">
	    <input type="hidden" name="bflag" value="<%=bflag %>">
	    <label for="sfl" class="sound_only">검색대상</label>
	    <select name="sfl" id="sfl">
		<%String sfl = param.getString("sfl"); %>
	        <option value="wr_subject" <%="wr_subject".equals(sfl) ? "selected" : "" %>>제목</option>
	        <option value="wr_content" <%="wr_content".equals(sfl) ? "selected" : "" %>>내용</option>
	        <option value="wr_subject||wr_content" <%="wr_subject||wr_content".equals(sfl) ? "selected" : "" %>>제목+내용</option>
	        <option value="mb_id,1" <%="mb_id,1".equals(sfl) ? "selected" : "" %>>회원아이디</option>
	        <option value="mb_id,0" <%="mb_id,0".equals(sfl) ? "selected" : "" %>>회원아이디(코)</option>
	        <option value="wr_name,1" <%="wr_name,1".equals(sfl) ? "selected" : "" %>>글쓴이</option>
	        <option value="wr_name,0" <%="wr_name,0".equals(sfl) ? "selected" : "" %>>글쓴이(코)</option>
	    </select>
	    <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
	    <input type="text" name="stx" id="stx" class="frm_input required" size="15" value="<%=TextFormatter.escapeHTML(param.getString("stx")) %>">
	    <input type="submit" value="검색" class="btn_submit">
    </form>
</fieldset>
<!-- } 게시판 검색 끝 -->


               
</div>

<!-- 페이지 -->


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
