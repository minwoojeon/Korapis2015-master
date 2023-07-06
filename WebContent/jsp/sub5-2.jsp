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
                    <h2 class="page_title">생산농가 품질관리</h2>
                    <div class="location">홈 &gt; 양봉산물연구소 &gt; <span>생산농가 품질관리</span></div>
                </div>
                
				<div class="sub_body_box">
				    <h3 class="title_txt">검사방법</h3>
				    <div class="taC"><img src="/images/s2_i01.jpg" alt="식품의약품안전처 벌꿀규격기준에 의한 검사, FAO/WHO 권장규격 시험법, AOAC 시험법 채택, 기타 자가시험법 병행, 분석처리"></div>
				
				    <h3 class="title_txt">검사 목적</h3>
				    <p>
				        1. 생산농가가 자가 생산한 벌꿀의 품질확인 검사<br />
				        2. 벌꿀공동브랜드(한벌꿀)를 위한 품질검사<br />
				        3. 협회 품질관리스티커를 부착하기 위한 봉인검사<br />
				        4. 판매업 회원이 벌꿀을 판매하기 전에 규격에 적합한 상품여부를 확인하기 위한 품질검사<br />
				        5. 관계기관 또는 소비자보호단체를 통한 고발검사
				    </p>
				
				    <h3 class="title_txt">품질관리 제도 운영</h3>
				    <div class="stepArea01">
				        <div class="step_box">
				            <strong>협회 품질보증표를 부착하기 위한 봉인검사</strong><br />
				            - 협회 외근직 직원파견<br />
				            - 직원 입회하 시료 채집 및 드럼 봉인작업</div>
				        <div class="taC"><img class="step_arrow step_down" src="/images/icon_step_down.png" alt="↓"></div>
				        <div class="step_box">검사 시료 500~600g 접수</div>
				        <div class="taC"><img class="step_arrow step_down"  src="/images/icon_step_down.png" alt="↓"></div>
				        <div class="step_box">- 식약처 식품공전 고시 벌꿀규격기준에 준한 검사<br />
				            - 필요에 따라 협회 자가 시험법 병행</div>
				        <div class="taC"><img class="step_arrow step_down"  src="/images/icon_step_down.png" alt="↓"></div>
				        <div class="step_box">- 검사결과 : 시험의뢰자에게 통보</div>
				        <div class="taC"><img class="step_arrow step_down"  src="/images/icon_step_down.png" alt="↓"></div>
				        <div class="step_box">- 협회 직원 입회하 봉인해제 및 소분．포장 작업 진행</div>
				    </div>
				    <div class="taC"><img src="/images/s2_i02_2_2019.jpg" alt="품질관리 상표 이미지 모음"></div>
				
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
