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
                
                
                <div class="sub_body_box">
                
                    <ul class="tab_list grid_6">
                        <li><a href="/jsp/sub2-1.jsp" target="_self">2018</a></li>
                        <li><a href="/jsp/sub2-1_05.jsp" target="_self">2017</a></li>
                        <li class="on"><a href="/jsp/sub2-1_04.jsp" target="_self">2016</a></li>
                        <li><a href="/jsp/sub2-1_03.jsp" target="_self">2015</a></li>
                        <li><a href="/jsp/sub2-1_02.jsp" target="_self">2014</a></li>
                        <li><a href="/jsp/sub2-1_01.jsp" target="_self">2013</a></li>
                    </ul>
                
                    <h3 class="title_txt">일반현황</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" checked="" id="s2-3_001">
                                <label class="radio_b for="s2-3_001"">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_001" class="h_label">
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
                                <input type="radio" name="tl-group" id="s2-3_002">
                                <label class="radio_b" for="s2-3_002">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_002" class="h_label">
                                            <h3>협회보 (월간양봉) 발행</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <colgroup>
                                                    <col style="width:15%;" />
                                                    <col />
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <th style="width:70px">기 간</th>
                                                        <td>2016년 1월 ~ 12월(총12회)</td>
                                                    </tr>
                                                    <tr>
                                                        <th>부 수</th>
                                                        <td>매월 약 7,000부 ~ 7,500부, 약 56페이지 분량</td>
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
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">각종회의개최</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_003">
                                <label class="radio_b" for="s2-3_003">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_003" class="h_label">
                                            <h3>각종회의개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <p>
                                                <strong>ㆍ 이사회(4회)<br>
                                                    ㆍ 임원․지회장 연석회의(8회)<br>
                                                    ㆍ 양봉자조금관리위원회 회의(2회)<br>
                                                    ㆍ 2015 대전세계양봉대회(2회)<br>
                                                    ㆍ 집행위원회 회의(2회)<br>
                                                    ㆍ 벌꿀 품질관리업소 회의(2회)<br>
                                                    ㆍ 정관(선거관리규정)개정위원회(4회)</strong>
                                            </p>
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
                                <input type="radio" name="tl-group" id="s2-3_004">
                                <label class="radio_b" for="s2-3_004">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_004" class="h_label">
                                            <h3>양봉자조금 사업</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>가. 소비홍보</strong>
                                                <ul class="noneList ml15">
                                                    <li>① 광고홍보
                                                        <ul class="dashList">
                                                            <li>양봉관련 TV프로그램 제작 방영 및 TV, 라디오 등 매체를 통한 홍보</li>
                                                        </ul>
                                                    </li>
                                                    <li>② 홍보행사추진
                                                        <ul class="dashList">
                                                            <li>벌꿀 및 양봉산물 홍보를 위한 현장 이벤트</li>
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
                                                            <li>우리벌꿀 해외 수출을 위한 판로 개척 및 지원</li>
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
                                                            <li>양봉농가 및 업체 자조금 거출 활성화를 위한 배포용 기념품 제작</li>
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
                
                
                    <h3 class="title_txt">생산성 향상을 위한 농가 교육(자조금 사업)</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_005">
                                <label class="radio_b"for="s2-3_005">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_005" class="h_label">
                                            <h3>생산성 향상을 위한 농가 교육(자조금 사업)</h3>
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
                                                            <td>2016년 8월 8일(월) ~ 9일(화), 2일간</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>경북 예천 웨딩의전당, 예천공설운동장 일대</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 최</th>
                                                            <td>양봉(임의)자조금위원회</td>
                                                        </tr>
                                                        <tr>
                                                            <th>후 원</th>
                                                            <td>농림축산식품부</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>양봉산업 관계자 및 양봉농가 879명</td>
                                                        </tr>
                                                        <tr>
                                                            <th>교육주요내용</th>
                                                            <td>
                                                                <ul class="dotList">
                                                                    <li>한국 밀원식물의 발굴과 전망(국립산림과학원 특용자원연구과 김세현과장)</li>
                                                                    <li>천연벌꿀과 사양벌꿀의 성분 및 기능(국립농업과학원 잠사양봉소재과 한상미 연구관)</li>
                                                                    <li>봉독/벌침 관련교육(서울지회 사무국장)</li>
                                                                    <li>로열젤리 생산관리(경북 예천시지부 윤여한 대의원)</li>
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
                
                
                    <h3 class="title_txt">양봉산업 발전대책 추진상황</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_006">
                                <label class="radio_b" for="s2-3_006">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_006" class="h_label">
                                            <h3>신품종 벌 보급용 벌통지원사업</h3>
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
                                                            <th>개 요</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>농진청에서 개발된 신품종 여왕벌 보급을 통한 양봉농가 생산성 향상 및 생산비 절감 유도</li>
                                                                    <li>지원 조건 : 보조 50%(군당 15천원 한도), 자담 50%</li>
                                                                    <li>사업시행주체 : 시·도지사(시장·군수), 한국양봉협회<br>※ 본 회 역할의 경우 벌통 보급업체 선정 후 각 시·도 통보</li>
                                                                    <li>사업비 : 150백만원(30,000원/군 x 10,000군 x 50% = 150백만원)</li>
                                                                    <li>사업량 : 10천군</li>
                                                                    <li>자금용도 : 신품종 여왕벌 보급용 벌통 구입비용</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원자격 및 <br>요건</th>
                                                            <td>농촌진흥청에서 육성한 신품종 벌 생산농가 또는 단체에서 생산한 여왕벌(장원벌) 구입을 희망하는 양봉농가</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_007">
                                <label class="radio_b" for="s2-3_007">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_007" class="h_label">
                                            <h3>도시양봉활성화사업</h3>
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
                                                            <th>개 요</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>목 적 : 도시민의 여가, 체험, 학습활동의 병행으로 양봉산물에 대한 정보제공을 통해 양봉산업 이해 도모</li>
                                                                    <li>기 간 : ‘16년 1월 ~ 12월(도시민 현장체험 및 교육 등은 3~4월에서 7~8월까지 5개월간 실시)</li>
                                                                    <li>지원조건 : 벌통구입비(보조 50%, 자부담50%), 도시민교육 및 관리(보조100%)</li>
                                                                    <li>총 사업비 : 300백만원
                                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>구 분</th>
                                                                                    <th>합 계</th>
                                                                                    <th>벌통구입비</th>
                                                                                    <th>교육 및 <br>관리비</th>
                                                                                    <th>전산관리<br>어플개발비</th>
                                                                                    <th>비 고</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>금 액 <br>(백만원)</td>
                                                                                    <td>300</td>
                                                                                    <td>100</td>
                                                                                    <td>180</td>
                                                                                    <td>20</td>
                                                                                    <td></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </li>
                                                                    <li>총 사업량 : 25개 지자체(도시민 520명, 선도양봉농가 104명)</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원자격 및 <br>신청절차</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>도시민 : 도시지역에 거주하면서 양봉 체험을 희망하는 도시민으로서 해당 지자체 신청하여 선정된 도시민</li>
                                                                    <li>선도양봉농가 : 도시민(5명)을 대상으로 체험, 교육, 관리 등이 가능한 양봉농가로서 본 회 각 시·도지부의 추천을 받은 자</li>
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
                                <input type="radio" name="tl-group" id="s2-3_008">
                                <label class="radio_b" for="s2-3_008">05</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_008" class="h_label">
                                            <h3>유해성말벌(등검은말벌)피해 국책 연구사업 추진</h3>
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
                                                            <th>주관</th>
                                                            <td>농림수산식품기술평가원</td>
                                                        </tr>
                                                        <tr>
                                                            <th>연구사업 <br>총괄책임자</th>
                                                            <td>전남대 김익수 교수 외 8명</td>
                                                        </tr>
                                                        <tr>
                                                            <th>연구기간</th>
                                                            <td>2016년 7월 ~ 2019년 6월(3년간)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>유해성 말벌류(등검은말벌) 방제기술개발 연구사업 협의</li>
                                                                    <li>등검은말벌에 의한 농가 피해 실태조사(협회)</li>
                                                                    <li>ICT접목기술에 의한 등검은말벌집 탐색장치 개발</li>
                                                                    <li>말벌 유인액 및 고효율 포획장치 개발</li>
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
                
                
                    <h3 class="title_txt">양봉농가 경영안정화 자금 지원</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_009">
                                <label class="radio_b" for="s2-3_009">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_009" class="h_label">
                                            <h3>농업경영회생자금 지원</h3>
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
                                                            <th>예 산</th>
                                                            <td>60,000백만원
                                                                <ul class="dashList">
                                                                    <li>경영평가위원회에서 결정된 융자액 전액을 지원하되, 융자 90% 이내, 자부담 10% 이상을 부담하는 농업인 우선지원</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>융자금리</th>
                                                            <td>연리1%(3년거치, 7년 분할상환) /지원 대상 : 준·전업농 이상</td>
                                                        </tr>
                                                        <tr>
                                                            <th>농업경영회생자금 <br>신청절차</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>(사업신청) 대출 취급기관(농협은행, 일선조합)신청</li>
                                                                    <li>(필요서류) 자구계획서, 제공담보, 이상기후에 따른 생산량 감소 확인(지자체 협조)</li>
                                                                    <li>(사업자 선정) 농협중앙회에서 경영평가위원회 설치 후 재무구조의 건전성, 타당성 등을 고려하여 유형 평가</li>
                                                                    <li>(자금 지원) 대출취급기관은 경영평가위원회의 결정에 따라 자금 지원</li>
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
                                <input type="radio" name="tl-group" id="s2-3_010">
                                <label class="radio_b" for="s2-3_010">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_010" class="h_label">
                                            <h3>농·축산 경영자금지원사업</h3>
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
                                                            <th>신청 사무소</th>
                                                            <td>지역 축협 본점 또는 지점<br>※ 지역·품목 농협, 농협은행 지점(지부) 신청 불가</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대출 금액</th>
                                                            <td>최대 1천만원 이하<br>- 기존에 축협 축산경영자금을 지원받아 잔액이 없을 경우 차감</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대출 기간</th>
                                                            <td>1년 이내(만기시 대환 가능, 대환 횟수 제한 없음)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대출 금리</th>
                                                            <td>변동 금리(6개월 주기 변동 : 1.09%(2016년 6월 기준))<br>- 고정 금리 : 2.5%</td>
                                                        </tr>
                                                        <tr>
                                                            <th>준비 서류</th>
                                                            <td>농업경영체 증명서(등록확인증), 건강보험 자격득실 확인서(국민건강보험공단 발급), 영농규모 확인서(농협 조회 가능) </td>
                                                        </tr>
                                                        <tr>
                                                            <th>제한 사항</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>농업경영체 등록이 안 된 농가는 지원불가</li>
                                                                    <li>연체 등으로 농협 여신취급이 제한되는 자는 지원불가</li>
                                                                    <li>대출금액에 따라 담보물(농신보 보증서, 부동산 등) 제공하여야 함</li>
                                                                    <li>준비서류 외 행정기관에서 추천서, 대상자 선정서류 등 발급 불필요</li>
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
                
                
                    <h3 class="title_txt">사무국장 교육 실시</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_011">
                                <label class="radio_b" for="s2-3_011">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_011" class="h_label">
                                            <h3>사무국장 교육 실시</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>목 적</th>
                                                            <td>전국 지회의 사무국장 업무능력 향상 및 협회와 지회간의 원활한 업무협조체계 구축</td>
                                                        </tr>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 6월 30일(목) ~ 7월 1일(금), 1박 2일간</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>경주 켄싱턴리조트 및 경주시 실내체육관 일대</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>각 시·도 지회 사무국장 15명</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>본 회 일반 행정업무 및 의전 행사 진행요령 안내</li>
                                                                    <li>‘16년도 제 41차 전국양봉인의 날 행사 개최지역(경주) 사전답사 및 지회별 숙박시설 예약</li>
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
                
                
                    <h3 class="title_txt">2016년도 제41차 전국양봉인의날 행사 개최</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_012">
                                <label class="radio_b" for="s2-3_012">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_012" class="h_label">
                                            <h3>2016년도 제41차 전국양봉인의날 행사 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 10월 7일(금) ~ 8일(토), 1박 2일간</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>경주시 실내체육관 일대(경주시 황성동 1022)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>양봉농가 및 관계자(약 5,000명)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요일정</th>
                                                            <td>
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <colgroup>
                                                                        <col style="width:23%;" />
                                                                        <col style="width:23%;" />
                                                                        <col />
                                                                        <col style="width:10%;" />
                                                                    </colgroup>
                                                                    <thead>
                                                                        <tr>
                                                                            <th>일 시</th>
                                                                            <th>시 간</th>
                                                                            <th>주요내용</th>
                                                                            <th>비 고</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td rowspan="4">1일차<br>(10월 7일(금))</td>
                                                                            <td>13:30~16:30</td>
                                                                            <td class="taL">양봉산업발전 심포지움</td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>16:30~18:00</td>
                                                                            <td class="taL">석 식</td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>18:00~19:00</td>
                                                                            <td class="taL">양봉인의날 기념행사<br>- 경북도지사표창, 협회장 감사패, 표창패, 장학상 시상</td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>19:00~21:00</td>
                                                                            <td class="taL">전야제 행사</td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td rowspan="3">2일차<br>(10월 8일(토))</td>
                                                                            <td>10:00~12:00</td>
                                                                            <td class="taL">양봉인 노래자랑</td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>12:00~13:00</td>
                                                                            <td class="taL">중 식</td>
                                                                            <td></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>13:00~15:00</td>
                                                                            <td class="taL">행운권 추첨 및 폐회식</td>
                                                                            <td></td>
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
                
                
                    <h3 class="title_txt">작은벌집딱정벌레감염증(SHB) 발생 보고 및 긴급 방역비 지원</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_013">
                                <label class="radio_b" for="s2-3_013">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_013" class="h_label">
                                            <h3>발생현황</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <ul class="dotList">
                                                    <li>경남 밀양소재 서양벌 양봉농가에서 의심신고(9.22)에 따라 농촌 진흥청에 의뢰되어 검역본부와 합동 현장조사 후 최종 확진(9.23)</li>
                                                    <li>경남 창녕소재 서양벌 농가에서 의심신고(10.5)에 따라 최종확진(10.7)</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_014">
                                <label class="radio_b" for="s2-3_014">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_014" class="h_label">
                                            <h3>방역조치 추진사항</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>· 유관기관 협의회(9.27)를 통해 농가 피해를 최소화하고 즉시 시행할 수 있는 조치를 중심으로 기관별 방역업무 추진</strong>
                                                <ul class="dashList ml15">
                                                    <li>(검역본부)‘작은벌집딱정벌레감염증’구제요령 마련(9.28), 시·도 위생시험소 진단교육(9.29), 작은벌집딱정벌레 해외 유입경로 조사 등</li>
                                                    <li>(농진청) 동 감염증으로 인한 꿀벌농가 피해 최소화 방안 제시(9.28)</li>
                                                    <li>(지자체) 경남도 꿀벌농가 발생상황 조사, 타 시·도 모니터링 검사 (~10.31), 발생농가 확인시 벌통 이동자제 및 구제 등 방역조치 실시</li>
                                                    <li>(협회) 회원농가 대상으로 예찰, 발생상황 및 구제방법 교육 홍보</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_015">
                                <label class="radio_b" for="s2-3_015" >02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_015" class="h_label">
                                            <h3>작은벌집딱정벌레 긴급방역비 지원</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>· 주요내용 : 방제용품 구입 예산은 일반 양봉농가 사용이 제한되며, 각 시·도 지자체별 예산 배정 후 동 감염증 발생농가에 한해 유사시 사용 가능</strong>
                                                <strong>· 방제용품 품목별 지원 내역</strong>
                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                    <thead>
                                                        <tr>
                                                            <th>구 분</th>
                                                            <th>수량(개)</th>
                                                            <th>단가(천원)</th>
                                                            <th>금액(천원)</th>
                                                            <th>비 고</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>트랩</td>
                                                            <td>3,800</td>
                                                            <td>8</td>
                                                            <td>24,000</td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>소비</td>
                                                            <td>67,500</td>
                                                            <td>2</td>
                                                            <td>135,000</td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>중간합계(A)</td>
                                                            <td>-</td>
                                                            <td>-</td>
                                                            <td>159,000</td>
                                                            <td>예산재배정*구제제</td>
                                                        </tr>
                                                        <tr>
                                                            <td>구제제</td>
                                                            <td>26,500</td>
                                                            <td>6</td>
                                                            <td>159,000</td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>살충제</td>
                                                            <td>13,500</td>
                                                            <td>8</td>
                                                            <td>108,000</td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>중간합계(B)</td>
                                                            <td>-</td>
                                                            <td>-</td>
                                                            <td>267,000</td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td>총 계(A+B)</td>
                                                            <td>-</td>
                                                            <td>-</td>
                                                            <td>426,000</td>
                                                            <td>자금교부**</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <span>* 트랩 및 소비에 대한 예산은 수령기관에서 바로 집행할 수 있도록 재교부</span><br>
                                                <span>** 구제제 및 살충제는 작은벌집딱정벌레용으로 국내 허가되는 시점 등을 고려하여 예산 수령기관에서 내년으로 이월 가능토록 예산교부 실시</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                
                    <h3 class="title_txt">식약처 사양벌꿀의 식품유형 신설 고시</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_016">
                                <label class="radio_b" for="s2-3_016">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_016" class="h_label">
                                            <h3>식약처 사양벌꿀의 식품유형 신설 고시</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>국내 유통되는 사양벌꿀의 안정적인 제도권 정착을 위하여 규격 시행 (개정 2016년 5월 31일, 시행 2017년 1월 1일) 전‘사양벌꿀’유형 및 기준규격 개정 관련 미비한 보완을 통한 안정적 제도 시행 및 시장 혼란 예방을 위해 식약처 고시 제2016-43호 시행시기를 식약처 고시 제2016-153호(2016년 12월 29일 고시)에 의거하여 시행시기를
                                                                6개월 연장되어 2017년 7월 1일 부로 시행</td>
                                                        </tr>
                                                        <tr>
                                                            <th>협회 의견</th>
                                                            <td>식품규격에 탄소동위원소비 삽입 및 명칭에 설탕사양 표시 반대</td>
                                                        </tr>
                                                        <tr>
                                                            <th>활동 사항</th>
                                                            <td>사양벌꿀 기준규격 관련 회의 참석(2회) 및 국회의원 방문(2회)</td>
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
                
                
                    <h3 class="title_txt">정부 지원사업</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_017">
                                <label class="radio_b" for="s2-3_017">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_017" class="h_label">
                                            <h3>양봉기자재 사후환급 대상품목 적용</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>내 용</th>
                                                            <td>국무회의에서 농업분야의 비과세 감면 사항을 포함한 소득세법 시행령과 부가가치세법 시행령 개정 의결</td>
                                                        </tr>
                                                        <tr>
                                                            <th>적용 일시</th>
                                                            <td>2016년 2월 11일(목)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>적용품목</th>
                                                            <td>
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>구 분</th>
                                                                            <th>부가가치세 사후 환급품목</th>
                                                                            <th>영세율 적용품목(기존)</th>
                                                                            <th>비 고</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>품 목</td>
                                                                            <td>탈봉기, 소문망</td>
                                                                            <td>벌통, 채밀기, 소초세트(소초광, 사양기, 격리판으로 구성된 것)</td>
                                                                            <td></td>
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
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_018">
                                <label class="radio_b" for="s2-3_018">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_018" class="h_label">
                                            <h3>2016년도 축사시설현대화사업</h3>
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
                                                            <th>사업명</th>
                                                            <td>2016년 축사시설현대화사업</td>
                                                        </tr>
                                                        <tr>
                                                            <th>신청장소</th>
                                                            <td>시·군·구청 축산 담당부서</td>
                                                        </tr>
                                                        <tr>
                                                            <th>사업대상자</th>
                                                            <td>2014년 12월 31일 이전부터 축산업 등록 허가되어 가축을 사육 중인 축산농가 및 법인 또는 농장실무경력 10년 이상이거나 축산관련학과 졸업자(50세 이하)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원범위</th>
                                                            <td>
                                                                - 축사시설 : 물품저장고(창고), 고정건축물 형태의 꿀벌사, 저온저장고 (양봉산물 저장고), 관련 기자재(벌통, 꿀 저장용기, 채밀기, 농축시설 (농축기, 포장기) 등)<br>
                                                                ※ 꿀벌사 및 저온저장고 등 고정건축물을 신개축 시 관련 기자재 지원 가능하며 기자재 단독 지원은 불가<br>
                                                                ※ 다만, 벌통, 농축기, 포장기, 채밀기, 스테인레스 드럼통 구비(단가 40만원 이내) 등 내구재는 시설로 간주하여 건축물 시·개축 없이도 지원 가능
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>축산시설 및 <br>경관개선 시설</th>
                                                            <td>밀원수 식재 포함</td>
                                                        </tr>
                                                        <tr>
                                                            <th>축산시설 <br>지원 특례</th>
                                                            <td>
                                                                이동형 양봉이 다수인 양봉산업 실태를 고려하여 이동형 카라반에 제한적으로 지원
                                                                <ul class="dashList">
                                                                    <li>규모와 관계없이 반드시 융자사업(이차보전)으로만 지원하도록 하고, 2,000만원을 한도로 하여 지원(초과분은 자부담)</li>
                                                                    <li>이동형 카라반을 지원받고자 하는 농가는 양봉협회 등 양봉관련 단체로부터 양봉 기자재 현대화 농가로서 추천을 받은 전업농가여야 하며, 해당 관련 서류를 사업 신청 시 첨부</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">지원 형태</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>구 분</th>
                                                                            <th>보조+융자</th>
                                                                            <th>이차보전방식</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>대 상</td>
                                                                            <td>30군~300군</td>
                                                                            <td>301군 이상(기업농)</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>금 액</td>
                                                                            <td>최대 2억2천</td>
                                                                            <td>최대 7억</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>지원형태</td>
                                                                            <td>보조 20%, 융자 60%, 자부담 20% <br>(연리 2%, 5년거치 10년 상환)</td>
                                                                            <td>융자 80%, 자부담 20% <br>(연리 1%, 5년거치 10년 상환)</td>
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
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_019">
                                <label class="radio_b" for="s2-3_019">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_019" class="h_label">
                                            <h3>2016년도 벌꿀가공육성지원사업(수매자금)</h3>
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
                                                            <th>사업명</th>
                                                            <td>2016년 벌꿀가공육성지원사업</td>
                                                        </tr>
                                                        <tr>
                                                            <th>신청 장소</th>
                                                            <td>(사)한국양봉협회 사무국</td>
                                                        </tr>
                                                        <tr>
                                                            <th>사업대상자</th>
                                                            <td>벌꿀을 원료로 하여 벌꿀 가공식품을 생산하는 업체 및 생산자 단체</td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원자격</th>
                                                            <td>연간 벌꿀 사용실적이 20톤 이상인 업체<br>(단, 사업기간이 1년 미만인 신규 업체는 예외)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원용도</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>사업의 운영에 필요한 자금</li>
                                                                    <li>운영자금 상환기일 도래시 소요자금 범위 내에서 재대출 대환 가능<br>※ 단, 시설 개·보수 자금은 지원하지 않음</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원규모</th>
                                                            <td>
                                                                꿀가공산업육성지원에 소요되는 자금을 개소당 5억원 한도로 융자지원<br>- 단, 벌꿀가공육성지원사업 선정심의위원회에서 5억원 이상 지원이 필요하다고 인정하는 경우에는 예외
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원조건</th>
                                                            <td>융자(연리 2.5%, 2년 이내 상환)<br>- 농업경영체가 금리 적용방식(고정, 연동) 선택 가능
                                                                <ul class="dotList">
                                                                    <li>고정 : 대출금 만기 시까지 2.5%의 고정금리 적용</li>
                                                                    <li>연동 : 최초금리는 대출시점 기준금리에 의해 결정되고 일정 주기에 따라 금리가 변동됨(기준금리에 연동하여 상승 또는 하락)</li>
                                                                </ul>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>제출서류</th>
                                                            <td>- 신청서, 사업계획서, 최근 2개년 결산 재무제표, 건축물 관리대장 및 임대차 계약서, 사업계획증빙서류(계약서, 카달로그, 견적서 등)<br>※ 접수를 희망하는 업체의 경우 본 협 사무국으로 연락하여 신청양식을 수령하시기 바라며, 서류 제출 시 설정 담보에 맞게 지원 자금을 기제 하여야 불이익이 없습니다.</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_020">
                                <label class="radio_b" for="s2-3_020">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_020" class="h_label">
                                            <h3>2016년도 농가사료직거래 활성화 자금지원</h3>
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
                                                            <th>총 사업비</th>
                                                            <td>4,500억원(전국)<br>- ‘15년 시·도별 대출실적을 고려 예산우선 배정</td>
                                                        </tr>
                                                        <tr>
                                                            <th>자금 용도</th>
                                                            <td>신규사료구매 및 기존 외상금액 상환</td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원조건</th>
                                                            <td>융자 100%(금리 1.8%, 2년 일시상환)<br>※ 사료범위 : 꿀벌 전용사료 및 꿀벌 기능성 사료</td>
                                                        </tr>
                                                        <tr>
                                                            <th>지원대상</th>
                                                            <td>축산업등록제에 참여한 축산농가 및 법인<br>
                                                                ※ 기존 사료구매 정책자금 대출자도 추가지원 가능. 단, 기존 대출금 상환 불가<br>
                                                                ※ 축산업등록을 하지 않은 농가는 축산업등록 후 추가 신청 및 선정·추천 가능
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th>대출기관</th>
                                                            <td>지역농협·축협 / 시행주체 : 지자체</td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">지원한도 및 지원 단가</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>구 분(꿀벌)</th>
                                                                            <th>농가당 지원한도</th>
                                                                            <th>군당 지원단가</th>
                                                                            <th>비 고</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>금 액</td>
                                                                            <td>90,000천원</td>
                                                                            <td>150천원</td>
                                                                            <td></td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                                <span>※ 대출금은 지역 농·축협에서 직접 사료업체에 입금</span>
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
                                <input type="radio" name="tl-group" id="s2-3_021">
                                <label class="radio_b" for="s2-3_021">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_021" class="h_label">
                                            <h3>국립산림과학원 밀원수 식재 정책수립을 위한 간담회 참석</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 2월 17일(수)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국립산림과학원(본관 중회의실)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참가자</th>
                                                            <td>약 50여명(국립산림과학원장, 산림청, 문화재청, 양봉협회장 등)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>양봉산물 생산증대를 위한 밀원식물 보호와 조성사업을 위한 논의</li>
                                                                    <li>밀원식물보호 및 조성을 위한 상호 정보교류 및 지원</li>
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
                                <input type="radio" name="tl-group" id="s2-3_022">
                                <label class="radio_b" for="s2-3_022">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_022" class="h_label">
                                            <h3>2016년도 축산분야 업무보고대회 참석</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 3월 22일(화)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>농협 안성팜랜드</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대 상</th>
                                                            <td>농림부장관, 농진청장, 축산단체장, 학계, 업계 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요 <br>건의내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>봉독의 동물의약품 승인 협조 건의</li>
                                                                    <li>밀원별 벌꿀의 성분 분석 및 R&D 사업을 위한 대단위 연구사업 추진 건의</li>
                                                                    <li>도시양봉 및 취미양봉(퇴직자)의 증가로 충분한 밀원수 확충 및 실버산업 활성화 건의</li>
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
                                <input type="radio" name="tl-group" id="s2-3_023">
                                <label class="radio_b" for="s2-3_023">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_023" class="h_label">
                                            <h3>2016년도 한국양봉학회 춘계학술대회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 3월 24일(목) ~ 25일(금)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>지역곤충자원산업화지원센터(경북 상주 소재)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대 상</th>
                                                            <td>양봉학회 관련자 및 양봉농가</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요 내용 <br>및 일정</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>한국양봉학회 정기총회 및 춘계학술대회 발표</li>
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
                                <input type="radio" name="tl-group" id="s2-3_024">
                                <label class="radio_b" for="s2-3_024">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_024" class="h_label">
                                            <h3>2016년도 밀원수 식목행사 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 4월 6일(수)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국립농업과학원 농업생물부 종봉시험장(전북 부안군 위도면 소재)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석대상</th>
                                                            <td>약 150명(농진청, 시·도 지회장 및 회원농가)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>식재수목</th>
                                                            <td>헛개나무, 쉬나무, 모감주나무 등 약 5,000주</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_025">
                                <label class="radio_b" for="s2-3_025">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_025" class="h_label">
                                            <h3>세계양봉연맹(아피몬디아) 이사회 참석</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 5월 26일(목) ~ 6월 1일(화) / 5박 6일간</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>이탈리아 로마</td>
                                                        </tr>
                                                        <tr>
                                                            <th>대 상</th>
                                                            <td>조균환 회장 외 2명(통역 및 수행직원)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>2015 대전세계양봉대회 결과 보고 및 국외 양봉산업 현황/문제점 논의</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-3_026">
                                <label class="radio_b" for="s2-3_026">05</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_026" class="h_label">
                                            <h3>전국 농수축산인 총궐기대회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 7월 20일(수), 13:00~</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>서울 여의도 국회의사당 앞</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>약 10,000명<br>- 총 29개 농수축산연합회 소속 농수축산인</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>부정청탁금지법(김영란법) 농축수산물 제외</li>
                                                                    <li>기업의 축산업 진출 반대 및 농협법 개정 반대</li>
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
                                <input type="radio" name="tl-group" id="s2-3_027">
                                <label class="radio_b" for="s2-3_027">06</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-3_027" class="h_label">
                                            <h3>FTA 양봉산물 경쟁력 강화 전략 국제심포지움 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:13%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2016년 11월 10일(목), 13:30 ~</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>농협중앙회 서울지역본부</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주최/주관</th>
                                                            <td>국립농업과학원/한국양봉농협</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dashList">
                                                                    <li>양봉산물 국제규격 표준화 및 외국의 양봉산물 수출 전략</li>
                                                                    <li>국내 양봉산물 연구·산업 발전방안 논의 및 종합토론</li>
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
