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
		
<!-- sub_wrap START -->
 	<div id="sub_wrap">
 	
		<jsp:include page="inc/header.jsp" />
		
        <!-- sub_contents START -->
        <div id="sub_contents">
        	
        	<jsp:include page="inc/leftmenu.jsp" />
        	
            <!-- sub_con START -->
           <div id="sub_con_box">
            	<div class="sub_top_box">
                	<div class="location"><img src="/images/home_icon.gif" alt="home" style="margin-top:-2px;"> &gt; 양봉산물연구소 &gt; <span>양봉산물 연구소 운영</span></div>
                    <h2><span>양봉산물</span> 연구소 운영</h2>
                </div>
                <div class="sub_body_box">
					<ul>
                        <li style="padding-left:10px;">
<p style="font-size:11pt; color:#a07e52; font-weight:bold"><strong style="color:#e4362b;">꿀벌을 관리함</strong>에 있어 기본 원칙은 있으나 하나로 집약된 원안은 없다는 말이 있다. <br/>
이말은 <strong style="color:#e4362b;">꿀벌은 대자연의 기후 조건에 매우 민감</strong>하므로 사육지역의 기후조건과 주변 환경에 따라 <br/>
절대적 영향을 받을 뿐 아니라 여러 가지 상황 변화가 발생 될 수 있기 때문이다.<br/>
꿀벌을 관리함에 있어서는 <strong style="color:#e4362b;">꿀벌을 사랑하는 마음과 항상 연구하고 노력하는 추진력</strong>이 뒤따라야 한다.<br/>
서적이나 강의를 통해 꿀벌관리의 원칙을 잘 습득한 다음 이를 토대로 타인의 관리 기술 등을 참고하여 <br/>
자신의 꿀벌사육지역 및 기후조건 등에 맞는 관리 기술을 개발하여 <br/>
<strong style="color:#e4362b;">새로운 자신의 꿀벌 관리기술로 발전시켜 나가야 한다.</strong><br/><br/></p>

</li>
						<li class="title" style="margin-top:20px;">꿀벌관리에 몇가지 유의해야할 사항들이 있다.</li>
                        <li class="text_2">① 꿀벌 관리는 자연, 자유, 습성 등 꿀벌들의 3대 요소에 상응한 기본 원칙 준수<br>
② 대자연의 기후조건 및 주변 환경에 절대적 영향 및 반응<br>
③ 꿀벌을 사랑하는 마음과 지속적으로 연구하고 노력하는 추진력의 필요성<br>
④ 꿀벌을 사육하는 지역의 환경과 기후 절기에 맞는 자신의 관리 기술 개발과 경영 관리<br>
⑤ 자신의 생각이나 이론에만 집착된 관리 지양<br>
⑥ 양봉 경력이 쌓여 갈수록 꿀벌관리 및 경영의 난이도에 대한 이해 및 신기술 습득 노력.</li>
                    </ul>
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
