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
						<div class="location">홈 &gt; 양봉산업 정보 &gt; <span>꿀벌/사육수 통계조사</span></div>
					</div>

					<div class="sub_body_box">
						<ul class="tab_list grid_3 ver_pc">
							<li class="on"><a href="/jsp/sub3-1.jsp" target="_self">사육 가구수</a></li>
							<li><a href="/jsp/sub3-1_01.jsp" target="_self">사육군수</a></li>
							<li><a href="/jsp/sub3-1_02.jsp" target="_self">종별‧사육형태별 가구수 및 군수</a></li>
						</ul>
						<ul class="tab_list grid_2 ver_m">
							<li class="on"><a href="/jsp/sub3-1.jsp" target="_self">사육 가구수</a></li>
							<li><a href="/jsp/sub3-1_01.jsp" target="_self">사육군수</a></li>
							<li><a href="/jsp/sub3-1_02.jsp" target="_self">종별‧사육형태별 가구수 및 군수</a></li>
						</ul>

						<h3 class="title_txt">꿀벌 사육 규모별 가구수</h3>
						<div class="xscrollArea">
							<table class="table_hor" width="100%" border="0" cellpadding="0" cellspacing="0" summary="꿀벌 사육 가구수">
								<caption>꿀벌 사육 가구수</caption>
								<colgroup>
									<col width="12%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="9%">
									<col width="9%">
								</colgroup>
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
									  <td>5,541</td>
									  <td>5,552</td>
									  <td>2,868</td>
									  <td>2,812</td>
									  <td>1,281</td>
									  <td>993</td>
									  <td>321</td>
									  <td>19</td>
									  <td>19,387</td>
									</tr>
									<tr>
									  <td>′12</td>
									  <td>4,971</td>
									  <td>5,830</td>
									  <td>3,368</td>
									  <td>3,157</td>
									  <td>1,655</td>
									  <td>1,130</td>
									  <td>339</td>
									  <td>32</td>
									  <td>20,482</td>
									</tr>
									<tr>
									  <td>′13</td>
									  <td>4,555</td>
									  <td>5,670</td>
									  <td>3,507</td>
									  <td>3,305</td>
									  <td>1,394</td>
									  <td>1,082</td>
									  <td>353</td>
									  <td>37</td>
									  <td>19,903</td>
									</tr>
									<tr>
									  <td>′14</td>
									  <td>4,279</td>
									  <td>6,026</td>
									  <td>3,976</td>
									  <td>3,742</td>
									  <td>1,593</td>
									  <td>1,177</td>
									  <td>376</td>
									  <td>45</td>
									  <td>21,214</td>
									</tr>
									<tr>
									  <td>′15</td>
									  <td>3,914</td>
									  <td>6,415</td>
									  <td>4,029</td>
									  <td>3,788</td>
									  <td>1,599</td>
									  <td>1,154</td>
									  <td>398</td>
									  <td>1,236</td>
									  <td>22,533</td>
									</tr>
									<tr>
									  <td>′16</td>
									  <td>3,844</td>
									  <td>6,830</td>
									  <td>4,395</td>
									  <td>3,962</td>
									  <td>1,787</td>
									  <td>1,333</td>
									  <td>419</td>
									  <td>39</td>
									  <td>22,609</td>
									</tr>
									<tr>
									  <td>′17</td>
									  <td>4,047</td>
									  <td>7,364</td>
									  <td>4,801</td>
									  <td>4,540</td>
									  <td>1,972</td>
									  <td>1,395</td>
									  <td>446</td>
									  <td>64</td>
									  <td>24,629</td>
									</tr>
									<tr>
									  <td>′18</td>
									  <td>4,399</td>
									  <td>7,898</td>
									  <td>5,193</td>
									  <td>4,864</td>
									  <td>2,063</td>
									  <td>1,518</td>
									  <td>497</td>
									  <td>55</td>
									  <td>26,487</td>
									</tr>
									<tr>
									  <td>′19</td>
									  <td>4,360</td>
									  <td>9,261</td>
									  <td>5,749</td>
									  <td>5,215</td>
									  <td>2,249</td>
									  <td>1,617</td>
									  <td>491</td>
									  <td>74</td>
									  <td>29,026</td>
									</tr>
									<tr>
									  <th>‘20. 12</th>
									  <th>3,634</th>
									  <th>8,744</th>
									  <th>5,564</th>
									  <th>5,171</th>
									  <th>2,305</th>
									  <th>1,574</th>
									  <th>486</th>
									  <th>54</th>
									  <th>27,532</th>
									</tr>
									<tr>
									  <td>서 울</td>
									  <td>2</td>
									  <td>15 &nbsp;</td>
									  <td>9</td>
									  <td>9</td>
									  <td>1</td>
									  <td>1</td>
									  <td>1</td>
									  <td>0</td>
									  <td>38</td>
									</tr>
									<tr>
									  <td>부 산</td>
									  <td>11</td>
									  <td>46</td>
									  <td>30</td>
									  <td>19</td>
									  <td>7</td>
									  <td>2</td>
									  <td>0</td>
									  <td>0</td>
									  <td>115</td>
									</tr>
									<tr>
									  <td>대 구</td>
									  <td>9</td>
									  <td>70</td>
									  <td>93</td>
									  <td>90</td>
									  <td>45</td>
									  <td>35</td>
									  <td>9</td>
									  <td>0</td>
									  <td>351</td>
									</tr>
									<tr>
									  <td>인 천</td>
									  <td>7</td>
									  <td>27</td>
									  <td>32</td>
									  <td>23</td>
									  <td>9</td>
									  <td>9</td>
									  <td>3</td>
									  <td>0</td>
									  <td>110</td>
									</tr>
									<tr>
									  <td>광 주</td>
									  <td>13</td>
									  <td>87</td>
									  <td>110</td>
									  <td>93</td>
									  <td>46</td>
									  <td>15</td>
									  <td>7</td>
									  <td>3</td>
									  <td>374</td>
									</tr>
									<tr>
									  <td>대 전</td>
									  <td>20</td>
									  <td>30</td>
									  <td>41</td>
									  <td>52</td>
									  <td>21</td>
									  <td>5</td>
									  <td>0</td>
									  <td>0</td>
									  <td>169</td>
									</tr>
									<tr>
									  <td>울 산</td>
									  <td>65</td>
									  <td>253</td>
									  <td>135</td>
									  <td>85</td>
									  <td>21</td>
									  <td>7</td>
									  <td>2</td>
									  <td>0</td>
									  <td>568</td>
									</tr>
									<tr>
									  <td>세 종</td>
									  <td>5</td>
									  <td>35</td>
									  <td>24</td>
									  <td>24</td>
									  <td>13</td>
									  <td>9</td>
									  <td>1</td>
									  <td>0</td>
									  <td>111</td>
									</tr>
									<tr>
									  <td>경 기</td>
									  <td>228</td>
									  <td>856</td>
									  <td>742</td>
									  <td>632</td>
									  <td>214</td>
									  <td>100</td>
									  <td>21</td>
									  <td>2</td>
									  <td>2,795</td>
									</tr>
									<tr>
									  <td>강 원</td>
									  <td>959</td>
									  <td>1,017</td>
									  <td>428</td>
									  <td>416</td>
									  <td>180</td>
									  <td>103</td>
									  <td>16</td>
									  <td>0</td>
									  <td>3,119</td>
									</tr>
									<tr>
									  <td>충 북</td>
									  <td>468</td>
									  <td>705</td>
									  <td>512</td>
									  <td>606</td>
									  <td>227</td>
									  <td>148</td>
									  <td>36</td>
									  <td>3</td>
									  <td>2,705</td>
									</tr>
									<tr>
									  <td>충 남</td>
									  <td>241</td>
									  <td>829</td>
									  <td>494</td>
									  <td>495</td>
									  <td>201</td>
									  <td>162</td>
									  <td>67</td>
									  <td>12</td>
									  <td>2,501</td>
									</tr>
									<tr>
									  <td>전 북</td>
									  <td>204</td>
									  <td>725</td>
									  <td>431</td>
									  <td>363</td>
									  <td>227</td>
									  <td>210</td>
									  <td>87</td>
									  <td>8</td>
									  <td>2,255</td>
									</tr>
									<tr>
									  <td>전 남</td>
									  <td>273</td>
									  <td>1,050</td>
									  <td>740</td>
									  <td>530</td>
									  <td>260</td>
									  <td>163</td>
									  <td>63</td>
									  <td>4</td>
									  <td>3,083</td>
									</tr>
									<tr>
									  <td>경 북</td>
									  <td>619</td>
									  <td>1,750</td>
									  <td>1,019</td>
									  <td>1,034</td>
									  <td>449</td>
									  <td>318</td>
									  <td>97</td>
									  <td>13</td>
									  <td>5,299</td>
									</tr>
									<tr>
									  <td>경 남</td>
									  <td>504</td>
									  <td>1,177</td>
									  <td>617</td>
									  <td>564</td>
									  <td>264</td>
									  <td>216</td>
									  <td>67</td>
									  <td>9</td>
									  <td>3,418</td>
									</tr>
									<tr>
									  <td>제 주</td>
									  <td>6</td>
									  <td>72</td>
									  <td>107</td>
									  <td>136</td>
									  <td>120</td>
									  <td>71</td>
									  <td>9</td>
									  <td>0</td>
									  <td>521</td>
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
