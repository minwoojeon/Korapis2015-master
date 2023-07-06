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
.s21tb table {font-size: 13px;line-height: 19px;" width:100%; table-layout:fixed}
.s21tb table th{vertical-align: top}
.s21tb table.management_table th{vertical-align:middle;}
.event {margin-bottom: 40px;}
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
                        <li><a href="/jsp/sub2-1_02.jsp" target="_self">2014</a></li>
                        <li class="on"><a href="/jsp/sub2-1_01.jsp" target="_self">2013</a></li>
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
                                            <h3>월간 양봉협회보 발행 </h3>
                                        </label>
                
                                        <div class="content-inner show">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">기 간</th>
                                                    <td>2013년 1월~12월, 총 12회</td>
                                                </tr>
                                                <tr>
                                                    <th>부 수</th>
                                                    <td>매월 약 6,000부, 약 60페이지 분량</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>광고, 협회소식, 양봉소식, 축산소식, 정부정책자료, 양봉사양관리, 해외양봉, 특별기고, 주요 알림 등</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_002">
                                <label class="radio_b" for="s2-1_002">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_002" class="h_label">
                                            <h3>양봉자조금 소식지 발행 </h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">발행 일시</th>
                                                    <td>2013년 6월(1회)</td>
                                                </tr>
                                                <tr>
                                                    <th>부 수</th>
                                                    <td>5,700부, 약 20페이지 분량</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>2013년 양봉자조금 TV/라디오 홍보 현황 및 사업진행 현황, 자조금 납부 현황 등 </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                
                        </ul>
                    </section>
                
                    <h3 class="title_txt">벌꿀 홍보사업(마사회 특별적립금)</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_003">
                                <label class="radio_b" for="s2-1_003">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_003" class="h_label">
                                            <h3>‘허니데이(Honey Day)’ 행사 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 5월 21일(화), 1일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>서울 잠실 야구 경기장</td>
                                                </tr>
                                                <tr>
                                                    <th>홍보대상</th>
                                                    <td>야구 관람객(20~30대 젊은층) 약 25,000명</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td> - 장내․외 ‘허니데이’ 홍보 현수막 설치(총 52개)<br />
                                                        - 양봉산물 홍보부스 설치 및 무료시음 실시<br />
                                                        - 관람객 참가 이벤트(룰렛 돌리기) 및 기념품(벌꿀 및 프로폴리스비누 등) 제공<br />
                                                        - 두산베어스 선수단 벌꿀 세트(100세트) 전달식 <br />
                                                        - 조균환 한국양봉협회장 기념시구<br />
                                                        - 전광판 벌꿀 홍보 광고(15초) 및 이미지 스팟 다회 노출<br />
                                                        - 응원석 이벤트를 통한 ‘허니데이’ 홍보 및 벌꿀세트 증정<br />
                                                        - 스포츠 신문 및 축산 관련지 홍보기사</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_004">
                                <label class="radio_b" for="s2-1_004">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_004" class="h_label">
                                            <h3>홍보물 제작(리플렛 및 기념품)</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">제작물</th>
                                                    <td>홍보 책자(리플렛) 및 기념품(주방용 앞치마)</td>
                                                </tr>
                                                <tr>
                                                    <th>수 량</th>
                                                    <td>리플렛 12,000부 및 기념품 12,000개</td>
                                                </tr>
                                                <tr>
                                                    <th>제작기간</th>
                                                    <td>2013년 1월 ~ 12월<br />
                                                        ※ 각종 전시 및 홍보행사 시 배포예정</td>
                                                </tr>
                                                <tr>
                                                    <th>주 제</th>
                                                    <td>대자연이 준 최고의 선물 우리벌꿀 ~</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- (리플렛)꿀벌의 공익적 가치 및 다양한 양봉산물 소개<br />
                                                        - (리플렛)양봉산물의 효능 및 이용법 소개 <br />
                                                        - (기념품)친환경 제품 제작 및 배포를 통해 양봉산업이 친환경 사업임을 소비자들에게 인식제고</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                
                        </ul>
                    </section>
                
                    <h3 class="title_txt">2015 세계양봉대회 활동 현황</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_005">
                                <label class="radio_b" for="s2-1_005">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_005" class="h_label">
                                            <h3>아피몬디아 세계양봉대회 대표자회의 참가</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 4월 13일(토) ~ 14일(일), 2일간 </td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>우크라이나 키예프 라마다 호텔</td>
                                                </tr>
                                                <tr>
                                                    <th>참가자</th>
                                                    <td>총 25명 (아피몬디아 임원 및 분과위원장 등)</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 제43회 우크라이나 세계양봉대회 준비상황 보고<br />
                                                        - 제44회 한국 세계양봉대회 준비상황 보고
                
                                                    </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_006">
                                <label class="radio_b" for="s2-1_006">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_006" class="h_label">
                                            <h3>2013 우크라이나 세계양봉대회 조직위원장 방한</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 8월 29일(목) ~ 30일(금) 2일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>본 협 사무국 </td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 2013우크라이나 세계양봉대회 참가 시 국내대회 홍보방법 논의<br />
                                                        (한국인의 밤 개최, 폐막식 중 PPT 및 동영상 홍보, 홍보부스 운영 등)<br />
                                                        - 성공적인 2015 세계양봉대회 개최를 위한 양국 간 협의사항 논의<br />
                                                        (각국 대표자 접견 방법 및 아피몬디아 회원관리자 프로그램 개발 등)</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_007">
                                <label class="radio_b" for="s2-1_007">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_007" class="h_label">
                                            <h3>2015 대전 세계양봉대회 업무협약(MOU) 체결</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td>성공적인 2015 대전 세계양봉대회 개최 및 상호 협력을 위해 대전광역시 및 협회 간 업무협약 체결 </td>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 9월 9일(월)</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>대전 광역시청 대회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td> - 2015 세계양봉대회 조직위원회 구성 및 기본계획 수립<br />
                                                        - 기관별 업무분담(대전광역시 및 협회)<br />
                                                        - 조직위원회 운영(예산 집행 및 결산업무 전문인력 파견 등) </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_008">
                                <label class="radio_b" for="s2-1_008">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_008" class="h_label">
                                            <h3>2013 우크라이나 세계양봉대회 참가</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">기 간</th>
                                                    <td>2013년 9월 29일(일) ~ 10월 4일(금), 6일간<br />
                                                        - 국내참가자 : 2013년 9월 27일(금) ~ 10월 6일(일), 10일간 </td>
                                                </tr>
                
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>우크라이나 키예프 국제 전시센터</td>
                                                </tr>
                                                <tr>
                                                    <th>참가규모</th>
                                                    <td>135개국 약 9,000여명 참가(국내 참가자 총 66명)</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>제 44회 2015 세계양봉대회 홍보 및 각국 대표자 참가독려
                                                        (한국관 전시부스홍보, 한국인의 밤 개최, 동영상 및 PPT 발표,
                                                        기념품(USB, 자석, 볼펜, 리플렛, 부채 등)) </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_009">
                                <label class="radio_b" for="s2-1_009">05</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_009" class="h_label">
                                            <h3>2015 대전 세계양봉대회 조직위원회 발기인 대회 및 창립총회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 11월 1일(월)</td>
                                                </tr>
                
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>대전시청 중회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>조직위 법인 설립 취지문, 조직위 정관(안), 임원 구성(안) 및 사업계획안 등 심의․의결</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_010">
                                <label class="radio_b" for="s2-1_010">06</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_010" class="h_label">
                                            <h3>우크라이나 양봉협회 방문</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td>2015 세계양봉대회 개최 시 유럽국가의 참가 독려</td>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 11월 20일(수) ~ 23일(토) 4일간</td>
                                                </tr>
                
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>우크라이나 키예프</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 2013 우크라이나 세계양봉대회 개최 시 애로사항 논의<br />
                                                        - 2013 우크라이나 세계양봉대회 준비과정 논의</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">벌꿀 소비촉진을 위한 토론회</h3>
                    <section>
                        <ul class="timeline">
                
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_011">
                                <label class="radio_b" for="s2-1_011">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_011" class="h_label">
                                            <h3>벌꿀 소비촉진을 위한 토론회</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td>- 정체된 벌꿀 소비촉진 및 판매를 위한 정부의 안정화 대책마련 건의<br />
                                                        - 벌꿀 소비촉진을 위한 관심과 정책유도 선포식 개최</td>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 4월 10일(수) </td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>농협 안성교육원 상생관</td>
                                                </tr>
                                                <tr>
                                                    <th>주 제</th>
                                                    <td>정체된 벌꿀, 소비안정화 대책마련 </td>
                                                </tr>
                                                <tr>
                                                    <th>참석자</th>
                                                    <td>양봉관련인 약 300명</td>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">주요내용</th>
                                                    <td> - 양봉산업 현 실태 동영상 상영(3~4분)<br />
                                                        - 벌꿀 소비촉진 선포식 개최<br />
                                                        - 주제발표(국내․외 양봉산업 비교, 벌꿀 등급제 시행방안 등)<br />
                                                        - 토론회(질의 및 응답) </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">주요 건의사항 (양봉협회 → 농림축산식품부)</th>
                
                                                </tr>
                                                <tr>
                
                                                    <td colspan="2">- 벌꿀 등급제 시행을 통한 소비자 불신 해소<br />
                                                        - 벌꿀 및 무설탕 구분을 위한 연구사업 시행<br />
                                                        - 생산비 절감을 위한 H․S 코드신설 촉구<br />
                                                        - 벌꿀 가공육성지원자금 금리 인하(3%→1%)<br />
                                                        - 양봉산업 육성 및 지원법 입법화</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                
                
                        </ul>
                    </section>
                
                    <h3 class="title_txt">품질관리업소 대표자 회의</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_012">
                                <label class="radio_b" for="s2-1_012">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_012" class="h_label">
                                            <h3>품질관리업소 대표자 회의</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table width="100%">
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td>경기침체 및 소비자 불신, 벌꿀 재고량 정체로 벌꿀 소비가 둔화 됨에 따라 자체 벌꿀 등급제 기준(안) 논의를 위한 회의 개최</td>
                                                </tr>
                                                <tr>
                                                    <th>일 시</th>
                                                    <td>2회(2013년 4월 23일)(화) / 2013년 12월 4일(수))</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>본 협 대회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>참가자</th>
                                                    <td>품질관리업소 대표자 약 20명</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>규격/기준(자체벌꿀 등급제 2개 등급 운영)</td>
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
                                                                    <th>항 목</th>
                                                                    <th>1 등급</th>
                                                                    <th>2 등급</th>
                                                                    <th>비 고</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td>탄 소<br />동위원소비(‰)</td>
                                                                    <td>-23.5 ∼ -24.0</td>
                                                                    <td>-20.0 이하</td>
                                                                    <td>아카시아, 잡화 <br />동일 적용</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>수 분(%)</td>
                                                                    <td>23.0 이하</td>
                                                                    <td>25.0 이하</td>
                                                                    <td>-</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>HMF(mg/kg)</td>
                                                                    <td>8.0 이상</td>
                                                                    <td>15.0 이하</td>
                                                                    <td>-</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>당비율(%)</td>
                                                                    <td>아카시아 1.45 이상<br />잡화 1.20 이상</td>
                                                                    <td>-</td>
                                                                    <td>-</td>
                                                                </tr>
                
                                                            </tbody>
                                                        </table>
                                                        <p style="padding:3px 15px 0">
                                                            ※ 2014년 자체 벌꿀 등급 스티커 제작 시행<br />
                                                            ※ 2014년부터 자체 벌꿀 등급제 집중 홍보(자조금 사업)
                                                        </p>
                
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">벌꿀 품질관리 규격기준 강화</th>
                
                                                </tr>
                                                <tr>
                                                    <td colspan="2">- 제품 안전성을 위한 품질관리 강화로 소비자 신뢰 회복 마련<br />
                                                        - 타 국가와 통용 가능한 품질관리로 해외수출관련 자료 제공<br />
                                                        - 소비자단체, 언론보다 먼저 위생 부분 품질관리 필요</td>
                
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
                                <input type="radio" name="tl-group" id="s2-1_013">
                                <label class="radio_b" for="s2-1_013" >01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_013" class="h_label">
                                            <h3>시․도 지회별 밀원식재사업 현황</h3>
                                        </label>
                                        <div class="content-inner">
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
                                                        <th>일 시</th>
                                                        <th>주 최</th>
                                                        <th>행사명</th>
                                                        <th>식재량</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>2013.4.4 (목)</td>
                                                        <td>음성군</td>
                                                        <td>밀원수종 확보를 위한 밀원식재행사</td>
                                                        <td>때죽나무 1,000주<br />
                                                            아까시나무 1,000주</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2013.4.5 (금)</td>
                                                        <td>공주시</td>
                                                        <td>제68회 식목일 맞이‘밀원단지조성’</td>
                                                        <td>아까시나무 <br />
                                                            1만 5천 주</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2013.4.5 (금)</td>
                                                        <td>포천시</td>
                                                        <td>제68회 식목일 맞이‘포천탄생 600년 기념’</td>
                                                        <td>산벚나무 600주</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2013.4.24.(금)</td>
                                                        <td>강릉시</td>
                                                        <td>2013년 밀원수 조림 및 양봉단지 조성사업</td>
                                                        <td>아까시나무 <br />
                                                            1만 3,500주</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2013.11.6 (금)</td>
                                                        <td>공주시</td>
                                                        <td>밀원수림 조성을위한 아까시나무 식재행사</td>
                                                        <td>아까시나무 9,000주</td>
                                                    </tr>
                
                                                </tbody>
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
                                            <h3>각 시․도 도심양봉사업 추진</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th colspan="2">경남도청 도심양봉</th>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">- 장 소</th>
                                                    <td>경남도청사 신관 2층 야외 옥상</td>
                                                </tr>
                
                                                <tr>
                                                    <th style="width:90px">- 채밀량</th>
                                                    <td>아카시아 벌꿀 40리터</td>
                                                </tr>
                
                                                <tr>
                                                    <th style="width:90px">- 관계자</th>
                                                    <td>홍준표 경남도지사, 조균환 협회장, 정현조 경남지회장</td>
                                                </tr>
                
                                                <tr>
                                                    <th colspan="2"> 대전시청 도심양봉</th>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">- 장 소</th>
                                                    <td>대전시청사 동편 옥상</td>
                                                </tr>
                
                                                <tr>
                                                    <th style="width:90px">- 채밀량</th>
                                                    <td>아카시아 벌꿀 60kg</td>
                                                </tr>
                
                                                <tr>
                                                    <th style="width:90px">- 관계자</th>
                                                    <td>정하윤 대전시 경제정책과장, 박근호 대전지회장, 대전시의회 등</td>
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
                                            <h3>산림청 ‘숲사랑 지도원증’ 발급</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:50px">목 적</th>
                                                    <td>양봉산업의 근간이 되는 밀원수 및 산림보호</td>
                                                </tr>
                                                <tr>
                                                    <th>대 상</th>
                                                    <td>양봉농가</td>
                                                </tr>
                                                <tr>
                                                    <th>역 할</th>
                                                    <td>묘목을 배거나 산림을 훼손시 지도원으로써, 이를 제지 하거나 산림청에 건의 및 보고 가능</td>
                                                </tr>
                
                                                <tr>
                                                    <td colspan="2">※ 국립산림공원 무료입장 가능 </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">신청현황</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>지 회</th>
                                                                    <th>신청자 수</th>
                                                                    <th>비 고<br />(관할지역 산림청)</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>합 계</th>
                                                                    <th>77명</th>
                                                                    <th> </th>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                                <tr>
                                                                    <td>서 울</td>
                                                                    <td>3명</td>
                                                                    <td>북부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>경 기</td>
                                                                    <td>7명</td>
                                                                    <td>북부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>강 원</td>
                                                                    <td>16명</td>
                                                                    <td>북부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>경 북</td>
                                                                    <td>8명</td>
                                                                    <td>남부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>경 남</td>
                                                                    <td>6명</td>
                                                                    <td>서부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>충 북</td>
                                                                    <td>6명</td>
                                                                    <td>중부지방 산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>충 남</td>
                                                                    <td>7명</td>
                                                                    <td>중부지방 산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>전 북</td>
                                                                    <td>4명</td>
                                                                    <td>서부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>광주․전남</td>
                                                                    <td>7명</td>
                                                                    <td>서부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>대 구 </td>
                                                                    <td>4명</td>
                                                                    <td>남부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>부 산</td>
                                                                    <td>4명</td>
                                                                    <td>남부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>울 산</td>
                                                                    <td>1명</td>
                                                                    <td>남부지방산림청</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>제 주</td>
                                                                    <td>4명</td>
                                                                    <td>남부지방산림청</td>
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
                
                    <h3 class="title_txt">제39차 전국 양봉인의 날 행사</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_016">
                                <label class="radio_b" for="s2-1_016">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_016" class="h_label">
                                            <h3>행사개요</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 10월 15일(화) ~ 16일(수) 2일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>산청군 축제광장(산청세계전통의약엑스포 부행사장) 산청문화예술회관</td>
                                                </tr>
                                                <tr>
                                                    <th>홍보대상</th>
                                                    <td>약 10,000명<br />
                                                        - 전국양봉농가 5,000여명, 양봉관계자 및 산청군민 5,000여명</td>
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
                                                                    <th>일자</th>
                                                                    <th>주요내용</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>1일차<br />
                                                                        (10월 15일)</td>
                                                                    <td class="t_left"><strong>2013 양봉산업발전 심포지움</strong><br />
                                                                        - 개회식 및 인사말<br />
                                                                        - 한국양봉산업의 현황 및 비전<br />
                                                                        &nbsp; (한국양봉협회 최규혁 사무총장)<br />
                                                                        - 일본양봉산업의 현황 및 비전<br />
                                                                        &nbsp; (야마구치 키쿠치 재팬로얄제리 대표)<br />
                                                                        - 프로폴리스 생산과 제조방법(이용림 (주)비엔케어대표)<br />
                                                                        <strong>양봉인 노래자랑</strong><br />
                                                                        <strong>양봉인의 밤 (전야제)</strong></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2일차<br />
                                                                        (10월 16일)</td>
                                                                    <td class="t_left"><strong>양봉인의 날 기념행사 (개회식)</strong><br />
                
                                                                        <strong>폐회식 및 경품추첨</strong></td>
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
                
                    <h3 class="title_txt">국내벌꿀 해외시장 진출</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_017">
                                <label class="radio_b" for="s2-1_017">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_017" class="h_label">
                                            <h3>일본 수출관련 내용</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">배 경</th>
                                                    <td> - 국내 벌꿀시장의 소비침체로 인한 벌꿀 재고량 증가 및 적체<br />
                                                        - 저가 수입꿀 유통으로 인한 벌꿀 소비감소 해결을 위한 새로운 판로 개척</td>
                                                </tr>
                                                <tr>
                                                    <th>기 간</th>
                                                    <td>2013년 1월 ~ 12월</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>한․일 양국간 양봉산업 유통실태조사 및 수출 협의</td>
                                                </tr>
                                                <tr>
                                                    <th>추진경과<br />(총 8회)</th>
                                                    <td>- 수출 관련 협의를 위한 협회 관계자 일본 방문(3회)<br />
                                                        - 일본 양봉관계자 국내 채밀현장(5곳) 방문(1회)<br />
                                                        - 국내 생산시설 / 품질검사 기관 방문(2회)<br />
                                                        - 벌꿀 수출물품 모니터링(2회)<br />
                                                        - 벌꿀 수출 최종심의 후 물품 선적(2014년 1월 8일)</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_018">
                                <label class="radio_b" for="s2-1_018">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_018" class="h_label">
                                            <h3>국내벌꿀 일본 수출기념 선적식 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 자</th>
                                                    <td>2014년 1월 8일(수), 10:00 ~</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>부산항 화물 컨테이너 부두(부산 문현동 소재)
                                                        - 수출 경로 : 부산 항 → 일본 나고야 항</td>
                                                </tr>
                                                <tr>
                                                    <th>수출 물량</th>
                                                    <td>약 68드럼(약 20톤 물량)</td>
                                                </tr>
                                                <tr>
                                                    <th>수입자</th>
                                                    <td>일본 일신양봉원</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">벌꿀 정의 개정/ 벌집꿀 규격기준 신설</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_019">
                                <label class="radio_b" for="s2-1_019">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_019" class="h_label">
                                            <h3>벌꿀 정의 개정/벌집꿀 규격기준 신설(식약처 제2013-204호)</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <td style="width:100%">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>현 행</th>
                                                                    <th>개 정</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td class="t_left">1) 정의<br />
                                                                        벌꿀류란 꿀벌들이 꽃꿀, 수핵 등
                                                                        자연물을 채집하여 벌집에 저장한 <span style="text-decoration:underline;">것을 채밀한 것 또는 일벌의 인두선에서 분비되는 분비물을 그대로 또는 섭취가 용이하도록 가공한 것을 말한다.</span></td>
                                                                    <td class="t_left">1) 정의<br />
                                                                        벌꿀류란 꿀벌들이 꽃꿀, 수핵 등 자연물을 채집하여 벌집에 저장한 <span style="text-decoration:underline;">벌집꿀과 이것에서 채밀한 벌꿀로서 화분, 로얄젤리, 당류, 감미료 등 다른 식품이나 식품 첨가물을 첨가하지 아니한 것을 말한다.</span></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left">4) 식품유형<br /><br /><br />
                                                                        <p style="text-align:center"> (신 설)</p>
                                                                    </td>
                                                                    <td class="t_left">4) 식품유형<br />
                                                                        (1) 벌집꿀<br />
                                                                        꿀벌들이 꽃꿀, 수액 등 자연물을 채집하여 벌집 속에 저장한 후 벌집의 전체 또는 일부를 봉한 것으로, 벌집 고유의 형태를 유지하고 있는 것을 말한다. </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left">(1) 벌 꿀<br />
                                                                        꿀벌들이 꽃꿀, 수액 등 자연물을
                                                                        채집하여 벌집에 <span style="text-decoration:underline;">저장한 것을 채밀한
                                                                            것으로, 채밀 후 화분, 로얄젤리, 당류,
                                                                            감미료 등 다른 식품이나 식품첨가물을 첨가하지 아니한 것을 말한다.</span></td>
                                                                    <td class="t_left">(1) 벌 꿀<br />
                                                                        꿀벌들이 꽃꿀, 수액 등 자연물을 채집하여 벌집에 <span style="text-decoration:underline;">저장한 것을 채밀한 것으로, 숙성된 것을 말한다.</span></td>
                                                                </tr>
                
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th style="width:100%; text-align:center; vertical-align: middle;"><br /> 규격 개정 </th>
                                                </tr>
                                                <tr>
                                                    <td style="width:100%">
                                                        <table class="management_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="규격/기준">
                                                            <caption>부저병</caption>
                                                            <colgroup>
                                                                <col width="*">
                                                                <col width="*">
                                                                <col width="*">
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>항목 ＼ 유형</th>
                                                                    <th>벌 집 꿀</th>
                                                                    <th>벌 꿀</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">① 수분 (%)</td>
                                                                    <td>23.0 이하</td>
                                                                    <td>20.0 이하</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">② 물품용품 (%)</td>
                                                                    <td></td>
                                                                    <td>0.5 이하</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">③ 산도 (meg/kg)</td>
                                                                    <td></td>
                                                                    <td>40.0 이하</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">④ 전화당 (%)</td>
                                                                    <td>50.0 이상</td>
                                                                    <td>60.0 이하</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">⑤ 자당(%)</td>
                                                                    <td>15.0 이하</td>
                                                                    <td>7.0 이하</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">⑥ H.M.F(mg/kg)</td>
                                                                    <td>80.0 이하</td>
                                                                    <td>80.0 이하</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">⑦ 타르색소 </td>
                                                                    <td></td>
                                                                    <td>불검출</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">⑧ 인공 감미료</td>
                                                                    <td></td>
                                                                    <td>불검출</td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="t_left" style="vertical-align: middle;">⑨ 이성화당</td>
                                                                    <td></td>
                                                                    <td>음 성</td>
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
                
                    <h3 class="title_txt">벌꿀등급제 관련 회의 개최</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_020">
                                <label class="radio_b" for="s2-1_020">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_020" class="h_label">
                                            <h3>벌꿀등급제(벌꿀인증제) 시행에 따른 현장 실태 조사</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2012년 7월 ~ 2013년 4월</td>
                                                </tr>
                                                <tr>
                                                    <th>조사자</th>
                                                    <td>농림축산식품부, 축평원, 협회</td>
                                                </tr>
                                                <tr>
                                                    <th>방문장소</th>
                                                    <td> - 농축장 : 충남지역 2개소, 경기지역 3개소, 서울지역 1개소<br />
                                                        - 양봉장 : 경기지역 2개소</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_021">
                                <label class="radio_b" for="s2-1_021">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_021" class="h_label">
                                            <h3>벌꿀등급제(벌꿀인증제) 관련 소비자 간담회 </h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td>전국 벌꿀등급제(벌꿀인증제) 관련사업 설명회</td>
                                                </tr>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 5월 2일(목) </td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>한국소비자 단체협의회 회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 국내 양봉산업의 실태 및 현황, 벌꿀 등급제 사업설명 및 의견수렴</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>
                
                    <h3 class="title_txt">각종 FTA 추진현황</h3>
                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_022">
                                <label class="radio_b" for="s2-1_022">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_022" class="h_label">
                                            <h3>국가별 양허 협상결과 비교</h3>
                                        </label>
                                        <div class="content-inner">
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
                                                        <th>한·캐나다</th>
                                                        <th>한·호주</th>
                                                        <th>한·중</th>
                                                        <th>한·뉴질랜드</th>
                                                    </tr>
                                                </thead>
                
                                                <tbody>
                                                    <tr>
                                                        <td>천연꿀</td>
                                                        <td>양허제외+TRQ</td>
                                                        <td>양허제외</td>
                                                        <td>양허제외</td>
                                                        <td>양허제외</td>
                                                    </tr>
                                                    <tr>
                                                        <td>인조꿀</td>
                                                        <td>10년철폐</td>
                                                        <td>양허제외</td>
                                                        <td>양허제외</td>
                                                        <td>양허제외</td>
                                                    </tr>
                                                    <tr>
                                                        <td>벌꿀 조제품</td>
                                                        <td>10년철폐</td>
                                                        <td>양허제외</td>
                                                        <td>양허제외</td>
                                                        <td>7년 철폐</td>
                                                    </tr>
                                                    <tr>
                                                        <td>관세율</td>
                                                        <td>천연꿀(243%)<br />
                                                            인조꿀(243%)<br />
                                                            로얄제리(8%)<br />
                                                            벌꿀 조제품(8%)</td>
                                                        <td>천연꿀(243%)<br />
                                                            인조꿀(243%)<br />
                                                            로얄제리(8%)<br />
                                                            벌꿀 조제품(8%)</td>
                                                        <td>천연꿀(243%)<br />
                                                            인조꿀(243%)<br />
                                                            로얄제리(8%)<br />
                                                            벌꿀 조제품(8%)</td>
                                                        <td>천연꿀(243%)<br />
                                                            인조꿀(243%)<br />
                                                            로얄제리(8%)<br />
                                                            벌꿀 조제품(8%)</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_023">
                                <label class="radio_b" for="s2-1_023">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_023" class="h_label">
                                            <h3>영연방 3개국 FTA 및 TPP 협상동향</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th colspan="2">영연방 3개국(호주/뉴질랜드/캐나다) FTA 협상동향</th>
                                                </tr>
                                                <tr>
                                                    <td style="width:90px">- 추진계획 :</td>
                                                    <td>‘14년도 가시적인 협상타결 예정</td>
                                                </tr>
                                                <tr>
                                                    <td style="width:90px">- 영연방측 :</td>
                                                    <td> 한미 FTA 와 같은 수준의 협상을 원함</td>
                                                </tr>
                                                <tr>
                                                    <td style="width:90px">- 정부방안 :</td>
                                                    <td>쇠고기, 낙농품 등 축산물에 큰 타격 없도록 추진계획</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">TPP(환태평양 경제동반자 협정) 추진동향 및 계획</th>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:top">- 정 의 :</td>
                                                    <td>아시아-태평양 주변국의 경제통합을 목적으로 하는 지역무역협정 <br />
                                                        ※ 미국 주도하에 진행되는 지역무역협정으로, 지난 4월 일본이 합류
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:top">- 회원국 :<br /> &nbsp; (12개국)</td>
                                                    <td>뉴질랜드, 싱가폴, 칠레, 브루니아, 미국, 호주, 페루, 베트남, 말레이시아, 캐나다, 멕시코, 일본
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="vertical-align:top">- 문제점 :</td>
                                                    <td>TPP 회원국 가입시 12개국과 자유무역협정이 진행<br /> (호주뉴질랜드캐나다와 조속한 FTA 체결 요구)
                                                    </td>
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
                                <input type="radio" name="tl-group" id="s2-1_024">
                                <label class="radio_b" for="s2-1_024">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_024" class="h_label">
                                            <h3>‘한국양봉학회’ 정기총회 및 학술발표회 개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 2월 14일(목)</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>대전아드리아 호텔</td>
                                                </tr>
                                                <tr>
                                                    <th>참가자</th>
                                                    <td>양봉학회 및 학계 연구자 약 150명</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 특별강연(3건) 및 구두발표(일반구두발표7건, 포스터 발표 16건)<br />
                                                        - 2012년도 예․결산 및 2013년도 예산안 의결 </td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_025">
                                <label class="radio_b" for="s2-1_025">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_025" class="h_label">
                                            <h3>한국 밀원수 조림․육성 협회 </h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <td>- 밀원수 발굴 연구사업</td>
                                                </tr>
                                                <tr>
                                                    <td>- 정부 및 지자체 밀원수 식재 활성화 유도</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_026">
                                <label class="radio_b" for="s2-1_026">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_026" class="h_label">
                                            <h3>국제양봉연맹(아피몬디아) 회원국 활동 </h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <td>- “꿀벌사육 60만군 이상”에 해당한 정 회원국 가입</td>
                                                </tr>
                                                <tr>
                                                    <td>- 연회비 : 750유로/년 납부</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_027">
                                <label class="radio_b" for="s2-1_027">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_027" class="h_label">
                                            <h3>축산 및 농민단체 협력체제 유지</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th>주요 협력단체</td>
                                                </tr>
                                                <tr>
                                                    <td> - 농민단체 협의회(2개단체), 축산관련단체 협의회(30개 축산관련단체),<br /> &nbsp; 나눔축산운동본부(농협중앙회)</td>
                                                </tr>
                                                <tr>
                                                    <th>주요활동</td>
                                                </tr>
                                                <tr>
                                                    <td>- 농민단체협의회 협력/ 연합활동(대정부 협력 건의)<br />
                                                        - 대정부 활동 및 성명서 발표<br />
                                                        - 한․중 FTA 저지 활동<br />
                                                        - FTA/DDA 범 국민연대 상호 협력 체제 유지</td>
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
                                <input type="radio" name="tl-group" id="s2-1_028">
                                <label class="radio_b" for="s2-1_028">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_028" class="h_label">
                                            <h3>동물용의약품 허가기준 검토 요청</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">배 경</th>
                                                    <td>전 세계적으로 신종 바이러스, 지구온난화 등의 환경파괴 및 과도한 농약사용 등으로 꿀벌 개체수 급증</td>
                                                </tr>
                                                <tr>
                                                    <th>요청대상</th>
                                                    <td>농림축산검역본부</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">양봉협 요청사항</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"> - 꿀벌에 치명적 영향을 미치는 네오니코티노이드계 농약에 대하여 벌꿀 개체 수 감소 및<br /> &nbsp; 양봉산업 보호를 위하여 동물용의약품 허가승인 시 검토 요청
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_029">
                                <label class="radio_b" for="s2-1_029">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_029" class="h_label">
                                            <h3>‘김학용’ 국회의원 주최 간담회 참석 및 정책건의</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 4월 2일(화)</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>국회 본 청</td>
                                                </tr>
                                                <tr>
                                                    <th>주 최</th>
                                                    <td>새누리당 국회의원 김학용</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td> - 적체된 벌꿀 2만톤 소비활성화를 위한 방안마련<br />
                                                        - 양봉산업 육성 및 지원법 신설<br />
                                                        - 생산성 향상을 위한 밀원수 식재/보호법 마련</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_030">
                                <label class="radio_b" for="s2-1_030">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_030" class="h_label">
                                            <h3>양봉사료(설탕/화분) H․S 코드번호 신설 요구</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 7월 10일(수)</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>기획재정부 회의실</td>
                                                </tr>
                                                <tr>
                                                    <th>참석대상</th>
                                                    <td>기재부 담당자 및 각 협회 실무자</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td> - (협회 요구) 양봉사료용 설탕코드 신설 및 관세인하(3%→1%) 요구 <br />
                                                        - (기획 재정부) 세율개정을 수반하는 사항이므로 추 후 기본세율 개정시 재검토 예정</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">협회 추 후 계획</th>
                                                </tr>
                
                                                <tr>
                                                    <td colspan="2">- 관계부처 협의를 거쳐 2014년도 기본세율 개편 시 반영 계획<br />
                                                        - H․S 코드 신설 타당성을 관계부처(기재부 산업 관세과 및 농림축산식품부) 에 건의 후 신설예정</td>
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
                                <input type="radio" name="tl-group" id="s2-1_031">
                                <label class="radio_b" for="s2-1_031">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_031" class="h_label">
                                            <h3>수의사 처방제 시행</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">목 적</th>
                                                    <td>동물의약품의 오남용을 방지하여 항생제 내성문제 해결, 안전한 축산물 유통, 국민건강 확보, 축산업의 생산성 향상</td>
                                                </tr>
                                                <tr>
                                                    <th>시행 일시</th>
                                                    <td>2013년 8월 2일 전면 시행</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">해당 약품(동물용의약품 97개 성분)</th>
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
                                                                    <th>벌꿀 해당유무</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>동물용 마취제 (17성분)</td>
                                                                    <td>해당사항 없음</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>동물용 호르몬제 (32성분)</td>
                                                                    <td>해당사항 없음</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>동물용 항생제 항균제 (20성분)</td>
                                                                    <td><strong>옥시테트라사이클린</strong></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>생물학적 제제(백신) (13성분)</td>
                                                                    <td>해당사항 없음</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>전문지식이 필요한 동물용 의약품</td>
                                                                    <td>해당사항 없음</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">구매 방법 </th>
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
                                                                    <th>소량/소매 구매시</th>
                                                                    <th>대량/도매 구입시</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td>현행과 동일</td>
                                                                    <td>수의사 처방 필요</td>
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
                                <input type="radio" name="tl-group" id="s2-1_032">
                                <label class="radio_b" for="s2-1_032">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_032" class="h_label">
                                            <h3>국내유통 수입 꿀 수거 검사</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 5월</td>
                                                </tr>
                                                <tr>
                                                    <th>수거대상</th>
                                                    <td>이마트, 코스트코, 롯데마트, 홈플러스 등</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">수거현황 </th>
                
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
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>구 분</th>
                                                                    <th>벌꿀명</th>
                                                                    <th>용량(g)</th>
                                                                    <th>가격(원)</th>
                                                                    <th>판매처</th>
                                                                    <th>원산지</th>
                                                                </tr>
                                                            </thead>
                
                                                            <tbody>
                                                                <tr>
                                                                    <td rowspan="6">수 입</td>
                                                                    <td>Kirkland Clover Honey</td>
                                                                    <td>2,260 </td>
                                                                    <td>28,490</td>
                                                                    <td>코스트코</td>
                                                                    <td>미 국</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Capiano 100% Austrailian Honey</td>
                                                                    <td>1,000</td>
                                                                    <td>29,900</td>
                                                                    <td>이마트</td>
                                                                    <td>호 주</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Airborne manuka P85</td>
                                                                    <td>500 </td>
                                                                    <td>44,800</td>
                                                                    <td>이마트</td>
                                                                    <td>뉴질랜드</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>타즈마니아 레더우드</td>
                                                                    <td>500 </td>
                                                                    <td>15,200</td>
                                                                    <td>롯데마트</td>
                                                                    <td>뉴질랜드</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>타즈마니아 클로버</td>
                                                                    <td>500 </td>
                                                                    <td>15,200</td>
                                                                    <td>롯데마트</td>
                                                                    <td>뉴질랜드</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>Anae Multi Flower Honey</td>
                                                                    <td>500 </td>
                                                                    <td>9,900</td>
                                                                    <td>롯데마트</td>
                                                                    <td>스페인</td>
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
                                <input type="radio" name="tl-group" id="s2-1_033">
                                <label class="radio_b" for="s2-1_033">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_033" class="h_label">
                                            <h3>지회 사무국장 교육실시</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 7월 25일(목) ~26일(금) 2일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>산청군청 2층 회의실</td>
                                                </tr>
                
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 제39차 양봉인의 날 지회별 숙박시설 확인 및 예약<br />
                                                        - 협회 업무관련 교육<br />
                                                        - 정기총회 진행교육(자료배포)</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_034">
                                <label class="radio_b" for="s2-1_034">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_034" class="h_label">
                                            <h3>양봉협회 정관개정 승인</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:170px">농식품부 승인일자</th>
                                                    <td>: 2013년 5월 30일</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="2">주요 내용</th>
                
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        - 정관 및 지회 운영 규정, 임원․지회장선거관리규정 개정<br />
                                                        &nbsp; 회원의 자격, 회원의 탈퇴 및 제명, 임원 선출 및 해임 등 <br />
                                                        - 지부장 선거관리규정 신설<br />
                                                        &nbsp; ※ 제40차 정기총회(2013.2.15.) 안건 상정 후 승인완료
                                                    </td>
                                                </tr>
                
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_035">
                                <label class="radio_b" for="s2-1_035">05</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_035" class="h_label">
                                            <h3>아카시아 유밀량 현장조사</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 6월 4일(화) ~ 5일(수), 1박 2일간</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>경기도 일대 양봉장 </td>
                                                </tr>
                                                <tr>
                                                    <th>조사자 </th>
                                                    <td>양봉협회, 농촌진흥청 잠사양봉소재과</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>- 2013년도 벌꿀 유밀량 현장조사</td>
                                                </tr>
                
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-1_036">
                                <label class="radio_b" for="s2-1_036">06</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-1_036" class="h_label">
                                            <h3>대통령 & 축산단체장 간담회 참석</h3>
                                        </label>
                                        <div class="content-inner">
                                            <table>
                                                <tr>
                                                    <th style="width:90px">일 시</th>
                                                    <td>2013년 12월 11일(수), 09:30 ~ 14:30</td>
                                                </tr>
                                                <tr>
                                                    <th>장 소</th>
                                                    <td>청와대<br />
                                                        - 농협중앙회 집결 후 청와대 이동 및 대통령 만찬</td>
                                                </tr>
                                                <tr>
                                                    <th>참석자</th>
                                                    <td>조균환 협회장 외 축산단체장</td>
                                                </tr>
                                                <tr>
                                                    <th>주요내용</th>
                                                    <td>현 축산분야의 애로사항 보고 및 건의</td>
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
