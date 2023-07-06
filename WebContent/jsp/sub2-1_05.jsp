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
.s21tb table {font-size: 13px;line-height: 19px; width:100%; table-layout:fixed;}
.s21tb table th{vertical-align:top;}
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
                
                <div class="sub_body_box ">
                    <ul class="tab_list grid_6">
                        <li><a href="/jsp/sub2-1.jsp" target="_self">2018</a></li>
                        <li class="on"><a href="/jsp/sub2-1_05.jsp" target="_self">2017</a></li>
                        <li><a href="/jsp/sub2-1_04.jsp" target="_self">2016</a></li>
                        <li><a href="/jsp/sub2-1_03.jsp" target="_self">2015</a></li>
                        <li><a href="/jsp/sub2-1_02.jsp" target="_self">2014</a></li>
                        <li><a href="/jsp/sub2-1_01.jsp" target="_self">2013</a></li>
                    </ul>
                
                
                    <h3 class="title_txt">일반현황</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" checked="" id="s2-4_001">
                                <label class="radio_b" for="s2-4_001">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_001" class="h_label">
                                            <h3>회원관리 및 회비 수납</h3>
                                        </label>
                                        <div class="content-inner show">
                                            <p>
                                                <strong>ㆍ 회원관리 및 회비수납</strong><br>
                                                &nbsp;&nbsp; - 지회별 회원관리 및 회비수납<br>
                                                <strong>ㆍ 협회 업무 시스템 및 관리 체계화</strong><br>
                                                &nbsp;&nbsp; - 지회 및 지부 운영 활성화(교육 및 구비서류 보급)<br>
                                                &nbsp;&nbsp; - 협회 자산관리 및 비용절감 방안 모색<br>
                                                <strong>ㆍ 회원관련 서비스 확대 및 정보제공</strong><br>
                                                &nbsp;&nbsp; - 홈페이지 활성화를 통한 정보제공 확대<br>
                                                &nbsp;&nbsp; - 공문발송을 통한 원할한 협회 업무 소통<br>
                                                <strong>ㆍ 협회 활동사항 강화</strong><br>
                                                &nbsp;&nbsp; - 월간 양봉협회보 발행(월 1회)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_002">
                                <label class="radio_b" for="s2-4_002">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_002" class="h_label">
                                            <h3>협회보 (월간양봉) 발행</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th style="width:70px">기 간</th>
                                                            <td>2017년 1월 ~ 12월(총12회)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>부 수</th>
                                                            <td>매월 약 7,500부 ~ 8,000부, 약 56페이지 분량</td>
                                                        </tr>
                                                        <tr>
                                                            <th>월별 주요내용</th>
                                                            <td>광고, 협회소식, 축산소식, 정부 정책자료, 특별기고, 양봉 사양관리, 자조금 납부자 안내, 주요 알림 등</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">각종회의개최</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_003">
                                <label class="radio_b" for="s2-4_003">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_003" class="h_label">
                                            <h3>각종회의개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>ㆍ 이사회(9회) 제5차 이사회부터 지회장 포함 개최<br>
                                                    ㆍ 임원․지회장 연석회의(4회)<br>
                                                    ㆍ 제19대 임원·지회장 선거관리위원회의(4회)<br>
                                                    ㆍ 품질관리업소 대표자회의(1회)<br>
                                                    ㆍ 양봉자조금관리위원회 회의(2회)</strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">양봉자조금 사업</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_004">
                                <label class="radio_b" for="s2-4_004">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_004" class="h_label">
                                            <h3>양봉자조금 사업</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>가. 소비홍보</strong>
                                                <ul class="noneList ml15">
                                                    <li>① 광고홍보
                                                        <ul class="dashList">
                                                            <li>양봉관련 TV프로그램 제작 방영 및 옥외광고,SNS 등 매체를 통한 홍보</li>
                                                        </ul>
                                                    </li>
                                                    <li>② 홍보행사추진
                                                        <ul class="dashList">
                                                            <li>정부 및 지자체 공식 전시행사 지원</li>
                                                            <li>대국민․해외행사, 페스티벌 등 현장성 홍보활동</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <strong class="mt10">나. 유통구조</strong>
                                                <ul class="noneList ml15">
                                                    <li>① 유통개선
                                                        <ul class="dashList">
                                                            <li>한벌꿀 필증 및 스티커, 박스 제작/배송</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <strong class="mt10">다. 교육 및 정보제공</strong>
                                                <ul class="noneList ml15">
                                                    <li>① 생산자 정보제공
                                                        <ul class="dashList">
                                                            <li>고품질의 벌꿀 및 양봉산물 생산을 위한 생산농가 교육</li>
                                                        </ul>
                                                    </li>
                                                    <li>② 소비자 정보제공
                                                        <ul class="dashList">
                                                            <li>소비자 대상 설명회, 체험교육</li>
                                                            <li>벌꿀에 대한 정확한 정보 전달을 위한 캠페인</li>
                                                            <li>언론매체 제공용 비쥬얼 데이터 구축</li>
                                                            <li>양봉산업의 공익적 가치와 양봉산물의 우수성 소개를 위한 동영상 제작</li>
                                                        </ul>
                                                    </li>
                                                    <li>③ 거출홍보
                                                        <ul class="dashList">
                                                            <li>양봉농가 및 업체 자조금 거출 활성화를 위한 배포용 기념품 제작 </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">사무국장 교육 실시</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_005">
                                <label class="radio_b" for="s2-4_005">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_005" class="h_label">
                                            <h3>사무국장 교육 실시</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 9월 27일(수) ~ 28일(목), 1박 2일간</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>대전아드리아호텔</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>각 시·도 지회 사무국장 15명</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dotList">
                                                                    <li>각 시·도 사무국장 소개 및 업무 교육<br>- 본 회 일반 행정업무 및 의전 행사 진행요령 안내</li>
                                                                    <li>‘17년도 제42차 전국양봉인의 날 행사 개최지역(논산) 사전답사 및 지회별 숙박시설 예약</li>
                                                                    <li>지회별 업무 처리 간 애로사항 논의 및 건의사항 수렴</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">2017년도 제42차 전국양봉인의날 행사 개최</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_006">
                                <label class="radio_b" for="s2-4_006">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_006" class="h_label">
                                            <h3>2017년도 제42차 전국양봉인의날 행사 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 10월 25일(수) ~ 26일(목), 1박 2일간</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>충남 논산시 논산천 둔치 일대<br>심포지엄 장소 : 논산시 농업기술센터</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>양봉농가 및 관계자(약 6,200명)<br>양봉농가 5,600명 및 양봉관계자, 충남시민 등 약 600명</td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">주요일정</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <colgroup>
                                                                        <col style="width:20%;" />
                                                                        <col />
                                                                        <col style="width:30%;" />
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>구 분</th>
                                                                            <th>주 요 내 용 </th>
                                                                            <th>비 고</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>1일차 (10/25)<br>(수)</td>
                                                                            <td class="taL">
                                                                                <ul class="dotList">
                                                                                    <li>2017 양봉산업발전 심포지엄</li>
                                                                                    <li>축하 공연 및 양봉인노래자랑</li>
                                                                                    <li>불꽃놀이 및 폐회식 등</li>
                                                                                </ul>
                                                                            </td>
                                                                            <td rowspan="2">양봉산물 및 기자재 전시장 상시 운영</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>2일차 (10/26)<br>(목)</td>
                                                                            <td class="taL">
                                                                                <ul class="dotList">
                                                                                    <li>식전공연 및 국민의례</li>
                                                                                    <li>시상식·기념사 및 축사 </li>
                                                                                    <li>양봉인 한마음 줄다리기</li>
                                                                                    <li>경품(행운권) 추첨 및 상품증정</li>
                                                                                    <li>차기대회 개최지역 발표·깃발 이양식</li>
                                                                                </ul>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">식약처 고시에 따른 협회 등급제 변경</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_007">
                                <label class="radio_b" for="s2-4_007">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_007" class="h_label">
                                            <h3>식약처 고시에 따른 협회 등급제 변경</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>근 거</th>
                                                            <td>식품의약품안전처공고(제2017-168호)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>개정 사유</th>
                                                            <td>개정 고시에 따르면 탄소동위원소비율(‰)의 기준 규격은 –22.5‰이하로 규정하고 있으나, 현재 협회 내 등급제 탄소동위원소비율의 시작점은 –20‰이하로 부적절함으로써 등급제 기준 변경 필요</td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">등급판정 비교</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <thead>
                                                                        <tr>
                                                                            <th rowspan="3" colspan="2">등급판정 <br>항목</th>
                                                                            <th colspan="5">품질등급</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th colspan="3">기존</th>
                                                                            <th colspan="2">변경(식약처)</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>1+<br>premium 등급</td>
                                                                            <td>1<br>special 등급</td>
                                                                            <td>2<br>standard 등급</td>
                                                                            <td>1+<br>premium 등급</td>
                                                                            <td>1<br>special 등급</td>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td rowspan="4">양봉협회</td>
                                                                            <td>탄소비(‰)</td>
                                                                            <td>-23.5 이하</td>
                                                                            <td>-22.0~<br>-23.4</td>
                                                                            <td>-20.0~<br>-21.9</td>
                                                                            <td>-23.5 이하</td>
                                                                            <td>-22.5~<br>-23.4</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>수분(%)</td>
                                                                            <td>23.0 이하</td>
                                                                            <td>23.1~<br>25.0</td>
                                                                            <td>25.0 초과</td>
                                                                            <td colspan="2" rowspan="2">기존 동일</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>HMF<br>(mg/kg)</td>
                                                                            <td>8.0 이하</td>
                                                                            <td>8.1~<br>15.0</td>
                                                                            <td>15.0 초과</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>과당/<br>포도당 비</td>
                                                                            <td colspan="5">아카시아,밤:1.45이상 / 잡화:1.20 이상</td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">담금주 불법판매에 따른 식품의약품안전처 협조요청</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_008">
                                <label class="radio_b" for="s2-4_008">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_008" class="h_label">
                                            <h3>담금주 불법판매에 따른 식품의약품안전처 협조요청</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>담금주 불법 판매 사례</strong>
                                                <span class="">
                                                    ‘건강원, 탕제원, 중탕집’, ‘인삼 등 농산물 전문 판매점’, ‘국도면 휴게소’ 등에서 식품위생법에 의한 영업등록(신고) 없이, 담금주 전용용기에 소주와 각종 산야초 등을 넣어 직접 제조 후 아무런 표시 없이 진열 판매하는 행위 등<br>
                                                    ※ 무등록(신고) 제품을 납품 받아 진열 판매하는 행위 포함<br>
                                                    ※ 말벌집 등 식품원료로 불가한 동식물성 원료로 담금주를 제조·판매 하는 행위 등
                                                </span>
                                                <strong class="mt10">담금주 사례 조치</strong>
                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                        <col />
                                                        <col />
                                                    </colgroup>
                                                    <thead>
                                                        <tr>
                                                            <th>구 분</th>
                                                            <th colspan="2">무등록(신고) 영업/고발 등 법 위반 처분</th>
                                                            <th>영업등록(신고) 업체/식품위생법 위반 개별 처분</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td rowspan="2">사례별 <br>조치사항</td>
                                                            <td>무등록 식품제조 가공업</td>
                                                            <td class="taL">식품제조가공업 영업 등록 없이 불법 담금주를 제조·판매하는 행위 등</td>
                                                            <td rowspan="2">무표시 등 표시기준 위반, 말벌 등 사용할 수 없는 식품원료로 불법 담금주를 제조·판매하는 경우 식품 위생법에 의한 위반사항별로 개별 처벌 등 </td>
                                                        </tr>
                                                        <tr>
                                                            <td>무신고 즉석판매 제조가공업</td>
                                                            <td class="taL">즉석판매제조가공업 영업 신고 없이 불법 담금주를 제조가공하여 최종 소비자에게 판매하는 행위 등</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <span>
                                                    * 식품위생법 시행규칙 제37조 관련 [별표15] 즉석판매 제조가공대상식품 제1호에 의거 주류도 대상에 포함 (식품제조가공업에서 제조가공할 수 있는 모든 식품)<br>
                                                    ** 주세법 제6조(주류제조 면허) 주류를 제조하려는 자는 관할 세무서장의 면허를 받아야 한다.
                                                </span>
                                                <strong class="mt10">협회 조치사항</strong>
                                                <span>지회별 협조공문 시달 및 협회보 게재(2018년 2월호)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">각종 정부 건의사항</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_009">
                                <label class="radio_b" for="s2-4_009">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_009" class="h_label">
                                            <h3>수입화분 검역 철저 건의</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>발송처</th>
                                                            <td>농림축산검역본부</td>
                                                        </tr>
                                                        <tr>
                                                            <th>발송일자</th>
                                                            <td>2017년 7월 31일(월)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>요청내용</th>
                                                            <td>화분 수입량 증가에 따른 국내 반입시 양봉관련 질병 및 병해충 유입으로 인한 국내 생태계 교란 등 각종 문제점 발생이 염려됨에 따라 화분 수입시 검역 철저 건의</td>
                                                        </tr>
                                                        <tr>
                                                            <th>회신 내용</th>
                                                            <td>꿀벌 병원체의 국내 유입 가능성 등에 대한 검토·평가 실시 및 협회, 양봉농가, 수입업체, 학계 및 유관기관 등의 의견 수렴을 거쳐 검역방안을 마련할 계획</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_010">
                                <label class="radio_b" for="s2-4_010">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_010" class="h_label">
                                            <h3>수입화분 식용 둔갑판매 방지방안 건의</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>관련기관, 수입화분 둔갑판매 방지 협조 건의(공문발송)</strong>
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>발송처</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>농림축산식품부(축산경영과 및 축산환경복지과(사료계))</li>
                                                                    <li>식약처(식품안전관리과)</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>발송일자</th>
                                                            <td>2017년 8월 17일(월)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>건의내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>최근 외국산(중국, 스페인 등) 식용 및 사료용 화분 수입 증가에 따라 일부 수입 또는 판매과정에서 국내산 식용 화분으로 둔갑 판매되는 사례가 우려 되는 바 </li>
                                                                    <li>화분 수입시 사전 점검 및 사후관리에 철저를 기해 국내 양봉농가 피해가 발생하지 않도록 건의</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_011">
                                <label class="radio_b" for="s2-4_011">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_011" class="h_label">
                                            <h3>자연재난 복구비용 산정기준 (벌통) 단가 상향조정 건의</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>발송처</th>
                                                            <td>농림축산식품부(재해보험 정책과)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>발송일자</th>
                                                            <td>2017년 8월 17일(목)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>요청 내용</th>
                                                            <td>자연재난 복구비용 산정기준 중 꿀벌(벌통) 피해 산정기준액이 10년 이상 동일 가격으로 책정되어 있어, 자연재난 피해 농가들이 보다 적절하고 현실에 맞는 피해보상이 이루어질 수 있도록 건의 </td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">조정(안)</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <thead>
                                                                        <tr>
                                                                            <th rowspan="2">구 분</th>
                                                                            <th colspan="2">단 가</th>
                                                                            <th rowspan="2">대 비</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>기 존</th>
                                                                            <th>요 청</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            <td>금 액<br>(군 당)</td>
                                                            <td>140,760원</td>
                                                            <td>210,000원</td>
                                                            <td>▲ 50% 인상</td>
                                                    </tbody>
                                                </table>
                                                </td>
                                                </tr>
                                                </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">양봉농가 농약(에피흄)사용 관련보도 기자 항의 방문</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_012">
                                <label class="radio_b" for="s2-4_012">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_012" class="h_label">
                                            <h3>양봉농가 농약(에피흄)사용 관련보도 기자 항의 방문</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>방송 일자</th>
                                                            <td>2017년 9월 22일</td>
                                                        </tr>
                                                        <tr>
                                                            <th>방송 매체</th>
                                                            <td>광주 KBC 뉴스</td>
                                                        </tr>
                                                        <tr>
                                                            <th>보도내용</th>
                                                            <td>양봉농가에서 ‘에피흄’을 벌집(꿀벌 먹이용) 저장목적으로 사용<br>※ 에피흄(aluminium phsphide) : 꿀벌에는 사용 금지 약제</td>
                                                        </tr>
                                                        <tr>
                                                            <th>협회 조치사항</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>KBC 광주방송 보도기자 항의방문(확산방지 촉구)</li>
                                                                    <li>농촌진흥청 대응기사 배포(9월 21일) 등</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">벌꿀 살충제 검출 관련보도 대책회의 개최</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_013">
                                <label class="radio_b" for="s2-4_013">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_013" class="h_label">
                                            <h3>벌꿀 살충제 검출 관련보도 대책회의 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:17%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>보도 일자</th>
                                                            <td>2017년 10월 6일(금), 서울신문·여성신문, 나우뉴스 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>보도 내용</th>
                                                            <td>전 세계 198개 벌꿀 샘플 검사결과 75%에서 신경자극성 살충제 성분인 네오니코티노이드가 발견되었다는 영국일간지(인디펜던트) 보도 내용 인용</td>
                                                        </tr>
                                                        <tr>
                                                            <th>협회 조치 사항</th>
                                                            <td>대책회의 개최
                                                                <ul class="dashList">
                                                                    <li>일 시(장소) : 2017년 10월 7일, 양봉농협 안성공장</li>
                                                                    <li>참가자 : 협회, 조합, 농진청 관계자 등 약 10명</li>
                                                                    <li>협의 사항
                                                                        <ul class="dotList">
                                                                            <li>시중 유통 국내·외 벌꿀 수거 검사 후 관계기관(농림부, 농진청, 식약처 등) 대응</li>
                                                                            <li>다른 매스컴으로 확대 되지 않도록 적극 조치</li>
                                                                            <li>임원·지회장, 품질관리업소 대책회의 결과 공문 발송 및 양봉 월간지(11월호) 농가별 유의사항 게재</li>
                                                                        </ul>
                                                                    </li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">2017 터키세계양봉대회 참가</h3>
                
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_014">
                                <label class="radio_b" for="s2-4_014">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_014" class="h_label">
                                            <h3>2017 터키세계양봉대회 참가</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>참가 목적</th>
                                                            <td>전 세계 양봉인에게 국내 양봉산업 및 양봉기자재, 양봉산물 우수성 홍보
                                                                <ul class="dashList">
                                                                    <li>다양한 세계양봉산업 의 현황을 파악하고 교류로 인한 국내 양봉산업 발전을 도모</li>
                                                                    <li>국내 양봉산물 및 기자재 수출 증대 및 판로 확보.</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>대회명</th>
                                                            <td>제 45회 2017 터키 이스탄불 세계양봉대회
                                                                <span class="dotTxt">영 명 : The 45th APIMONDIA International Apiculture Congress<br>- 주 제 : 전 세계 대륙이 만나는 모임(Let′s bee where the continents meet...)
                                                                </span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>기 간</th>
                                                            <td>2017년 9월 29일(금) ~ 10월 4일(수) / 5박 6일</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>터키 이스탄불 콩그레스 센터(Icc – Istanbul Congress Center)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 최</th>
                                                            <td>아피몬디아(국제양봉협회 연맹)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 관</th>
                                                            <td>2017 터키세계양봉대회 조직위원회</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참가 규모</th>
                                                            <td>135개국 약 9,000여명 참가<br>(외국인 참가자 수 : 약 7,200명 / 한국참가자: 21 명)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>전시규모</th>
                                                            <td>약 10,000m2 (전시부스 약 400여개 / 50개국)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dotList">
                                                                    <li>학술발표(포스터 발표 포함) 및 전 세계 양봉산물 및 기자재 전시</li>
                                                                    <li>2017 터키세계양봉대회 개·폐막식 및 우수양봉산물 컨테스트 개최</li>
                                                                    <li>세계양봉연맹 총회(대표자 회의) 및 터키의 밤 개최</li>
                                                                    <li>테크니컬 투어 개최(현지 양봉장 및 관련업체 방문) 등</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
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
                                <input type="radio" name="tl-group" id="s2-4_015">
                                <label class="radio_b" for="s2-4_015">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_015" class="h_label">
                                            <h3>2017년도 제32차 한국양봉학회 총회 및 춘계학술대회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 4월 13일(목) ~ 14일(금)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>인천대학교 교수회관</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대 상</th>
                                                            <td>양봉학회 관련자 및 양봉농가</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 제</th>
                                                            <td>한국양봉 세계로 미래로! </td>
                                                        </tr>
                                                        <tr>
                                                            <th>발표 내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>(특별강연) 중국양봉현황(국립농업과학원 이만영박사)</li>
                                                                    <li>(심포지엄) 유전자를 이용한 초고속 PCR 검출법 발표논문 소개</li>
                                                                    <li>(심포지엄) 작은벌집밑빠진벌레의 봉군과 토양의 밀도 비교 및 온도, 발육패턴에 대한 발표</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_016">
                                <label class="radio_b" for="s2-4_016">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_016" class="h_label">
                                            <h3>농림축산검역본부, 꿀벌질병 관리교육 실시</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>목 적</th>
                                                            <td>양봉농가 및 관계 공무원 등을 대상으로 2개권역별(영호남) ‘작은벌집딱정벌레(SHB)’ 중심 꿀벌질병 방역관리 교육 추진</td>
                                                        </tr>
                                                        <tr>
                                                            <th>일시 및 장소<br>(2회)</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>1차(영남지역 교육) : 2017년 4월 17일(월), 밀양시농업기술센터 </li>
                                                                    <li>2차(호남지역 교육) : 2017년 7월 18일(화), 광주광역시청</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>대 상</th>
                                                            <td>양봉농가 및 지자체 공무원 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>교육 내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>꿀벌질병 방역관리 요령(국내외 발생현황 및 방제방법 등)</li>
                                                                    <li>꿀벌 사양관리(노제마, 등검은말벌 등으로부터 꿀벌의 친환경 봉군관리 소개) 등</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_017">
                                <label class="radio_b" for="s2-4_017">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_017" class="h_label">
                                            <h3>2017년도 민관 합동 밀원수 식목행사 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 4월 5일(수)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>미르숲 일대(충북 진천군 소재)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석대상</th>
                                                            <td>약 50명(농진청, 충북지회장 및 지회 회원농가)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>식재수목<br>(약 10여종)</th>
                                                            <td>헛개나무, 벚나무, 이나무 등 약 1,800주</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 관</th>
                                                            <td>농진청 국립농업과학원</td>
                                                        </tr>
                                                        <tr>
                                                            <th>후 원</th>
                                                            <td>국립산림과학원, 검역본부, 한국양봉농협, 한봉협회 등</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_018">
                                <label class="radio_b" for="s2-4_018">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_018" class="h_label">
                                            <h3>김영록 농림부장관 주재 농축산 단체장 간담회 참석</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 7월 13일(목)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>정부세종청사</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>조균환 협회장 외 축산관련 단체장 등 약 20명</td>
                                                        </tr>
                                                        <tr>
                                                            <th>협회장 요청 및 건의사항</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>꿀벌의 공익적 가치 제고 및 밀원수 식재 건의</li>
                                                                    <li>양봉산업 육성 및 지원에 관한 법률 제정 건의</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_019">
                                <label class="radio_b" for="s2-4_019">05</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_019" class="h_label">
                                            <h3>‘17년도 장원벌 확대보급시범사업 중간평가회 참석</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 7월 26일(수), 09:00~ 15:00</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>울릉도 농업기술센터 및 현지 육종장</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자<br>(약 50명)</th>
                                                            <td>조균환 협회장, 김종상 전무, 경북지회장 외 시·군 담당자 및 울릉군, 예천군 농가 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>장원벌 육성·보급 경상북도 추진 상황</li>
                                                                    <li>장원벌 보급 문제점 및 발전방안 토의/ 장원벌 육종장(태하리, 알봉) 견학</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_020">
                                <label class="radio_b" for="s2-4_020">06</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_020" class="h_label">
                                            <h3>양봉관련 기관 및 단체 업무협약(MOU) 체결</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 9월 12일(화)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>한국양봉농협 안성경제사업부</td>
                                                        </tr>
                                                        <tr>
                                                            <th>협약 기관 및 <br>단체(총 8개)</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>기관 : 농촌진흥청 국립농업과학원, 농림축산검역본부, 국립산림과학원</li>
                                                                    <li>단체 : 양봉협회, 한봉협회, 양봉농협, 산림조합</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>업무협약 내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>밀원식물 확보로 양봉산업 생산성 증대방안 마련</li>
                                                                    <li>꿀벌질병 저항성 품종육성과 방제기술 개발 및 외래병해충 유입방지를 위한 검역 강화</li>
                                                                    <li>양봉산물 소비촉진을 위해 정부기관, 농업인단체, 조합간의 긴밀한 협업과 유대를 강화</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_021">
                                <label class="radio_b" for="s2-4_021">07</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_021" class="h_label">
                                            <h3>축산단체 협의회 활동 사항</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>1. 김영란법 개정촉구 기자회견 개최</strong>
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 8월 9일(수)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>청와대 분수광장 앞</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자<br>(약 40명)</th>
                                                            <td>축산단체 협의회 단체장 및 실무자 등 </td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>농축수산물 김영란법 예외 조치 및 개정 촉구</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <strong class="mt10">2. 한·미 FTA 개정협상 공청회 대응 기자회견 개최</strong>
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 11월 10일(금)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>코엑스(서울강남 소재)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자<br>(약 50명)</th>
                                                            <td>농수축산물 단체 대표 및 관계자 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>한·미 FTA 개정협상 공청회 대응 기자회견 개최 및 강력 항의</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
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
                                <input type="radio" name="tl-group" id="s2-4_022">
                                <label class="radio_b" for="s2-4_022">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_022" class="h_label">
                                            <h3>농림축산식품부, 본 협회 정관 승인</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>승인 일시</th>
                                                            <td>2017년 6월 15일(목)</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_023">
                                <label class="radio_b" for="s2-4_023">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_023" class="h_label">
                                            <h3>시·도 지회장 당연직이사에 따른 이사회 참석대상 변경</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th colspan="2">이사회 참석대상 변경</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>구 분</th>
                                                                            <th>기 존</th>
                                                                            <th>변 경</th>
                                                                            <th>비 고</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            <td>참석대상</td>
                                                            <td>총 12명<br>(회장(1), 부회장(2), 이사(7), 감사(2))</td>
                                                            <td>총 26명<br>(회장(1), 부회장(2), 이사(6) 감사(2), 시·도지회장(15))</td>
                                                            <td>시·도 지회장 15명 추가</td>
                                                    </tbody>
                                                </table>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">주요내용</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">농림부 정관승인(17년 6월 15일) 이후 제5차 이사회를 시작으로 참석 대상자는 회장, 부회장, 이사(상근이사 포함), 각 시·도지회장, 감사로 총 26명 체제로 이사회 개최</td>
                                                </tr>
                                                </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_024">
                                <label class="radio_b" for="s2-4_024">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_024" class="h_label">
                                            <h3>‘17년도 소나무재선충병 항공방제 실시</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2017년 4월 24일(월) ~ 7월 13일(목)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 관</th>
                                                            <td>산림청(산림병해충 방제과)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>협회 조치사항</th>
                                                            <td>- 시도 지회장 및 사무국장, 지부장 일정표 우편발송(4월 27일(목)<br>·항공방제 일정표 확인 후 각 시·도·군·구청 담당자 협의를 통한 일정변경 요청</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-4_025">
                                <label class="radio_b" for="s2-4_025">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-4_025" class="h_label">
                                            <h3>시·도 보조사업 검사비(전체검사) 부가세 조정</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>목 적</th>
                                                            <td>검사비 부가세 지원을 통한 농가 생산비 절감 및 경영부담 완화</td>
                                                        </tr>
                                                        <tr>
                                                            <th>조정내용</th>
                                                            <td>지부 활성화 및 농가 경영부담 감소를 위해 시도 보조사업을 통한 본 협회 검사 의뢰시 세금계산서 발생(10%)에 한해서는 80,000원(부가세 포함)으로 조정</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                    <thead>
                                                        <tr>
                                                            <th>구 분</th>
                                                            <th>대상 및 조건</th>
                                                            <th>검사항목</th>
                                                            <th>기존<br>(부가세포함)</th>
                                                            <th>변경<br>(부가세포함)</th>
                                                            <th>비 고</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <td>내 용</td>
                                                        <td>협회원에 한해 시·도 보조사업을 통한 검사 의뢰 시 적용</td>
                                                        <td>전체검사</td>
                                                        <td>88,000원</td>
                                                        <td>80,000원</td>
                                                        <td>부가세 10% 조정</td>
                                                    </tbody>
                                                </table>
                                            </div>
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
