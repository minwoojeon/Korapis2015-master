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

<!-- sub_wrap START -->
 	<div id="sub_wrap">

		<jsp:include page="inc/header.jsp" />

        <!-- sub_contents START -->
    <div id="sub_contents">
        	<!-- left_menu START -->
        				<!-- left_menu START -->
        	<jsp:include page="inc/leftmenu.jsp" />
            <!--// left_menu END -->            <!--// left_menu END -->
            <!-- sub_con START -->
                        <div id="sub_con_box">
            	<div class="sub_top_box">
                	<div class="location"><img src="/images//home_icon.gif" alt="home" style="margin-top:-2px;" /> &gt; 협회소개 &gt; <span>회비납부</span></div>
                    <h2><span>회비</span>납부</h2>
                </div>
                <div class="sub_body_box">
                	<ul>
                    	<li class="title">지회별</li>
                        <li class="text_2">
							본 서비스는 권한있는 회원전용입니다.						</li>
                    </ul>
                    <ul>
                    	<li class="title">개인별</li>
                        <li class="text_2">
							본 서비스는 회원전용입니다.						</li>
                    </ul>
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
