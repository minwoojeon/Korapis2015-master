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
                    <h2 class="page_title">한 벌꿀 생산이력 검색</h2>
                    <div class="location">홈 &gt; 양봉산물연구소 &gt; <span>한 벌꿀 생산이력 검색</span></div>
                </div>
                
                <div class="sub_body_box">
					<h3 class="title_txt">한 벌꿀 생산이력 <font color="red">큐알코드</font>로 확인하세요!</h3>
					<p class="sub_title">한벌꿀이란?</p><br>
                	<div class="honeySchTxtArea">
						<div class="honeySchTxt">
							<p>한 벌꿀은 우리나라의 양봉농가 들이 모여서 만든 공동 브랜드로<br>
							(사)한국양봉협호의 양봉산물 검사소에서 검사 후 등급을 부여받아 철저한 품질관리를 통해 유통되고 있습니다.<br><br>
							한벌꿀은 1+ 등급과 1등급 2가지고 분류가 되며 탄소동위원소를 비롯한 잔류농약, 항생제 등 25가지의 각종 검사를 통해 등급이 부여되며<br> 
							1+와 1등급의 차이는 탄소동위원소와 수분 함량에 따라 결정이 되며 구입하신 벌꿀제품상단의 등급필증에서 확인하실 수 있습니다.<br><br>
							또한 등급필증에 있는 큐알코드와 일련번호를 통하여 구입하신 벌꿀의 생산지역, 생산자, 생산년도, 유통기한 등급 품질관자를 즉시 확인할 수 있습니다.
							</p>
						</div>
						<div class="honeySchTxtImg"><img src="/images/han-honey_logo.jpg"/></div>
					</div>


					<h3 class="title_txt">한 벌꿀 생산이력 검색방법</h3>
					<p class="sub_title">일련번호로 검색하기</p><br>
					<p>
						구입하신 제품의 뚜껑, 라벨에 부착된 한 벌꿀 품질마크에 표기된 <font color="red">일련번호를 검색창에 입력하시면</font> 제품의 이력을 조회할 수 있습니다.<br><br>
						<!--form action="sub5-5.jsp">
							일련번호: <input type="text" name="qrcd" width="50"> <input type="submit">
						</form-->

						<div class="taC mt20">
							<img src="/images/han-honey_certB.png"/>
						</div>
					</p>

					<p class="sub_title">큐알코드로 검색하기</p><br>					
					<p>
						구입하신 제품의 뚜껑, 라벨에 부착된 한 벌꿀 품질마크에 표기된 <font color="red">큐알코드를 큐알코드 스케너로 촬영하시면</font> 제품의 이력을 조회할 수 있습니다.<br><br>
						<div class="taC mt20">
							<img src="/images/han-honey_certA.png"/ >
						</div>
						<div class="mt50 taC">
							<a href="https://play.google.com/store/apps/details?id=com.google.zxing.client.android" target="_blank" class="btn twoLine main">Android 큐알코드 스캐너 <br>다운로드 받기</a>
							<a href="https://apps.apple.com/kr/app/qr%EC%BD%94%EB%93%9C-%EB%A6%AC%EB%8D%94-qr-code-reader/id1080558159" target="_blank" class="btn twoLine sub">iOS 큐알코드 스캐너 <br>다운로드 받기</a>
						</div>
					</p>
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
