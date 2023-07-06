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
						<h2 class="page_title">꿀벌/사육수 통계조사</h2>
						<div class="location">홈  &gt; 양봉산업 정보 &gt; <span>꿀벌/사육수 통계조사</span></div>
					</div>
					
					<div class="sub_body_box">
						<ul class="tab_list grid_3 ver_pc">
							<li><a href="/jsp/sub3-1.jsp" target="_self">사육 가구수</a></li>
							<li><a href="/jsp/sub3-1_01.jsp" target="_self">사육군수</a></li>
							<li class="on"><a href="/jsp/sub3-1_02.jsp" target="_self">종별‧사육형태별 가구수 및 군수</a></li>
						</ul>
						<ul class="tab_list grid_2 ver_m">
							<li><a href="/jsp/sub3-1.jsp" target="_self">사육 가구수</a></li>
							<li><a href="/jsp/sub3-1_01.jsp" target="_self">사육군수</a></li>
							<li class="on"><a href="/jsp/sub3-1_02.jsp" target="_self">종별‧사육형태별 가구수 및 군수</a></li>
						</ul>
						
						<h3 class="title_txt">꿀벌 종별 사육형태별 가구수 및 군수</h3>
						
						<p class="sub_title">종별 가구수  및  군수</p>
						<div class="xscrollArea">
							<table class="table_hor stable" width="100%" border="0" cellpadding="0" cellspacing="0" summary="종별 가구수  및  군수">
								<caption>종별 가구수  및  군수</caption>
								<thead>
									<tr>
										<th rowspan="2">구별</th>
										<th colspan="2">계</th>
										<th colspan="2">재래종</th>
										<th colspan="2">개량종</th>
									</tr>
									<tr>
										<th>가구수 (호)</th>
										<th>군수 (군)</th>
										<th>가구수 (호)</th>
										<th>군수 (군)</th>
										<th>가구수 (호)</th>
										<th>군수 (군)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									  <td>′11</td>
									  <td>19,528</td>
									  <td>1,531,609</td>
									  <td>4,012</td>
									  <td>100,756</td>
									  <td>15,516</td>
									  <td>1,430,853</td>
									</tr>
									<tr>
									  <td>′12</td>
									  <td>20,579</td>
									  <td>1,795,197</td>
									  <td>3,917</td>
									  <td>149,172</td>
									  <td>16,662</td>
									  <td>1,646,025</td>
									</tr>
									<tr>
									  <td>′13</td>
									  <td>19,903</td>
									  <td>1,756,993</td>
									  <td>3,534</td>
									  <td>98,899</td>
									  <td>16,369</td>
									  <td>1,658,094</td>
									</tr>
									<tr>
									  <td>′14</td>
									  <td>21,297</td>
									  <td>1,952,962</td>
									  <td>3,121</td>
									  <td>94,383</td>
									  <td>18,176</td>
									  <td>1,858,579</td>
									</tr>
									<tr>
									  <td>′15</td>
									  <td>22,596</td>
									  <td>1,962,989</td>
									  <td>3,123</td>
									  <td>109,818</td>
									  <td>19,473</td>
									  <td>1,853,171</td>
									</tr>
									<tr>
									  <td>′16</td>
									  <td>22,722</td>
									  <td>2,155,180</td>
									  <td>3,130</td>
									  <td>119,028</td>
									  <td>19,592</td>
									  <td>2,036,152</td>
									</tr>
									<tr>
									  <td>′17</td>
									  <td>24,691</td>
									  <td>2,388,237</td>
									  <td>3,644</td>
									  <td>165,718</td>
									  <td>21,047</td>
									  <td>2,222,519</td>
									</tr>
									<tr>
									  <td>′18</td>
									  <td>26,545</td>
									  <td>2,592,197</td>
									  <td>3,589</td>
									  <td>129,816</td>
									  <td>22,956</td>
									  <td>2,462,381</td>
									</tr>
									<tr>
									  <td>′19</td>
									  <td>29,109</td>
									  <td>2,744,141</td>
									  <td>3,861</td>
									  <td>131,530</td>
									  <td>25,248</td>
									  <td>2,612,611</td>
									</tr>
									<tr>
									  <th>‘20.12</th>
									  <th>27,464</th>
									  <th>2,679,842</th>
									  <th>3,349</th>
									  <th>98,076</th>
									  <th>24,116</th>
									  <th>2,581,766</th>
									</tr>
									<tr>
									  <td>서 울</td>
									  <td>38</td>
									  <td>3,239</td>
									  <td>0</td>
									  <td>0</td>
									  <td>38</td>
									  <td>3,239</td>
									</tr>
									<tr>
									  <td>부 산</td>
									  <td>115</td>
									  <td>8,011</td>
									  <td>12</td>
									  <td>404</td>
									  <td>104</td>
									  <td>7,607</td>
									</tr>
									<tr>
									  <td>대 구</td>
									  <td>347</td>
									  <td>48,906</td>
									  <td>12</td>
									  <td>517</td>
									  <td>335</td>
									  <td>48,389</td>
									</tr>
									<tr>
									  <td>인 천</td>
									  <td>109</td>
									  <td>11,966</td>
									  <td>7</td>
									  <td>176</td>
									  <td>102</td>
									  <td>11,790</td>
									</tr>
									<tr>
									  <td>광 주</td>
									  <td>379</td>
									  <td>43,990</td>
									  <td>0</td>
									  <td>0</td>
									  <td>379</td>
									  <td>43,990</td>
									</tr>
									<tr>
									  <td>대 전</td>
									  <td>169</td>
									  <td>18,945</td>
									  <td>0</td>
									  <td>0</td>
									  <td>169</td>
									  <td>18,945</td>
									</tr>
									<tr>
									  <td>울 산</td>
									  <td>571</td>
									  <td>33,919</td>
									  <td>50</td>
									  <td>2,391</td>
									  <td>521</td>
									  <td>31,528</td>
									</tr>
									<tr>
									  <td>세 종</td>
									  <td>112</td>
									  <td>12,171</td>
									  <td>2</td>
									  <td>18</td>
									  <td>110</td>
									  <td>12,153</td>
									</tr>
									<tr>
									  <td>경 기</td>
									  <td>2,788</td>
									  <td>253,043</td>
									  <td>184</td>
									  <td>3,635</td>
									  <td>2,604</td>
									  <td>249,408</td>
									</tr>
									<tr>
									  <td>강 원</td>
									  <td>3,098</td>
									  <td>192,170</td>
									  <td>1,015</td>
									  <td>10,078</td>
									  <td>2,083</td>
									  <td>182,092</td>
									</tr>
									<tr>
									  <td>충 북</td>
									  <td>2,714</td>
									  <td>258,861</td>
									  <td>491</td>
									  <td>10,222</td>
									  <td>2,223</td>
									  <td>248,639</td>
									</tr>
									<tr>
									  <td>충 남</td>
									  <td>2,492</td>
									  <td>268,570</td>
									  <td>168</td>
									  <td>6,703</td>
									  <td>2,324</td>
									  <td>261,867</td>
									</tr>
									<tr>
									  <td>전 북</td>
									  <td>2,262</td>
									  <td>286,616</td>
									  <td>188</td>
									  <td>7,224</td>
									  <td>2,074</td>
									  <td>279,392</td>
									</tr>
									<tr>
									  <td>전 남</td>
									  <td>3,045</td>
									  <td>285,038</td>
									  <td>374</td>
									  <td>22,900</td>
									  <td>2,671</td>
									  <td>262,138</td>
									</tr>
									<tr>
									  <td>경 북</td>
									  <td>5,303</td>
									  <td>536,547</td>
									  <td>508</td>
									  <td>14,542</td>
									  <td>4,795</td>
									  <td>522,005</td>
									</tr>
									<tr>
									  <td>경 남</td>
									  <td>3,409</td>
									  <td>337,047</td>
									  <td>312</td>
									  <td>11,421</td>
									  <td>3,097</td>
									  <td>325,626</td>
									</tr>
									<tr>
									  <td>제 주</td>
									  <td>513</td>
									  <td>80,803</td>
									  <td>26</td>
									  <td>7,845</td>
									  <td>487</td>
									  <td>72,958</td>
									</tr>
								  </tbody>
							</table>
						</div>
						
						<p class="sub_title">개량종 중 사육 형태별 가구수 및 군수</p>
						<div class="xscrollArea">
							<table class="table_hor stable" width="100%" border="0" cellpadding="0" cellspacing="0" summary="개량종 사육형태별 가구수 및 군수">
								<caption>개량종 중 사육 형태별 가구수 및 군수</caption>
								
								<thead>
									<tr>
										<th rowspan="2">구분</th>
										<th colspan="2">고정양봉</th>
										<th colspan="2">이동양봉</th>
									</tr>
									<tr>
										<th>가구수 (호)</th>
										<th>군수 (군)</th>
										<th>가구수 (호)</th>
										<th>군수 (군)</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									  <td>′11</td>
									  <td>10,141</td>
									  <td>604,064</td>
									  <td>5,375</td>
									  <td>826,789</td>
									</tr>
									<tr>
									  <td>′12</td>
									  <td>10,933</td>
									  <td>752,887</td>
									  <td>5,729</td>
									  <td>893,138</td>
									</tr>
									<tr>
									  <td>′13</td>
									  <td>11,235</td>
									  <td>813,195</td>
									  <td>5,145</td>
									  <td>844,899</td>
									</tr>
									<tr>
									  <td>′14</td>
									  <td>12,175</td>
									  <td>909,459</td>
									  <td>6,001</td>
									  <td>949,120</td>
									</tr>
									<tr>
									  <td>′15</td>
									  <td>13,134</td>
									  <td>1,002,088</td>
									  <td>6,339</td>
									  <td>851,083</td>
									</tr>
									<tr>
									  <td>′16</td>
									  <td>13,988</td>
									  <td>1,095,132</td>
									  <td>5,604</td>
									  <td>941,020</td>
									</tr>
									<tr>
									  <td>′17</td>
									  <td>15,122</td>
									  <td>1,248,684</td>
									  <td>5,925</td>
									  <td>973,835</td>
									</tr>
									<tr>
									  <td>′18</td>
									  <td>16,573</td>
									  <td>1,398,288</td>
									  <td>6,383</td>
									  <td>1,064,093</td>
									</tr>
									<tr>
									  <td>′19</td>
									  <td>18,800</td>
									  <td>1,534,294</td>
									  <td>6,619</td>
									  <td>1,078,317</td>
									</tr>
									<tr>
									  <th>‘20.12</th>
									  <th>18,095</th>
									  <th>1,530,668</th>
									  <th>6,421</th>
									  <th>1,051,098</th>
									</tr>
									<tr>
									  <td>서 울</td>
									  <td>14</td>
									  <td>628</td>
									  <td>24</td>
									  <td>2,611</td>
									</tr>
									<tr>
									  <td>부 산</td>
									  <td>98</td>
									  <td>6,673</td>
									  <td>9</td>
									  <td>934</td>
									</tr>
									<tr>
									  <td>대 구</td>
									  <td>200</td>
									  <td>22,190</td>
									  <td>139</td>
									  <td>26,199</td>
									</tr>
									<tr>
									  <td>인 천</td>
									  <td>49</td>
									  <td>3,490</td>
									  <td>54</td>
									  <td>8,300</td>
									</tr>
									<tr>
									  <td>광 주</td>
									  <td>242</td>
									  <td>19,655</td>
									  <td>138</td>
									  <td>24,335</td>
									</tr>
									<tr>
									  <td>대 전</td>
									  <td>72</td>
									  <td>6,304</td>
									  <td>98</td>
									  <td>12,641</td>
									</tr>
									<tr>
									  <td>울 산</td>
									  <td>393</td>
									  <td>21,884</td>
									  <td>107</td>
									  <td>9,644</td>
									</tr>
									<tr>
									  <td>세 종</td>
									  <td>71</td>
									  <td>6,774</td>
									  <td>40</td>
									  <td>5,379</td>
									</tr>
									<tr>
									  <td>경 기</td>
									  <td>2,204</td>
									  <td>187,770</td>
									  <td>394</td>
									  <td>61,638</td>
									</tr>
									<tr>
									  <td>강 원</td>
									  <td>1,627</td>
									  <td>104,074</td>
									  <td>488</td>
									  <td>78,018</td>
									</tr>
									<tr>
									  <td>충 북</td>
									  <td>1,604</td>
									  <td>140,243</td>
									  <td>624</td>
									  <td>108,396</td>
									</tr>
									<tr>
									  <td>충 남</td>
									  <td>2,381</td>
									  <td>209,413</td>
									  <td>291</td>
									  <td>52,454</td>
									</tr>
									<tr>
									  <td>전 북</td>
									  <td>1,121</td>
									  <td>109,756</td>
									  <td>963</td>
									  <td>169,636</td>
									</tr>
									<tr>
									  <td>전 남</td>
									  <td>2,067</td>
									  <td>155,696</td>
									  <td>599</td>
									  <td>106,442</td>
									</tr>
									<tr>
									  <td>경 북</td>
									  <td>3,530</td>
									  <td>319,642</td>
									  <td>1,290</td>
									  <td>202,363</td>
									</tr>
									<tr>
									  <td>경 남</td>
									  <td>2,354</td>
									  <td>209,213</td>
									  <td>740</td>
									  <td>116,413</td>
									</tr>
									<tr>
									  <td>제 주</td>
									  <td>68</td>
									  <td>7,263</td>
									  <td>423</td>
									  <td>65,695</td>
									</tr>
								  </tbody>
							</table>
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
