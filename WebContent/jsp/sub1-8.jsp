<%@page import="kr.or.korapis.admin.member.AdminMemberDao"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

AdminMemberDao dao = new AdminMemberDao();
ResultSetEntity d = dao.getHomepageGihe();

%>
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
<script type="text/javascript" >
            $(function() {



                $('#branch_map area').click(function(){
                    var mname = $(this).attr('class');
                    $('.branch_map>img').attr('src','/images/'+mname+'.jpg');
                });


                //초기셋업
                $('.branch_map>img').attr('src','/images/imap_02.jpg');
                $("div[id^=info_]").hide();
                $("#info_02").show();
            });


            function f_changemap(i_id){
                $("div[id^=info_]").hide();
                $("#info_"+i_id).show();
            }
        </script>

</head>
<style>
.imwon_box img { width:145px; height:150px; }
</style>
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
                    <h2 class="page_title">협회임원소개</h2>
                    <div class="location">홈 &gt; 협회소개 &gt; <span>협회임원소개</span></div>
                </div>
                <div class="sub_body_box imwon_wrap">

                    <h3 class="title_txt">역대회장</h3>

                    <div class="imwonArea cle">
                        <div class="imwon_box">
                            <img src="/images/president/01.png"/>
                            <p class="presi_num">초대회장</p>
                            <p class="presi_name">김삼상 회장</p>
                            <p class="presi_age">1967.10.25.~1972. 9.16</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/president/02.png"/>
                            <p class="presi_num">제2대회장</p>
                            <p class="presi_name">정우식 회장</p>
                            <p class="presi_age">1972.9.16.~1974.12.20</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/president/03.png"/>
                            <p class="presi_num">제3,4대회장</p>
                            <p class="presi_name">박덕수 회장</p>
                            <p class="presi_age">1974.12.20.~1979.2.12</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/president/04.png"/>
                            <p class="presi_num">제5,6,7대회장</p>
                            <p class="presi_name">정병호 회장</p>
                            <p class="presi_age">1979.2.12.~1985.1.31</p>
                        </div>

                        <div class="imwon_box">
                            <img src="/images/president/05.png"/>
                            <p class="presi_num">제8,9,10대회장</p>
                            <p class="presi_name">조기태 회장</p>
                            <p class="presi_age">1985.1.31.~1994.2.16</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/president/06.png"/>
                            <p class="presi_num">제11,12,13,14대회장</p>
                            <p class="presi_name">정해운 회장</p>
                            <p class="presi_age">1994.2.16.~2006.2.20</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/president/07.png"/>
                            <p class="presi_num">제15대회장</p>
                            <p class="presi_name">전기현 회장</p>
                            <p class="presi_age">2006.2.20.~2009.1.7</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/president/08.png"/>
                            <p class="presi_num">제16대회장</p>
                            <p class="presi_name">배경수 회장</p>
                            <p class="presi_age">2009.1.7.~2012.1.18</p>
                        </div>

                        <div class="imwon_box">
                            <img src="/images/president/09.png"/>
                            <p class="presi_num">제17,18대회장</p>
                            <p class="presi_name">조균환 회장</p>
                            <p class="presi_age">2012.1.18.~2018.1.30</p>
                        </div>

                        <div class="imwon_box">
                            <img src="/images/president/10.png"/>
                            <p class="presi_num">제19대회장</p>
                            <p class="presi_name">황협주 회장</p>
                            <p class="presi_age">2018.1.18.~2021.2.25</p>
                        </div>
                    </div>

                    <h3 class="title_txt">현 임원현황</h3>
                    <div class="imwonArea cle">
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-01.png"/>
                            <p class="presi_num">회장</p>
                            <p class="presi_name">윤화현</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-02.png"/>
                            <p class="presi_num">부회장</p>
                            <p class="presi_name">김동수</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-03.png"/>
                            <p class="presi_num">부회장</p>
                            <p class="presi_name">이영우</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-04.png"/>
                            <p class="presi_num">감사1</p>
                            <p class="presi_name">이무섭</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-05.png"/>
                            <p class="presi_num">감사2</p>
                            <p class="presi_name">문상재</p>
                        </div>

                        <div class="imwon_box">
                            <img src="/images/imwon/2021-06.png"/>
                            <p class="presi_num">경남 지회장</p>
                            <p class="presi_name">정현조</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/07.png"/>
                            <p class="presi_num">전북 지회장</p>
                            <p class="presi_name">김종화</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-08.png"/>
                            <p class="presi_num">대구 지회장</p>
                            <p class="presi_name">김화열</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-09.png"/>
                            <p class="presi_num">울산 지회장</p>
                            <p class="presi_name">김철홍</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-10.png"/>
                            <p class="presi_num">충북 지회장</p>
                            <p class="presi_name">반화병</p>
                        </div>

                        <div class="imwon_box">
                            <img src="/images/imwon/2021-11.png"/>
                            <p class="presi_num">층남 지회장</p>
                            <p class="presi_name">이승우</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/12.png"/>
                            <p class="presi_num">강원 지회장</p>
                            <p class="presi_name">김익수</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-13.png"/>
                            <p class="presi_num">광주 지회장</p>
                            <p class="presi_name">이천재</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/14.png"/>
                            <p class="presi_num">전남 지회장</p>
                            <p class="presi_name">반성진</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-15.png"/>
                            <p class="presi_num">경기 지회장</p>
                            <p class="presi_name">김선희</p>
                        </div>

                        <div class="imwon_box">
                            <img src="/images/imwon/16.png"/>
                            <p class="presi_num">경북 지회장</p>
                            <p class="presi_name">박순배</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/17.png"/>
                            <p class="presi_num">인천 지회장</p>
                            <p class="presi_name">김인식</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/18.png"/>
                            <p class="presi_num">서울 지회장</p>
                            <p class="presi_name">원익진</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-19.png"/>
                            <p class="presi_num">제주 지회장</p>
                            <p class="presi_name">이순철</p>
                        </div>
                        <div class="imwon_box">
                            <img src="/images/imwon/2021-20.png"/>
                            <p class="presi_num">부산 지회장</p>
                            <p class="presi_name">양호진</p>
                        </div>

                        <div class="imwon_box">
                            <img src="/images/imwon/21.png"/>
                            <p class="presi_num">대전 지회장</p>
                            <p class="presi_name">송정근</p>
                        </div>
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
