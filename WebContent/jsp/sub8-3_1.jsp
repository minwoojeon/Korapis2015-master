<%@page import="kr.or.korapis.util.ItextPdfUtil"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.or.korapis.member.CertiDao"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.util.DateFormatter"%>
<%@page import="kr.or.korapis.member.PayDao"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
<%@page import="kr.or.korapis.member.MemberDao"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

//더블파싱메소드사용
ItextPdfUtil dp_method = new ItextPdfUtil();

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");
response.sendRedirect("/");

SelectBoxDao boxDao = new SelectBoxDao();
CertiDao dao = new CertiDao();
String uid = TextFormatter.convNvl(request.getParameter("uid"), "");
ResultSetEntity d = dao.getDetail(uid);
DecimalFormat format = new DecimalFormat("###.###");

String qury_uid   = "";
String qury_regnum      = "";
String qury_bongin     = "";
String qury_mmbr_idnt   = "";
String qury_name         = "";
String qury_recv_date      = "";
String qury_test_endd_date  = "";
String qury_home_addr      = "";
String qury_offc_addr       = "";
String qury_mailreceive     = "";
String qury_rqst_prdt_name  = "";
String qury_sung_valu       = "";
String qury_wter            = "";
String qury_hwoi            = "";
String qury_june_sgar       = "";
String qury_ja_sgar         = "";
String qury_sando           = "";
String qury_gammoryo        = "";
String qury_hmf             = "";
String qury_tarr            = "";
String qury_esung           = "";
String qury_c12             = "";
String qury_abtc            = "";
String qury_fng             = "";
String qury_gita            = "";
String qury_test_rslt       = "";
String qury_rqst_nmbr       = "";

