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
            		<h2 class="page_title">회원가입 방법</h2>
                	<div class="location">홈 &gt; 협회소개 &gt; <span>회원가입 방법</span></div>
                </div>
                <div class="sub_body_box">
				    <h3 class="title_txt">회원 자격</h3>
				    <p>- 국내에서 양봉업을 하는 생산농가</p>

				    <h3 class="title_txt">회원 가입</h3>
			        <p>- 신규가입 회원은 가입신청서 제출(해당 각 시&middot;도 지회 지회장 또는 사무국장)과 함께 가입비 및 연회비를 납부</p>
			        <p>- 회비납부 종류 및 기준</p>
				    <table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="회비납부 종류 및 기준">
			            <caption>회비납부 종류 및 기준</caption>
			            <colgroup>
			                <col width="33%" />
			                <col width="33%" />
			                <col width="*" />
			            </colgroup>
			            <thead>
			                <tr>
			                    <th>구 분</th>
			                    <th>금 액</th>
			                    <th>비 고</th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr>
			                    <td>가입비(가입시 공통적용)</td>
			                    <td>50,000원</td>
			                    <td>일반회원</td>
			                </tr>
			                <tr>
			                    <td>연회비</td>
			                    <td>100,000원</td>
			                    <td>&nbsp;</td>
			                </tr>
			                <tr>
			                    <td>합계</td>
			                    <td>150,000원</td>
			                    <td>&nbsp;</td>
			                </tr>
			            </tbody>
			        </table>


				    <h3 class="title_txt">회원 가입시 혜택</h3>
				        <ul class="text_2">
				            <li>- 정기간행물 제공(협회보, 자조금 소식지 등)</li>
				            <li>- 상호정보교환(사양관리, 채밀정보 등)</li>
				            <li>- 각종 정부사업 지원 및 기자제 보조사업 시행 </li>
				            <li> &nbsp;* 각종 정부사업 지원시 필요서류 발행 (회원 확인증, 자조금 납부 확인증, 교육참가 확인서 등)</li>
				            <li>- 양봉산물 판매촉진</li>
				            <li>- 자조금사업을 통한 양봉산물 홍보/소비자 정보제공</li>
				            <li>- 양봉관련 피해 및 민원 발생시 조언 상담</li>
				            <li>- 생산성 향상을 위한 양봉농가 교육(1회 ~ 2회/연)</li>
				            <li>- 양봉산물(벌꿀) 검사(검사비 별도 납부)</li>
				        </ul>
				    </ul>


				    <h3 class="title_txt">가입신청 방법</h3>
					<div class="stepArea02 stepArea03">
					    <div class="step_box">
					        <div>
					            <p class="small_title fcmain">가입희망자</p>
					            <p class="pl10 pt10">신청서 작성 및 가입비, 연회비 납부</p>
					        </div>
					    </div>
					    <img class="step_arrow step_right" src="/images/icon_step_right.png" alt="→">
					    <div class="step_box">
					        <div>
					            <p class="small_title fcmain">시도 지회장(사무국장)</p>
					            <p class="pl10 pt10">가입원서 수령 및 연회비 납부 후 협회 중앙회 가입원서, 회비납부 확인서 제출</p>
					        </div>
					    </div>
					    <img class="step_arrow step_right" src="/images/icon_step_right.png" alt="→">
					    <div class="step_box">
					        <div>
					            <p class="small_title fcmain">협회(중앙회)</p>
					            <p class="pl10 pt10">확인 후 가입자 고유 아이디 및 비밀번호(임시번호) 부여 후 가입 완료</p>
					        </div>
					    </div>
					</div>

				    <div class="taC mt20">		    	
				        <a href="/Files/policy/회원가입원서(최종).hwp" target="_blank" class="btn main">신청서 다운로드</a>
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
