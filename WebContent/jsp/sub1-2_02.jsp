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
						<li><a href="/jsp/sub1-2_01.jsp" target="_self" class="go">2001년~2010년</a></li>
						<li class="on"><a href="/jsp/sub1-2_02.jsp" target="_self" class="go">1967년~2000년</a></li>
					</ul>

                    <div>
						<table class="table_ver" width="100%" border="0" cellpadding="0" cellspacing="0" summary="1967년~2000년 연혁">
						    <caption>1967년~2000년 연혁</caption>
						    <colgroup>
						        <col width="20%">
						        <col width="*">
						    </colgroup>
						    <tbody>
						
						        <tr>
						            <th>2000년 4월 </th>
						            <td>아까시나무 시범림 2㏊ 추가 조성 </td>
						        </tr>
						        <tr>
						            <th>2000년 3월 </th>
						            <td>제5회 아시아양봉대회(태국 치앙마이) 최우수업적상 수상 </td>
						        </tr>
						        <tr>
						            <th>1999년 5월 </th>
						            <td>칠곡군과 공동으로 제 1회 아카시아 벌꿀축제 개최(3일간 연 인원 100,000명 참석) </td>
						        </tr>
						        <!--tr>
						            <th>1999년 4월 </th>
						            <td>아까시나무 시범림 1㏊조성(칠보산 연습림-헝가리 도입수종 및 국내선발종 총3,000본) </td>
						        </tr-->
						        <tr>
						            <th>1998년 6월 </th>
						            <td>서울 종로 6가에서 현 주소지로 이전 </td>
						        </tr>
						        <tr>
						            <th>1997년 12월 </th>
						            <td>정부와 합동으로 꿀벌 군수 통계 조사-재해 보상 및 꿀벌방역사업 기준 마련 </td>
						        </tr>
						        <tr>
						            <th>1997년 10월 </th>
						            <td>동계양봉대학 부활(서울농대 양봉과학 연구소) </td>
						        </tr>
						        <tr>
						            <th>1996년 11월 </th>
						            <td>서울농대 이경준교수와 농특과제(다밀성·장화기 우량 아까시나무 선발 및 육종) 수행 </td>
						        </tr>
						        <tr>
						            <th>1994년 3월 </th>
						            <td>정부지원 꿀벌응애류 긴급방제용 구제약제 양봉농가 무상공급 실현 </td>
						        </tr>
						        <tr>
						            <th>1992년 5월 </th>
						            <td>양봉산업의 젖줄인 아카시아나무 보호증식을 위한 [한국아까시나무연구회]창립 참여 </td>
						        </tr>
						        <tr>
						            <th>1990년 7월 </th>
						            <td>우리의 양봉산업 국제경쟁력 배양을 위한 중국의 양봉산업 실태 조사단 파견 </td>
						        </tr>
						        <tr>
						            <th rowspan="2">1990년 6월 </th>
						            <td>[수입개방 이후의 일본 양봉산업 동향]과 [세계의 양봉산업과 벌꿀 무역 현황] 펴냄</td>
						        </tr>
						        <tr>
						            <td>양봉산물 수입개방 대책을 모색하기 위해 오래전에 벌꿀시장을 개방한 일본 양봉업계 시찰,조사보고서 </td>
						        </tr>
						        <tr>
						            <th>1990년 3월 </th>
						            <td>[한국양봉인명록] 펴냄 </td>
						        </tr>
						        <tr>
						            <th>1987년12월 </th>
						            <td>[우리나라 밀원식물의 현황 및 증식방안] 펴냄 </td>
						        </tr>
						        <tr>
						            <th>1987년12월 </th>
						            <td>한국 근대 양봉사를 처음으로 구명한 [한국근대양봉연구] 펴냄 </td>
						        </tr>
						        <tr>
						            <th>1987년 9월 </th>
						            <td>양봉농가 카나다이주 실현 </td>
						        </tr>
						        <tr>
						            <th rowspan="2">1985년10월 </th>
						            <td>APIMONDIA 30차 총회(일본 나고야)에 대규모 대표단 파견 </td>
						        </tr>
						        <tr>
						            <td>- API EXPO-'85에서 우리대표단 종합 [금상]수상</td>
						        </tr>
						        <tr>
						            <th>1984년10월 </th>
						            <td>양봉농가 첫 해외이주사업 실현(아르헨티나) </td>
						        </tr>
						        <tr>
						            <th>1984년 7월 </th>
						            <td>[한국양봉과학연구소]와 공동사업으로 시험양봉장에 꿀벌입식 </td>
						        </tr>
						        <tr>
						            <th>1984년 4월 </th>
						            <td>제12회 [양봉의 날]기념식, 서울대학교 농과대학 중부연습림내에 밀원식물 견본림조성 </td>
						        </tr>
						        <tr>
						            <th>1984년 2월 </th>
						            <td>제1기 겨울 양봉대학 강좌 개설(서울대 농대 [한국양봉과학연구소]에서) </td>
						        </tr>
						        <tr>
						            <th>1981년 8월 </th>
						            <td>제1회 양봉세미나 개최 </td>
						        </tr>
						        <tr>
						            <th>1981년 7월 </th>
						            <td>규격 꿀병 개발 보급 </td>
						        </tr>
						        <tr>
						            <th rowspan="2">1979년 9월 </th>
						            <td>[국제양봉협회 연합기구(APIMONDIA)] 제27차 총회 </td>
						        </tr>
						        <tr>
						            <td>(그리스 아데네에서 개최)에 최초로 한국대표 파견,이후 매회 대표단을 파견함</td>
						        </tr>
						        <tr>
						            <th>1979년 6월 </th>
						            <td>본협회 부설 [양봉산물 검사실] 설치 </td>
						        </tr>
						        <tr>
						            <th>1978년 7월 </th>
						            <td>국제곤충학회 회원국으로 가입 </td>
						        </tr>
						        <tr>
						            <th>1976년12월 </th>
						            <td>사단법인 한국양봉협회 설립허가(농수산부 설립인가 제55호) </td>
						        </tr>
						        <tr>
						            <th>1973년 5월 </th>
						            <td>[국제양봉협회 연합기구(APIMONDIA)]에 정회원국으로 가입 </td>
						        </tr>
						        <tr>
						            <th>1973년 4월 </th>
						            <td>매년 4월4일을 [양봉의 날]로 제정, 제1회 기념행사를 제주도에서 거행 </td>
						        </tr>
						        <tr>
						            <th>1967년 9월 </th>
						            <td>(가칭)한국양봉협회 발기인 총회 </td>
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