String qury_prname = "";
String qury_CRO = "";
String qury_NITRO = "";
String qury_CERPON	 = "";
String qury_doxine		 = "";
String qury_merazine = "";
String qury_methoxazole = "";
String qury_pyridine = "";
String qury_MECRO = "";
String qury_erythro	 = "";
String qury_spira		 = "";
String qury_tilmico = "";
String qury_tyrosin = "";
String qury_BETARA = "";
String qury_amoxi = "";
String qury_ampi = "";
String qury_penicillin = "";
String qury_NEOMA = "";
String qury_STREPTO = "";
String qury_strep = "";
String qury_dihydro = "";
String qury_OXITE = "";
String qury_TETRASA = "";
String qury_chlor = "";
String qury_demeclo = "";
String qury_tetra = "";
String qury_doxy = "";
String qury_QUENOL1   = "";
String qury_enro = "";
String qury_cipro = "";
String qury_QUENOL2 = "";
String qury_dano = "";
String qury_nor = "";
String qury_oflo = "";
String qury_BROMOP = "";
String qury_SIMIAOZOL = "";
String qury_QUMAPOS = "";
String qury_AMITRAZ = "";
String qury_PLUBA = "";
String qury_PLUME = "";
String qury_GRAYANO = "";
String qury_ISSUENUM = "";
String qury_MOBILE = "";
String qury_GUMCHEPYOSI = "";
String qury_RATING_RESULT = "";
String qury_addr = "";
String datediff = "";
if(d!=null && d.next()){
	qury_uid      = d.getString(0);			// uid
	qury_regnum         = d.getString(1);		// 처리번호
	qury_bongin         = d.getString(2);	// 봉인번호
	qury_mmbr_idnt      = d.getString(3);	// ID
	qury_name           = d.getString(4);		// 성명
	qury_recv_date      = d.getString(5);		// 접수일자
	qury_test_endd_date = d.getString(6);	//(완료일자
	qury_home_addr      = d.getString(7);  // 집주소
	qury_offc_addr      = d.getString(8);		// 사무실주소
	qury_mailreceive    = d.getString(9);	// 사무실 집 구분
	qury_rqst_prdt_name = d.getString(10); // 시험항목
	qury_sung_valu      = d.getString(11, "-");	// 성상
	qury_wter           = d.getString(12, "-");		// 수분
	qury_hwoi           = d.getString(13, "-");		// 회분
	qury_june_sgar      = d.getString(14, "-");	// 전화당
	qury_ja_sgar        = d.getString(15, "-");		 // 자당
	qury_sando          = d.getString(16, "-");		// 산도
	qury_gammoryo       = d.getString(17, "-");	 // 사카린나트륨
	qury_hmf            = d.getString(18, "-");		// HMF
	qury_tarr           = d.getString(19, "-");			// 타르
	qury_esung          = d.getString(20, "-");		// 이성화당
	qury_c12            = d.getString(21, "-");		// 탄소동위원소
	qury_abtc           = d.getString(22, "-");		// 항생제
	qury_fng            = d.getString(23, "-");			// F & G
	qury_gita           = d.getString(24, "-");			// 기타
	qury_test_rslt      = d.getString(25, "-");		// 판정
	qury_rqst_nmbr      = d.getString(26);	// 접수번호
	
	qury_prname			= d.getString(27);	// 검체표시     090501추가
	qury_CRO				= d.getString(28);	// 클로람페니콜
	qury_NITRO			= d.getString(29);	// 니트로퓨란
	qury_CERPON		= d.getString(30);	// 설폰아마이드
	qury_doxine			= d.getString(31);	// doxine
	qury_merazine	    = d.getString(32);	// merazine
	qury_methoxazole  = d.getString(33);	// methoxazole
	qury_pyridine			= d.getString(34);	// pyridine
	qury_MECRO			= d.getString(35);	// 매크로라이드
	qury_erythro			= d.getString(36);	// erythro
	qury_spira				= d.getString(37);	// spira
	qury_tilmico			= d.getString(38);	// tilmico
	qury_tyrosin			= d.getString(39);	// tyrosin
	qury_BETARA			= d.getString(40);	// 베타락탐
	qury_amoxi				= d.getString(41);	// amoxi
	qury_ampi				= d.getString(42);	// ampi
	qury_penicillin		= d.getString(43);	// penicillin
	qury_NEOMA			= d.getString(44);	// 네오마이신
	qury_STREPTO      = d.getString(45);	// 스트렙토마이신
	qury_strep				= d.getString(46);	// strep
	qury_dihydro			= d.getString(47);	// dihydro
	qury_OXITE				= d.getString(48);	// 옥시테트라
	qury_TETRASA		= d.getString(49);	// 테트라사이클린
	qury_chlor				= d.getString(50);	// chlor
	qury_demeclo		= d.getString(51);	// demeclo
	qury_tetra				= d.getString(52);	// tetra
	qury_doxy				= d.getString(53);	// doxy
	qury_QUENOL1      = d.getString(54);	// 퀴놀론1
	qury_enro				= d.getString(55);	// enro
	qury_cipro				= d.getString(56);	// cipro
	qury_QUENOL2      = d.getString(57);	// 퀴놀론2
	qury_dano				= d.getString(58);	// dano
	qury_nor					= d.getString(59);	// nor
	qury_oflo				= d.getString(60);	// oflo
	qury_BROMOP		= d.getString(61);	// 브로모프로필레이트
	qury_SIMIAOZOL	= d.getString(62);	// 시미아졸
	qury_QUMAPOS		= d.getString(63);	// 쿠마포스
	qury_AMITRAZ		= d.getString(64);	// 아미트라즈
	qury_PLUBA			= d.getString(65);	// 플루바리네이트
	qury_PLUME			= d.getString(66);	// 플루메쓰린
	qury_GRAYANO      = d.getString(67);	// 그레이아노톡신

	qury_MOBILE      = d.getString(68);	// 연락처
	qury_ISSUENUM      = d.getString(69);	// 발급번호
	qury_GUMCHEPYOSI = d.getString(70);
	qury_RATING_RESULT = d.getString(71); //등급판정
	if ( "O".equals(qury_mailreceive)){
		qury_addr = qury_offc_addr;
	}else{
		qury_addr = qury_home_addr;
	}

	
	datediff = d.getString("diffdate");
}


