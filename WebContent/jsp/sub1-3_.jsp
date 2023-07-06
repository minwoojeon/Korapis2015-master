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
<script type="text/javascript" >
			$(function() {



				$('#branch_map area').click(function(){
					var mname = $(this).attr('class');
					$('.branch_map>img').attr('src','/images/'+mname+'.jpg')
					})

			})
		</script>

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

		<jsp:include page="inc/header.jsp" />

        <!-- sub_contents START -->
        <div id="sub_contents">

        	<jsp:include page="inc/leftmenu.jsp" />

            <!-- sub_con START -->

            <div id="sub_con_box">
            	<div class="sub_top_box">
                	<div class="location"><img src="/images/home_icon.gif" alt="home" style="margin-top:-2px;" /> &gt; 협회소개 &gt; <span>조직구성</span></div>
                    <h2><span>조직</span>구성</h2>
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
                            	<li class="g_2">(사)한국아까시나무연구회<br />(사)밀원수 조림육성혁회<br />벌꿀 정화위원회</li>
                                <li class="g_3">한국양봉산물 연구소</li>
                                <li class="g_5">소 장</li>
                                <li class="g_8">품질관리<br />직원</li>
                                <li class="g_8_1">연구소<br />직원</li>
                            </ul>
                        </li>
                    </ul>
                    <ul>
                   	  	<li class="title">지부현황</li>
                        <li class="branch_map_w">
						<div class="branch_map">
							<img src="/images/imap_00.jpg" width="193" height="309" usemap="#branch_map" border="0"  />
							<map name="branch_map" id="branch_map">
								<area shape="poly" coords="50,59,54,59,55,55,58,55,60,55,61,52,63,51,65,51,67,53,67,54,68,56,70,57,70,59,72,60,72,62,72,64,71,65,69,66,68,67,67,68,66,69,64,70,63,69,61,69,59,69,57,70,56,70,55,67,54,66,52,65" href="#;"  class="imap_02" />
								<area shape="poly" coords="38,47,42,49,44,48,45,45,46,43,48,42,48,40,48,38,46,35,48,35,51,36,52,36,52,33,52,31,53,31,55,30,55,28,53,27,51,25,52,23,54,22,59,21,63,20,65,19,68,22,70,23,76,25,79,27,83,31,87,36,89,37,90,40,87,42,87,44,87,47,87,50,87,54,88,56,90,58,93,59,98,59,100,60,99,63,100,68,99,71,98,77,98,81,98,84,96,86,94,88,93,90,90,91,87,93,85,94,83,96,81,98,77,100,76,102,70,99,65,98,62,98,60,100,56,101,54,102,51,102,49,97,48,95,48,92,45,88,42,86,42,83,43,79,44,76,44,74,46,71,48,70,50,66,55,68,60,69,63,68,67,66,68,65,69,63,70,61,70,58,67,54,65,52,63,50,61,50,59,51,58,52,56,54,53,55,51,58,50,59,47,58,45,56,42,56,41,57,39,58,37,56,36,53,36,50,36,47" href="#;"   class="imap_031"/>
								<area shape="poly" coords="39,59,45,56,51,60,52,65,50,66,50,69,49,71,48,71,46,72,43,70,42,68,40,67,36,67,35,68,33,69,30,70,28,65,27,62,27,59,24,58,21,57,20,55,18,52,20,50,22,48,23,46,24,45,27,44,30,43,33,43,36,44,38,46,37,50,37,54" href="#;"   class="imap_032"/>
								<area shape="poly" coords="98,85,103,88,105,86,109,83,111,79,112,81,113,83,116,82,120,80,122,80,127,87,127,85,128,86,134,87,136,88,140,90,142,91,147,91,150,90,155,90,159,90,163,90,170,90,172,90,175,89,178,87,179,82,177,79,175,73,171,69,169,66,166,62,165,56,162,52,157,48,152,41,147,33,142,29,140,22,140,16,136,13,134,3,129,0,125,10,121,9,118,10,115,13,115,16,108,17,102,17,96,17,90,16,88,15,83,16,81,17,76,16,73,15,70,19,69,21,79,26,86,34,90,35,91,38,90,40,88,40,88,43,89,51,89,51,90,55,92,57,97,59,100,59,102,61,102,69,99,78" href="#;"   class="imap_033" />
								<area shape="poly" coords="78,101,81,105,82,107,85,110,83,112,80,111,77,112,77,115,78,118,79,122,81,126,81,128,76,132,76,135,76,138,76,141,77,143,80,145,82,145,82,146,86,145,87,142,90,144,91,146,91,148,95,153,94,157,93,159,90,160,84,159,81,156,79,151,74,151,71,153,68,154,66,155,63,154,62,149,61,147,58,148,53,155,51,156,49,158,43,157,42,153,37,149,37,145,37,139,37,137,36,135,33,134,32,134,26,133,26,126,27,121,26,116,25,115,18,118,17,112,17,107,20,103,22,101,26,97,28,95,36,93,41,94,43,97,46,98,49,98,51,101,55,103,56,102,60,101,64,99,68,98,73,99" href="#;"  class="imap_041" />
								<area shape="poly" coords="83,127,85,129,87,130,89,134,88,136,87,138,87,140,86,144,83,145,82,145,80,145,78,144,76,143,75,141,75,139,75,137,75,135,76,135,77,132,79,129" href="#;"   class="imap_042"/>
								<area shape="poly" coords="81,128,85,128,86,128,88,130,89,132,89,136,88,138,88,139,87,141,88,142,90,144,91,146,92,148,93,150,94,150,95,152,95,154,96,157,100,159,101,158,106,156,110,156,110,152,113,150,113,148,114,146,115,143,113,142,110,141,106,141,105,139,104,136,105,136,106,134,106,131,107,129,108,127,107,124,105,123,104,119,108,117,112,114,114,112,118,108,121,106,124,103,126,103,130,106,132,107,135,105,135,103,135,100,136,98,137,97,142,93,135,87,128,88,127,85,122,81,114,84,112,80,111,81,111,81,109,83,104,87,101,87,97,86,94,89,90,91,89,93,84,96,80,100,79,101,81,103,84,108,85,111,81,112,76,113,78,118,79,120,80,123" href="#;"  class="imap_043" />
								<area shape="poly" coords="152,222,149,220,147,220,145,221,144,224,143,226,142,226,138,223,138,221,136,219,140,217,141,215,144,214,146,213,149,212,150,212,154,213,158,212,157,212,158,210,159,206,160,206,163,203,166,202,167,201,169,199,171,198,172,198,175,197,176,199,177,201,178,201,177,204,176,205,176,207,176,210,175,211,171,212,170,211,167,213,165,216,163,218,159,218,157,218,156,218,154,220,152,220" href="#;"   class="imap_051"/>
								<area shape="poly" coords="174,197,176,201,178,201,181,199,182,199,183,197,184,194,184,192,185,191,187,189,187,187,188,185,187,183,186,180,183,181,181,180,179,180,178,179,177,178,174,176,172,176,170,178,170,179,169,180,166,182,165,182,163,185,164,186,164,188,165,191,168,191,171,193" href="#;"  class="imap_052" />
								<area shape="poly" coords="131,180,135,180,137,180,139,180,142,180,143,178,144,177,145,176,147,173,148,172,149,171,150,168,151,166,151,165,150,163,149,161,148,159,147,159,144,158,144,158,141,159,140,160,138,161,137,161,136,162,135,162,135,165,133,166,133,167,134,171,134,172,135,174,134,176,132,177" href="#;"   class="imap_053"/>
								<area shape="poly" coords="181,156,184,157,186,156,189,153,191,153,191,158,189,159,190,163,190,166,189,169,188,170,187,173,187,176,187,178,186,179,180,180,178,180,172,176,168,178,167,179,164,181,160,183,158,185,156,186,152,187,147,185,145,185,143,185,141,181,141,179,141,177,143,177,145,175,147,172,148,169,149,166,149,163,147,158,142,157,140,159,138,161,135,161,132,165,131,166,132,170,133,173,133,175,131,177,130,180,127,182,126,182,124,181,123,180,122,179,122,177,121,175,121,174,119,172,117,171,115,169,114,168,112,168,109,168,107,167,105,165,104,163,104,161,103,157,106,156,110,153,111,152,112,149,113,147,113,146,114,144,113,143,110,141,104,141,103,137,104,135,105,134,106,131,106,130,107,127,107,126,105,124,104,123,103,120,103,119,104,119,104,119,109,116,113,113,114,112,116,110,119,108,121,106,122,105,124,104,125,104,128,106,130,107,133,107,134,106,134,105,134,103,134,100,136,98,138,94,139,94,141,91,145,91,151,90,153,90,159,90,161,90,167,90,169,90,174,90,177,89,178,87,182,93,183,96,182,99,184,102,185,106,186,111,184,115,183,117,183,120,184,123,185,125,183,128,181,133,181,134,181,141,182,147,183,152,181,155" href="#;"  class="imap_054" />
								<area shape="poly" coords="92,201,94,206,95,209,95,211,97,213,98,215,100,217,101,220,102,221,102,224,102,226,103,230,105,234,105,236,106,237,113,238,114,239,117,241,118,238,118,235,119,234,121,233,122,233,126,233,128,232,131,233,132,235,135,236,137,238,144,238,146,239,147,238,149,235,150,233,150,230,150,226,150,224,152,221,151,220,147,220,146,221,144,222,143,225,142,226,141,226,137,222,136,219,140,215,143,215,146,213,149,213,150,212,152,214,157,211,157,208,159,206,161,205,165,202,168,200,171,197,174,197,174,195,170,193,166,191,165,191,164,190,163,187,164,183,158,186,155,187,148,186,147,187,144,186,143,184,141,181,137,180,134,180,130,181,126,182,124,181,124,179,123,176,122,174,121,172,115,169,113,168,109,168,105,167,103,168,100,169,99,170,97,171,97,173,96,178,94,179,93,182,94,186,95,190,93,192,97,195,95,197" href="#;"   class="imap_055"/>
								<area shape="poly" coords="33,196,38,200,40,200,44,201,46,200,48,199,49,198,50,196,51,194,52,193,55,193,57,192,59,194,61,195,63,198,64,200,66,201,69,201,73,201,77,201,83,202,85,201,87,201,92,201,92,201,94,206,94,208,96,212,98,214,101,219,102,222,103,227,103,228,103,232,104,234,106,237,103,239,104,243,101,245,96,246,94,246,91,247,89,248,88,251,88,252,89,255,89,258,86,257,83,256,80,256,79,256,75,258,75,259,73,259,69,260,69,262,67,265,65,266,62,266,58,266,55,265,51,265,49,266,45,265,43,265,36,265,34,263,32,260,32,258,29,258,29,260,27,261,25,262,22,262,18,262,18,263,18,264,18,267,17,268,14,269,13,269,10,272,6,273,1,269,5,264,6,261,9,257,11,255,14,252,15,251,14,248,12,247,10,247,7,246,5,245,5,244,5,241,5,238,5,237,7,234,9,233,10,231,11,228,10,227,16,225,17,225,13,219,11,214,14,212,16,212,22,212,23,212,24,213,26,207,27,206,29,205,31,202,31,198" href="#;"   class="imap_061"/>
								<area shape="poly" coords="45,157,41,159,38,159,38,161,40,165,41,167,42,170,42,173,42,174,41,177,38,178,36,180,35,181,35,188,34,191,33,194,34,197,37,199,39,200,43,200,47,200,47,198,50,194,51,193,53,192,57,193,61,195,62,197,64,199,65,200,68,201,74,201,83,201,86,200,89,201,91,201,93,198,94,196,95,195,94,192,93,187,92,185,92,181,92,180,93,179,96,177,96,176,96,172,97,170,100,169,101,168,105,167,105,164,105,160,104,157,100,158,96,155,95,157,93,160,91,160,88,160,85,160,83,158,82,156,81,154,78,152,77,152,72,153,71,154,67,155,67,155,62,153,62,150,61,148,58,149,57,152,49,158,50,157,51,159,46,159" href="#;"   class="imap_063"/>  <area shape="poly" coords="37,284,43,283,48,283,53,283,54,283,58,286,59,288,59,291,60,293,58,296,56,297,55,299,50,301,48,302,45,304,42,305,39,305,35,305,33,305,30,306,25,306,24,306,21,304,18,301,17,297,18,296,19,294,22,291,25,291,27,289,31,286,33,286" href="#;"  class="imap_064" />
							</map>
						</div>
						<div class="text_2" >
                        <p class="tt">강원 지회</p>
	                        <table class="group_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="지부혐황">
	                            <caption>지부혐황</caption>
	                            <colgroup>
	                                <col width="15%">
	                                <col width="35%">
	                                <col width="15%">
	                                <col width="35%">
	                            </colgroup>
	                            <tbody>
	                         	  <tr>
	                                <th>직책</th>
	                                <td>지회장</td>
	                                <th>이름</th>
	                                <td>정현조</td>
	                              </tr>
	                         	  <tr>
	                                <th>주소</th>
	                                <td colspan="3">(131-220) 서울 중량구 상봉2동84-8 불로양봉원</td>
	                              </tr>
	                         	  <tr>
	                                <th>연락처</th>
	                                <td>000-0000-0000</td>
	                                <th>핸드폰</th>
	                                <td>000-0000-0000</td>
	                              </tr>
	                            </tbody>
	                        </table>
	                        <table class="group_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="지부혐황">
	                            <caption>지부혐황</caption>
	                            <colgroup>
	                                <col width="15%">
	                                <col width="35%">
	                                <col width="15%">
	                                <col width="35%">
	                            </colgroup>
	                            <tbody>
	                         	  <tr>
	                                <th>직책</th>
	                                <td>지회장</td>
	                                <th>이름</th>
	                                <td>정현조</td>
	                              </tr>
	                         	  <tr>
	                                <th>주소</th>
	                                <td colspan="3">(131-220) 서울 중량구 상봉2동84-8 불로양봉원</td>
	                              </tr>
	                         	  <tr>
	                                <th>연락처</th>
	                                <td>000-0000-0000</td>
	                                <th>핸드폰</th>
	                                <td>000-0000-0000</td>
	                              </tr>
	                            </tbody>
	                        </table>
                        </div>
                        </li>
                    </ul>
                    <ul>
                    	<li class="title">회원 현황</li>
                        <li>
                        <table class="group_table" width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#d7d7d7" summary="회원현황">
                            <caption>회원현황</caption>
                            <colgroup>
                                <col width="25%" />
                                <col width="25%" />
                                <col width="25%" />
                                <col width="25%" />
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
                          <!--  <tr>
                                <td>2003</td>
                                <td>8,722</td>
                                <td>485</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2004</td>
                                <td>9,439</td>
                                <td>667</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2005</td>
                                <td>10,113</td>
                                <td>674</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2006</td>
                                <td>10,666</td>
                                <td>553</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2007</td>
                                <td>11,151</td>
                                <td>485</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2008</td>
                                <td>11,833</td>
                                <td>682</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2009</td>
                                <td>12,588</td>
                                <td>755</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2010</td>
                                <td>13,685</td>
                                <td>1,097</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2011</td>
                                <td>14,147</td>
                                <td>462</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2012</td>
                                <td>14,869</td>
                                <td>722</td>
                                <td>&nbsp;</td>
                              </tr>
                              <tr>
                                <td>2013</td>
                                <td>15,550</td>
                                <td>681</td>
                                <td>&nbsp;</td>
                              </tr> -->
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
                                <col width="25%" />
                                <col width="25%" />
                                <col width="25%" />
                                <col width="25%" />
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
                                <col width="150" />
                                <col width="150" />
                                <col width="300" />
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
