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

                <!-- 연혁추가 요청이 오면  sub2-1_0*.jsp 파일을 만들어 sub2-1.jsp내용을 복사하여 넣고 sub2-1.jsp에 새로운 내용 넣는식으로 진행하시면 됩니다. -->
                <div class="sub_body_box">
                    <ul class="tab_list grid_6">
                        <li class="on"><a href="/jsp/sub2-1.jsp" target="_self">2020</a></li>
                        <li><a href="/jsp/sub2-1_07.jsp" target="_self">2019</a></li>
						<li><a href="/jsp/sub2-1_06.jsp" target="_self">2018</a></li>
                        <li><a href="/jsp/sub2-1_05.jsp" target="_self">2017</a></li>
                        <li><a href="/jsp/sub2-1_04.jsp" target="_self">2016</a></li>
                        <li><a href="/jsp/sub2-1_03.jsp" target="_self">2015</a></li>
                    </ul>

                    <h3 class="title_txt">일반현황</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" checked="" id="s2-5_001">
                                <label class="radio_b" for="s2-5_001">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_001" class="h_label">
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
                                                &nbsp;&nbsp; - 공문발송을 통한 원활한 협회 업무 소통<br>
                                                <strong>ㆍ 협회 활동사항 강화</strong><br>
                                                &nbsp;&nbsp; - 월간 양봉협회보 발행(월 1회)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_002">
                                <label class="radio_b" for="s2-5_002">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_002" class="h_label">
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
                                                            <td>2020년 1월 ~ 12월(총12회)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>부 수</th>
                                                            <td>매월 평균 약 9,000부~9,500부(64~68페이지)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>월별 주요내용</th>
                                                            <td>협회소식, 축산소식, 정부 정책자료, 특별기고, 양봉사양관리, 자조금납부자안내, 광고, 주요 알림 등</td>
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
                                <input type="radio" name="tl-group" id="s2-5_003">
                                <label class="radio_b" for="s2-5_003">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_003" class="h_label">
                                            <h3>각종회의개최</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>ㆍ 이사회(9회)<br>
													ㆍ 선거관리위원회(6회)<br>
													ㆍ 인사위원회(4회)<br>
													ㆍ 양봉자조금위원회의(2회)</strong>
                                                </p>
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
                                <input type="radio" name="tl-group" id="s2-5_004">
                                <label class="radio_b" for="s2-5_004">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_004" class="h_label">
                                            <h3>양봉자조금 사업</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>가. 소비홍보</strong>
                                                <ul class="noneList ml15">
                                                    <li>① 광고홍보
                                                        <ul class="dashList">
                                                            <li>TV조선, KBS, MBN, SBS, 채널A 등을 통한 방송매체를 이용 양봉산물의 효능·효과 등을 홍보</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <strong class="mt10">나. 유통구조</strong>
                                                <ul class="noneList ml15">
                                                    <li>① 유통개선
                                                        <ul class="dashList">
                                                            <li>농가 공동브랜드 한 벌꿀 인증 및 스티커, 박스, 등 지원</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <strong class="mt10">다. 교육 및 정보제공</strong>
                                                <ul class="noneList ml15">
                                                    <li>
                                                        <ul class="dashList">
                                                            <li>양봉자조금 홍보물 제작 배포</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <strong class="mt10">라. 수급안정</strong>
                                                <ul class="noneList ml15">
                                                    <li>① 소비촉진
                                                        <ul class="dashList">
                                                            <li>양봉산물의 소비를 촉진하는 판촉 행사 등 참가 및 지원</li>
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

                    <h3 class="title_txt">농촌진흥청 합동 아까시아 꿀 채밀작황 현장 조사</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_005">
                                <label class="radio_b" for="s2-5_005">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_005" class="h_label">
                                            <h3>농촌진흥청 합동 아까시아 꿀 채밀 작황 현장 조사</h3>
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
                                                            <td>2020년 5월 11일 ~ 6월 2일까지</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>남부·북부 등 구 권역별 조사</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참여기관</th>
                                                            <td>양봉산업발전협의회, 한국양봉협회, 한국양봉농협, 산림조합중앙회, 각 도 농업기술원 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dotList">
                                                                    <li>조사지역의 온·습도, 풍속 등 기상요인, 아까시나무 꽃송이수, 개화기간, 봉군의 일벌 활동·봉군 당 꿀 생산량 등 조사</li>
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

                    <h3 class="title_txt">벌꿀 흉작에 따른 후속조치 사항</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_006">
                                <label class="radio_b" for="s2-5_006">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_006" class="h_label">
                                            <h3>벌꿀 흉작에 따른 후속조치 사항</h3>
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
                                                            <th>배 경</th>
                                                            <td>올해 아까싱라 꿀 채밀 작황 현장 조사 결과, 4월 ~ 5월 채밀기간 동안 강한  비· 비람으로 인한 꽃 개화 부진으로 평년 수준보다 턱없이 부족한 생산량을 기록</td>
                                                        </tr>
                                                        <tr>
                                                            <th>협회조치사항</th>
                                                            <td>
                                                                <strong>벌꿀 흉작에 따른 농림축산식품부 긴급 건의</strong>
                                                                <ul class="dotList">
                                                                    <li>양봉농가 생계비 및 사료지원자금 긴급 보조지원</li>
                                                                    <li>경영안정화자금 및 학자금 저리융자 긴급지원</li>
                                                                    <li>기존 융자금 상환기간 연장 및 금리 인하</li>
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

                    <h3 class="title_txt">양봉농가 등록 계도기간 연장 및 사업장의 사용권한 인정범위 확대</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_006">
                                <label class="radio_b" for="s2-5_006">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_006" class="h_label">
                                            <h3>등록 계도기간 연장 및 인정범위 확대</h3>
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
                                                            <th>주요사항</th>
                                                            <td>
                                                                <strong>양봉농가 등록기간 연장</strong>
                                                                <ul class="dotList">
                                                                    <li>2021년 8월 31일 까지 9개월 연장</li>
                                                                </ul>

                                                                <strong>사업장의 인정범위 확대</strong>
                                                                <ul class="dotList">
                                                                    <li>사업장·부지 사용권한 인정 범위에 토지 소유주의 사용동의서·승낙서 등 포함</li>
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

                    <h3 class="title_txt">양봉산업발전법안 원년기념 제도활성화 연속토론회 개최</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_007">
                                <label class="radio_b" for="s2-5_007">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_007" class="h_label">
                                            <h3>그린뉴딜 양봉산업육성을 위한 생태 soc밀원확대방안</h3>
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
                                                            <td>2020년 8월 4일(화)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국회의원회관 제7간담회의실</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 최</th>
                                                            <td>이개호 농림축산식품해양수산위원장</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 관</th>
                                                            <td>농촌진흥청 국립농업과학원, 한국양봉협회</td>
                                                        </tr>
														<tr>
                                                            <th>내 용</th>
                                                            <td>
                                                                <span>- 주제발표(농림축산식품부) 양봉산업의 현황 및 육성방향 </span>
                                                                <span>- 패널토론 </span>
                                                                <ul class="dotList">
                                                                    <li>(산림청) 양봉산업의 활성화를 위한 밀원수 조림 확대</li>
                                                                    <li>(농진청) 양봉산업 육성 지원을 위한 양봉산물 연구현황 등</li>
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
                                <input type="radio" name="tl-group" id="s2-5_008">
                                <label class="radio_b" for="s2-5_008">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_008" class="h_label">
                                            <h3>전업양봉농가 수익보전을 위한 유통개선 방안</h3>
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
                                                            <td>2020년 11월 13일(금)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국회의원회관 제7간담회의실</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 최</th>
                                                            <td>이개호 농림축산식품해양수산위원장</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 관</th>
                                                            <td>농촌진흥청, 한국양봉학회, 한국양봉협회</td>
                                                        </tr>
														<tr>
                                                            <th>내 용</th>
                                                            <td>
                                                                <span>- 주제발표(지역농업네트워크) 양봉산물 유통개선을 위한 조직화 방안</span>
                                                                <span>- 패널토론 </span>
                                                                <ul class="dotList">
                                                                    <li>(농림축산식품부) 양봉산업법령 제정·시행에 따른 산업육성 방향</li>
                                                                    <li>(농진청) 농가소득 다각화를 위한 국내 양봉산물 연구개발 전략수립 등</li>
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
                                <input type="radio" name="tl-group" id="s2-5_009">
                                <label class="radio_b" for="s2-5_009">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_009" class="h_label">
                                            <h3>민·관 합동 밀원수 식목행사 개최</h3>
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
                                                            <td>2018년 5월 28일(월)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>현장방문을 통한 실태조사 및 심각성 인식을 통한 정부지원 건의</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>강원도 일대 양봉장 총 4곳</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>농림부, 농진청 관계자 및 협회장, 김종상 전무, 양봉농협 김용래 조합장, 박승수 과장</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_010">
                                <label class="radio_b" for="s2-5_010">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_010" class="h_label">
                                            <h3>추가 조치사항</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>농림부차관 대화시 건의(미허가 축사 관련 대담시) </strong>
                                                <table width="100%">
                                                    <colgroup>
                                                        <col style="width:15%;" />
                                                        <col />
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <th>일 시</th>
                                                            <td>2018년 6월 7일(목), 12:00~</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>세종시 인근 한정식당</td>
                                                        </tr>
                                                        <tr>
                                                            <th>건의자</th>
                                                            <td>황협주 협회장</td>
                                                        </tr>
                                                        <tr>
                                                            <th>건의내용</th>
                                                            <td>양봉농가 사료비 긴급지원 건의</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                <strong class="mt10">※ 벌꿀 흉작 및 화분홍보 등 각종 메스컴 보도</strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </section>


                    <h3 class="title_txt">처방대상 동물용의약품 추가적용 및 시행</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_011">
                                <label class="radio_b" for="s2-5_011">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_011" class="h_label">
                                            <h3>처방대상 동물용의약품 추가적용 및 시행</h3>
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
                                                            <th>관련 근거</th>
                                                            <td>약사법 제85조 6항 및 제7항의‘처방대상 동물용 의약품 지정에 관한 규정’(농식품부 고시- 2017.05.22)</td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">협회 관련 조치사항</th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <strong>가. 공문 건의</strong>
                                                                <table width="100%">
                                                                    <colgroup>
                                                                        <col style="width:15%;" />
                                                                        <col />
                                                                    </colgroup>
                                                                    <tbody>
                                                                        <tr>
                                                                            <th>발송 일시</th>
                                                                            <td>2018년 5월 3일(목)</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>수신기관</th>
                                                                            <td>농림부 조류인플루엔자방역과</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>건의 내용</th>
                                                                            <td>
                                                                                <ul class="dashList">
                                                                                    <li>밀원 여건상 1개월이란 짧은 기간 동안 이동하는 관계로, 꿀벌 질병 발생시 처방을 내려 줄 수 있는 전문 수의사가 부족할 뿐만 아니라,</li>
                                                                                    <li>이동 중 낯선 지역의 동물 병원의 위치를 파악이 불가하므로, 국내 양봉산업 현실적 여건을 고려하여, 꿀벌 질병관련 약품을 수의사 처방 없이 사용 가능하도록 예외적인 경우가 인정될 수 있도록 제도적 보완 건의</li>
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


                    <h3 class="title_txt">브로모프로필레이트 추가 검사에 따른 검사항목 조정</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_012">
                                <label class="radio_b" for="s2-5_012">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_012" class="h_label">
                                            <h3>브로모프로필레이트 추가 검사에 따른 검사항목 조정</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>⌜식품위생법⌟ 제7조에 따른 ⌜식품의 기준 및 규격⌟ 개정고시 [식품의약품안전처 고시 제2017-57호]에 따른 잔류물질 추가 실험</strong>
                                                <span>
                                                    · 식품 중 동물용의약품 잔류허용기준 개정(1개품목 추가)<br>
                                                    - 시행일 : 2018년 7월 1일<br>
                                                    가. 별표5의 브로모프로필레이트(Bromopropylate) : 살충제<br>
                                                    나. 벌꿀 허용기준 : 0.01ppm 이하
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </section>


                    <h3 class="title_txt">양봉산업 육성법 제정 입법 공청회 개최</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_013">
                                <label class="radio_b" for="s2-5_013">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_013" class="h_label">
                                            <h3>정인화 국회의원 입법 공청회 개최</h3>
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
                                                            <td>2018년 7월 3일(화)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국회의원회관 제2세미나실</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>황협주 협회장 외 임원, 양봉관련단체, 업체, 대학 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                정인화 의원이 대표발의 한 법률 제정안 검토 및 의견 제안 등<br>
                                                                ※ 7월 16일 국회 상임위원 조정에 따라 정인화의원 행정안정위원회로 변경<br>
                                                                → 당초 발의한 법률안의 경우 황주홍(민주평화당) 농림축산식품해양수산위원장으로 7월 26일 대표발의자 변경
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
                                <input type="radio" name="tl-group" id="s2-5_014">
                                <label class="radio_b" for="s2-5_014">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_014" class="h_label">
                                            <h3>황주홍의원, 양봉산업 육성법 입법 공청회 개최</h3>
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
                                                            <td>2018년 10월 13일(화), 14:00~16:00</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국회의원 회관 제1간담회실</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>임원(회장, 부회장, 감사 및 시·도 지회장)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>황주홍 농림해양수산위원장 발의한 양봉산업의 육성 및 지원에 관한 법률 제정(안) 공청회 개최</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_015">
                                <label class="radio_b" for="s2-5_015">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_015" class="h_label">
                                            <h3>김현권의원, 양봉산업 육성법 입법 공청회 개최</h3>
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
                                                            <td>2018년 12월 17일(월), 14:00~16:00</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국회의원 회관 제7간담회실</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>임원(회장, 부회장, 감사 및 시·도 지회장)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>김현권의원 발의 양봉산업의 육성 및 지원에 관한 법률 제정(안) 공청회 개최</td>
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


                    <h3 class="title_txt">제14회 인도네시아 아시아양봉대회 참가</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_016">
                                <label class="radio_b" for="s2-5_016">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_016" class="h_label">
                                            <h3>제14회 인도네시아 아시아양봉대회 참가</h3>
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
                                                            <td>2018년 10월 22일(월)~25일(목), 3박 4일<br>· 협회 일정 : 10월 21일(일)~25일(목), 4박 5일</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>인도네시아 자카르타, 메릴린파크 호텔</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자<br>(총 4명)</th>
                                                            <td>황협주 자조금위원장, 김용래 부위원장, 김종상 간사, 박성치 차장(실무자)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dotList">
                                                                    <li>한국관(전시부스) 전시를 통한 국내 양봉산물 우수성 홍보</li>
                                                                    <li>아시아양봉연맹 총회 및 기념식(개·폐막식) 참가</li>
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


                    <h3 class="title_txt">기타 사항</h3>

                    <section>
                        <ul class="timeline">
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_017">
                                <label class="radio_b" for="s2-5_017">01</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_017" class="h_label">
                                            <h3>제18대, 19대 회장 이·취임식 개최</h3>
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
                                                            <td>2018년 3월 6일(화), 11:00~</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>오티움 웨딩홀(세종시 부강면 소재)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자<br>(약 250명)</th>
                                                            <td>국회의원, 관련기관 및 단체장, 전 회장 및 지회장, 제19대 임원 및 사무국장 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>내 용</th>
                                                            <td>제18(조균환 협회장), 19대 회장(황협주 협회장) 이·취임</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_018">
                                <label class="radio_b" for="s2-5_018">02</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_018" class="h_label">
                                            <h3>양봉산업 발전협의회 실무자회의 개최</h3>
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
                                                            <td>2018년 3월 9일(금), 13:30~ </td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>본 협회 회의실</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>국립농업과학원, 농림축산검역본부, 국립산림과학원, 양봉협회, 한봉협회, 양봉농협, 산림조합중앙회 실무자 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>내 용</th>
                                                            <td>
                                                                <ul class="dotList">
                                                                    <li>주제발표 및 토론<br>
                                                                        - (주제발표) 고정양봉장 밀원조성(산림과학원 김세현 과장)<br>
                                                                        - (토론) 연중 개화 밀원 식재, 초본류, 관목류, 수목류 등
                                                                    </li>
                                                                    <li>양봉산업 현안 및 발전방안 논의 등</li>
                                                                    <li>아카시아 개화시기 특이종 물색 협조 당부</li>
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
                                <input type="radio" name="tl-group" id="s2-5_019">
                                <label class="radio_b" for="s2-5_019">03</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_019" class="h_label">
                                            <h3>국회 민·관·학 합동 밀원수 식수행사 개최</h3>
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
                                                            <td>2018년 3월 23일(금), 10:00~</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>국회 헌정 기념관 앞</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자<br>(약 50명)</th>
                                                            <td>국립농업과학원, 국립산림과학원, 황협주 협회장, 류재광 충남지회장, 산림조합중앙회 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>식재 수종</th>
                                                            <td>밀원수 신품종 교목 5~10종, 소교목류, 초화류 등 식재</td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_020">
                                <label class="radio_b" for="s2-5_020">04</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_020" class="h_label">
                                            <h3>정관변경 승인</h3>
                                        </label>
                                        <div class="content-inner">
                                            <div class="innerTxt">
                                                <strong>승인 일자(농림축산식품부) : 2018년 2월 13일(화)</strong>
                                                <strong class="mt10">변경 사유</strong>
                                                <ul class="dotList">
                                                    <li>현재 정관의 경우 시·도 지회장의 당연직 이사에 따라 등기시 각 지회총회 참가 회원의 인감증명 및 지회별 의사록을 첨부하도록 되어 있어 등기 과정에 많은 애로사항 발생 및 현실적으로 불가</li>
                                                    <li>이를 해결하고 현실적으로 가능한 임원 등기를 위해 정관을 변경</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="event">
                                <input type="radio" name="tl-group" id="s2-5_021">
                                <label class="radio_b" for="s2-5_021">05</label>
                                <div class="content-perspective">
                                    <div class="content">
                                        <label for="s2-5_021" class="h_label">
                                            <h3>한국양봉학회 총회 및 추계학술발표회 참가</h3>
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
                                                            <td>2018년 10월 11일(목)~ 13일(토)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>장 소</th>
                                                            <td>꿀벌테마공원(경북 칠곡군 호국평화 기념관)</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주 제</th>
                                                            <td>꿀벌...몸과 마음 치유 농업으로</td>
                                                        </tr>
                                                        <tr>
                                                            <th>참석자</th>
                                                            <td>황협주 협회장 및 양봉농가 및 관계자 등</td>
                                                        </tr>
                                                        <tr>
                                                            <th>주요내용</th>
                                                            <td>
                                                                <ul class="dotList">
                                                                    <li>양봉산업 관련 기조강연 및 심포지엄 개최</li>
                                                                    <li>우수논문 수상자 시상 및 현장견학 등</li>
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