int 성상 = 0;
int 수분 = 0;
int 자당 = 0;
int 전화당 = 0;
int 당비율 = 0;
int HMF = 0;
int 산도 = 0;
int 물불용물 = 0;
int 타르색소 = 0;
int 사카린나트륨 = 0;
int 이성화당 = 0;
int 탄소동위원소비 = 0;
int 클로람페니콜 = 0;
int 스트렙토마이신 = 0;
int 시미아졸 = 0;
int 니트로푸란 = 0;
int 옥시테트라싸이클린 = 0;
int 코마포스 = 0;
int 설폰아마이드 = 0;
int 테트라싸이클린 = 0;
int 아미트라즈 = 0;
int 매크로라이드 = 0;
int 퀴놀론1 = 0;
int 플루발리네이트 = 0;
int 베타락탐 = 0;
int 퀴놀론2 = 0;
int 플루메쓰린 = 0;
int 네오마이신 = 0;
int 브로모프로필레이트 = 0;
int 그레이아노톡신 = 0;

String OverallResult = ""; //종합판정
String ExcessItems = ""; //기준초과항목

//널처리를 위에서 이미처리하였기에............
성상 = "적합".equals("-".equals(qury_sung_valu) ? "적합" : qury_sung_valu) ? 0 : 1;	
if(qury_rqst_prdt_name.contains("벌집꿀")){
	수분 = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_wter) ? "0" : qury_wter, "0")) > 23 ? 1 : 0;
}else{
	수분 = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_wter) ? "0" : qury_wter, "0")) > 20 ? 1 : 0;
}

if(qury_rqst_prdt_name.contains("벌집꿀")){
	자당 = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_ja_sgar) ? "0" : qury_ja_sgar, "0")) > 15 ? 1 : 0;
}else{
	자당 = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_ja_sgar) ? "0" : qury_ja_sgar, "0")) > 7 ? 1 : 0;
}

if(qury_rqst_prdt_name.contains("벌집꿀")){
	전화당 = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_june_sgar) ? "0" : qury_june_sgar, "0")) < 50 ? 1 : 0;
}else{
	전화당 = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_june_sgar) ? "0" : qury_june_sgar, "0")) < 60 ? 1 : 0;
}
당비율 = 0;
HMF = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_hmf) ? "0" : qury_hmf, "0")) > 80 ? 1 : 0;
산도 = "적합".equals("-".equals(qury_sando) ? "0" : qury_sando) ? 0 : 1;
물불용물 = "적합".equals("-".equals(qury_hwoi) ? "0" : qury_hwoi) ? 0 : 1;
타르색소 = "불검출".equals("-".equals(qury_tarr) ? "0" : qury_tarr) ? 0 : 1;
사카린나트륨 = "불검출".equals("-".equals(qury_gammoryo) ? "0" : qury_gammoryo) ? 0 : 1;
이성화당 = "음성".equals("-".equals(qury_esung) ? "0" : qury_esung) ? 0 : 1;
탄소동위원소비 = 0;
클로람페니콜 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_CRO, "0")) > 0 ? 1 : 0;
스트렙토마이신 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_STREPTO, "0")) > 100 ? 1 : 0;
시미아졸 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_SIMIAOZOL, "0")) > 1000 ? 1 : 0;
니트로푸란 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_NITRO, "0")) > 0 ? 1 : 0;
옥시테트라싸이클린 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_OXITE, "0")) > 30 ? 1 : 0;
코마포스 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_QUMAPOS, "0")) > 10 ? 1 : 0;
설폰아마이드 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_CERPON, "0")) > 30 ? 1 : 0;
테트라싸이클린 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_TETRASA, "0")) > 30 ? 1 : 0;
아미트라즈 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_AMITRAZ, "0")) > 200 ? 1 : 0;
매크로라이드 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_MECRO, "0")) > 30 ? 1 : 0;
퀴놀론1 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_QUENOL1, "0")) > 50 ? 1 : 0;
플루발리네이트 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_PLUBA, "0")) > 50 ? 1 : 0;
베타락탐 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_BETARA, "0")) > 30 ? 1 : 0;
퀴놀론2 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_QUENOL2, "0")) > 30 ? 1 : 0;
플루메쓰린 =  dp_method.parseDouble_method(TextFormatter.convNvl(qury_PLUME, "0")) > 10 ? 1 : 0;
네오마이신 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_NEOMA, "0")) > 100 ? 1 : 0;
브로모프로필레이트 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_BROMOP, "0")) > 50 ? 1 : 0;
그레이아노톡신 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_GRAYANO, "0")) > 0 ? 1 : 0;



		
if( 성상 == 1
	|| 수분 == 1
	|| 자당 == 1
	|| 전화당 == 1
	|| 당비율 == 1
	|| HMF == 1
	|| 산도 == 1
	|| 물불용물 == 1
	|| 타르색소 == 1
	|| 사카린나트륨 == 1
	|| 이성화당 == 1
	//|| 탄소동위원소비 == 1
	|| 클로람페니콜 == 1
	|| 스트렙토마이신 == 1
	|| 시미아졸 == 1
	|| 니트로푸란 == 1
	|| 옥시테트라싸이클린 == 1
	|| 코마포스 == 1
	|| 설폰아마이드 == 1
	|| 테트라싸이클린 == 1
	|| 아미트라즈 == 1
	|| 매크로라이드 == 1
	|| 퀴놀론1 == 1
	|| 플루발리네이트 == 1
	|| 베타락탐 == 1
	|| 퀴놀론2 == 1
	|| 플루메쓰린 == 1
	|| 네오마이신 == 1
	|| 브로모프로필레이트 == 1
	|| 그레이아노톡신 == 1
){
OverallResult = "부적합";
}else{
	OverallResult =	"적합";
}

