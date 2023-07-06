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
<script src="/js/jquery-1.8.3.min.js" ></script>
<style type="text/css">

</style>
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
                    <h2 class="page_title">아이디/비밀번호 찾기</h2>
                    <div class="location">홈  &gt; 운영체제 &gt; <span>아이디/비밀번호 찾기</span></div>
                </div>
                
                <div class="sub_body_box">
					<div class="login mt50" >
						<form name="" id="" method="" action="">
							<p class="login_top" style="padding: 10px 0 7px;font-size: 15px;border-bottom: 1px solid #cfcfcf;margin-bottom: 10px;text-align: center;">
							<strong>가입하신 이메일을 입력해주세요.</strong><br/>
아이디와 비밀번호가 가입하신 메일로 발송됩니다.
</p>

							<p class="error" style="display: none;" ><img src="/images/ex_mark.png" alt="" style="float:left;">
							<span style="display:block; margin-left:50px">가입된 회원이 아니거나 이메일이 틀립니다.<br/>
이메일 주소는 대소문자를 구분합니다.</span></p>	
				
							<div class="j_login">
								
								<p class="item">
									<label for="" class="i_label" >E-mail</label>
									<input type="text" id="" class="in_txt" value="" tabindex="">
								</p>								
								<p class="taC">
									<a href="javascript: alert('준비중입니다.')" class="btn full sub2">아이디 / 비밀번호 찾기 <span style="font-weight:normal;">(E-mail 발송)</span></a>
								</p>
							</div>
							
						</form>
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
