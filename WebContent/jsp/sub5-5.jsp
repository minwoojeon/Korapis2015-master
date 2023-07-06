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

<!--  추가1 시작 : 수정 후 주석 삭제할것 -->
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.admin.QRCode.AdminSelfQRCodeDao"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>    
<%
String qrCode = "";
MiceParam param = MiceParam.parseRequest(request);
AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
String qrcd = param.getString("qrcd");
ResultSetEntity dataList = (ResultSetEntity)dao.getQRCodeList(param,0);
ResultSetEntity dataListDetail = (ResultSetEntity)dao.getQRCodeDetail_cert(param,qrcd);

String prod_qrcd = "";
String prod_owner =    "";
String prod_province = "";
String subdiv_date =     "";
String sale_shop =     "";
String prod_orign = "";
String prod_orign_etc = "";
String org_inspecter = "";
String prod_area = "";
String quality_mgr = "";
String rating = "";
int pub_sts = 0 ;

String prod_category = "";



while(dataList.next()&&dataList!=null){
	
	 pub_sts = dataList.getInt("pub_sts");
	 
	 if(pub_sts==2){
		 prod_qrcd = dataList.getString("prod_qrcd");
		 prod_owner = dataList.getString("prod_owner");
		 prod_province = dataList.getString("prod_province");
		 subdiv_date = dataList.getString("subdiv_date");
		 sale_shop = dataList.getString("sale_shop");
		 prod_orign = dataList.getString("prod_orign");
		 prod_orign_etc = dataList.getString("prod_orign1");
		 org_inspecter = dataList.getString("org_inspecter");
		 rating = dataList.getString("rating");
		 prod_area = dataList.getString("prod_area");
		 quality_mgr = dataList.getString("quality_mgr");
		 
		 prod_category = dataList.getString("prod_category");
	 }
};

