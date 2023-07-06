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
            		<h2 class="page_title">찾아오시는길</h2>
                	<div class="location">홈 &gt; 협회소개 &gt; <span>찾아오시는길</span></div>
                </div>
                <div class="sub_body_box">
                	<h3 class="title_txt">찾아오시는길</h3>
					<ul class="tab_list grid_4">
					    <li class="on"><a href="/jsp/sub1-7.jsp" target="_self" class="go">지도</a></li>
					    <li><a href="/jsp/sub1-7_01.jsp" target="_self" class="go">이미지</a></li>
					</ul>

					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=af39bf7dc9594d0f1ea55c9a76c04303"></script>
					<div class="mediabox">
						<div id="kakao-map"></div>
					    <!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.8930819078805!2d127.01516645098839!3d37.48684936393547!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1151b84fbf5%3A0x748d322ebfab2ad8!2z7ZWc6rWt7JaR67SJ7ZiR7ZqM!5e0!3m2!1sko!2skr!4v1421110577332" frameborder="0"></iframe> -->
					</div>
					<script type="text/javascript">
					var lng = 127.01626215977149;
					var lat = 37.48637228731779;
					
					var container = document.getElementById('kakao-map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(lat, lng), //지도의 중심좌표.
						level: 3 //지도의 레벨(확대, 축소 정도)
					};

					var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

					// 마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(lat, lng); 

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    position: markerPosition
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);

					var iwContent = ['<div style="box-sizing:border-box; padding:5px;">',
								'<strong style="font-size:1.15rem; color:#454545; font-weight:bold;">사단법인 한국양봉협회</strong>',
								'<br>',
								'<a href="https://map.kakao.com/link/map/사단법인%20한국양봉협회,'+lat+','+lng+'" style="color:blue" target="_blank">큰지도보기</a>',
								' | <a href="https://map.kakao.com/link/to/사단법인%20한국양봉협회,'+lat+','+lng+'" style="color:blue" target="_blank">길찾기</a>',
							'</div>'].join(''), // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker); 
					</script>

					<p class="sub_title">교통편</p>
					<div class="bg_box">지하철 3호선 남부터미널역 1번 출구 1분거리</div>
					<p class="sub_title">주소</p>
					<div class="bg_box">(06643)서울시 서초구 서초중앙로6길9, 제2축산회관 4층</div>
					<p class="sub_title">연락처</p>
					<div class="bg_box">TEL : 02-3486-0882~5 / FAX : 02-3486-0886 / E-mail:apiary@korapis.or.kr</div>
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
