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
                    <h2 class="page_title">벌꿀의 성분 및 효능</h2>
                    <div class="location">홈 &gt; 양봉산물 &gt; <span>벌꿀의 성분 및 효능</span></div>
                </div>
                
				<div class="sub_body_box">
				    <ul class="tab_list grid_4 ver_pc">
				        <li><a href="/jsp/sub4-2.jsp" target="_self">벌꿀의 성분 및 효능</a></li>
				        <li><a href="/jsp/sub4-2_01.jsp" target="_self">벌꿀에 함유된 비타민</a></li>
				        <li><a href="/jsp/sub4-2_02.jsp" target="_self">벌꿀에 함유된 유기물</a></li>
				        <li><a href="/jsp/sub4-2_03.jsp" target="_self">백화의 정액 벌꿀</a></li>
				        <li><a href="/jsp/sub4-2_04.jsp" target="_self">벌꿀의 이용</a></li>
				        <li><a href="/jsp/sub4-2_05.jsp" target="_self">벌꿀의 종류</a></li>
				        <li class="on"><a href="/jsp/sub4-2_06.jsp" target="_self">색깔별 벌꿀 등급</a></li>
				        <li><a href="/jsp/sub4-2_07.jsp" target="_self">벌꿀의 결정</a></li>
				    </ul>
				    
                    <ul class="tab_list grid_2 ver_m">
                        <li><a href="/jsp/sub4-2.jsp" target="_self">벌꿀의 성분 및 효능</a></li>
                        <li><a href="/jsp/sub4-2_01.jsp" target="_self">벌꿀에 함유된 비타민</a></li>
                        <li><a href="/jsp/sub4-2_02.jsp" target="_self">벌꿀에 함유된 유기물</a></li>
                        <li><a href="/jsp/sub4-2_03.jsp" target="_self">백화의 정액 벌꿀</a></li>
                        <li><a href="/jsp/sub4-2_04.jsp" target="_self">벌꿀의 이용</a></li>
                        <li><a href="/jsp/sub4-2_05.jsp" target="_self">벌꿀의 종류</a></li>
                        <li class="on"><a href="/jsp/sub4-2_06.jsp" target="_self">색깔별 벌꿀 등급</a></li>
                        <li><a href="/jsp/sub4-2_07.jsp" target="_self">벌꿀의 결정</a></li>
                    </ul>
				
				
				    <h3 class="title_txt">색깔별 벌꿀 등급</h3>
				    <p class="pl20">한국양봉협회 봉산물연구소에서 보유하고 있는 벌꿀색깔 등급기(Pfund Colour Grader) 국제무역에서는 벌꿀의 등급에 따라 가격차가 많이나는데 이 등급기에 의해 색깔에 따라 벌꿀의 등급이 결정됩니다. </p>
				
				    <table class="product_table mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="색깔별 벌꿀 등급">
				        <caption>색깔별 벌꿀 등급</caption>
				        <colgroup>
				            <col width="60">
				            <col>
				            <col width="100">
				            <col>
				        </colgroup>
				        <tbody>
				            <tr>
				                <td><img src="/images/4-1_b01.gif" alt="Water White 물처럼 맑은색"></td>
				                <td>water white 물처럼 맑은색</td>
				                <td>0~8mm</td>
				                <td class="t_left">아카시아, 사과꿀 등</td>
				            </tr>
				            <tr>
				                <td><img src="/images/4-1_b02.gif" alt="Extra White 아주 맑은색"></td>
				                <td>Extra White 아주 맑은색</td>
				                <td>8~16.5mm</td>
				                <td class="t_left">클로버, 칠엽수, 오렌지, 자운영꿀 등</td>
				            </tr>
				            <tr>
				                <td><img src="/images/4-1_b03.gif" alt="White 맑은색"></td>
				                <td>White 맑은색</td>
				                <td>16.5~34mm</td>
				                <td class="t_left">유채, 피나무, 해바라기꿀, 싸리꿀 등</td>
				            </tr>
				            <tr>
				                <td><img src="/images/4-1_b04.gif" alt="Extra Light Amber 아주 연한 호박색"></td>
				                <td>Extra Light Amber 아주 연한 호박색</td>
				                <td>34~50mm</td>
				                <td class="t_left">유칼리, 목화, 옻나무꿀 등</td>
				            </tr>
				            <tr>
				                <td><img src="/images/4-1_b05.gif" alt="Light Amber 연한 호박색"></td>
				                <td>Light Amber 연한 호박색</td>
				                <td>50~85mm</td>
				                <td class="t_left">잡화꿀</td>
				            </tr>
				            <tr>
				                <td><img src="/images/4-1_b06.gif" alt="Amber 호박색"></td>
				                <td>Amber 호박색</td>
				                <td>80~114mm</td>
				                <td class="t_left">잡화꿀</td>
				            </tr>
				            <tr>
				                <td><img src="/images/4-1_b07.gif" alt="Dark 암갈색"></td>
				                <td>Dark 암갈색</td>
				                <td>114mm</td>
				                <td class="t_left">메밀, 밤나무 등의 잡화꿀</td>
				            </tr>
				        </tbody>
				    </table>
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
