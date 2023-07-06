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
<link rel="stylesheet" href="/css/style.css" >
<link href="/css/sub.css"  rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.8.3.min.js" ></script>


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
                    <h2 class="page_title">회원가입</h2>
                    <div class="location">홈 &gt; 운영체제 &gt; <span>회원가입</span></div>
                </div>
                
                <div class="sub_body_box ">
                <!-- <p>한국양봉 회원가입은 협회회원과 일반회원으로 구분하여 등록합니다.<br/>가입절차를 따라 회원으로 등록해주시기 바랍니다.</p>  -->
                	<div class="joinArea01">
	                	<ul>
	                		<li>
	                			<p class="sub_title">협회회원</p>
	                			<p class="pl20">양봉종사자로 가입비 50,000원 / <br/>연협회비 100,000을 납부한다.</p>
	                			<p class="pl20"><a href="/jsp/sub7-2_00.jsp" class="btn sub2">협회회원 가입하기 ></a></p>
	                		</li>            	
	                	</ul>
	                	
                	</div>
				</div>
		</div>
				<!-- } 회원가입 약관 동의 끝 -->
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
