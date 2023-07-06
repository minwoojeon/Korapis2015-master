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
<script src="js/html5.js" ></script>
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
<style type="text/css">
.sub_body_box ul {padding-bottom:0}
.s21tb table {font-size: 13px;line-height: 19px; width:100%; table-layout:fixed}
.s21tb table th{vertical-align: top}
.s21tb table.management_table th{vertical-align:middle;}
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
                    <h2 class="page_title">주요사업</h2>
                    <div class="location">홈  &gt; 협회활동 &gt; <span>주요사업</span></div>
                </div>
                
                
                <div class="sub_body_box">
                
                    <ul class="tab_list grid_6">
                        <li><a href="/jsp/sub2-1.jsp" target="_self">2018</a></li>
                        <li><a href="/jsp/sub2-1_05.jsp" target="_self">2017</a></li>
                        <li><a href="/jsp/sub2-1_04.jsp" target="_self">2016</a></li>
                        <li><a href="/jsp/sub2-1_03.jsp" target="_self">2015</a></li>
                        <li class="on"><a href="/jsp/sub2-1_02.jsp" target="_self">2014</a></li>
                        <li><a href="/jsp/sub2-1_01.jsp" target="_self">2013</a></li>
                    </ul>
                
                    <h3 class="title_txt">일반현황</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" checked="" id="s2-1_001">
                                <label class="radio_b" for="s2-1_001">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_001" class="h_label">
                                            <h3>월간 협회보 발행 </h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">기 간</th>
                                                    <td>2014년 1월 ~ 12월, 총 12회</td>
                                                </tr>
                                                <tr>
                                                    <th>부 수</th>
                                                    <td>매월 약 6,000부, 약 60페이지 분량</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>광고, 협회소식, 축산소식, 정부정책자료, 양봉사양관리, 해외양봉, 특별기고, 주요 알림 등</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">양봉산업 육성 및 지원대책 마련</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_002">
                                <label class="radio_b" for="s2-1_002">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_002" class="h_label">
                                            <h3>농림축산식품부장관 간담회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2014년 8월 2일(토), 10:00~12:00</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>(주) 꽃샘식품</td>
                                                </tr>
                                                <tr>
                                                    <th>주 최</th>
                                                    <td>농림축산식품부</td>
                                                </tr>
                                                <tr>
                                                    <th>참석대상</th>
                                                    <td>약 30명<br />
                                                        - 양봉협회 임원/지회장, 조합, 관련기관(농림부,농진청 등), 학계 등 </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">주요 요구 및 논의사항</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"> - 꿀벌 전문육종장 및 전문기관 마련<br />
                                                        - 밀원수 다양화 및 식재 확대<br />
                                                        - 양봉농가 등록제 시행<br />
                                                        - 각종 연구사업 지원(국내벌꿀 및 양봉산물 기능성 분석, 벌꿀 진위여부 분석 연구사업 등)<br />
                                                        - 양봉산물 유통업체 시설비용 지원 <br />
                                                        - 양봉사료 영세율 적용 </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_003">
                                <label class="radio_b" for="s2-1_003">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_003" class="h_label">
                                            <h3>양봉산업 육성 및 지원대책마련 T/F팀 구성</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">개최 횟수</th>
                                                    <td>총6회</td>
                                                </tr>
                
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>농림축산식품부 회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>구 성</th>
                                                    <td>농림축산식품부, 농촌진흥청, 양봉협회, 학회 등 실무자</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 농림축산식품부 장관 간담회에서 논의 된 주요내용 업무분장 및 세부추진계획 논의 </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">벌꿀 관련회의 개최</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_004">
                                <label class="radio_b" for="s2-1_004">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_004" class="h_label">
                                            <h3>벌꿀 품질관리업소 대표자 회의</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>201년 2월 26일(수), 11:00 ~ </td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>본 협 회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>참가자 </th>
                                                    <td>벌꿀 품질관리업소 대표자(6명)</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td> - 벌꿀 및 벌집꿀 기준/규격 강화에 관한 의견수렴</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_005">
                                <label class="radio_b" for="s2-1_005">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_005" class="h_label">
                                            <h3>벌꿀 등급제 회의 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>총 2회(2014년 3월 26일(수), 6월 10일(화)</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>농림축산식품부 회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>참가자 </th>
                                                    <td>농림축산식품부, 축산물 품질평가원, 양봉협회 실무자</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">주요내용</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>구 분</th>
                                                                    <th>내 용</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>농림부 및 축평원 의견</td>
                                                                    <td class="t_left">
                                                                        - 협회가 정부 벌꿀 등급제 참여토록 희망(사업 일원화)<br />
                                                                        - 소비자 신뢰를 얻기 위해 천연꿀에 한해 등급 판정<br />
                                                                        - 소수의 참여로 비참여 농가 및 업체와의 차별성 요구<br />
                                                                        - 기준을 강화하여 최상위 등급의 가격 및 대우 필요 </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>한국양봉협회 의견</td>
                                                                    <td class="t_left">
                                                                        - 정부의 양봉산업 현실을 고려하지 않는 기준규격 고수<br />
                                                                        - 정부 이중 규제로 인한 농가, 업체 부담감 가중<br />
                                                                        - 등급제 참여 기준을 충족하는 업체(시설 등) 미비<br />
                                                                        - 정부 벌꿀등급제는 축평원 업무 확대를 위함으로 봄 </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_006">
                                <label class="radio_b" for="s2-1_006">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_006" class="h_label">
                                            <h3>벌꿀 등급제 관련 벌꿀 생산/유통 실태조사 T/F팀 회의 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>총 2회(4월 3일목) / 4월 11일(금)</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>제2축산회관 및 수안보 온천</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">T/F팀 대상자 명단</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th colspan="2">소 속</th>
                                                                    <th>직 책</th>
                                                                    <th>성 명</th>
                                                                    <th>비 고</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td rowspan="2">정 부</td>
                                                                    <td>농림축산식품부<br />
                                                                        (축산정책과)</td>
                                                                    <td>사 무 관</td>
                                                                    <td>김 형 식</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>농림축산식품부<br />
                                                                        (축산경영과)</td>
                                                                    <td>서 기 관</td>
                                                                    <td>박 홍 식</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td rowspan="2">학 계</td>
                                                                    <td>서울대학교</td>
                                                                    <td>교 수</td>
                                                                    <td>이 승 환</td>
                                                                    <td>총괄 책임자</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>농촌진흥청</td>
                                                                    <td>연 구 사</td>
                                                                    <td>최 용 수</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>등급판정기관</td>
                                                                    <td>축산물품질평가원</td>
                                                                    <td>평가관리팀장</td>
                                                                    <td>이 동 원</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td rowspan="3">유통업체</td>
                                                                    <td>한국양봉농협</td>
                                                                    <td>조 합 장</td>
                                                                    <td>김 용 래</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>동서식품</td>
                                                                    <td>차 장</td>
                                                                    <td>조 광 제</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>꽃샘식품</td>
                                                                    <td>대 표 이 사</td>
                                                                    <td>이 상 갑</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td rowspan="2">생산자 단체</td>
                                                                    <td rowspan="2">한국양봉협회</td>
                                                                    <td>부 회 장</td>
                                                                    <td>오 만 균</td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>사 무 총 장</td>
                                                                    <td>최 규 혁</td>
                                                                    <td></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">주요 협의내용</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">학회측 연구사업 의뢰를 통한 2개 연구사업 진행<br />
                                                        벌꿀 생산/유통실태조사 및 벌꿀 양봉산물 기능성 연구
                                                    </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">밀원수 식재사업</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_007">
                                <label class="radio_b" for="s2-1_007">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_007" class="h_label">
                                            <h3>양봉산업 활성화를 위한 밀원수 식목행사</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td> 2014년 4월 2일(수), 1일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>국림농업과학원 농업생물부 전주 신청사 일대</td>
                                                </tr>
                                                <tr>
                                                    <th>주 최</th>
                                                    <td>농촌진흥청</td>
                                                </tr>
                                                <tr>
                                                    <th>후 원</th>
                                                    <td>국림산림과학원, 한국양봉협회, 한국한봉협회, 한국양봉농협</td>
                                                </tr>
                                                <tr>
                                                    <th>참가자</th>
                                                    <td>약 200명</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>구 분</th>
                                                                    <th>합 계</th>
                                                                    <th>협 회</th>
                                                                    <th>국림산림과학원<br />농업생물부</th>
                                                                    <th>비 고</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>인 원(명)</td>
                                                                    <td>200명</td>
                                                                    <td>150명</td>
                                                                    <td>50명</td>
                                                                    <td></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th>식재수목</th>
                                                    <td>헛개나무, 백합나무 등 10종(2,000주) </td>
                                                </tr>
                                                <tr>
                                                    <th>식재 면적</th>
                                                    <td>20,000㎡</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">제40차 전국 양봉인의 날 행사</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_008">
                                <label class="radio_b" for="s2-1_008">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_008" class="h_label">
                                            <h3>행사개요</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2014년 11월 3일(월) ~ 4일(화) 2일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>제주특별자치도 서귀포시 천지연폭포 일대 특설무대</td>
                                                </tr>
                                                <tr>
                                                    <th>참석자</th>
                                                    <td>약 10,000명<br />
                                                        - 전국양봉농가 5,000여명, 양봉관계자 및 산청군민 5,000여명</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">관련기관 활동</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_009">
                                <label class="radio_b" for="s2-1_009">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_009" class="h_label">
                                            <h3>제29회 한국양봉학회 정기총회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2014년 4월 10일(목) ~ 11일(금), 1박 2일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>수안보 한화리조트(충북 충주시 수안보면)</td>
                                                </tr>
                                                <tr>
                                                    <th>참가자 </th>
                                                    <td>양봉협회장 및 임원 등 </td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 2013년도 한국양봉학회 예·결산 및 2014년도 사업계획<br />
                                                        - 한국양봉학회 학술대회 개최</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_010">
                                <label class="radio_b" for="s2-1_010">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_010" class="h_label">
                                            <h3>한·중 FTA 12차 협상규탄 전국 농축산인 결의대회</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">협상 일자</th>
                                                    <td>2014년 7월 14일(월)~18일(금) / 4박 5일간<br />
                                                        - 결의대회 일자 : 2014년 7월 14일(월), 14:00 ~ </td>
                                                </tr>
                                                <tr>
                                                    <th>집회장소</th>
                                                    <td>대구 북구 산격대로 옆 노상</td>
                                                </tr>
                                                <tr>
                                                    <th>참석인원</th>
                                                    <td>약 250여명(대구, 경북, 경남, 부산, 울산)</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_011">
                                <label class="radio_b" for="s2-1_011">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_011" class="h_label">
                                            <h3>제29차 한국양봉학회 추계학술 발표회 개최 </h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2014년 9월 25일(목) ~ 26일(금), 2일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>농진청 국립농업과학원 대회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 양봉학회 주제강연 및 학술발표회 개최<br />
                                                        - 아피몬디아 학술위원회 개최</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_012">
                                <label class="radio_b" for="s2-1_012">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_012" class="h_label">
                                            <h3>축산인 총 궐기대회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td> - 정책자금 지원금리 인하 및 무역이득 공유제 법제화<br />
                                                        - FTA 피해보전 직불제 현실화 및 무허가축사 양성화 대책마련</td>
                                                </tr>
                                                <tr>
                                                    <th>일 시</th>
                                                    <td>2014년 10월 23일(목), 13:00 ~ 17:00</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>서울 여의도 문화광장</td>
                                                </tr>
                                                <tr>
                                                    <th>주최 및 주관</th>
                                                    <td>FTA반대 축산인 비상대책위원회(축산단체협의회)</td>
                                                </tr>
                                                <tr>
                                                    <th>참석인원</th>
                                                    <td>약 4만명(양봉협회 920명)</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">- 지회별 참석 현황</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>구 분</th>
                                                                    <th>합 계</th>
                                                                    <th>대 구</th>
                                                                    <th>경 기</th>
                                                                    <th>광주전남</th>
                                                                    <th>강 원</th>
                                                                    <th>경 북</th>
                                                                    <th>충 북</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>인 원</td>
                                                                    <td>920</td>
                                                                    <td>160</td>
                                                                    <td>240</td>
                                                                    <td>240</td>
                                                                    <td>120</td>
                                                                    <td>120</td>
                                                                    <td>40</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">양봉협 각종 요구 및 조치사항</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_013">
                                <label class="radio_b" for="s2-1_013">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_013" class="h_label">
                                            <h3>가. 식약처 벌꿀(벌집꿀) 규격기준 강화를 위한 조치사항</h3>
                                        </label>
                                        <div class="content-inner">
                                            <p><strong>식약처장 면담</strong></p>
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2014년 3월 23일(일) </td>
                                                </tr>
                                                <tr>
                                                    <th>대 상</th>
                                                    <td>식약처장, 협회장, 사무총장</td>
                                                </tr>
                                                <tr>
                                                    <th>논의 내용</th>
                                                    <td>탄소동의원소 규격화 문제점 논의 및 벌집꿀 규격강화 건의</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_014">
                                <label class="radio_b" for="s2-1_014">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_014" class="h_label">
                                            <h3>나. 수입 벌집꿀 수입금지 조치</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">조 치</th>
                                                    <td>수의과학 검역원</td>
                                                </tr>
                                                <tr>
                                                    <th>관련근거</th>
                                                    <td>반소비 반입금지 조치 조항에 의거 금지조치</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_015">
                                <label class="radio_b" for="s2-1_015">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_015" class="h_label">
                                            <h3> 다. (사)한국양봉산물 생산·가공·유통협회 설립 건의</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td>국내 양봉산물(로얄제리, 봉독, 프로폴리스, 화분, 밀납) 생산에서 가공, 유통까지 담당할 수 있는 협회 설립 </td>
                                                </tr>
                                                <tr>
                                                    <th>발기인</th>
                                                    <td>임원 및 지회장</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_016">
                                <label class="radio_b" for="s2-1_016">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_016" class="h_label">
                                            <h3>라.“이영돈 PD의 먹거리 x 파일”방송 후 조치사항</h3>
                                        </label>
                                        <div class="content-inner">
                                            <p><strong>식약처 파라핀소초 관련 회의 개최</strong></p>
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2014년 5월 27일(화)</td>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">장 소</th>
                                                    <td>서울지방식품의약품안전처</td>
                                                </tr>
                                                <tr>
                                                    <th>참석자</th>
                                                    <td>식약처, 협회, 벌집꿀 아이스크림 업체(14개)</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 파라핀 소초에 대한 올바른 지식제공 및 지도점검 계획 논의 </td>
                                                </tr>
                
                                            </table>
                
                
                                            <p><br /><strong>벌집꿀 아이스크림 업체 소집회의 개최</strong></p>
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td> 2014년 6월 3일(화)</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>본 협 회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>참석자</th>
                                                    <td>협회, 벌집꿀 아이스크림 업체 대표자(10개)</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 식품공전 벌집꿀 기준규격 설명<br />
                                                        - 벌집꿀 품질관리제도 절차, 시행내용 설명<br />
                                                        - 사양벌집꿀 유통 자제 요구 </td>
                                                </tr>
                
                                            </table>
                
                
                                            <p><br /><strong>식약처“식품 안전관리 강화”협조요청</strong></p>
                                            <table>
                                                <tr>
                                                    <th>주요내용 </th>
                                                    <td> - 부적합 벌집꿀을 식용으로 판매, 제공시 식품위생법에 의거 처벌가능 <br />
                                                        - 벌집꿀 주의내용을 협회원, 업계에 홍보, 교육 협조 요청
                                                    </td>
                                                </tr>
                
                                            </table>
                
                
                                            <p><br /><strong>사양 벌집꿀 생산/판매 자제요청 호소문 발송</strong></p>
                                            <table>
                                                <tr>
                                                    <th style="width:90px">발송 일자</th>
                                                    <td>2014년 4월 18일(금)</td>
                                                </tr>
                                                <tr>
                                                    <th>대 상</th>
                                                    <td>임원, 지회장, 지부장, 대의원, 회원농가, 벌집꿀 수매 및 판매 업체, 전국 백화점(롯데, 신세계, 현대 백화점) </td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 소비자 보호와 양봉산업 발전 그리고 유통업체 보호를 위해 유통업체에서는 천연 벌집꿀이 생산유통 될 수 있도록 협조<br />
                                                        ※ 6월호 협회보 게재</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_017">
                                <label class="radio_b" for="s2-1_017">05</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_017" class="h_label">
                                            <h3>바. 벌집꿀 품질관리제도 시행</h3>
                                        </label>
                                        <div class="content-inner">
                
                                            <table>
                                                <tr>
                                                    <th style="width:90px">목 적 </th>
                                                    <td>벌집꿀 품질관리제를 통한 벌집꿀 소비촉진 및 소비자 불신 해소</td>
                                                </tr>
                                                <tr>
                                                    <th>참여대상</th>
                                                    <td>벌집꿀 아이스크림 판매업체 </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_018">
                                <label class="radio_b" for="s2-1_018">06</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_018" class="h_label">
                                            <h3>사. 벌꿀 등급제 품질관리 시행</h3>
                                        </label>
                                        <div class="content-inner">
                                            <p><strong>벌꿀 등급제 시행</strong></p>
                                            <table>
                                                <tr>
                                                    <th style="width:90px">시행 일시</th>
                                                    <td>2014년 6월 1일(일)</td>
                                                </tr>
                                                <tr>
                                                    <th>참여대상</th>
                                                    <td>생산농가 및 전국 벌꿀 판매업체</td>
                                                </tr>
                                                <tr>
                                                    <th>등급 기준</th>
                                                    <td>총 3개 등급(1+ 등급, 1등급, 2등급)</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>등 급</th>
                                                                    <th>1+</th>
                                                                    <th>1</th>
                                                                    <th>2</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>탄소비(‰)</td>
                                                                    <td>-23.5이하</td>
                                                                    <td>-22.0 ~ -23.4</td>
                                                                    <td>-20.0 ~ -21.9</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>수분(%)</td>
                                                                    <td>23.0이하</td>
                                                                    <td>23.1 ~ 25.0</td>
                                                                    <td>25.0 초과</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>H.M.F(mg/kg)</td>
                                                                    <td>8.0 이하</td>
                                                                    <td>8.1 ~ 15.0</td>
                                                                    <td>15.0 초과</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>당비율(%)</td>
                                                                    <td colspan="3">아카시아, 밤 : 1.45 이상 / 잡화 1.20 이상</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">기타 사항</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_019">
                                <label class="radio_b" for="s2-1_019">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_019" class="h_label">
                                            <h3>회원명부 제작/배포</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th colspan="2">회원명부 게재 대상자</th>
                
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        - 2011년~2014년 중 1회 이상 회비 납부자
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">회원명부 발송 대상자 <span style="font-weight: normal;"> : 총 7,912명</span></th>
                
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        - 전국 15개 지회(7,877명), 임원(15명), 광고 게재 업체(20개)
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">발간 부수</th>
                                                    <td>: 8,400부(약 400페이지) </td>
                                                </tr>
                                                <tr>
                                                    <th>배부방법</th>
                                                    <td>: 각 지회 배송 후 각 지부별 배포</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col style="width:16.667%;" />
                                                                <col style="width:16.667%;" />
                                                                <col style="width:16.667%;" />
                                                                <col style="width:16.667%;" />
                                                                <col style="width:16.667%;" />
                                                                <col />
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>지회</th>
                                                                    <th>대상자</th>
                                                                    <th>배부</th>
                                                                    <th>지회</th>
                                                                    <th>대상자</th>
                                                                    <th>배부</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <td>업체</td>
                                                                    <td>20</td>
                                                                    <td>100</td>
                                                                    <th>총계</th>
                                                                    <th>7912</th>
                                                                    <th>8330</th>
                                                                </tr>
                                                            </tfoot>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>서울</td>
                                                                    <td>103</td>
                                                                    <td>125</td>
                                                                    <td>광주/전남</td>
                                                                    <td>988</td>
                                                                    <td>1025</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>경기</td>
                                                                    <td>631</td>
                                                                    <td>650</td>
                                                                    <td>경북</td>
                                                                    <td>1045</td>
                                                                    <td>1075</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>인천</td>
                                                                    <td>43</td>
                                                                    <td>50</td>
                                                                    <td>경남</td>
                                                                    <td>1156</td>
                                                                    <td>1200</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>강원</td>
                                                                    <td>683</td>
                                                                    <td>700</td>
                                                                    <td>대구</td>
                                                                    <td>212</td>
                                                                    <td>225</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>대전</td>
                                                                    <td>139</td>
                                                                    <td>150</td>
                                                                    <td>울산</td>
                                                                    <td>125</td>
                                                                    <td>150</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>충북</td>
                                                                    <td>756</td>
                                                                    <td>775</td>
                                                                    <td>부산</td>
                                                                    <td>182</td>
                                                                    <td>200</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>충남</td>
                                                                    <td>1002</td>
                                                                    <td>1025</td>
                                                                    <td>제주</td>
                                                                    <td>159</td>
                                                                    <td>175</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>전북</td>
                                                                    <td>653</td>
                                                                    <td>675</td>
                                                                    <td>임원</td>
                                                                    <td>15</td>
                                                                    <td>30</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        ※ 회원명부 기입된 내용(주소 또는 전화번호 등) 중 오기된 내용 협회보 추가 안내 및 별도 부록 제작
                                                    </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
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