ExcessItems = (수분 == 1 ? "수분, " : "") + ( 자당 == 1 ? "자당, " : "") + (전화당 == 1 ? "전화당, " : "")
	            + (당비율 == 1 ? "당비율, " : "")
				+ ( HMF == 1 ? "H.M.F(mg/kg), " : "" )
				+ ( 산도 == 1 ? "산도(meq/kg), " : "" )
				+ ( 물불용물 == 1 ? "물불용물(meq/kg), " : "" )
				+ ( 타르색소 == 1 ? "타르색소(meq/kg), " : "" )
				+ ( 사카린나트륨 == 1 ? "사카린나트륨(meq/kg), " : "" )
				+ ( 이성화당 == 1 ? "이성화당(meq/kg), " : "" );

if(클로람페니콜 == 1
|| 스트렙토마이신 == 1
|| 시미아졸 == 1
|| 니트로푸란 == 1
|| 옥시테트라싸이클린 == 1
|| 코마포스 == 1
|| 설폰아마이드 == 1
|| 테트라싸이클린 == 1
|| 아미트라즈 == 1
|| 매크로라이드 == 1
|| 퀴놀론1 == 1
|| 플루발리네이트 == 1
|| 베타락탐 == 1
|| 퀴놀론2 == 1
|| 플루메쓰린 == 1
|| 네오마이신 == 1
|| 브로모프로필레이트 == 1
|| 그레이아노톡신 == 1
){
	ExcessItems += "잔류";
}else{
	ExcessItems += "";
}
//마지막콤마 제거
if(ExcessItems.lastIndexOf(",") != -1){
	ExcessItems = ExcessItems.substring(0,ExcessItems.lastIndexOf(","));
}else{
}

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
<link rel="stylesheet" href="/css/style.css" >
<link href="/css/sub.css"  rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.8.3.min.js" ></script>
<script type="text/javascript">

$(function(){
	<%
	if(qury_rqst_prdt_name.contains("한벌꿀")
    		|| "봉인".equals(qury_rqst_prdt_name)
    		|| "벌집꿀(봉인)".equals(qury_rqst_prdt_name)
    		){
	%>
		$("#OverallResult").show();
	<%}%>
});

</script>
</head>
<body>
<form name="frmDetail" method="post">
<input type="hidden" name="uid" value=""/>
</form>

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
                    <h2 class="page_title">시험성적서</h2>
                    <div class="location">홈  &gt; <span>마이페이지</span></div>
                    <h2>시험성적서</h2>
                </div>
                <div class="sub_body_box " >








