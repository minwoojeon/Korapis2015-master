<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!--[if lte IE 8]>
<script src="html5.js" ></script>
<![endif]-->
<script>
// 자바스크립트에서 사용하는 전역변수 선언
var g5_url       = "http://korapis.weelsystem.co.kr";
var g5_bbs_url   = "weel_bbs";
var g5_is_member = "";
var g5_is_admin  = "";
var g5_is_mobile = "";
var g5_bo_table  = "";
var g5_sca       = "";
var g5_editor    = "";
var g5_cookie_domain = "";
</script>
<script src="/js/jquery-1.8.3.min.js" ></script>
<script src="/js/common.js" ></script>
<script src="/js/wrest.js" ></script>

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
                    <h2 class="page_title">저작권정책</h2>
                    <div class="location">홈 &gt; 운영체제 &gt; <span>저작권정책</span></div>
                </div>
                <div class="sub_body_box">
                
					<p class="p20">

본 사단법인 한국양봉협회에서 제공하는 모든 자료는 저작권법에 의하여 보호받는 저작물로서 별도의 저작권 표시 또는 출처를 명시한 경우를 제외하고는 원칙적으로 본 사단법인 한국양봉협회에 저작권이 있으며 이를 무단 복제/배포하는 경우에는 저작권법 제97조의5에 의한 저작재산권침해죄에 해당함을 유념하시기 바랍니다.
<br><br>

개인 또는 법인이 본 사단법인 한국양봉협회의 컨텐츠를 링크하거나 인용, 복제 및 재배포등을 통하여 사용하실 때와 당 협회 웹사이트에서 제공하는 자료로 수익을 얻거나 이에 상응하는 혜택을 누리고자 하는 경우에는 본 협회와 사전에 협의를 하고 허락을 얻고 출처가 사단법인 한국양봉협회임을 밝혀야 하며 적법한 절차에 따라 게재한 경우에도 단순한 오류 정정 이외의 내용의 무단변경을 금지하며, 이를 위반할 때에는 형사처벌을 받을 수 있습니다. 
<br><br>
본 사단법인 한국양봉협회를 링크하여 사용하고자 하는 경우, 사단법인 한국양봉협회에 연결됨을 표시하고, 한국양봉협회의 첫화면을 통하도록 하고 세부하면(서브도메인)으로 링크시키거나 페이지를 프레임 안에 넣는 것은 허용되지 않습니다.
					</p>

                		
                </div>
            </div>
            <!--// sub_con END -->
            
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
