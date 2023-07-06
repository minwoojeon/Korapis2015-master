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
<jsp:include page="inc/header.jsp" />

<!-- sub_wrap START -->
    <div id="sub_wrap">

        <jsp:include page="inc/leftmenu.jsp" />

        <!-- sub_contents START -->
        <div id="sub_contents">

            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">협회정관</h2>
                    <div class="location">홈  &gt; 협회소개 &gt; <span>협회정관</span></div>
                </div>

                <div class="sub_body_box">
                    
                    <!-- 탭메뉴 반응형때문에 pc와 모바일 분리했습니다. -->
                    <ul class="tab_list grid_4 ver_pc">
                        <li class="on"><a href="/jsp/sub1-4.jsp" target="_self" class="go">한국양봉협회 정관</a></li>
                        <li><a href="/jsp/sub1-4_01.jsp" target="_self" class="go">가입금 및 회비납부 규정</a></li>
                        <li><a href="/jsp/sub1-4_02.jsp" target="_self" class="go">임원 선거관리규정</a></li>
                        <li><a href="/jsp/sub1-4_03.jsp" target="_self" class="go">지회정관</a></li>
                        <li class="on"><a href="/jsp/sub1-4_04.jsp" target="_self" class="go">지부정관</a></li>
                        <li><a href="/jsp/sub1-4_05.jsp" target="_self" class="go">지부장 선거관리규정</a></li>
                        <li><a href="/jsp/sub1-4_06.jsp" target="_self">대의원 선출규정</a></li>
                    </ul>

                    <ul class="tab_list grid_2 ver_m">
                        <li class="on"><a href="/jsp/sub1-4.jsp" target="_self" class="go">한국양봉협회 정관</a></li>
                        <li><a href="/jsp/sub1-4_01.jsp" target="_self" class="go">가입금 및 회비납부 규정</a></li>
                        <li><a href="/jsp/sub1-4_02.jsp" target="_self" class="go">임원 선거관리규정</a></li>
                        <li><a href="/jsp/sub1-4_03.jsp" target="_self" class="go">지회정관</a></li>
                        <li class="on"><a href="/jsp/sub1-4_04.jsp" target="_self" class="go">지부정관</a></li>
                        <li><a href="/jsp/sub1-4_05.jsp" target="_self" class="go">지부장 선거관리규정</a></li>
                        <li><a href="/jsp/sub1-4_06.jsp" target="_self">대의원 선출규정</a></li>
                    </ul>

                    <div class="taR"><a href="/Files/policy/5. 지부정관 (2022.02.24 개정판).pdf" class="sbtn sub2" download>지부정관 다운로드 <img src="/images/icon_download_bk.png"/></a></div>
                    
                    <div class="p20">
                        <p class="taR">
                        	제정 1983.01.09<br>
							개정 1984.10.23<br>
							〃 1991.10.31<br>
							〃 2010.01.29<br>
							〃 2013.05.30.<br>
							〃 2022.02.24.
						</p>

<style>
pre {overflow-x: visible; font-family: 'NanumSquare', sans-serif ,'dotum','돋움'; font-size: 100%; white-space: pre-line;}
</style>
<pre>
<strong class="small_title">제 1 장   총 칙</strong>
 
<strong>제1조(명칭)</strong> 본 회는 (사)한국양봉협회 ○ ○지회 ○ ○ 지부<strong>(이하“본 지부”라 한다.)</strong>라 칭한다.

<strong>제2조(목적)</strong> 본 지부는 양봉산업의 발전과 회원의 공동이익 및 권익을 도모하고 ○ ○시·군·구의 양봉 진흥정책과 ○ ○ 시·군·구 민의 경제적 지위 향상에 적극 기여함을 목적으로 한다.

<strong>제3조(사무소)</strong> 본 지부의 사무소는 ○ ○ 지부 관내에 둔다.

<strong>제4조(사업)</strong> 본 지부는 제2조의 목적을 달성하기 위하여 <strong>사단법인 한국양봉협회</strong>, 지회의 사업을 준용하여 수행한다.

<strong class="small_title">제 2 장   회원 및 회계</strong>

