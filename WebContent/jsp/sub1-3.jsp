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
										$('.branch_map>img').attr('src','/images/map/'+mname+'.jpg');
								});
								//지도 캐쉬로 갱신이 안되어 /map 폴더 별도 생성하여 작업함.


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
										<h2 class="page_title">조직구성</h2>
										<div class="location">홈 &gt; 협회소개 &gt; <span>조직구성</span></div>
								</div>
								<div class="sub_body_box">

										<h3 class="title_txt">조직도</h3>

										<div class="taC">
												<img src="http://www.korapis.or.kr/images/branch_map.png" alt="조직도"/>
										</div>

										<%--
										<ul class="group">
												<li class="group_01">
														<ul>
																<li class="g_1">한국양봉학회</li>
																<li class="g_3">사 무 국</li>
																<!-- <li class="g_5">사무총장</li>
																<li class="g_7">사무국직원</li> -->
														</ul>
												</li>
												<li class="group_02">
														<ul>
																<li class="g_1">회 장</li>
																<li class="g_4">이 사</li>
																<li class="g_6">시도지회(15개)</li>
																<!-- <li class="g_7">시도 지부</li> -->
														</ul>
												</li>
												<li class="group_03">
														<ul>
																<li class="g_2">(사)밀원수 조림육성협회</li>
																<li class="g_3">한국양봉산물 연구소</li>
																<!-- <li class="g_5">소 장</li>
																<li class="g_8">품질관리<br />직원</li>
																<li class="g_8_1">연구소<br />직원</li> -->
														</ul>
												</li>
										</ul>
										 --%>

								<h3 class="title_txt">지회현황</h3>

								<div class="branch_map_w">
										<div class="branch_map">
												<img src="/images/imap_00.jpg" usemap="#branch_map" border="0"  />
												<map name="branch_map" id="branch_map">
														<area shape="poly" alt="서울" href="javascript: f_changemap('02')" class="imap_02"  coords="79,95,87,95,89,89,96,88,98,82,104,81,107,85,108,91,114,95,115,100,103,112,99,108,91,109,91,109" />
