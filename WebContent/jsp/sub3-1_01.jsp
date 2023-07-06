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
							<li class="on"><a href="/jsp/sub3-1_01.jsp" target="_self">사육군수</a></li>
							<li><a href="/jsp/sub3-1_02.jsp" target="_self">종별‧사육형태별 가구수 및 군수</a></li>
						</ul>
						<ul class="tab_list grid_2 ver_m">
							<li><a href="/jsp/sub3-1.jsp" target="_self">사육 가구수</a></li>
							<li class="on"><a href="/jsp/sub3-1_01.jsp" target="_self">사육군수</a></li>
							<li><a href="/jsp/sub3-1_02.jsp" target="_self">종별‧사육형태별 가구수 및 군수</a></li>
						</ul>
						
						<h3 class="title_txt">꿀벌 사육 규모별 군수</h3>
						<div class="xscrollArea">
							<table class="table_hor stable" width="100%" border="0" cellpadding="0" cellspacing="0" summary="꿀벌 사육 군수">
								<caption>꿀벌 사육 군수</caption>
								
								<thead>
									<tr>
									  <th>구 분</th>
									  <th>1~9</th>
									  <th>10~49</th>
									  <th>50~99</th>
									  <th>100~<br>199</th>
									  <th>200~<br>299</th>
									  <th>300~<br>499</th>
									  <th>500~<br>999</th>
									  <th>1,000<br>이상</th>
									  <th>계</th>
									</tr>
								  </thead>
								  <tbody>
									<tr>
									  <td>′11</td>
									  <td>22,216</td>
									  <td>123,614</td>
									  <td>180,838</td>
									  <td>356,681</td>
									  <td>287,072</td>
									  <td>345,964</td>
									  <td>192,444</td>
									  <td>22,780</td>
									  <td>1,531,609</td>
									</tr>
									<tr>
									  <td>′12</td>
									  <td>19,907</td>
									  <td>135,162</td>
									  <td>216,3144</td>
									  <td>404,559</td>
									  <td>378,598</td>
									  <td>394,637</td>
									  <td>205,026</td>
									  <td>40,994</td>
									  <td>1,795,197</td>
									</tr>
									<tr>
									  <td>′13</td>
									  <td>18,562</td>
									  <td>132,340</td>
									  <td>223,877</td>
									  <td>427,716</td>
									  <td>312,176</td>
									  <td>378,995</td>
									  <td>211,933</td>
									  <td>51,394</td>
									  <td>1,756,993</td>
									</tr>
									<tr>
									  <td>′14</td>
									  <td>17,461</td>
									  <td>139,483</td>
									  <td>256,400</td>
									  <td>481,803</td>
									  <td>360,912</td>
									  <td>414,774</td>
									  <td>222,479</td>
									  <td>59,650</td>
									  <td>1,952,962</td>
									</tr>
									<tr>
									  <td>′15</td>
									  <td>16,005</td>
									  <td>151,921</td>
									  <td>260,526</td>
									  <td>487,031</td>
									  <td>364,149</td>
									  <td>401,358</td>
									  <td>232,499</td>
									  <td>49,500</td>
									  <td>1,962,989</td>
									</tr>
									<tr>
									  <td>′16</td>
									  <td>16,510</td>
									  <td>165,475</td>
									  <td>285,023</td>
									  <td>511,502</td>
									  <td>406,037</td>
									  <td>466,644</td>
									  <td>249,856</td>
									  <td>54,133</td>
									  <td>2,155,180</td>
									</tr>
									<tr>
									  <td>′17</td>
									  <td>16,972</td>
									  <td>178,379</td>
									  <td>311,040</td>
									  <td>584,258</td>
									  <td>448,613</td>
									  <td>492,297</td>
									  <td>260,891</td>
									  <td>95,787</td>
									  <td>2,388,237</td>
									</tr>
									<tr>
									  <td>′18</td>
									  <td>38,461</td>
									  <td>194,860</td>
									  <td>337,838</td>
									  <td>639,187</td>
									  <td>476,652</td>
									  <td>531,243</td>
									  <td>296,730</td>
									  <td>77,226</td>
									  <td>2,592,197</td>
									</tr>
									<tr>
									  <td>′19</td>
									  <td>20,524</td>
									  <td>223,074</td>
									  <td>374,256</td>
									  <td>673,086</td>
									  <td>511,665</td>
									  <td>554,353</td>
									  <td>285,629</td>
									  <td>101,454</td>
									  <td>2,744,141</td>
									</tr>
									<tr>
									  <th>‘20. 12</th>
									  <th>17,251</th>
									  <th>213,128</th>
									  <th>354,853</th>
									  <th>666,987</th>
									  <th>527,407</th>
									  <th>547,022</th>
									  <th>284,778</th>
									  <th>68,416</th>
									  <th>2,697,842</th>
									</tr>
									<tr>
									  <td>서 울</td>
									  <td>10</td>
									  <td>371</td>
									  <td>540</td>
									  <td>1,118</td>
									  <td>200</td>
									  <td>300</td>
									  <td>700</td>
									  <td>0</td>
									  <td>3,239</td>
									</tr>
									<tr>
									  <td>부 산</td>
									  <td>34</td>
									  <td>1,163</td>
									  <td>1,898</td>
									  <td>2,796</td>
									  <td>1,450</td>
									  <td>670</td>
									  <td>0</td>
									  <td>0</td>
									  <td>8,011</td>
									</tr>
									<tr>
									  <td>대 구</td>
									  <td>27</td>
									  <td>1,880</td>
									  <td>6,068</td>
									  <td>11,504</td>
									  <td>11,213</td>
									  <td>11,734</td>
									  <td>6,480</td>
									  <td>0</td>
									  <td>48,906</td>
									</tr>
									<tr>
									  <td>인 천</td>
									  <td>36</td>
									  <td>500</td>
									  <td>1,946</td>
									  <td>2,993</td>
									  <td>2,160</td>
									  <td>2,581</td>
									  <td>1,750</td>
									  <td>0</td>
									  <td>11,966</td>
									</tr>
									<tr>
									  <td>광 주</td>
									  <td>100</td>
									  <td>2,606</td>
									  <td>5,509</td>
									  <td>11,741</td>
									  <td>10,422</td>
									  <td>5,033</td>
									  <td>4,779</td>
									  <td>3,800</td>
									  <td>43,990</td>
									</tr>
									<tr>
									  <td>대 전</td>
									  <td>160</td>
									  <td>944</td>
									  <td>3,380</td>
									  <td>6,925</td>
									  <td>4,740</td>
									  <td>1,600</td>
									  <td>0</td>
									  <td>1,196</td>
									  <td>18,945</td>
									</tr>
									<tr>
									  <td>울 산</td>
									  <td>337</td>
									  <td>6,070</td>
									  <td>8,798</td>
									  <td>10,500</td>
									  <td>4,990</td>
									  <td>2,184</td>
									  <td>1,040</td>
									  <td>0</td>
									  <td>33,919</td>
									</tr>
									<tr>
									  <td>세 종</td>
									  <td>30</td>
									  <td>828</td>
									  <td>1,624</td>
									  <td>3,214</td>
									  <td>3,015</td>
									  <td>3,460</td>
									  <td>0</td>
									  <td>0</td>
									  <td>12,171</td>
									</tr>
									<tr>
									  <td>경 기</td>
									  <td>1,082</td>
									  <td>22,187</td>
									  <td>48,731</td>
									  <td>83,064</td>
									  <td>50,282</td>
									  <td>33,244</td>
									  <td>11,453</td>
									  <td>3,000</td>
									  <td>253,043</td>
									</tr>
									<tr>
									  <td>강 원</td>
									  <td>3,643</td>
									  <td>21,755</td>
									  <td>28,477</td>
									  <td>52,754</td>
									  <td>41,056</td>
									  <td>34,835</td>
									  <td>9,650</td>
									  <td>0</td>
									  <td>192,170</td>
									</tr>
									<tr>
									  <td>충 북</td>
									  <td>2,104</td>
									  <td>15,519</td>
									  <td>33,368</td>
									  <td>77,017</td>
									  <td>51,831</td>
									  <td>53,591</td>
									  <td>21,931</td>
									  <td>3,500</td>
									  <td>258,861</td>
									</tr>
									<tr>
									  <td>충 남</td>
									  <td>907</td>
									  <td>21,857</td>
									  <td>31,463</td>
									  <td>62,675</td>
									  <td>45,464</td>
									  <td>56,389</td>
									  <td>38,340</td>
									  <td>11,475</td>
									  <td>268,570</td>
									</tr>
									<tr>
									  <td>전 북</td>
									  <td>1,045</td>
									  <td>20,575</td>
									  <td>28,050</td>
									  <td>47,132</td>
									  <td>50,351</td>
									  <td>76,809</td>
									  <td>51,384</td>
									  <td>11,270</td>
									  <td>286,616</td>
									</tr>
									<tr>
									  <td>전 남</td>
									  <td>1,093</td>
									  <td>24,975</td>
									  <td>40,662</td>
									  <td>63,928</td>
									  <td>56,183</td>
									  <td>55,050</td>
									  <td>36,157</td>
									  <td>6,990</td>
									  <td>285,038</td>
									</tr>
									<tr>
									  <td>경 북</td>
									  <td>2,945</td>
									  <td>41,634</td>
									  <td>66,793</td>
									  <td>138,560</td>
									  <td>107,677</td>
									  <td>108,761</td>
									  <td>54,452</td>
									  <td>15,725</td>
									  <td>536,547</td>
									</tr>
									<tr>
									  <td>경 남</td>
									  <td>3,673</td>
									  <td>28,395</td>
									  <td>40,859</td>
									  <td>73,404</td>
									  <td>58,358</td>
									  <td>78,596</td>
									  <td>42,302</td>
									  <td>11,460</td>
									  <td>337,047</td>
									</tr>
									<tr>
									  <td>제 주</td>
									  <td>25</td>
									  <td>1,869</td>
									  <td>6,687</td>
									  <td>17,662</td>
									  <td>28,015</td>
									  <td>22,185</td>
									  <td>4,360</td>
									  <td>0</td>
									  <td>80,803</td>
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