<strong>제5조(회원)</strong> <strong>사단법인 한국양봉협회</strong>의 목적에 찬동하고 지부 관내에 주소를 둔 자로서 소정의 회비를 납부하고 가입을 동의한 자와 타지역의 지부에서 전입해온 회원은 전입신고를 함으로써 지부의 회원이 된다.

<strong>제6조(회원의 의무)</strong> 회원은 아래와 같이 협회에서 정한 회비의 납부 및 본 지부에서 특별히 정한 부담금을 납부하여야 하며, 「정관」, 지회 총회, 지부 총회, 운영위원회에서 결정된 제반 사항을 준비하여 회의 참석의 의무를 진다.

<strong>제7조(회원의 권리)</strong> 본 지부 회원은 임원의 선거권, 피선거권, 지부 총회 참석과 의결권을 가진다.

<strong>제8조(자격상실)</strong> 본 지부의 회원은 다음 각호의 사유가 발생하였을 때는 자격을 상실한다. 
   1. 사 망
   2. 파산, 피한정후견인 및 피성년 후견인
   3. 제명
   4. 탈퇴자
   5. 유사단체 직전 및 현직 임원

<strong>제9조(징계)</strong> 회원으로서 다음 각 호를 위반하였을 때는 경고, 자격정지, 변상, 제명 등의 징계를 할 수 있다. 
   1. 회원으로서 의무를 이행하지 않을 때 
   2. 사단법인 한국양봉협회 사업을 방해하거나 양봉산업 발전에 반(反) 하는 행위를 할 때
   3. 회원의 품위를 실추하거나 본 회의 명예를 손상과 해를 끼칠 때 
   4. 회비를 2년 이상 납부하지 아니할 때는 자동적으로 자격이 정지되고 납부와 동시에 회복한다. 
   5. 유사단체 가입 활동자로 협회를 비방하는 행위를 하였을 때

<strong>제10조(회비의 환불)</strong> 회원의 자격을 상실하였을 경우에는 납부된 회비는 환불하지 않으며, 지부 자산에 대한 지분권을 상실한다.

<strong class="small_title">제 3 장   임원 및 대의원</strong>

<strong>제11조(임원의 정수)</strong> 본 지부에 다음의 임원을 둔다.
  1. 지부장    1인
  2. 감  사    2인
  3. 운영위원 (사무장 1인 포함) : 지부별 위원 정수는 자율 운영

<strong>제12조(임원의 선출)</strong> ① 지부장과 감사는 지부 총회에서 선출한다.
  ② 사무장은 지부장이 지명한다.
  ➂ 운영위원은 회원 중에서 호선한다.

<strong>제13조(임원의 직무)</strong> 본 지부의 임원 임무는 다음과 같다.
  1. 지부장은 지부를 대표하며, 모든 회의의 의장이 된다.
  2. 지부장 유고 시 운영위원 중 최연장자가 그 직무를 대행한다.
  3. 감사는 지부의 모든 업무를 감사하고, 그 결과를 운영위원회와 총회에 보고하여야 한다.
  4. 운영위원은 지부의 주요업무를 심의·의결 추진한다.
  5. 사무장은 지부장의 명을 받아 업무를 수행하고, 기록 보존 하여야 한다.

<strong>제14조(임원의 임기)</strong> 본 지부의 임원의 임기는 다음과 같다.
  1. 지부장, 감사 및 운영위원의 임기는 4년으로 하며, 연임할 수 있다. 
  2. 보선된 임원의 임기는 전임자의 잔여기간으로 한다.
  3. 정기총회 개최가 불가능하여 임기가 만료되었을 때에는 차기 임원이 선출될 때까지 직무를 수행한다. 

<strong>제15조(임·직원의 보수)</strong> 본 지부의 모든 임·직원(사무장)에 대한 보수, 업무추진비, 수당 등은 지부 사정에 따라 예산을 편성하여 지급할 수 있다.

<strong class="small_title">제 4 장   회 의</strong>

<strong>제16조(회의)</strong> 본 지부에는 지부 총회와 운영위원회로 구분한다.