<area shape="poly" alt="경기" href="javascript: f_changemap('031')"  class="imap_031" coords="76,91,71,88,62,93,63,87,61,78,65,77,71,77,78,61,75,55,85,56,84,47,91,46,88,41,81,39,89,35,95,33,109,31,113,37,130,43,139,57,144,60,139,73,141,89,155,95,162,96,158,106,162,113,158,131,159,136,152,138,141,146,133,149,124,161,109,154,98,155,87,161,81,153,78,151,75,140,69,138,68,132,70,129,76,115,82,111,81,106,86,104,92,108,100,107,103,111,115,100,113,93,107,89,108,85,103,80,97,81,97,86,90,88,87,94,79,94"/>
<area shape="poly" alt="인천" href="javascript: f_changemap('032')" class="imap_032" coords="58,80,61,73,48,67,45,71,36,72,36,79,32,81,33,87,45,93,45,103,51,110,67,105,74,112,76,114,82,108,83,104,88,104,77,91,69,88,64,94,60,84,60,84"/>
<area shape="poly" alt="강원" href="javascript: f_changemap('033')" class="imap_033" coords="286,132,287,128,283,123,282,118,270,107,259,83,252,76,237,53,228,43,224,37,225,30,218,20,215,12,212,4,205,2,207,9,202,19,193,16,186,16,186,26,151,28,138,22,134,26,124,26,119,23,111,28,111,33,112,36,131,44,139,57,146,61,140,75,141,89,154,94,161,95,160,108,162,111,158,135,164,138,169,137,177,126,178,128,182,134,190,129,198,130,205,139,223,140,226,147,274,143"/>
<area shape="poly" alt="충남" href="javascript: f_changemap('041')" class="imap_041" coords="72,252,69,245,60,240,60,231,63,223,56,217,47,215,42,207,42,203,44,199,41,185,35,187,32,189,29,185,27,173,33,167,44,156,60,150,66,155,80,157,88,166,101,160,119,163,124,164,133,174,133,178,125,177,119,189,128,203,120,214,119,228,137,236,139,229,146,237,147,242,151,248,148,256,132,255,126,242,117,243,112,248,104,247,103,238,93,234,82,254"/>
<area shape="poly" alt="대전" href="javascript: f_changemap('042')" class="imap_042" coords="120,221,125,210,135,207,140,208,139,223,135,232,126,227,122,227"/>
<area shape="poly" alt="충북" href="javascript: f_changemap('043')" class="imap_043" coords="130,203,124,188,127,179,133,178,137,175,128,163,137,152,150,147,160,139,166,141,174,138,180,128,184,134,192,129,199,131,204,140,218,142,226,148,214,158,215,166,215,171,211,172,204,166,198,165,169,189,165,194,172,201,171,207,167,211,168,216,166,221,175,228,184,231,179,238,176,244,174,249,161,251,157,253,152,248,152,243,149,241,150,233,139,226,143,218,144,207,138,203"/>
<area shape="poly" alt="부산" href="javascript: f_changemap('051')" class="imap_051" coords="247,354,242,350,233,349,229,358,223,360,219,352,234,342,242,344,250,341,253,334,266,326,271,318,279,318,285,324,282,329,280,338,275,337,268,340,262,348,256,347,255,350"/>
<area shape="poly" alt="울산" href="javascript: f_changemap('052')" class="imap_052"  coords="285,319,294,318,294,306,301,300,299,289,289,290,276,284,264,294,263,302,281,311"/>
<area shape="poly" alt="대구" href="javascript: f_changemap('053')" class="imap_053" coords="211,287,217,278,213,267,225,256,236,254,242,265,233,281,227,281,223,287" href="" target="" />
<area shape="poly" alt="경북" href="javascript: f_changemap('054')" class="imap_054" coords="307,245,300,251,293,249,293,238,290,231,291,224,289,215,296,207,296,195,294,190,298,186,298,169,293,161,292,152,293,149,287,136,276,145,229,148,218,158,217,172,213,175,206,172,199,168,169,193,175,200,174,208,171,214,170,220,179,225,187,229,185,236,180,244,176,251,169,254,174,266,189,268,194,274,198,276,198,288,203,290,212,287,215,277,210,267,228,253,239,253,243,266,234,282,227,285,229,292,232,296,241,295,246,297,254,295,268,287,276,281,290,288,300,286,302,281,302,275,308,261,305,257" href="" target="" />
<area shape="poly" alt="경남" href="javascript: f_changemap('055')" class="imap_055" coords="185,387,179,381,170,382,166,364,165,355,152,337,153,333,148,324,155,313,150,296,155,285,156,276,162,274,172,268,179,273,185,271,196,279,195,288,199,293,210,293,225,291,228,298,242,298,246,302,263,295,260,302,280,315,269,319,264,325,251,333,247,342,231,341,218,351,217,361,226,363,236,354,243,355,242,363,241,375,236,385,218,383,212,371,201,375,190,375" href="" target="" />
<area shape="poly" alt="전남" href="javascript: f_changemap('061')" class="imap_061" coords="1,430,7,437,23,432,30,429,27,422,43,419,51,413,61,423,106,426,111,417,136,408,142,414,142,402,140,396,147,393,163,392,168,379,163,362,163,353,150,338,147,327,141,322,126,325,105,324,99,316,91,313,87,309,81,311,78,319,61,323,74,330,88,330,101,336,100,342,83,352,71,343,71,330,60,324,54,316,51,315,43,330,40,330,42,340,27,339,15,343,25,356,19,361,16,361,16,367,9,378,9,389,10,395,21,397,22,404" href="" target="" />
<area shape="poly" alt="광주" href="javascript: f_changemap('062')" class="imap_062" coords="81,351,69,339,71,330,86,330,91,328,101,336,101,345"/>
<area shape="poly" alt="전북" href="javascript: f_changemap('063')" class="imap_063" coords="54,309,56,300,56,289,64,284,69,267,61,257,74,255,85,256,94,238,99,239,100,247,110,251,122,243,127,245,131,256,149,257,154,251,159,256,167,253,168,258,169,263,161,270,154,271,151,283,146,297,152,311,146,321,140,319,128,322,105,321,102,313,94,311,89,306,80,307,77,317,63,321"/>
<area shape="poly" alt="제주" href="javascript: f_changemap('064')" class="imap_064" coords="28,477,32,468,38,468,47,460,55,460,61,455,88,453,93,460,93,469,85,478,72,486,53,487,39,490,33,488"/>
												</map>
										</div>


										<%
										String b1 = "";
										int i=0;
										String divid = "";
										String ozip = "";
										String ophone = "";
										String ofax = "";

										String strAddr = "";
										String cp = "";
										while(d!=null && d.next()){
												if("강원".equals(d.getString("branch1"))){ divid = "033";
												}else if("경기".equals(d.getString("branch1"))){ divid = "031";
												}else if("경남".equals(d.getString("branch1"))){ divid = "055";
												}else if("경북".equals(d.getString("branch1"))){ divid = "054";
												}else if("광주".equals(d.getString("branch1"))){ divid = "062";
												}else if("전남".equals(d.getString("branch1"))){ divid = "061";
												}else if("대구".equals(d.getString("branch1"))){ divid = "053";
												}else if("대전".equals(d.getString("branch1"))){ divid = "042";
												}else if("부산".equals(d.getString("branch1"))){ divid = "051";
												}else if("서울".equals(d.getString("branch1"))){ divid = "02";
												}else if("울산".equals(d.getString("branch1"))){ divid = "052";
												}else if("인천".equals(d.getString("branch1"))){ divid = "032";
												}else if("전북".equals(d.getString("branch1"))){ divid = "063";
												}else if("제주".equals(d.getString("branch1"))){ divid = "064";
												}else if("충남".equals(d.getString("branch1"))){ divid = "041";
												}else if("충북".equals(d.getString("branch1"))){ divid = "043";
												}


												//보낼주소(자택, 사업장 )
												if("H".equals(d.getString("mailreceive"))){
														strAddr = d.getString("Hzipcode3");
														strAddr = "-".equals(strAddr) ? "" : strAddr+"&nbsp;&nbsp;";
														strAddr += d.getString("Haddr1") + d.getString("Haddr2");
												}else if("O".equals(d.getString("mailreceive"))){
														strAddr = d.getString("Ozipcode3");
														strAddr = "-".equals(strAddr) ? "" : strAddr+"&nbsp;&nbsp;";
														strAddr += d.getString("Oaddr1") + d.getString("Oaddr2");
												}else{
														strAddr = "";
												}
												cp = d.getString("cp1")+"-"+d.getString("cp2")+"-"+d.getString("cp3");

												if("광주".equals(d.getString("branch1")) && "지회장".equals(d.getString("role_pos"))) {
													strAddr = "광주광역시 광산구 수등로123번길 70";
												}

												ozip = ("".equals(d.getString("zipcode")) || "-".equals(d.getString("zipcode"))) ? "" : "("+d.getString("zipcode")+")";
												ophone = ("".equals(d.getString("ophone")) || "--".equals(d.getString("ophone"))) ? "" : d.getString("ophone");
												ofax = ("".equals(d.getString("ofax")) || "--".equals(d.getString("ofax"))) ? "" : d.getString("ofax");

												if(!b1.equals(d.getString("branch1"))){
														if(i++!=0){
														%>
														</div>
														<%}%>
										<div class="branch_table" id="info_<%=divid %>">
											 <p class="sub_title"><%=d.getString("branch1") %> 지회</p>
														<%
												}
												b1 = d.getString("branch1");
										%>
												<table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="지회현황">
														<caption>지회현황</caption>
														<colgroup>
																<col width="17%">
																<col width="33%">
																<col width="15%">
																<col width="35%">
														</colgroup>
														<tbody>
															<tr>
																<th>직책</th>
																<td><%=d.getString("role_pos") %></td>
																<th>이름</th>
																<td><%=d.getString("name").replaceAll("지회장님?","") %></td>
															</tr>
															<tr>
																<th>주소</th>
																<td colspan="3"><%=strAddr %></td>
															</tr>
															<!-- <tr>
																<th>연락처</th>
																<td><i>사무국 문의</i><%--=cp --%></td>
																<th>팩스</th>
																<td><%=ofax %></td>
															</tr> -->
														</tbody>
												</table>
											 <%} %>
											 </div>
										</div>
										<p class="taC"> 지부 및 지회 연락처는 본 협회 사무국 이성진 사원 (02-3486-0882~5)로 문의해 주시기 바랍니다.</p>

									 <h3 class="title_txt">회원 현황</h3>

									 <table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="회원현황">
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
												<tr>
													<td>2021</td>
													<td>19,320</td>
													<td>▲1,168</td>
													<td>신규회원:1,168명</td>
												</tr>
												<tr>
													<td>2020</td>
													<td>18,152</td>
													<td>▲1,013</td>
													<td>신규회원:1,013명</td>
												</tr>
												<tr>
													<td>2019</td>
													<td>17,139</td>
													<td>▲535</td>
													<td>신규회원:535명</td>
												</tr>
												<tr>
													<td>2018</td>
													<td>16,604</td>
													<td>▲1,220</td>
													<td>신규회원:1,220명</td>
												</tr>
												<tr>
													<td>2017</td>
													<td>15,384</td>
													<td>▲1,073</td>
													<td>신규회원:1,073명</td>
												</tr>
												 <tr>
													 <td>2016</td>
													 <td>14,311</td>
													 <td>▲ 1,069</td>
													 <td>신규회원: 1,069명</td>
												 </tr>
												 <tr>
													 <td>2015</td>
													 <td>13,242</td>
													 <td>▼ 3,315</td>
													 <td>신규회원: 1,151명</td>
												 </tr>
												 <tr>
													 <td>2014</td>
													 <td>16,557</td>
													 <td>▲ 1,007</td>
													 <td>&nbsp;</td>
												 </tr>
												 <tr>
													 <td>2013</td>
													 <td>15,550</td>
													 <td>▲ 681</td>
													 <td>&nbsp;</td>
												 </tr>
												 <tr>
													 <td>2012</td>
													 <td>14,869</td>
													 <td>▲ 722</td>
													 <td>&nbsp;</td>
												 </tr>
												 <tr>
													 <td>2011</td>
													 <td>14,147</td>
													 <td>▲ 462</td>
													 <td>&nbsp;</td>
												 </tr>
												 <tr>
													 <td>2010</td>
													 <td>13,685</td>
													 <td>▲ 1,079</td>
													 <td>&nbsp;</td>
												 </tr>
											 </tbody>
									 </table>

									 <%--
									 <ul>
												<li class="title">회원 분포</li>
											 <li>
											 <table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="회원 분포">
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
										--%>
									 <h3 class="title_txt">협회 사무국 현황</h3>
								<table class="table_hor mt20" width="100%" border="0" cellpadding="0" cellspacing="0" summary="협회 사무국 현황">
										<caption>협회 사무국 현황</caption>
										<colgroup>
												<col width="30%" />
												<col width="15%" />
												<col width="20%" />
												<col width="*" />
										</colgroup>
										<thead>
										<tr>
												<th>구분</th>
												<th>인원</th>
												<th colspan="2">직책/이름</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td rowspan="6">사무국</td>
												<td rowspan="6">6</td>
												<td>회장</td>
												<td>윤화현</td>
											</tr>
											<tr>
												<td class="not-first">전무</td>
												<td>김정빈</td>
											</tr>
											<tr>
												<td class="not-first">차장</td>
												<td>박성치</td>
											</tr>
											<tr>
												<td class="not-first">과장</td>
												<td>김민우</td>
											</tr>
											<tr>
												<td class="not-first">계장</td>
												<td>신선아</td>
											</tr>
											<tr>
												<td class="not-first">계장</td>
												<td>이성진</td>
											</tr>

											<tr>
												<td rowspan="6">양봉산물 연구소</td>
												<td rowspan="6">5</td>
												<td>소장</td>
												<td>&nbsp;</td>
											</tr>
											<tr>
												<td class="not-first">과장</td>
												<td>박혜영</td>
											<tr>
												<td class="not-first">계장</td>
												<td>박경희</td>
											</tr>
											<tr>
												<td class="not-first">주임</td>
												<td>이수미</td>
											</tr>
											<tr>
												<td class="not-first">연구원</td>
												<td>정지윤</td>
											</tr>
											<tr>
												<td class="not-first">연구원</td>
												<td>이연주</td>
											</tr>
											<tr>
												<td>품질관리</td>
												<td>1</td>
												<td>차장</td>
												<td>정대영</td>
											</tr>
										</tbody>
										<!-- <tfoot>
										 <tr>
												<th>합 계</th>
												<th colspan="3">12명</th>
											</tr>
										</tfoot> -->
								</table>
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
