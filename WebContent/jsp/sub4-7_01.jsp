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
                    <h2 class="page_title">봉독의 성분 및 효능</h2>
                    <div class="location">홈 &gt; 양봉산물 &gt; <span>봉독의 성분 및 효능</span></div>
                </div>
                
				<div class="sub_body_box">
				    <ul  class="tab_list grid_3">
				        <li><a href="/jsp/sub4-7.jsp" target="_self">봉독의 성상 및 성분</a></li>
				        <li class="on"><a href="/jsp/sub4-7_01.jsp" target="_self">봉독의 생산</a></li>
				        <li><a href="/jsp/sub4-7_02.jsp" target="_self">봉독의 효능 및 반응</a></li>
				    </ul>
				
				    <h3 class="title_txt">봉독의 생산</h3>
				        <p>봉독은 꿀벌이 자신의 몸을 희생하면서 잔신의 군집을 지키기 위한 독액이다. 봉독의 생산을 위해서는 물리적, 화학적, 기계적 방법으로 채취할수 있다.</p>
				
				        <p class="sub_title">물리적방법</p>
				        <p>물리적인 방법은 꿀벌의 희생 없이 봉독을 얻을 수 있기 때문에 꿀벌의 보호와 경제적으로 봉독을 얻을 수 있기 때문에 양봉기술이 발달된 나라에서 많이 사용하는 방법이다. 꿀벌에게 전혀 피해가 없는 것은 아니고 아래에 있는 다른 방법에 비해서 꿀벌의 희생이 최소화 된다. <br>
				            전기충격을 이용하여 봉독을 생산하는 물리적인 방법은 벌통내부 또는 외부에 전기충격 장비를 설치하고 봉독을 분비하게 하여 생산하는 방법이다. <br>
				            전기충격 장치 아래에 수집판이 있어 액체의 봉독은 건조 결정물만 남게 되는데 이것을 긁어모은 것이 정제되지 않은 봉독 가루다. 봉독 가루는 여러 가지 방법으로 정제될 수 있고, 나라마다 가격이 천차만별이다. 아래의 그림은 봉독생산을 위한 전기 충격 장치이다. </p>
				
				        <div class="taC"><img src="/images/4-5_img.jpg" alt="봉독채취기"></div>
				
				        <p class="sub_title">건조 봉독의 가격비교</p>
				
				        <table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="건조 봉독의 가격비교">
				            <caption>건조 봉독의 가격비교</caption>
				            <colgroup>
				                <col width="*">
				                <col width="*">
				                <col width="*">
				                <col width="*">
				                <col width="*">
				                <col width="*">
				                <col width="*">
				            </colgroup>
				            <thead>
				                <tr>
				                    <th>국가</th>
				                    <th>한국</th>
				                    <th>뉴질랜드</th>
				                    <th>러시아</th>
				                    <th>미국</th>
				                    <th>중국</th>
				                    <th>비고</th>
				                </tr>
				            </thead>
				            <tbody>
				                <tr>
				                    <td>원/1g</td>
				                    <td>100,000원</td>
				                    <td>170,000원</td>
				                    <td>56,000 ~ 80,000원</td>
				                    <td>40,000 ~ 44,000원</td>
				                    <td>33,000 ~ 42,000원</td>
				                    <td>&nbsp;</td>
				                </tr>
				            </tbody>
				        </table>
				        <br>
				
				        <p class="pl20">※ US $ 1 = 1,200원으로 계산<br>
				            ※ €1 = 1,600원으로 계산</p>
				
				        <p class="sub_title">화학적방법</p>
				        <p>화학적인 방법은 유기용매를 사용하여 봉독을 생산하는 방법이다. 꿀벌을 유리와 같은 관에 넣고 에테르로 죽여서 독액을 분비하게 하여 수집된 봉독을 정제과정을 거쳐 생산한다. 이 방법으로 말린 독 약 75mg'1,000마리를 얻을 수 있지만 꿀벌의 조직 혼합물뿐만 아니라 유기용매 <span>*에테르</span>를 제거하여야 하는 과정이 까다롭다. 또한 꿀벌에게도 해롭지만 인간에게도 해로운 생산 방법이다.</p>
				
				        <div class="etcArea01"><strong>에테르(ether)</strong> : 에테르는 유기 물질을 잘 녹이기 때문에 용매로 많이 사용되며 에테르 증기는 토양의 살충제로 사용되며, 의약용 마취제로도 사용.</div>
				
				        <p class="sub_title">기계적방법</p>
				        <p>기계적 방법을 핀셋과 같은 도구를 사용하여 봉독을 채취하는 것으로 인력의 소모가 큰 방법이다. 소량이 필요하거나 직접 벌침을 사용하여 환부에 처리할 때 유용한 방법이다. 그러나 잘못된 상식을 가지고 할 경우 죽음이나 힘한 부작용을 부를 수 있다.</p>
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