<strong>제17조(지부 총회)</strong> ① 지부 총회는 정기총회와 임시총회로 구분하며, 정기총회는 연 1회 회계연도 종료 후 20일 이내에 지부장이 소집하여야 한다. 단, 악성 인수 전염병 및 재난 등으로 인하여 정부의 집합 금지 명령이 있을 시, 30일까지 연기할 수 있으며, 「정관」 개정 및 규정을 제외한 나머지 부의 안건은 회원 1/2 이상 서면동의를 얻어 서면 총회를 개최한다.
 ② 임시총회는 다음 각 호에 해당할 경우 20일 이내에 소집하여야 한다. 
   1. 지부장이 필요하다고 인정할 때
   2. 운영위원 2/3 이상 또는 회원 1/3 이상의 요청이 있을 때
   3. 감사 1인이 운영위원 2/3 이상 동의를 얻어 요구할 때
 ③ 총회 소집은 개최 10일 전에 회의 목적, 일시, 장소를 서면으로 통지하여야 한다. 
제18조(지부 총회 소집) 본 지부 총회 개최 시에는 총회의 목적 및 일시, 장소를 명기하여 개최 5일 전까지 통지하여 소집한다.

<strong>제19조(지부 총회의 의결사항)</strong> 본 지부 총회 의결사항은 다음과 같다. 
   1. 지부 정관의 변경
   2. 지부 임원(지부장, 감사)의 선임 및 해임
   3. 사업 계획 및 예산(안), 결산의 승인
   4. 대의원 선출
   5. 기타 지부의 업무추진에 필요한 사항으로 지부장이 제안한 사항
     단, 제1항의 정관변경이 결의한 때는 협회 승인을 득한 후 시행하여야 한다. 

<strong>제20조(정족수)</strong> 본 지부의 모든 회의의 의결 정족수는 과반수 참석으로 개회하고, 과반수의 찬성으로 의결한다. 단, 가부동수일 때에는 부결된 것으로 한다.

<strong>제21조(지부 회의록)</strong> 본 지부의 회의 진행과 안건 토의 결과를 요약하여 의사록을 작성하고, 지부장이 지명한 서명인 2인의 서명을 받아 총회, 운영위원회에 보고한다.

<strong>제22조(지부 운영위원회)</strong> ① 본 지부의 운영위원회는 필요시 
  지부장이 소집한다.
  ② 운영위원회 구성은 지부장, 감사, 사무장, 운영위원으로 한다.

<strong>제23조(지부 운영위원회 의결사항)</strong> 본 지부 운영위원회의 의결 사항은 다음과 같다. 
  1. 총회에 부의할 사항
  2. 사업 계획 및 예산(안), 결산의 심의
  3. 사업 집행에 관한 주요사항
  4. 기타 지부 운영에 필요한 사항

<strong>제24조(지부 운영위원회 소집)</strong> 지부장은 운영위원회의 목적 및 일시, 장소 등을 명기하여 회의 개최 5일 전까지 통지하여야 한다.

<strong>제25조(지부 운영위원회 회의록)</strong> 지부장은 운영위원회의 진행과 안건 토의 결과를 요약하여 의사록을 작성하고 참석자 2인 이상 서명을 받아 보존하고 차기 회의에 보고한다. 

<strong class="small_title">제 5 장   재 정</strong>

<strong>제26조(회계연도)</strong> 본 지부의 회계 연도는 1월 1일부터 12월 31일까지로 한다. 

<strong>제27조(재정)</strong> 본 지부의 재정의 운용은 다음과 같다.
 1. 회원의 가입비 및 회비
 2. 찬조금 및 보조금(시·군의 지원금) 
 3. 기타 수입금

<strong class="small_title">제 6 장   보 칙</strong>

<strong>제28조(세칙)</strong> 본 정관에 규정하지 아니한 사항은 <strong>사단법인 한국양봉협회</strong>, 지회 정관 및 규정을 우선 준용한다.

<strong>제29조(해석)</strong> 제28조(세칙)에 규정되지 아니한 사항은 회의 일반 원칙과 운영위원회 결의로 시행한다.

<strong class="small_title">제 7 장   부 칙</strong>

<strong>제1조(시행)</strong> 본 지부 정관은 <strong>사단법인 한국양봉협회</strong> 정관이 시행 날로부터 지부 총회의 결의를 받은 것으로 간주하고 그 효력을 발생·시행한다. 

<strong>제2조(경과조치)</strong> 본 지부 정관이 시행되기 전 결정 시행된 모든 사항은 이 정관에 의한 것으로 간주한다.
</pre>
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
