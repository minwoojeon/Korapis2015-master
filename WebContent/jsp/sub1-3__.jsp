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
                        <link rel="stylesheet" href="/css/default.css">
                            <link href="/css/sub.css" rel="stylesheet" type="text/css"/>
                            <!--[if lte IE 8]> <script src="html5.js" ></script> <![endif]-->
                            <script>
                                // 자바스크립트에서 사용하는 전역변수 선언
                                var g5_url = "http://korapis.weelsystem.co.kr";
                                var g5_bbs_url = "weel_bbs";
                                var g5_is_member = "";
                                var g5_is_admin = "";
                                var g5_is_mobile = "";
                                var g5_bo_table = "";
                                var g5_sca = "";
                                var g5_editor = "";
                                var g5_cookie_domain = "";
                            </script>
                            <script src="/js/jquery-1.8.3.min.js"></script>
                            <script src="/js/common.js"></script>
                            <script src="/js/wrest.js"></script>

                        </head>
                        <body>
                            <div id="skipToContent" title="스킵네비게이션">
                                <a href="#main_menu">메뉴 바로가기</a>
                                <a href="#search">프로그램 검색 바로가기</a>
                                <a href="#footer">카피라이터 바로가기</a>
                            </div>
                            <!-- sub_wrap_main START -->
                            <div id="sub_wrap_main">

                                <!-- sub_wrap START -->
                                <div id="sub_wrap">

                                    <jsp:include page="inc/header.jsp"/>

                                    <!-- sub_contents START -->
                                    <div id="sub_contents">

                                        <jsp:include page="inc/leftmenu.jsp"/>

                                        <!-- sub_con START -->

                                        <div id="sub_con_box">
                                            <div class="sub_top_box">
                                                <div class="location"><img src="/images/home_icon.gif" alt="home" style="margin-top:-2px;"/>
                                                    &gt; 협회소개 &gt;
                                                    <span>조직구성</span>
                                                </div>
                                                <h2>
                                                    <span>조직</span>구성</h2>
                                            </div>
                                            <div class="sub_body_box">
                                                <ul>
                                                    <li class="title">조직도</li>
                                                </ul>
                                                <ul class="group">
                                                    <li class="group_01">
                                                        <ul>
                                                            <li class="g_1">한국양봉학회</li>
                                                            <li class="g_3">사 무 국</li>
                                                            <li class="g_5">사무총장</li>
                                                            <li class="g_7">사무국직원</li>
                                                        </ul>
                                                    </li>
                                                    <li class="group_02">
                                                        <ul>
                                                            <li class="g_1">회 장</li>
                                                            <li class="g_4">이 사</li>
                                                            <li class="g_6">시도지회(15개)</li>
                                                            <li class="g_7">시도 지부</li>
                                                        </ul>
                                                    </li>
                                                    <li class="group_03">
                                                        <ul>
                                                            <li class="g_2">(사)한국아까시나무연구회<br/>(사)밀원수 조림육성혁회<br/>벌꿀 정화위원회</li>
                                                            <li class="g_3">한국양봉산물 연구소</li>
                                                            <li class="g_5">소 장</li>
                                                            <li class="g_8">품질관리<br/>직원</li>
                                                            <li class="g_8_1">연구소<br/>직원</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li class="title">회원 현황</li>
                                                    <li>
                                                        <table class="group_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="회원현황">
                                                            <caption>회원현황</caption>
                                                            <colgroup>
                                                                <col width="25%"/>
                                                                <col width="25%"/>
                                                                <col width="25%"/>
                                                                <col width="25%"/>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>연도</th>
                                                                    <th>총원</th>
                                                                    <th>증감</th>
                                                                    <th>비고</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <!-- <tr> <td>2003</td> <td>8,722</td> <td>485</td> <td>&nbsp;</td> </tr> <tr> <td>2004</td> <td>9,439</td> <td>667</td> <td>&nbsp;</td> </tr> <tr> <td>2005</td> <td>10,113</td> <td>674</td> <td>&nbsp;</td> </tr> <tr> <td>2006</td> <td>10,666</td>
                                                                <td>553</td> <td>&nbsp;</td> </tr> <tr> <td>2007</td> <td>11,151</td> <td>485</td> <td>&nbsp;</td> </tr> <tr> <td>2008</td> <td>11,833</td> <td>682</td> <td>&nbsp;</td> </tr> <tr> <td>2009</td> <td>12,588</td> <td>755</td> <td>&nbsp;</td> </tr> <tr>
                                                                <td>2010</td> <td>13,685</td> <td>1,097</td> <td>&nbsp;</td> </tr> <tr> <td>2011</td> <td>14,147</td> <td>462</td> <td>&nbsp;</td> </tr> <tr> <td>2012</td> <td>14,869</td> <td>722</td> <td>&nbsp;</td> </tr> <tr> <td>2013</td> <td>15,550</td>
                                                                <td>681</td> <td>&nbsp;</td> </tr> -->
                                                                <tr>
                                                                    <td>2010</td>
                                                                    <td>13,685</td>
                                                                    <td>▲ 1,079</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2011</td>
                                                                    <td>14,147</td>
                                                                    <td>▲ 462</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2012</td>
                                                                    <td>14,869</td>
                                                                    <td>▲ 722</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2013</td>
                                                                    <td>15,550</td>
                                                                    <td>▲ 681</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>2014</td>
                                                                    <td>16,557</td>
                                                                    <td>▲ 1,007</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li class="title">회원 분포</li>
                                                    <li>
                                                        <table class="group_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="회원 분포">
                                                            <caption>회원 분포 (2014년)</caption>
                                                            <colgroup>
                                                                <col width="25%"/>
                                                                <col width="25%"/>
                                                                <col width="25%"/>
                                                                <col width="25%"/>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>시․도지회</th>
                                                                    <th>총원(명)</th>
                                                                    <th>2014년</th>
                                                                    <th>비고</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>합 계</th>
                                                                    <th>16,557</th>
                                                                    <th>35%</th>
                                                                    <th>&nbsp;</th>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                                <tr>
                                                                    <td>서 울</td>
                                                                    <td>476</td>
                                                                    <td>14%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>경 기</td>
                                                                    <td>1,837</td>
                                                                    <td>24%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>강 원</td>
                                                                    <td>1,229</td>
                                                                    <td>42%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>충 북</td>
                                                                    <td>1,457</td>
                                                                    <td>37%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>충 남</td>
                                                                    <td>1,845</td>
                                                                    <td>45%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>전 북</td>
                                                                    <td>1,301</td>
                                                                    <td>34%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>광주․전남</td>
                                                                    <td>1,892</td>
                                                                    <td>37%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>경 북</td>
                                                                    <td>2,275</td>
                                                                    <td>25%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>경 남</td>
                                                                    <td>2,288</td>
                                                                    <td>43%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>부 산</td>
                                                                    <td>353</td>
                                                                    <td>40%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>제 주</td>
                                                                    <td>399</td>
                                                                    <td>49%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>인 천</td>
                                                                    <td>160</td>
                                                                    <td>18%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>대 전</td>
                                                                    <td>352</td>
                                                                    <td>32%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>울 산</td>
                                                                    <td>259</td>
                                                                    <td>40%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>대 구</td>
                                                                    <td>434</td>
                                                                    <td>35%</td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </li>
                                                </ul>
                                                <ul>
                                                    <li class="title">협회 사무국 현황</li>
                                                    <li>
                                                        <table class="group_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="협회 사무국 현황">
                                                            <caption>협회 사무국 현황</caption>
                                                            <colgroup>
                                                                <col width="150"/>
                                                                <col width="150"/>
                                                                <col width="300"/>
                                                            </colgroup>
                                                            <thead>
                                                                <tr>
                                                                    <th>구분</th>
                                                                    <th>인원</th>
                                                                    <th>직책</th>
                                                                </tr>
                                                            </thead>
                                                            <tfoot>
                                                                <tr>
                                                                    <th>합 계</th>
                                                                    <th colspan="2">13</th>
                                                                </tr>
                                                            </tfoot>
                                                            <tbody>
                                                                <tr>
                                                                    <td>회 장</td>
                                                                    <td>1</td>
                                                                    <td>회장(1)</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>사무국</td>
                                                                    <td>4</td>
                                                                    <td>사무총장(1) / 차장(1) / 계장(1) / 주임(1)</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>양봉산물 연구소</td>
                                                                    <td>4</td>
                                                                    <td>연구소장(1) / 계장(1) / 주임(2)</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>품질관리</td>
                                                                    <td>2</td>
                                                                    <td>과장(1) / 차장(1)</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>세계양봉대회 사무국</td>
                                                                    <td>2</td>
                                                                    <td>계약직(2)</td>
                                                                </tr>

                                                            </tbody>
                                                        </table>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!--// sub_con END -->

                                        <jsp:include page="inc/partner.jsp"/>

                                    </div>
                                    <!--// sub_contents END -->
                                </div>
                                <!--// sub_wrap END -->
                            </div>
                            <!--// sub_wrap_main END -->

                            <jsp:include page="inc/footer.jsp"/>

                            <!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
                            <!--[if lte IE 7]> <script> $(function() { var $sv_use = $(".sv_use"); var count = $sv_use.length; $sv_use.each(function() { $(this).css("z-index", count); $(this).css("position", "relative"); count = count - 1; }); }); </script> <![endif]-->

                        </body>
                    </html>