if(!"".equals(prod_orign_etc)){
	prod_orign_etc = "("+prod_orign_etc+")";
}else{
	prod_orign_etc = "";
}
%>

	<style>

		@charset "utf-8";
		@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
		div, li, span, a, th, td ,body, h1, h2, h3, h4, h5, h6 {font-family:'NanumSquare', sans-serif;}
		html {font-size:15px}
		body {min-width:320px; height:100%; font-size:100%;}
		* * , * {font-family: 'NanumSquare', sans-serif; margin:0; padding:0; box-sizing:border-box}

		/* 버튼 클래스 추가 */
		button.btn {position:absolute; border:none; background:none}
		.btn_plus {top:0; right:0;}
		.btn_plus img {width:2rem}
		.btn_close {top:1rem; right:1rem; transform:rotate(45deg); }
		.btn_close img {width:2.66rem}

		.level_page_title {height:6.2rem; line-height:6.2rem; color:#fff; background:#064867; text-align:center; font-size: 2.4rem; font-weight:900}
		.level_wrap {background:#f3f3f3; font-size:2rem;}

		.section01 {
			position:relative;
			height:37rem;
			margin-bottom: 6rem;
			background-image:url('korapis_level_bgpt.png');
			background-color:#052129;
			background-position:center; text-align:center;}

		.section01 h2 {position:absolute; top:6.667rem; left:0; width:100%; font-size:2.66rem; font-weight:bold; color:#ffd97f}
		.level_num {position:absolute; top:3rem; left:0; width:100%; height:20rem; line-height:25rem; font-size:10.3rem; font-weight:700; color:#fff; background:url('korapis_level.png'); background-repeat:no-repeat; background-position:center; background-size:contain; }
		.level_txt {position:absolute; top:26rem; left:0; width:100%; padding:0 1.74rem; font-size:1.8rem; color:#ffd97f; line-height:1.4}
		.level_barco {position:absolute; bottom:-4rem; left:1.74rem; right:1.74rem; height:7.6rem; line-height:7.6rem; font-size:2.5rem; background:#fff; border:2px solid #dadada; border-radius:0.6rem; font-weight:bold; text-align:left;}
		.level_barco b {float: left; width:14.33rem; color:#898989; text-align:center;}

		.section02 {padding:1.74rem; padding-top:0}
		.level_sec_title {height:4.33rem; line-height:4.33rem; padding-left:2.33rem; background:#075f88; color:#fff; font-size:2rem}
		.level_sec_title.c_red {background:#8c3b3b;}
		.level_sec_wrap {padding:2.33rem; background:#fff;}
		.prod_f_table {width:100%; font-size:2rem;}
		.prod_f_table th {width:12rem; padding-bottom:1.66rem; text-align:left; color:#6e6e6e;}
		.prod_f_table td {position:relative; padding-right:2rem; padding-bottom:1.66rem; color:#0c0c0c; font-weight:bold}

		.box_gray {overflow:hidden; padding:1.33rem 4rem; text-align:center; background:#f2f2f2; color:#1b1b1b; border-radius:0.6rem; text-overflow: ellipsis; white-space:nowrap; font-weight:bold; margin-bottom:1.66rem;}
		.box_gray span {color:#797979; margin-right:0.8rem}

		.box_gray02 {padding:1.33rem; background:#f2f2f2; color:#1b1b1b; border-radius:0.6rem; font-size:2.1rem; font-weight:bold}

		.section03 {text-align:center; padding:3.334rem 1rem 1rem 1rem}
		.section03 img {max-width:80%}


		/* 팝업 */
		.popupArea {position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.85); text-align:center}
		.popupArea:before {content:''; display:inline-block; width:1px; height:100%; margin-left:-1px; vertical-align:middle;}
		.popupArea > div {position:relative; display:inline-block; vertical-align:middle;}
		/* 유효하지않은 필증팝업 */
		.errorPop01 {display:none}
		.errorPop01 img {max-width:10rem}
		.errorPop01 p {margin-top:3rem; color:#ffffff; font-size:3rem;}
		/* 데이터팝업 */
		.dataPop01 > div {background:#efefef; width:90%; max-width:480px; padding:5rem 2rem 3rem 2rem; border:5px solid #064867}
		.dataPop01 .prod_f_table th {width:8rem}
		.dataPop01 .prod_f_table {font-size:1.5rem}

		@media screen and (max-width: 600px) {
			html {font-size:12px}
		}

		@media screen and (max-width: 500px) {
			html {font-size:10px}
			.level_barco {height:6rem; line-height:6rem;}
		}
		@media screen and (max-width: 400px) {
			html {font-size:8px}
			.section01 {height:34.5rem}
			.level_barco b {width:12rem}
			.prod_f_table th {width:8rem}
		}

	</style>

<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">

$(function(){
	$(".dataPop01").hide();
	<%if(pub_sts!=2){%>
		$("#error_popup").show();
	<%}else{%>
		$("#error_popup").hide();
	<%}%>
})

</script>
<!--  추가1 끝 : 수정 후 주석 삭제할것 -->

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
                    <h2 class="page_title">한 벌꿀 생산이력 검색</h2>
                    <div class="location">홈 &gt; 양봉산물연구소 &gt; <span>한 벌꿀 생산이력 검색</span></div>
                </div>
                
                <div class="sub_body_box">

<!--  추가2 시작 : 수정 후 주석 삭제할것 -->
	<div class="level_wrap">

		<div class="section01">
			<div>
				<h2>품질등급</h2>
				<p class="level_num"><%=rating %></p>
				<p class="level_barco"><b>필증번호</b><span><%=prod_qrcd %></span></p>
			</div>
			<p class="level_txt">
				본 제품은 (사)한국양봉협회 양봉산물 검사소에서 검사후 관리 되고 있는 제품입니다.
			</p>
		</div>

		<div class="section02">
			<div class="level_sec_wrap">
				<table class="prod_f_table">
					<tr>
					<%if("1".equals(rating)){ %>
						<th colspan="2" style="text-align: center;">
							<strong>탄소동위원소 -22.5‰ 이하</strong>
						</<th>
					<%}else if("1+".equals(rating)){ %>
						<th colspan="2" style="text-align: center;">
							<strong>탄소동위원소 -23.5‰ 이하</strong>
						</th>
					<%}%>
					</tr>
					<tr>
						<th>밀원</th>
						<td><%=prod_orign+prod_orign_etc %></td>
					</tr>
					<%
					//dataListDetail.initCursor();
					int idx = 0;
					String prodTitle ="";
					StringBuffer prod_province_total = new StringBuffer();
					
					if(pub_sts==2){
						while(dataListDetail.next()&&dataListDetail!=null){ 
							
							String prod_name = dataListDetail.getString("prod_name");
							String prod_no = dataListDetail.getString("prod_no");
							String prod_orign1 = dataListDetail.getString("prod_orign");
							String prod_province1 = dataListDetail.getString("prod_province");
							String prod_date = dataListDetail.getString("prod_date");
							String prod_rating = dataListDetail.getString("prod_rating");
							
							if(idx<dataListDetail.size()-1){
								prod_province_total.append(dataListDetail.getString("prod_province")+",");
							}else{
								prod_province_total.append(dataListDetail.getString("prod_province"));
							}
							
							if(idx==0){
								prodTitle = "생산자";
							}else{
								prodTitle = "";
							}
						%>
						<tr>
							<th><%=prodTitle %></th>
							<td>
								<%=prod_name %><span>  (<%=dataListDetail.getString("prod_no") %>)</span>
								<button class="btn btn_plus" onclick="fnpop('.dataPop01','<%=prod_name%>','<%=prod_no%>','<%=prod_orign1%>','<%=prod_province1%>','<%=prod_date%>','<%=prod_rating%>')">
								<img src="korapis_level_icon_plus.png" alt=""></button>
							</td>		
						</tr>
						<%
						idx++;
						}
					}else{
					%>
						<tr>
							<th>생산자</th>
						</tr>
					<%} %>	
					<%if("_LA_SA_".contains("_"+prod_category+"_")){%>
						<tr>
							<th>생산지역</th>
							<td><%=prod_area %></td>
						</tr>
					<%} %>
					<tr>
						<th>품질유지기한</th>
						<td><%=subdiv_date %></td>
					</tr>
					<tr>
						<th>검사기관</th>
						<td><%=org_inspecter %></td>
					</tr>
					<tr>
						<th><%="_LA_SA_".contains("_"+prod_category+"_") ? "판매자명" : "판매원<br>(소분원)"%></th>
						<td><%=sale_shop %></td>
					</tr>
					<tr>
						<th>품질관리자</th>
						<td><%=quality_mgr %></td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<!-- 데이터팝업 -->
	<div class="dataPop01 popupArea">
		<div>
			<button class="btn btn_close" onclick="fnpop_close();"><img src="korapis_level_icon_plus.png" alt=""></button>
			<table class="prod_f_table">
				<tr>
					<th>생산자명</th>
					<td>
						<span id="prod_name_popup"></span>
					</td>
				</tr>
				<tr>
					<th>봉인번호</th>
					<td>
						<span id="prod_no_popup"></span>
					</td>
				</tr>
				<tr>
					<th>밀원명</th>
					<td>
						<span id="prod_orign_popup"></span>
					</td>
				</tr>
				<tr>
					<th>채밀지역</th>
					<td>
						<span id="prod_province_popup"></span>
					</td>
				</tr>
				<tr>
					<th>채밀날자</th>
					<td>
						<span id="prod_date_popup"></span>
					</td>
				</tr>
				<tr>
					<th>등급판정</th>
					<td>
						<span id="prod_rating_popup"></span>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<script type="text/javascript">
		function fnpop(el,prod_name,prod_no,prod_orign,prod_province,prod_date,prod_rating){
			$(el).show();
			$("#prod_name_popup").text(prod_name);
			$("#prod_no_popup").text(prod_no);
			$("#prod_orign_popup").text(prod_orign);
			$("#prod_province_popup").text(prod_province);
			$("#prod_date_popup").text(prod_date);
			$("#prod_rating_popup").text(prod_rating);
			
		}

		function fnpop_close(){
			$(".dataPop01").hide();
		}

	</script>

	<!-- 유효하지않은 필증 팝업 -->
	<div class="errorPop01 popupArea" id="error_popup">
		<div>
			<img src="korapis_level_error01.png" alt="">
			<p>유효하지 않은 필증입니다.</p>
		</div>
	</div>

<!--  추가2 끝 : 수정 후 주석 삭제할것 -->


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
