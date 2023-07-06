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
        	
            <!-- sub_con START -->
<div id="sub_con_box">
            	<div class="sub_top_box">
                	<div class="location">홈 &gt; 홍보센터 &gt; <span>양봉협회보</span></div>
                    <h2>양봉협회보</h2>
                </div>
                <div class="sub_body_box">
<link rel="stylesheet" href="/css/style2.css">           
<link rel="stylesheet" href="/css/style1.css">

<!-- 게시물 읽기 시작 { -->
<article id="bo_v" style="width:100%">
    <header>
        <h1 id="bo_v_title">
            양봉협회보        </h1>
    </header>

    <section id="bo_v_info">
        <h2>페이지 정보</h2>
        작성자 <strong><span class="sv_member">한국양봉협회</span></strong>
        <span class="sound_only">작성일</span><strong>14-06-22 14:11</strong>
        조회<strong>10회</strong>
        댓글<strong>0건</strong>
    </section>

    
        <!-- 첨부파일 시작 { -->
    <section id="bo_v_file">
        <h2>첨부파일</h2>
        <ul>
                    <li>
                <a href="" class="view_file_download">
                    <img src="/images/icon_file.gif" alt="첨부">
                    <strong>201405.pdf</strong>
                     (24.6M)
                </a>
                <span class="bo_v_file_cnt">1회 다운로드</span>
                <span>DATE : 2014-06-22 14:11:06</span>
            </li>
                </ul>
    </section>
    <!-- } 첨부파일 끝 -->
    
    
  

    <section id="bo_v_atc">
        <h2 id="bo_v_atc_title">본문</h2>

        <div id="bo_v_img">
<a href="/view_image.php?bo_table=bbs_letter&amp;fn=3718138848_gr5EA27O_201405.png" target="_blank" class="view_image"><img src="/3718138848_gr5EA27O_201405.png" alt="" title="" style="width: 188px; height: 238px;"></a></div>

        <!-- 본문 내용 시작 { -->
        <div id="bo_v_con"><div><img alt="2014년 5월호 목차" height="749" src="/3718138848_1403414123.2.png" width="586" style="width: 586px; height: 749px;"></div>
</div>
                <!-- } 본문 내용 끝 -->


    </section>

    
    



    <!-- 링크 버튼 시작 { -->
    <div id="bo_v_bot">
                
        <ul class="bo_v_com">
                                                                        <li><a href="./board.php?bo_table=bbs_letter&amp;page=" class="btn_b01">목록</a></li>
                                </ul>
            </div>
    <!-- } 링크 버튼 끝 -->

</article>
<!-- } 게시판 읽기 끝 -->
              </div>
            </div>
            
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
