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
				        <li class="on"><a href="/jsp/sub4-2_01.jsp" target="_self">벌꿀에 함유된 비타민</a></li>
				        <li><a href="/jsp/sub4-2_02.jsp" target="_self">벌꿀에 함유된 유기물</a></li>
				        <li><a href="/jsp/sub4-2_03.jsp" target="_self">백화의 정액 벌꿀</a></li>
				        <li><a href="/jsp/sub4-2_04.jsp" target="_self">벌꿀의 이용</a></li>
				        <li><a href="/jsp/sub4-2_05.jsp" target="_self">벌꿀의 종류</a></li>
				        <li><a href="/jsp/sub4-2_06.jsp" target="_self">색깔별 벌꿀 등급</a></li>
				        <li><a href="/jsp/sub4-2_07.jsp" target="_self">벌꿀의 결정</a></li>
				    </ul>
				    
                    <ul class="tab_list grid_2 ver_m">
                        <li><a href="/jsp/sub4-2.jsp" target="_self">벌꿀의 성분 및 효능</a></li>
                        <li class="on"><a href="/jsp/sub4-2_01.jsp" target="_self">벌꿀에 함유된 비타민</a></li>
                        <li><a href="/jsp/sub4-2_02.jsp" target="_self">벌꿀에 함유된 유기물</a></li>
                        <li><a href="/jsp/sub4-2_03.jsp" target="_self">백화의 정액 벌꿀</a></li>
                        <li><a href="/jsp/sub4-2_04.jsp" target="_self">벌꿀의 이용</a></li>
                        <li><a href="/jsp/sub4-2_05.jsp" target="_self">벌꿀의 종류</a></li>
                        <li><a href="/jsp/sub4-2_06.jsp" target="_self">색깔별 벌꿀 등급</a></li>
                        <li><a href="/jsp/sub4-2_07.jsp" target="_self">벌꿀의 결정</a></li>
                    </ul>
				
				
				    <h3 class="title_txt">벌꿀에 함유된 비타민</h3>
				
				    <table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="벌꿀에 함유된 비타민">
				        <caption>벌꿀에 함유된 비타민</caption>
				        <colgroup>
				            <col>
				            <col>
				            <col>
				            <col>
				        </colgroup>
				        <thead>
				            <tr>
				                <th>종류</th>
				                <th>함량</th>
				                <th>작용</th>
				                <th>결핍증</th>
				            </tr>
				        </thead>
				        <tbody>
				            <tr>
				                <td>B1</td>
				                <td>5.5</td>
				                <td class="t_left">탄수화물대사</td>
				                <td class="t_left">각기, 당뇨병</td>
				            </tr>
				            <tr>
				                <td>B2</td>
				                <td>61.0</td>
				                <td class="t_left">발육촉진,간장기능 강화,피부조성</td>
				                <td class="t_left">영양장해,구강염,간장장해</td>
				            </tr>
				            <tr>
				                <td>B6</td>
				                <td>299.0</td>
				                <td class="t_left">피부건강 유지</td>
				                <td class="t_left">피부염,습진</td>
				            </tr>
				            <tr>
				                <td>엽산</td>
				                <td>3.0</td>
				                <td class="t_left">조혈, 성장 촉진</td>
				                <td class="t_left">악성빈혈</td>
				            </tr>
				            <tr>
				                <td>니코틴산</td>
				                <td>0.1</td>
				                <td class="t_left">조혈, 성장 촉진</td>
				                <td class="t_left">피부염(펠라그라)</td>
				            </tr>
				            <tr>
				                <td>판토텐산</td>
				                <td>115.0</td>
				                <td class="t_left">성장 촉진, 노화 예방</td>
				                <td class="t_left">노인병</td>
				            </tr>
				            <tr>
				                <td>비오틴</td>
				                <td>0.066</td>
				                <td class="t_left">중년이후 발육 촉진</td>
				                <td class="t_left">영양장해</td>
				            </tr>
				            <tr>
				                <td>C</td>
				                <td>2.4</td>
				                <td class="t_left">노화 예방, 조혈, 저항력 보강</td>
				                <td class="t_left">괴혈병,빈혈</td>
				            </tr>
				            <tr>
				                <td>K</td>
				                <td>25.0</td>
				                <td class="t_left">지혈, 해독, 이뇨</td>
				                <td class="t_left">&nbsp;</td>
				            </tr>
				            <tr>
				                <td>클린</td>
				                <td>1.5</td>
				                <td class="t_left">발육 촉진</td>
				                <td class="t_left">발육부진 </td>
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
