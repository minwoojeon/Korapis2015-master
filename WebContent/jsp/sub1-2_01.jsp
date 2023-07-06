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
                	<div class="location">홈  &gt; 협회소개 &gt; <span>설립목적 및 연혁</span></div>
                </div>
                <div class="sub_body_box">
                	<div class="intro">
					<h3 class="title_txt">협회설립목적</h3>
					<p>본회는 회원의 권익보호와 회원 상호 협력으로 양봉업의 육성을 도모하고 꿀벌에 의한 농작물의 화분매개 촉진으로 농산물 증산에 기여하며 양봉산물 생산증대로 국민보건향상에 이바지함을 목적으로 한다.</p>

					<h3 class="title_txt">허가 연월일</h3>
					<p>1976. 12. 28</p>

					<h3 class="title_txt">정관에서 정한사업</h3>
					<ol>
						<li>1. 꿀벌의 보호증식, 종봉개량과 우량종봉의 보급 및 사양관리에 관한 지도사업</li>
						<li>2. 양봉산물 생산증대를 위한 밀원식물 보호와 조성사업</li>
						<li>3. 양봉산물 품질검사를 통한 품질향상에 관한 지도사업</li>
						<li>4. 양봉농가 기술교육 및 홍보 활동</li>
						<li>5. 꿀벌의 질병예방과 치료에 관한 연구사업</li>
						<li>6. 국제기구를 통한 양봉 신기술 연구 및 정보교류에 관한 사업</li>
						<li>7. 양봉기자재 개발 지원 및 보급사업</li>
						<li>8. 국내외 양봉제품개발 관련 시장조사 및 시장개척사업</li>
						<li>9. 양봉산물 수급대책 수립 및 소비확대에 관한 사업</li>
						<li>10. 양봉산물의 제품개발 연구사업, 특화단지, 브랜드 사업</li>
						<li>11. 양봉자조금 사업</li>
						<li>12. 기타 양봉산업 발전을 위하여 필요로 하는 사업</li>
					</ol>


					<h3 class="title_txt">협회연혁</h3>
					<ul class="tab_list grid_3">
						<li><a href="/jsp/sub1-2.jsp" target="_self"  class="go">2011~현재</a></li>
						<li class="on"><a href="/jsp/sub1-2_01.jsp" target="_self" class="go">2001년~2010년</a></li>
						<li><a href="/jsp/sub1-2_02.jsp" target="_self" class="go">1967년~2000년</a></li>
					</ul>

                    <div>
						<table class="table_ver" width="100%" border="0" cellpadding="0" cellspacing="0" summary="2001년~2010년 연혁">
						    <caption>2001년~2010년 연혁</caption>
						    <colgroup>
						        <col width="20%">
						        <col width="*">
						    </colgroup>
						    <tbody>
						        <tr>
						            <th>2010년 11월 </th>
						            <td>벌꿀공동브랜드 한 벌꿀 출범</td>
						        </tr>
						        <tr>
						            <th>2010년 09월 </th>
						            <td>양봉산업 비전 2015 심포지엄 개최 </td>
						        </tr>
						        <tr>
						            <th>2010년 07월 </th>
						            <td>벌꿀공동브랜드 한 벌꿀 출범 </td>
						        </tr>
						        <tr>
						            <th>2010년 06월 </th>
						            <td>정부 및 대국민 꿀벌 살리기 캠페인 </td>
						        </tr>
						        <tr>
						            <th>2009년 10월 </th>
						            <td>양봉산업발전을 위한 국제 심포지움 개최 </td>
						        </tr>
						        <tr>
						            <th>2009년 09월 </th>
						            <td>제41회 세계양봉대회(프랑스 몽펠리에) 참가 </td>
						        </tr>
						        <tr>
						            <th rowspan="2">2009년 07월 </th>
						            <td>사양벌꿀 자율표시제도 시행 </td>
						        </tr>
						        <tr>
						            <td>양봉산업발전연구회 발족</td>
						        </tr>
						        <tr>
						            <th>2009년 04월 </th>
						            <td>밀원수 식재사업(아까시나무 묘목 분양) </td>
						        </tr>
						        <tr>
						            <th>2009년 03월 </th>
						            <td>농림수산식품부 29개 대표품목 선정 </td>
						        </tr>
						        <tr>
						            <th>2009년 02월 </th>
						            <td>농림수산식품부 축산경영과 양봉담당 부서 신설 </td>
						        </tr>
						        <tr>
						            <th rowspan="2">2008년 11월 </th>
						            <td>제9회 아시아양봉대회(중국 항주) 참가 </td>
						        </tr>
						        <tr>
						            <td>제10회 2010년 아시아양봉대회 유치권 획득</td>
						        </tr>
						        <tr>
						            <th>2008년 07월 </th>
						            <td>밀원수 조림육성협회 창립 </td>
						        </tr>
						        <tr>
						            <th>2008년 02월 </th>
						            <td>정관 및 임원/지회장 선거관리 규정 개정 </td>
						        </tr>
						        <tr>
						            <th>2007년 10월 </th>
						            <td>세계프로폴리스 사이언스 포럼(대전) 개최 </td>
						        </tr>
						        <tr>
						            <th rowspan="2">2007년 09월 </th>
						            <td>제40회 세계양봉대회(호주 멜버른) 참가</td>
						        </tr>
						        <tr>
						            <td>2010년 제9회 아시아양봉대회 유치 </td>
						        </tr>
						        <tr>
						            <th>2007년 08월 </th>
						            <td>2010년 제9회 아시아양봉대회 유치 </td>
						        </tr>
						        <tr>
						            <th>2006년 12월 </th>
						            <td>우크라이나 대통령 방문 </td>
						        </tr>
						        <tr>
						            <th>2006년 08월 </th>
						            <td>해외연수교육 2회 시행(중국 갈림성) </td>
						        </tr>
						        <tr>
						            <th>2006년 05월 </th>
						            <td>프로폴리스 원산지 표시 의무화 </td>
						        </tr>
						        <tr rowspan="2">
						            <th>2006년 03월 </th>
						            <td>사무실 이전 및 입주(서울시 서초구 서초1동 1621-19번지 제2축산회관 4층) </td>
						        </tr>
						        <tr>
						            <td>제8회 아시아양봉대회(호주 퍼스(Perth)) 참가</td>
						        </tr>
						        <tr>
						            <th>2005년 11월 </th>
						            <td>개성공업지구 가을철 나무심기 작업차 북한 방문 </td>
						        </tr>
						        <tr>
						            <th>2005년 08월 </th>
						            <td>제39회 세계양봉대회(아일랜드 더블린) 참가 </td>
						        </tr>
						        <tr>
						            <th>2005년 05월 </th>
						            <td>WTO(DDA) 농업협상(농업위원회) 개최 </td>
						        </tr>
						        <tr>
						            <th>2004년 11월 </th>
						            <td>벌꿀 잔류에 관한 국제 심포지움 개최 </td>
						        </tr>
						        <tr>
						            <th>2004년 03월 </th>
						            <td>우리나라 밀원식물 책자 제작 및 배포 </td>
						        </tr>
						        <tr>
						            <th>2004년 02월 </th>
						            <td>제7회 아시아양봉대회(필리핀 마닐라) 참가 </td>
						        </tr>
						        <tr>
						            <th>2003년 3월 </th>
						            <td>국내·외 꿀벌 내성에 관련된 책자 제작 및 배포 </td>
						        </tr>
						        <tr>
						            <th>2003년 12월 </th>
						            <td>벌꿀요리책자 발간 </td>
						        </tr>
						        <tr>
						            <th>2002년 2월 </th>
						            <td>제6회 아시아 양봉대회 </td>
						        </tr>
						        <tr>
						            <th>2001년 5월 </th>
						            <td>칠곡군 제2회 아카시아 벌꿀축제 개최 </td>
						        </tr>
						        <tr>
						            <th>2001년 10월 </th>
						            <td>세계양봉대회(케나다) </td>
						        </tr>
						
						    </tbody>
						</table>
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
