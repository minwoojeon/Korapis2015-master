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
                    <h2 class="page_title">화분</h2>
                    <div class="location">홈 &gt; 양봉산물 &gt; <span>화분</span></div>
                </div>
				<div class="sub_body_box">
				
				        <h3 class="title_txt">화분의 수집</h3>
				        <p>
				            <img src="/images/4-4_img.jpg" alt="화분" style="float: left; padding-right:8px">
				            <span><strong>화분이란</strong></span>벌들이 꽃에서 화밀<span class="ffdotum">(花蜜)</span>을 수집하면서 함께 모아 들인것으로벌들의 영양 공급원이 됩니다. <br>
				            꽃의 수술에서 수집, 꿀벌들의 뒷다리에 있는 화분주머니에 뭉쳐서 모아들인 화분(Pollen)은 영양많은 식품입니다.<br>
				            Stemen은 꽃의 수술에 묻어있는 꽃가루<span class="ffdotum">(花粉)</span>란 라틴어이고 스테미나(Stemine)는 스테멘의 복수형으로 정력, 끈기, 기력을 나타내는 화분의 뜻을 상징적으로 말해 주고 있습니다.</p>
				            
				        <h3 class="title_txt">화분의 성분</h3>
				        
				        <table class="table_hor" width="100%" border="0" cellpadding="0" cellspacing="0"summary="화분의 성분">
				            <caption>화분의성분</caption>
				            <colgroup>
				                <col width="30%">
				                <col width="*">
				            </colgroup>
				            <thead>
				                <tr>
				                    <th>성분</th>
				                    <th>함량(%)</th>
				                </tr>
				            </thead>
				            <tbody>
				                <tr>
				                    <td>단백질</td>
				                    <td>23~25%</td>
				                </tr>
				                <tr>
				                    <td>탄수화물</td>
				                    <td>25~27%</td>
				                </tr>
				                <tr>
				                    <td>미네랄</td>
				                    <td>2.5~3.0%</td>
				                </tr>
				                <tr>
				                    <td>아미노산</td>
				                    <td>필수 아미노산 8가지외 10가지 다량함유</td>
				                </tr>
				                <tr>
				                    <td>비타민류</td>
				                    <td>10여가지 비타민류 다량함유</td>
				                </tr>
				                <tr>
				                    <td>기타</td>
				                    <td>20~25%</td>
				                </tr>
				            </tbody>
				        </table>
				
				        <h3 class="title_txt">화분의 이용</h3>
				        <p>꿀벌들이 수집하여 들이는 화분을 벌집문앞에 채분기(화분채집장치)를 설치하여 수집합니다. <br>
				            수집한 화분을 일정한 온도에서 (40°C이하)수분을 건조시킨후 정선 포장하여 상품화 하는 것으로 밀원(꽃)의 종류에 따라 화분의 고유한 색깔이 다르며 꽃에 따라 맛의 차이가 있습니다. 벌에 의해 얻어지는 고추씨 모양의 화분덩이는 수십만개의 화분을 모아서 만든 花粉團으로 한가지 꽃에서 모아들인 것보다는 여러가지 밀원의 화분이 혼합된것이 더욱 영양가가 높습니다. <br>
				            최근 먼지크기밖에 되지않는 화분의 껍질을 벗긴 것이라 하여 비싸게 팔고있는 것들은 전혀 근거없는 상행위 이므로 현혹되지 말아야 하겠습니다. 미국등 선진 여러나라에서도 화분은 일체의 가공이 필요없는 자연상태로 먹고 있습니다. </p>
				        <h3 class="title_txt">자연식품 화분의 이용</h3>
				        <p>화분은 의약품이 아닙니다. 순수한 자연에 의해서 얻어지는 자연의 산물로 인체가 요구하는 영양소를 고르게 공급하는 고단위 영양식품으로서 산성체질을 알칼리성으로 개선 중성화시켜 주므로써 질병을 예방하고 질병에 대한 자연 치유력을 높여주는 양봉산물(꿀벌의 선물)인것 입니다. <br>
				            화분은 체력증강, 저항력증강, 갱년기장애, 여성의 피부미용에 더욱좋은 식품입니다.</p>
				
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