<h2 id="container_title"><span class="sound_only">시험성적서</span><span class="sound_only"> 상세정보</span></h2>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">


    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div class="bo_fx" style="padding:0px 5px">
        <div style="float:right">
        </div>	
    </div>



    <div class="tbl_head01 tbl_wrap" style="font-size:12px">
        
        <p style="margin:0 0 20px 0; font-size:24px; text-align:center; font-weight:bold; color:#000000;">시 험 성 적 통 지 서</p>
        <table width="725" border="0" cellpadding="0" cellspacing="0" class="table">
        <table width="725" class="form">
			          <tr>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>발급번호</strong></td>
			            <td width="200" align="center"><%=qury_ISSUENUM %></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>접수번호</strong></td>
			            <td width="200" align="center">&nbsp;<%=qury_regnum %></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>접 수 일</strong></td>
			            <td width="200" align="center"><%=qury_recv_date %></td>
			          </tr>
			          <tr>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>시험항목</strong></td>
			            <td align="center"><%=qury_rqst_prdt_name %></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>봉인번호</strong></td>
			            <td width="100" align="center"><%=qury_bongin %></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>완 료 일</strong></td>
			            <td align="center"><%=qury_test_endd_date%></td>
			          </tr>
			          <tr>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>의 뢰 자</strong></td>
			            <td align="center"><%=qury_name %></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>검체표시</strong></td>
			            <td width="100" align="center"><%=qury_GUMCHEPYOSI%></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>연 락 처</strong></td>
			            <td align="center"><%=qury_MOBILE %></td>
			          </tr>
			          
			          <tr>
			          	<td align="center" bgcolor="f4f4f4"><strong>주소</strong></td>
			            <td colspan="5" align="center"><%=qury_addr %></td>
			          </tr>
			        </table>
			        
			        
			        <p style="margin:20px 0; font-size:24px; text-align:center; font-weight:bold; color:#000000;">시 험 결 과</p>
			        <table width="725" class="form" style="text-align: center;">
			        
			        	<colgroup>
			        		<col width="50px;">
			        		<col width="250px;">
			        		<col width="150px;">
			        		<col width="150px;">
			        		<col width="50px;">
			        		<col width="250px;">
			        		<col width="150px;">
			        		<col width="150px;">
			        	</colgroup>
			        
			        	<tr>
			        		<th bgcolor="f4f4f4">NO.</th>
			        		<th bgcolor="f4f4f4">항  목</th>
			        		<th bgcolor="f4f4f4">기 준</th>
			        		<th bgcolor="f4f4f4">결 과</th>
			        		<th bgcolor="f4f4f4">NO.</th>
			        		<th bgcolor="f4f4f4">항  목</th>
			        		<th bgcolor="f4f4f4">기 준</th>
			        		<th bgcolor="f4f4f4">결 과</th>
			        	</tr>
			        	
			        	<tr>
			        		<td>1</td>
			        		<td style="text-align:left;"> 성상</td>
			        		<td>적합</td>
			        		<td><%=qury_sung_valu%></td>
			        		<td>16</td>
			        		<td style="text-align:left;">니트로푸란</td>
			        		<td>불검출</td>
			        		<td>
			        		<%if("".equals(qury_NITRO)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_NITRO) > 0){
			            				니트로푸란 = Double.parseDouble(qury_NITRO) > 0 ? 1 : 0;
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_NITRO)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_NITRO)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>2</td>
			        		<td style="text-align:left;"> 수분(%)</td>
			        		<%
			        		if(qury_rqst_prdt_name.contains("벌집꿀")){
			        		%>
			        			<td>23.0 이하</td>
			        		<%}else{ %>
			        			<td>20.0 이하</td>
			        		<%} %>
			        		
			        		<td><%=qury_wter %></td>
			        		<td>17</td>
			        		<td style="text-align:left;"> 옥시테트라싸이클린</td>
			        		<td>0.30ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_OXITE)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_OXITE) > 300){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_OXITE)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_OXITE)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>3</td>
			        		<td style="text-align:left;"> 자당(%)</td>
			        		
			        		<%
			        		if(qury_rqst_prdt_name.contains("벌집꿀")){
			        		%>
			        			<td>15.0 이하</td>
			        		<%}else{ %>
			        			<td>7.0 이하</td>
			        		<%} %>
			        		
			        		<td><%=qury_ja_sgar %></td>
			        		<td>18</td>
			        		<td style="text-align:left;"> 코마포스</td>
			        		<td>0.10ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_QUMAPOS)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_QUMAPOS) > 100){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_QUMAPOS)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_QUMAPOS)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>4</td>
			        		<td style="text-align:left;"> 전화당(%)</td>
			        		
			        		<%
			        		if(qury_rqst_prdt_name.contains("벌집꿀")){
			        		%>
			        			<td>50.0 이상</td>
			        		<%}else{ %>
			        			<td>60.0 이상</td>
			        		<%} %>
			        		
			        		<td><%=qury_june_sgar %></td>
			        		<td>19</td>
			        		<td style="text-align:left;"> 설폰아마이드</td>
			        		<td>0.03ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_CERPON)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_CERPON) > 30){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_CERPON)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_CERPON)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>5</td>
			        		<td style="text-align:left;"> 당비율(F/G)</td>
			        		<td>-</td>
			        		<td><%=qury_fng %></td>
			        		<td>20</td>
			        		<td style="text-align:left;"> 테트라싸이클린</td>
			        		<td>0.03ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_TETRASA)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_TETRASA) > 30){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_TETRASA)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_TETRASA)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>6</td>
			        		<td style="text-align:left;"> H.M.F(mg/kg)</td>
			        		<td>80.0 이하</td>
			        		<td><%=qury_hmf %></td>
			        		<td>21</td>
			        		<td style="text-align:left;"> 아미트라즈</td>
			        		<td>0.20ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_AMITRAZ)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_AMITRAZ) > 200){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_AMITRAZ)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_AMITRAZ)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>7</td>
			        		<td style="text-align:left;"> 산도(meq/kg)</td>
			        		<td>40.0 이하</td>
			        		<td><%=qury_sando %></td>
			        		<td>22</td>
			        		<td style="text-align:left;"> 매크로라이드</td>
			        		<td>0.03ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_MECRO)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_MECRO) > 30){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_MECRO)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_MECRO)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>8</td>
			        		<td style="text-align:left;"> 물불용물(%)</td>
			        		<td>0.5 이하</td>
			        		<td><%=qury_hwoi %></td>
			        		<td>23</td>
			        		<td style="text-align:left;"> 퀴놀론1</td>
			        		<td>0.03ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_QUENOL1)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_QUENOL1) > 30){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_QUENOL1)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_QUENOL1)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>9</td>
			        		<td style="text-align:left;"> 타르색소</td>
			        		<td>불검출</td>
			        		<td><%=qury_tarr %></td>
			        		<td>24</td>
			        		<td style="text-align:left;"> 플루발리네이트</td>
			        		<td>0.05ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_PLUBA)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_PLUBA) > 50){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_PLUBA)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_PLUBA)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>10</td>
			        		<td style="text-align:left;"> 사카린나트륨</td>
			        		<td>불검출</td>
			        		<td><%=qury_gammoryo %></td>
			        		<td>25</td>
			        		<td style="text-align:left;"> 베타락탐</td>
			        		<td>0.03ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_BETARA)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_BETARA) > 30){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_BETARA)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_BETARA)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>11</td>
			        		<td style="text-align:left;"> 이성화당</td>
			        		<td>음성</td>
			        		<td><%=qury_esung %></td>
			        		<td>26</td>
			        		<td style="text-align:left;"> 퀴놀론2</td>
			        		<td>0.03ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_QUENOL2)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_QUENOL2) > 30){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_QUENOL2)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_QUENOL2)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>12</td>
			        		<td style="text-align:left;"> 탄소동위원소비(‰)</td>
			        		<td>-22.5‰이하 벌꿀 / -22.5‰초과 사양꿀</td>
			        		<td><%=qury_c12 %></td>
			        		<td>27</td>
			        		<td style="text-align:left;"> 플루메쓰린</td>
			        		<td>0.01ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_PLUME)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_PLUME) > 10){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_PLUME)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_PLUME)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>13</td>
			        		<td style="text-align:left;"> 클로람페니콜</td>
			        		<td>불검출</td>
			        		<td>
			        		<%if("".equals(qury_CRO)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_CRO) > 0){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_CRO)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_CRO)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        		<td>28</td>
			        		<td style="text-align:left;"> 네오마이신</td>
			        		<td>0.10ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_NEOMA)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_NEOMA) > 100){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_NEOMA)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_NEOMA)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>14</td>
			        		<td style="text-align:left;"> 스트렙토마이신</td>
			        		<td>0.10ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_STREPTO)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_STREPTO) > 100){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_STREPTO)/1000) %> --%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_STREPTO)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        		<td>29</td>
			        		<td style="text-align:left;"> 브로모프로필레이트</td>
			        		<td>0.03ppm이하</td>
			        		<td>
			        		<%if("".equals(qury_BROMOP)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_BROMOP) > 50){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_BROMOP)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_BROMOP)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
							</td>
			        	</tr>
			        	
			        	<tr>
			        		<td>15</td>
			        		<td style="text-align:left;"> 시미아졸</td>
			        		<td>1.00ppm이하</td>
			        		<td>
							<%if("".equals(qury_SIMIAOZOL)){ %>
							-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_SIMIAOZOL) > 50){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_SIMIAOZOL)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_SIMIAOZOL)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
							</td>
			        		<td>30</td>
			        		<td style="text-align:left;"> 그레이아노톡신 III</td>
			        		<td>불검출</td>
			        		<td>
			        		<%if("".equals(qury_GRAYANO)){ %>
			        		-
			            	<%}else{
			            		try{
			            			if(Double.parseDouble(qury_GRAYANO) > 0){
							%>
									검출<%--<br/><%=format.format(Double.parseDouble(qury_GRAYANO)/1000) %>--%>
									<%}else{%>
									불검출<%--<br/><%=format.format(Double.parseDouble(qury_GRAYANO)/1000) %>--%>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			        		</td>
			        	</tr>
			        	<tr style="display: none;" id="OverallResult">
			        		<td colspan="2">종합 결과</td>
			        		<td colspan="2"><%=OverallResult %></td>
			        		<td colspan="2" bgcolor="f4f4f4">등급 판정</td>
			        		<td colspan="2">
			        		<%if("1+".equals(qury_RATING_RESULT)){ %>
			        			<%=qury_RATING_RESULT %>
			        		<%}else if("1".equals(qury_RATING_RESULT)){ %>
			        			<%=qury_RATING_RESULT %>
			        		<%}else if("2".equals(qury_RATING_RESULT)){ %>
			        			<%=qury_RATING_RESULT %>
			        		<%} %>
			        		
			        		</td>
			        	</tr>
			        	<tr>
			        		<td colspan="2" bgcolor="f4f4f4">기준 초과 항목</td>
			        		<td colspan="6" bgcolor="f4f4f4"><%=TextFormatter.convNvl(ExcessItems, "-") %></td>
			        	</tr>
			        </table>
			        <p style="margin:20px 0; font-size:18px; text-align:center; font-weight:bold; color:#000000;">상기와 같이 시험결과를 통지합니다.</p>
			      	<p style="margin:20px 0; font-size:12px; text-align:center; font-weight:bold; color:#000000;">
			      	<%	
			      	//완료일 형식이 2015-01-01이 아닌경우
		            if("".equals(qury_test_endd_date)
		            		|| qury_test_endd_date.length() != 10
		            		){
		            %>	
		            	0000 년 00 월 00 일
		            <%}else{ %>
		            	<%=qury_test_endd_date.substring(0,4) %>년 <%=qury_test_endd_date.substring(5,7) %>월 <%=qury_test_endd_date.substring(8,10) %>일
		            <%} %>
					</p>
      <table width="720" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="285" align="right" style="font-size:11px; font-weight:bold; color:#000000;">사단<br />
            법인</td>
          <td style="font-size:24px; font-weight:bold; color:#000000;">&nbsp;한 국 양 봉 협 회</td>
        </tr>
      </table>      
    
    	</td>
  </tr>
</table>

    </div>

	<div class="btn_confirm">
        <a href="/jsp/sub8-3.jsp" class="btn_cancel">목록보기</a>
    </div>





               
</div>

<!-- 페이지 -->

				</div>
				
				
			</div>
<!-- } 회원가입 약관 동의 끝 -->
            <!--// sub_con END -->
            
			<jsp:include page="inc/partner.jsp" />
			
        </div>
        <!--// sub_contents END -->
	</div>
    <!--// sub_wrap END -->
</div>
<!--// sub_wrap_main END -->

<jsp:include page="inc/footer.jsp" />


</body>
</html>
