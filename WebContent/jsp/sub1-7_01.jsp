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
            		<h2 class="page_title">찾아오시는길</h2>
                	<div class="location">홈 &gt; 협회소개 &gt; <span>찾아오시는길</span></div>
                    <h2><span>찾아</span>오시는길</h2>
                </div>
                <div class="sub_body_box">
                	<h3 class="title_txt">찾아오시는길</h3>
					<ul class="tab_list grid_4">
					    <li><a href="/jsp/sub1-7.jsp" target="_self" class="go">지도</a></li>
					    <li class="on"><a href="/jsp/sub1-7_01.jsp" target="_self" class="go">이미지</a></li>
					</ul>


					<div class="mediabox">
					    <img src="/images/map_02.gif" alt="(우)서울특별시 서초구 서초중앙로 6길 제2축산회관 (지하철 3호선 남부터미널 4거리 1번출구)">
					</div>

					<p class="sub_title">교통편</p>
					<div class="bg_box">지하철 3호선 남부터미널 4거리 1번출구 1번거리</div>
					<p class="sub_title">주소</p>
					<div class="bg_box">(06643) 서울시 서초구 서초중앙로6길 9 제2축산회관</div>
					<p class="sub_title">연락처</p>
					<div class="bg_box">TEL : 02-3486-0882~5 / FAX : 02-3486-0886 / E-mail:apiary@korapis.or.kr</div>
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
