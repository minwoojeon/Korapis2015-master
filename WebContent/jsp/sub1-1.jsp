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
            		<h2 class="page_title">인사말</h2>
                	<div class="location">홈  &gt; 협회소개 &gt; <span>인사말</span></div>
                </div>
                <div class="sub_body_box">
                	<div class="intro">
					<h3 class="title_txt">사단법인 한국양봉협회장</h3>

	                <div class="intro_img">
	                	<img src="/images/Yoon_Hoa_Houn_bg.jpg" alt="윤화현"/>
	                </div>

					<div class="intro_txt">
						<div class="txt_box">
							안녕하십니까?<br>
							한국양봉협회 회장 윤화현입니다.<br>
							본회는 1967년 창립 이후로 양봉 농가의 권익보호를 위해 끊임없는 노력을 기울여 오고 있습니다.<br>
							그 가운데는 양봉농가의 소득증대와 양봉산물 고품질 향상을 위해 노력하고 있고, 양봉산업의 기반조성을 위해 밀원수 식재와 여왕벌 보급사업, 해외연수교육·홍보사업 등이 진행되고 있으며, 이를 통해 우리 양봉산업의 발전을 도모하려는 목표로 한 걸음 한 걸음 나아가고 있습니다. <br>
							하지만 최근 세계 시장의 개방 압력에 맞서 우리 양봉산업은 커다란 위기에 직면해 있습니다.<br>
							장기적으로 우리 양봉산업이 세계적인 경쟁력을 갖추기 위해서는 기능성 꿀의 생산을 통해 독특한 차별화를 추구해야 하며, 동시에 소비자 홍보를 강화하여 국내 벌꿀에 대한 인식을 변화시켜 생산자와 소비자가 서로 신뢰할 수 있는 환경을 만들어 나아가야 할 것입니다.<br>
							이를 실천하기 위한 노력으로 본회는 장기적인 대책안을 마련 중에 있습니다.<br>
							본회의 노력에 여러분들의 지지와 성원을 더해주셔서 그 효과가 배가 될 수 있도록 많은 협조를 부탁드리는 바입니다. 끝으로 본회와 임원진 모두는 앞으로 양봉산업의 발전을 위해 더욱 힘쓸 것을 약속드리며, 여러분의 의견을 적극적으로 수렴하는 협회가 되도록 하겠습니다.<br>
							감사합니다.
						</div>
	                </div>
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
