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
                    <h2 class="page_title">실험진행순서</h2>
                    <div class="location">홈 &gt; 양봉산물연구소 &gt; <span>실험진행순서</span></div>
                </div>
                
                <div class="sub_body_box">

    <h3 class="title_txt">검사항목 <a class="sbtn sub2" href="javascript:void(0);" onclick="window.open('/jsp/sub5-3popup.jsp','5-3popup1','width=800,height=650, scrollbars=yes')">자세히</a></h3>

    <table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="검사항목">
        <caption>검사항목</caption>
        <colgroup>
            <col width="*">
            <col width="*">
            <col width="*">
        </colgroup>
        <thead>
            <tr>
                <th>검사항목</th>
                <th>식품공전규격 (벌집꿀기준)</th>
                <th>양봉협회 벌꿀 품질규격 (벌집꿀기준)</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>성상</td>
                <td colspan="2">고유의 색택과 향미를 가지고 점조성이 있어야 한다.</td>
            </tr>
            <tr>
                <td>수분(%)</td>
                <td>20.0 이하 (23.0 이하)</td>
                <td>20.0 이하 (23.0 이하)</td>
            </tr>
            <tr>
                <td>전화당(%)</td>
                <td>60.0 이상 (50.0 이상)</td>
                <td>60.0 이상 (50.0 이상)</td>
            </tr>
            <tr>
                <td>자당(%)</td>
                <td>7.0 이하 (15.0 이하)</td>
                <td>7.0 이하 (15.0 이하)</td>
            </tr>
            <tr>
                <td>산도(meq/kg)</td>
                <td>40.0 이하 (40.0 이하)</td>
                <td>40.0 이하 (40.0 이하)</td>
            </tr>
            <tr>
                <td>HMF(mg/kg)</td>
                <td>80.0 이하 (80.0 이하)</td>
                <td>80.0 이하 (80.0 이하)</td>
            </tr>
            <tr>
                <td>물불용물(%)</td>
                <td>0.5 이하 (0.5 이하)</td>
                <td>0.5 이하 (0.5 이하)</td>
            </tr>
            <tr>
                <td>사카린나트륨</td>
                <td>불검출 (불검출)</td>
                <td>불검출 (불검출)</td>
            </tr>
            <tr>
                <td>타르색소</td>
                <td>불검출 (불검출)</td>
                <td>불검출 (불검출)</td>
            </tr>
            <tr>
                <td>이성화당</td>
                <td>음성 (음성)</td>
                <td>음성 (음성)</td>
            </tr>
            <tr>
                <td>탄소동위원소비율(‰)</td>
                <td>-22.5‰이하 벌꿀 / -22.5‰초과 사양꿀</td>
                <td>-22.5‰이하 벌꿀 / -22.5‰초과 사양꿀</td>
            </tr>
            <tr>
                <td>당비율(%)</td>
                <td>- ( - )</td>
                <td>- ( - )</td>
            </tr>
            <tr>
                <td>잔류물질</td>
                <td>12항목</td>
                <td>13항목</td>
            </tr>
        </tbody>
    </table>


    <h3 class="title_txt">실험 진행 순서 <a class="sbtn sub2" href="/jsp/common/download.jsp?fileName=%EA%B2%80%EC%82%AC%EC%84%9C.hwp&fileURL=/html/request_2.hwp" target="_blank">검사 의뢰서 다운로드</a></h3>
	<div class="stepArea02">
	   <div class="stepline01">
	       <div class="step_box">
	           <p>의뢰시료(600G)+<br>의뢰서 동봉 후 협회로 배송</p>
	       </div>
	       <img class="step_arrow step_right" src="/images/icon_step_right.png" alt="→">
	       <div class="step_box">
	           <p>검사 금액 납부<br>계좌번호<br><span>농협 301-0143-1466-21</span></p>
	       </div>
	       <img class="step_arrow step_right"  src="/images/icon_step_right.png" alt="→">
	       <div class="step_box">
	           <p>의뢰서 확인 후 접수</p>
	       </div>
	   </div>
	
	   <div class="stepline02"><img class="step_arrow step_down"  src="/images/icon_step_down.png" alt="↓"></div>
	
	   <div class="stepline03">
	       <div class="step_box">
	           <p>성적서 발송</p>
	       </div>
	       <img class="step_arrow step_left"  src="/images/icon_step_left.png" alt="←">
	       <div class="step_box">
	           <p>성적서 발행</p>
	       </div>
	       <img class="step_arrow step_left"  src="/images/icon_step_left.png" alt="←">
	       <div class="step_box">
	           <p>검사 진행</p>
	       </div>
	   </div>
	</div>
    <p class="mt10">성수기( 5~10월 ) : 검사비 납부 후 3~4주 / 비수기 (11월~4월): 검사비 납부 후 1~2주</p>


    <h3 class="title_txt">실험항목 / 수수료</h3>

    <table class="table_hor stable mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="잔류물질 기준">
        <caption>잔류물질 기준</caption>
        <colgroup>
            <col width="*">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="8.3%">
            <col width="9.5%">

        </colgroup>
        <thead>
            <tr>
                <th>구분</th>
                <th colspan="9">벌꿀</th>
                <th>벌집꿀</th>
                <th>비회원</th>
            </tr>
            <tr>
                <th>항목</th>
                <th>봉인</th>
                <th>한벌꿀</th>
                <th>전체</th>
                <th>일반</th>
                <th>잔류</th>
                <th>탄소비</th>
                <th>일반<br>잔류</th>
                <th>일반<br>탄소</th>
                <th>잔류<br>탄소</th>
                <th>전체</th>
                <th>전체</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>수수료<br>(단위: 원)</td>
                <td>80,000</td>
                <td>80,000</td>
                <td>80,000</td>
                <td>50,000</td>
                <td>70,000</td>
                <td>40,000</td>
                <td>120,000</td>
                <td>90,000</td>
                <td>110,000</td>
                <td>80,000</td>
                <td>800,000</td>
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
