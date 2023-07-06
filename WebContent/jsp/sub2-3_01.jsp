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
            		<h2 class="page_title">국제대회</h2>
                	<div class="location">홈  &gt; 협회활동 &gt; <span>국제대회</span></div>
                </div>
                
				<div class="sub_body_box">

				    <ul class="tab_list grid_2">
				        <li><a href="/jsp/sub2-3.jsp" target="_self">2015 대전세계양봉대회</a></li>
				        <li class="on"><a href="/jsp/sub2-3_01.jsp" target="_self">제10회 아시아양봉대회</a></li>
				    </ul>
				
				
				
				    <h3 class="title_txt">행사개요</h3>
				
				    <p class="text_5_1"><strong>대회명</strong> : 제10회 아시아 양봉대회(10th AAA Conference & Api Expo) </p>
				    <p class="text_5_1"><strong>주제</strong> : 녹색성장과 꿀벌 세계(Green Life with Bee World)</p>
				    <p class="text_5_1"><strong>개최 일자</strong> : ‘10.11.04(목) ∼ 07(일), 4일간</p>
				    <p class="text_5_1"><strong>개최 장소</strong> : BEXCO(부산전시컨벤션센터) 컨벤션홀 </p>
				    <p class="text_5_1"><strong>주최</strong> : 한국양봉학회, 한국양봉협회, 한국양봉농협</p>
				    <p class="text_5_1"><strong>주관</strong> : AAA 2010 조직위원회, AAA 집행위원회</p>
				    <p class="text_5_1"><strong>후원</strong> : 농림수산식품부, 부산광역시, 농촌진흥청, 산림청, 한국관광공사, 농협중앙회</p>
				    <p class="text_5_1"><strong>참가 규모</strong> : 20 여 개국 4,000여명</p>
				
				
				    <h3 class="title_txt">주요프로그램</h3>
				
				    <p class="text_5_1">개.폐막식, 학술프로그램(기조강연, 분과회의, 포스터 발표), 양봉 전시회, 환영의 밤, <br> &nbsp; 테크니컬투어, 꿀벌아가씨 선발대회 등</p>
				
				    <h3 class="title_txt">개최 결과</h3>
				
				    <p class="text_5_1 mb10"><strong>대한민국 양봉산업을 전 세계에 알리는 기회 마련</strong><br>
				        &nbsp; 축산업 최초로 열리는 국제행사인 아시아 양봉대회를 맞이하여 대규모 전시회를 통해 국내 양봉업을 전 세계에 홍보하고 신규 수출시장 개척의 장 마련
				    </p>
				    <p class="text_5_1 mb10"><strong>전시장 개방을 통한 부산시민 참여 유도</strong><br>
				        &nbsp; 부산시민에게 전시장을 무료 개방하여 녹색산업으로써 양봉산업의 중요성을 소비자에게 소개하는 계기 마련
				    </p>
				    <p class="text_5_1 mb10"><strong>국제행사를 통한 양봉농가의 사기진작 및 재활 기반 마련</strong><br>
				        &nbsp; 올해 이상기온현상에 따른 저온피해 및 낭충봉아부패병 질병확산으로 양봉농가의 어려움이 가중된 상태에서 국제행사를 통해 국내 양봉인 들에게 희망을 주고 사기진작과 재활기반을 유도함
				    </p>
				    <p class="text_5_1 mb10"><strong>학술발표를 통한 양봉산업의 체계적 연구 및 가치 제고</strong>
				    </p>
				    <p class="text_5_1 mb10"><strong>‘양봉산업 비전 2015’와 함께 국내 양봉산업의 향상</strong><br>
				        &nbsp; 농림수산식품부에서 발표한 “양봉산업 비전 2015” 더불어 국내 양봉산업이 한층 향상되어 7,000 억 원 규모의 시장을 형성할 수 있는 기회마련
				    </p>
				    <p class="text_5_1"><strong>세계양봉대회 유치 계기 마련</strong><br>
				        &nbsp; 2015년 세계대회 유치를 위한 발판 마련
				    </p>
				
				    <div class="taC mt20">
				        <img src="/images/2-3_img1.jpg" alt="2015 세계양봉대회" title="">
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
