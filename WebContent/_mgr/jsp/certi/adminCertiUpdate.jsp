<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.korapis.admin.certi.AdminCertiDao"%>
<%@page import="kr.or.korapis.util.ItextPdfUtil"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.FunctionDao"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%

//더블파싱메소드사용
ItextPdfUtil dp_method = new ItextPdfUtil();

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
MiceParam param = (MiceParam)request.getAttribute("param");
FunctionDao fDao = new FunctionDao();

ResultSetEntity d = (ResultSetEntity)request.getAttribute("dataList");
DecimalFormat format = new DecimalFormat("###.###");

MemberVo vo = (MemberVo)request.getAttribute("vo");

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
String qury_HPHONE = "";
String qury_GUMCHEPYOSI = "";
String qury_RATING_RESULT = "";

String qury_addr = "";
String datediff = "";

int certiType = AdminCertiDao.CERTI_TYPE_DEFAULT;

if(d!=null && d.next()){
	qury_uid      = TextFormatter.escapeHTML(d.getString("uid"));			// uid
	qury_regnum         = TextFormatter.escapeHTML(d.getString("regnum"));		// 처리번호 ?!?!?접수번호가 처리번호로 리스트에 되어있음..확인필요
	qury_bongin         = TextFormatter.escapeHTML(d.getString("bongin"));	// 봉인번호
	qury_mmbr_idnt      = TextFormatter.escapeHTML(d.getString("mmbr_idnt"));	// ID
	qury_name           = TextFormatter.escapeHTML(d.getString("name"));		// 성명
	qury_recv_date      = TextFormatter.escapeHTML(d.getString("recv_date"));		// 접수일자
	qury_test_endd_date = TextFormatter.escapeHTML(d.getString("test_endd_date"));	//(완료일자
	qury_home_addr      = TextFormatter.escapeHTML(d.getString("home_addr"));  // 집주소
	qury_offc_addr      = TextFormatter.escapeHTML(d.getString("offc_addr"));		// 사무실주소
	qury_mailreceive    = TextFormatter.escapeHTML(d.getString("mailreceive"));	// 사무실 집 구분
	qury_rqst_prdt_name = TextFormatter.escapeHTML(d.getString("rqst_prdt_name")); // 시험항목
	qury_sung_valu      = TextFormatter.escapeHTML(d.getString("sung_valu", "-"));	// 성상
	qury_wter           = TextFormatter.escapeHTML(d.getString("wter", "-"));		// 수분
	qury_hwoi           = TextFormatter.escapeHTML(d.getString("hwoi", "-"));		// 회분
	qury_june_sgar      = TextFormatter.escapeHTML(d.getString("june_sgar", "-"));	// 전화당
	qury_ja_sgar        = TextFormatter.escapeHTML(d.getString("ja_sgar", "-"));		 // 자당
	qury_sando          = TextFormatter.escapeHTML(d.getString("sando", "-"));		// 산도
	qury_gammoryo       = TextFormatter.escapeHTML(d.getString("gammoryo", "-"));	 // 사카린나트륨
	qury_hmf            = TextFormatter.escapeHTML(d.getString("hmf", "-"));		// HMF
	qury_tarr           = TextFormatter.escapeHTML(d.getString("tarr", "-"));			// 타르
	qury_esung          = TextFormatter.escapeHTML(d.getString("esung", "-"));		// 이성화당
	qury_c12            = TextFormatter.escapeHTML(d.getString("c12", "-"));		// 탄소동위원소
	qury_abtc           = TextFormatter.escapeHTML(d.getString("abtc", "-"));		// 항생제
	qury_fng            = TextFormatter.escapeHTML(d.getString("fng", "-"));			// F & G
	qury_gita           = TextFormatter.escapeHTML(d.getString("gita", "-"));			// 기타
	qury_test_rslt      = TextFormatter.escapeHTML(d.getString("test_rslt", "-"));		// 판정
	qury_rqst_nmbr      = TextFormatter.escapeHTML(d.getString("rqst_nmbr"));	// 접수번호
	
	qury_prname			= TextFormatter.escapeHTML(d.getString("검체표시"));	// 검체표시     090501추가
	qury_CRO				= TextFormatter.escapeHTML(d.getString("클로암페니콜"));	// 클로람페니콜
	qury_NITRO			= TextFormatter.escapeHTML(d.getString("니트로퓨란"));	// 니트로퓨란
	qury_CERPON		= TextFormatter.escapeHTML(d.getString("설폰아마이드"));	// 설폰아마이드
	qury_doxine			= TextFormatter.escapeHTML(d.getString("doxine"));	// doxine
	qury_merazine	    = TextFormatter.escapeHTML(d.getString("merazine"));	// merazine
	qury_methoxazole  = TextFormatter.escapeHTML(d.getString("methoxazole"));	// methoxazole
	qury_pyridine			= TextFormatter.escapeHTML(d.getString("pyridine"));	// pyridine
	qury_MECRO			= TextFormatter.escapeHTML(d.getString("매크로라이드"));	// 매크로라이드
	qury_erythro			= TextFormatter.escapeHTML(d.getString("erythro"));	// erythro
	qury_spira				= TextFormatter.escapeHTML(d.getString("spira"));	// spira
	qury_tilmico			= TextFormatter.escapeHTML(d.getString("tilmico"));	// tilmico
	qury_tyrosin			= TextFormatter.escapeHTML(d.getString("tyrosin"));	// tyrosin
	qury_BETARA			= TextFormatter.escapeHTML(d.getString("베타락탐"));	// 베타락탐
	qury_amoxi				= TextFormatter.escapeHTML(d.getString("amoxi"));	// amoxi
	qury_ampi				= TextFormatter.escapeHTML(d.getString("ampi"));	// ampi
	qury_penicillin		= TextFormatter.escapeHTML(d.getString("penicillin"));	// penicillin
	qury_NEOMA			= TextFormatter.escapeHTML(d.getString("네오마이신"));	// 네오마이신
	qury_STREPTO      = TextFormatter.escapeHTML(d.getString("스트렙토마이신"));	// 스트렙토마이신
	qury_strep				= TextFormatter.escapeHTML(d.getString("strep"));	// strep
	qury_dihydro			= TextFormatter.escapeHTML(d.getString("dihydro"));	// dihydro
	qury_OXITE				= TextFormatter.escapeHTML(d.getString("옥시테트라"));	// 옥시테트라
	qury_TETRASA		= TextFormatter.escapeHTML(d.getString("테트라사이클린"));	// 테트라사이클린
	qury_chlor				= TextFormatter.escapeHTML(d.getString("chlor"));	// chlor
	qury_demeclo		= TextFormatter.escapeHTML(d.getString("demeclo"));	// demeclo
	qury_tetra				= TextFormatter.escapeHTML(d.getString("tetra"));	// tetra
	qury_doxy				= TextFormatter.escapeHTML(d.getString("doxy"));	// doxy
	qury_QUENOL1      = TextFormatter.escapeHTML(d.getString("퀴놀론1"));	// 퀴놀론1
	qury_enro				= TextFormatter.escapeHTML(d.getString("enro"));	// enro
	qury_cipro				= TextFormatter.escapeHTML(d.getString("cipro"));	// cipro
	qury_QUENOL2      = TextFormatter.escapeHTML(d.getString("퀴놀론2"));	// 퀴놀론2
	qury_dano				= TextFormatter.escapeHTML(d.getString("dano"));	// dano
	qury_nor					= TextFormatter.escapeHTML(d.getString("nor"));	// nor
	qury_oflo				= TextFormatter.escapeHTML(d.getString("oflo"));	// oflo
	qury_BROMOP		= TextFormatter.escapeHTML(d.getString("브로모프로필레이트"));	// 브로모프로필레이트
	qury_SIMIAOZOL	= TextFormatter.escapeHTML(d.getString("시미아졸"));	// 시미아졸
	qury_QUMAPOS		= TextFormatter.escapeHTML(d.getString("쿠마포스"));	// 쿠마포스
	qury_AMITRAZ		= TextFormatter.escapeHTML(d.getString("아미트라즈"));	// 아미트라즈
	qury_PLUBA			= TextFormatter.escapeHTML(d.getString("플루바리네이트"));	// 플루바리네이트
	qury_PLUME			= TextFormatter.escapeHTML(d.getString("플루메쓰린"));	// 플루메쓰린
	qury_GRAYANO      = TextFormatter.escapeHTML(d.getString("그레이아노톡신"));	// 그레이아노톡신
	
	qury_MOBILE      = TextFormatter.escapeHTML(d.getString("mobile"));	// 연락처
	qury_ISSUENUM      = TextFormatter.escapeHTML(d.getString("sel_issuenum"));	// 발급번호
	qury_HPHONE      = TextFormatter.escapeHTML(d.getString("Hphone"));	// 자택전화
	qury_GUMCHEPYOSI      = TextFormatter.escapeHTML(d.getString("검체표시"));	// 검체표시
	qury_RATING_RESULT = TextFormatter.escapeHTML(d.getString("등급판정")); //등급판정
	if ( "O".equals(qury_mailreceive)){
		qury_addr = qury_offc_addr;
	}else{
		qury_addr = qury_home_addr;
	}
	
	datediff = d.getString("diffdate");
	
	if(!qury_test_endd_date.isEmpty() && qury_test_endd_date.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = sdf.parse("2018-07-01");
		Date completeDate = sdf.parse(qury_test_endd_date);
		if(completeDate.before(date1)){
			certiType = AdminCertiDao.CERTI_TYPE_HAN_0;
		}else{
			certiType = AdminCertiDao.CERTI_TYPE_HAN_1;
		}
	}
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
}else if("-".equals(qury_june_sgar)){
	전화당 = 0;
}else{
	전화당 = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_june_sgar) ? "0" : qury_june_sgar, "0")) < 60 ? 1 : 0;	
}
당비율 = 0;

HMF = dp_method.parseDouble_method(TextFormatter.convNvl("-".equals(qury_hmf) ? "0" : qury_hmf, "0")) > 80 ? 1 : 0;

if("-".equals(qury_sando)){
	산도 = 0;
}else{
	산도 = "적합".equals("-".equals(qury_sando) ? "0" : qury_sando) ? 0 : 1;
}


if("적합".equals(qury_hwoi)){
	물불용물 = 0;
}else if("-".equals(qury_hwoi)){
	물불용물 = 0;
}else if("부적합".equals(qury_hwoi)){
	물불용물 = 1;
}else{
	물불용물 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_hwoi, "0")) > 0.5 ? 1 : 0;
}

if("-".equals(qury_tarr)){
	타르색소 = 0;
}else{
	타르색소 = "불검출".equals("-".equals(qury_tarr) ? "0" : qury_tarr) ? 0 : 1;
}

if("-".equals(qury_gammoryo)){
	사카린나트륨 = 0;	
}else{
	사카린나트륨 = "불검출".equals("-".equals(qury_gammoryo) ? "0" : qury_gammoryo) ? 0 : 1;
}

if("-".equals(qury_esung)){
	이성화당 = 0;	
}else{
	이성화당 =  "음성".equals("-".equals(qury_esung) ? "0" : qury_esung) ? 0 : 1;
}
탄소동위원소비 = 0;
클로람페니콜 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_CRO, "0")) > 0 ? 1 : 0;
스트렙토마이신 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_STREPTO, "0")) > 100 ? 1 : 0;
시미아졸 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_SIMIAOZOL, "0")) > 1000 ? 1 : 0;
니트로푸란 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_NITRO, "0")) > 0 ? 1 : 0;
옥시테트라싸이클린 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_OXITE, "0")) > 300 ? 1 : 0;

System.out.println("옥시테트라>>"+옥시테트라싸이클린+dp_method.parseDouble_method(TextFormatter.convNvl(qury_OXITE, "0")));

설폰아마이드 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_CERPON, "0")) > 30 ? 1 : 0;
코마포스 = dp_method.parseDouble_method(TextFormatter.convNvl(qury_QUMAPOS, "0")) > 10 ? 1 : 0;
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
	
	
			/* 
			데이터 체크하기위한 syso
			System.out.println(">>>>>>1"+성상);
			System.out.println(">>>>>>2"+수분);
			System.out.println(">>>>>>3"+자당);
			System.out.println(">>>>>>4"+전화당);
			System.out.println(">>>>>>5"+당비율);
			System.out.println(">>>>>>6"+HMF);
			System.out.println(">>>>>>7"+산도);
			System.out.println(">>>>>>8"+물불용물);
			System.out.println(">>>>>>9"+타르색소);
			System.out.println(">>>>>>10"+사카린나트륨);
			System.out.println(">>>>>>11"+이성화당);
			System.out.println(">>>>>>12"+클로람페니콜);
			System.out.println(">>>>>>13"+스트렙토마이신);
			System.out.println(">>>>>>14"+시미아졸);
			System.out.println(">>>>>>15"+니트로푸란);
			System.out.println(">>>>>>16"+옥시테트라싸이클린);
			System.out.println(">>>>>>17"+코마포스);
			System.out.println(">>>>>>18"+설폰아마이드);
			System.out.println(">>>>>>19"+테트라싸이클린);
			System.out.println(">>>>>>20"+아미트라즈);
			System.out.println(">>>>>>21"+매크로라이드);
			System.out.println(">>>>>>22"+퀴놀론1);
			System.out.println(">>>>>>23"+플루발리네이트);
			System.out.println(">>>>>>24"+베타락탐);
			System.out.println(">>>>>>25"+퀴놀론2);
			System.out.println(">>>>>>26"+플루메쓰린);
			System.out.println(">>>>>>27"+네오마이신);
			System.out.println(">>>>>>28"+브로모프로필레이트);
			System.out.println(">>>>>>29"+그레이아노톡신); */
	
	
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
	
	//마지막콤마 제거
	if(ExcessItems.lastIndexOf(",") != -1){
		ExcessItems = ExcessItems.substring(0,ExcessItems.lastIndexOf(","));
	}
}





%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
   .resultArea {line-height: 1.8; padding:2rem;width:100%; max-width:780px; margin:0 auto; text-align:center}
   .resultArea img {width:100%; max-width:1000px; }
   .resultArea h4 {font-size:2rem; padding:1.5rem 0 1rem;  border-top:2px solid #000}
   .resultArea .bgsky {background:#d0eaed;}
   .resultArea .table01 {width: 100%; border-collapse: collapse; text-align:left }
   .resultArea .table01 .titlecell th {background:#a3d7dd;}
   .resultArea .table01 th,.resultArea .table01 td {padding:0 5px; }
   .resultArea ul {padding:0; list-style: none; text-align:left }
   .resultArea .korapis_result_bottom {height:14rem; position:relative;}
   .resultArea .korapis_result_btxt {width:100%; position:absolute; top:0; left:0; font-size: 1rem; line-height:3; z-index:10}
   .resultArea .korapis_result_bimg {width:100%; margin-top: 4rem;}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">

//PDF다운로드
function f_print(){
	
		var frm = document.forms.frmDetail;
		frm.selAction.value = "PDF";
		frm.uid.value = <%=qury_uid%>;
		frm.subSelAction.value = "PDF";
		
		
		//잔류물질표기 체크여부
		if($("input:checkbox[name='chk_disp_fig']").is(":checked")){
			frm.chk_disp.value = "Y";
		}else{
			frm.chk_disp.value = "N";	
		}
		
		//종합결과항목 체크여부
		if($("input:checkbox[name='chk_add_show']").is(":checked")){
			frm.chk_add.value = "Y";
		}else{
			frm.chk_add.value = "N";	
		}
		
		//식품공정용 도장 체크여부
		if($("input:checkbox[name='chk_food_process']").is(":checked")){
			frm.chk_food.value = "N";
		}else{
			frm.chk_food.value = "Y";	
		}
		
		//참고용 도장 체크여부
		if($("input:checkbox[name='chk_reference_point']").is(":checked")){
			frm.chk_reference.value = "N";
		}else{
			frm.chk_reference.value = "Y";	
		}
		
		frm.target = "hidFrame";
		frm.method="post";
		frm.action = "/adminCerti.do";
		frm.submit();
}


$(function(){
	
	
	<%
	if(qury_rqst_prdt_name.contains("한벌꿀")
    		|| "봉인".equals(qury_rqst_prdt_name)
    		|| "벌집꿀(봉인)".equals(qury_rqst_prdt_name)
    		){
	%>
		$("#OverallResult").show();
	<%}%>
	
	//전체참고시에는, 종합결과항목 체크박스가 체크되어있을때만 종합결과오픈.
	<%
	if("전체(참고)".equals(qury_rqst_prdt_name)){
	%>
		$("input:checkbox[name='chk_add_show']").click(function(){
			if($("input:checkbox[name='chk_add_show']").is(":checked")){
				$("#OverallResult").show();
			}else{
				$("#OverallResult").hide();
			}
		});
	<%}%>
});

function f_update(){
	
		
		
		var frm = document.forms.frmDetail;
		frm.method="post";
		frm.target="";
		frm.selAction.value = "update_certi";
		frm.action = "/adminCerti.do";
		frm.uid.value = <%=qury_uid%>;
		
		frm.submit();
	
};


/*
$(function(){
	
	
	$("#recv_date").datepicker({changeYear:true});
	$("#recv_date").datepicker("option", "dateFormat", "yymmdd");
	$("#recv_date").datepicker("option", "yearRange", "-10:+0");
	$("#recv_date").datepicker("setDate", "<%=param.getString("recv_date") %>");
	
	$("#test_endd_date").datepicker({changeYear:true});
	$("#test_endd_date").datepicker("option", "dateFormat", "yymmdd");
	$("#test_endd_date").datepicker("option", "yearRange", "-10:+0");
	$("#test_endd_date").datepicker("setDate", "<%=param.getString("test_endd_date") %>");
		
});
*/


$(function(){
	$("input[name='등급판정']").val('<%=qury_RATING_RESULT.replace("&#43;", "+") %>');
})
</script>


</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
</form>
<!-- 공통폼 E. -->
<iframe name="hidFrame" style="display:none"></iframe>
<!-- 공통폼 E. -->
<form name="frmDetail" id="frmDetail" method="post">
<input type="hidden" name="selAction" value="" />
<input type="hidden" name="uid" value="" />
<input type="hidden" name="chk_disp" value="" />
<input type="hidden" name="chk_add" value="" />
<input type="hidden" name="chk_food" value="" />
<input type="hidden" name="chk_reference" value="" />
<input type="hidden" name="subSelAction" value="" />

<!-- Global Wrapper.s -->
<div class="resultArea">
   <img src="http://www.korapis.or.kr/images/korapis_test_result_top.gif">
   <h4>시험 결과 통지서</h4>

   <table class="table01 bgsky" border="1">
      <tr>
         <td>·의 뢰 자 : <%=qury_name %></td>
         <td>·접수번호 : <input type = "text" name="regnum" value=<%=qury_regnum.replaceAll("\\(.*?\\)", "")%>></td>
         <td>·접 수 일 : <input type = "text" name = "recv_date" id="recv_date" maxlength="10" value=<%=qury_recv_date %>></td>
      </tr>
      <tr>
         <td>·시험항목 : <input type = "text" name="rqst_prdt_name" value=<%=qury_rqst_prdt_name %>></td>
         <td>·봉인번호 : <input type = "text" name="bongin" value=<%=qury_bongin %>></td>
         <td>·완 료 일 : <input type = "text" name="test_endd_date" id="test_endd_date" maxlength="10" value=<%=qury_test_endd_date%>></td>
      </tr>
      <tr>
         <td colspan="2">·검체표시 : <input type = "text" name="검체표시" value=<%=qury_GUMCHEPYOSI%>></td>
         <td>·연 락 처 :<%=!"--".equals(qury_HPHONE) ? qury_HPHONE : qury_MOBILE%></td>
      </tr>
      <tr>
         <td colspan="3">·주소 :<%=qury_addr %></td>
      </tr>
   </table>

   <ul>
      <li>·이 통지서는 식품공전에 의거한 검사 성적서이며, 검사 완료 후 6개월간 유효합니다.</li>
      <li>·NO.1~12 벌꿀규격 및 일반 성상/ NO.13~18 항생제/ NO.19 구충제/ NO.20~24 농약/ NO.25 독성물질</li><br>
      <li><strong>·이 통지서는 홍보, 선전, 광고 및 소송용으로 사용할 수 없으며 납품 및 참고자료 이외의 사용을 금합니다.</strong></li>
   </ul>
<%if(Integer.parseInt(qury_uid)<161963) {%>
   <table class="table01" border="1">
      <colgroup>
         <col width="8%">
         <col width="15%">
         <col width="15%">
         <col width="12%">
         <col width="8%">
         <col width="15%">
         <col width="15%">
         <col width="12%">
      </colgroup>
      <tr class="titlecell">
         <th>NO.</th>
         <th>항 목</th>
         <th>기 준</th>
         <th>결 과</th>
         <th>NO.</th>
         <th>항 목</th>
         <th>기 준</th>
         <th>결 과</th>
      </tr>
		<tr>
	    	<td>1</td>
	       	<td style="text-;"> 성상</td>
	       	<td>적합</td>
	       	<td><input type = "text" name="sung_valu" value=<%=qury_sung_valu%>></td>
	       	<td>16</td>
	       	<td style="text-;">니트로푸란</td>
	       	<td>불검출</td>
	      	<td>
	       		<%if("".equals(qury_NITRO)){ %>
	       		-
	           	<%}else{
	           		try{
	           			if(Double.parseDouble(qury_NITRO) > 0){
	           			니트로푸란 = Double.parseDouble(qury_NITRO) > 0 ? 1 : 0;
						%>
							검출
						<%}else{%>
							불검출
					<%	}%>
	           			</br>
	           			<input type = "text" name="니트로퓨란" value=<%=format.format(Double.parseDouble(qury_NITRO)) %>>
	           		<% }catch(Exception e){}
				} %>
	       	</td>
		</tr>
		<tr>
	       	<td>2</td>
	       		<td style="text-;"> 수분(%)</td>
	       		<%
	       		if(qury_rqst_prdt_name.contains("벌집꿀")){
	       		%>
	       			<td>23.0 이하</td>
	       		<%}else{ %>
	       			<td>20.0 이하</td>
	       		<%} %>
	       		
	       		<td><input type = "text" name="wter" value=<%=qury_wter %>></td>
	       		<td>17</td>
	       		<td style="text-;"> 옥시테트라싸이클린</td>
	       		<td>0.30ppm이하</td>
	       		<td>
	       		<%if("".equals(qury_OXITE)){ %>
	       		-
	           	<%}else{
	           		try{
	           			if(Double.parseDouble(qury_OXITE) > 300){
					%>
						검출
						<%}else{%>
						불검출
					<%	}%>
					<br/><input type = "text" name="옥시테트라" value=<%=format.format(Double.parseDouble(qury_OXITE)) %>>
	           	<% 	}catch(Exception e){}
				} %>
	       	</td>
		</tr>       	
		<tr>
	       	<td>3</td>
	       		<td style="text-;"> 자당(%)</td>
	       		
	       		<%
	       		if(qury_rqst_prdt_name.contains("벌집꿀")){
	       		%>
	       			<td>15.0 이하</td>
	       		<%}else{ %>
	       			<td>7.0 이하</td>
	       		<%} %>
	       		
	       		<td><input type = "text" name="ja_sgar" value=<%=qury_ja_sgar %>></td>
	       		<td>18</td>
	       		<td style="text-;"> 코마포스</td>
	       		<td>0.10ppm이하</td>
	       		<td>
	       		<%if("".equals(qury_QUMAPOS)){ %>
	       		-
	           	<%}else{
	           		try{
	           			if(Double.parseDouble(qury_QUMAPOS) > 100){
					%>
						검출
						<%}else{%>
						불검출
					<%			
						}%>
						<br/><input type = "text" name="쿠마포스" value=<%=format.format(Double.parseDouble(qury_QUMAPOS)) %>>
	           		<% }catch(Exception e){}
				} %>
	       	</td>
		</tr>
		<tr>
			<td>4</td>
			<td style="text-;"> 전화당(%)</td>
			
				<%
				if(qury_rqst_prdt_name.contains("벌집꿀")){
				%>
			<td>50.0 이상</td>
				<%}else{ %>
			<td>60.0 이상</td>
				<%} %>
			
			<td><input type = "text" name="june_sgar" value=<%=qury_june_sgar %>></td>
			<td>19</td>
			<td style="text-;"> 설폰아마이드</td>
			<td>0.03ppm이하</td>
			<td>
				<%if("".equals(qury_CERPON)){ %>
				-
			  	<%}else{
			 		try{
			 			if(Double.parseDouble(qury_CERPON) > 30){
				%>
					검출
				<%}else{%>
					불검출
				<%	}%>
				<br/><input type = "text" name="설폰아마이드" value=<%=format.format(Double.parseDouble(qury_CERPON)) %>>
			     <%	}catch(Exception e){}
			}%>
			</td>
		</tr>

		<tr>
			<td>5</td>
			<td style="text-;"> 당비율(F/G)</td>
		<td>-</td>
		<td>
		<input type = "text" name="fng" value=<%=qury_fng %>>
		
		</td>
		<td>20</td>
		<td style="text-;"> 테트라싸이클린</td>
		<td>0.03ppm이하</td>
		<td>
		<%if("".equals(qury_TETRASA)){ %>
		-
	  	<%}else{
	 		try{
	 			if(Double.parseDouble(qury_TETRASA) > 30){	%>
					검출
				<%}else{%>
					불검출
			<%	}%>
			<br/><input type = "text" name="테트라사이클린" value=<%=format.format(Double.parseDouble(qury_TETRASA)) %>>
	     <%	}catch(Exception e){}
		} %>
			</td>
		</tr>

		<tr>
			<td>6</td>
			<td style="text-;"> H.M.F(mg/kg)</td>
		<td>80.0 이하</td>
		<td><input type = "text" name="hmf" value=<%=qury_hmf %>></td>
		<td>21</td>
		<td style="text-;"> 아미트라즈</td>
		<td>0.20ppm이하</td>
		<td>
		<%if("".equals(qury_AMITRAZ)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_AMITRAZ) > 200){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
					<br/><input type = "text" name="아미트라즈" value=<%=format.format(Double.parseDouble(qury_AMITRAZ)) %>>					
		        <%		}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td>7</td>
			<td style="text-;"> 산도(meq/kg)</td>
			<td>40.0 이하</td>
			<td><input type = "text" name="sando" value=<%=qury_sando %>></td>
			<td>22</td>
			<td style="text-;"> 매크로라이드</td>
			<td>0.03ppm이하</td>
			<td>
				<%if("".equals(qury_MECRO)){ %>
				-
				<%}else{
				 		try{
				 			if(Double.parseDouble(qury_MECRO) > 30){
				%>
				검출
					<%}else{%>
				불검출
				<%			
						}%>
						<br/><input type = "text" name="매크로라이드" value=<%=format.format(Double.parseDouble(qury_MECRO)) %>>
				        	<%}catch(Exception e){}
				} %>
			</td>
		</tr>

		<tr>
			<td>8</td>
			<td style="text-;"> 물불용물(%)</td>
		<td>0.5 이하</td>
		<td><input type = "text" name="hwoi" value=<%=qury_hwoi %>></td>
		<td>23</td>
		<td style="text-;"> 퀴놀론1</td>
		<td>0.03ppm이하</td>
		<td>
			<%if("".equals(qury_QUENOL1)){ %>
			-
			<%}else{
			 		try{
			 			if(Double.parseDouble(qury_QUENOL1) > 30){
			%>
			검출
			<%}else{%>
			불검출
			<%			
					}%>
					<br/><input type = "text" name="퀴놀론1" value=<%=format.format(Double.parseDouble(qury_QUENOL1)) %>>
			        	<% }catch(Exception e){}
			} %>
			</td>
		</tr>

		<tr>
			<td>9</td>
			<td style="text-;"> 타르색소</td>
		<td>불검출</td>
		<td><input type ="text" name="tarr" value ="<%=qury_tarr %>"></td>
		<td>24</td>
		<td style="text-;"> 플루발리네이트</td>
		<td>0.05ppm이하</td>
		<td>
		<%if("".equals(qury_PLUBA)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_PLUBA) > 50){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<br/><input type = "text" name="플루바리네이트" value=<%=format.format(Double.parseDouble(qury_PLUBA)) %>>
		        	<%	}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td>10</td>
			<td style="text-;"> 사카린나트륨</td>
		<td>불검출</td>
		<td><input type = "text" name="gammoryo" value=<%=qury_gammoryo %>></td>
		<td>25</td>
		<td style="text-;"> 베타락탐</td>
		<td>0.03ppm이하</td>
		<td>
		<%if("".equals(qury_BETARA)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_BETARA) > 30){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<br/><input type = "text" name="베타락탐" value=<%=format.format(Double.parseDouble(qury_BETARA)) %>>
		        	<%	}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td>11</td>
			<td style="text-;"> 이성화당</td>
		<td>음성</td>
		<td><input type = "text" name="esung" value=<%=qury_esung %>></td>
		<td>26</td>
		<td style="text-;"> 퀴놀론2</td>
		<td>0.03ppm이하</td>
		<td>
		<%if("".equals(qury_QUENOL2)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_QUENOL2) > 30){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<input type = "text" name="퀴놀론2" value=<%=format.format(Double.parseDouble(qury_QUENOL2)) %>>
		        	<%	}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td>12</td>
			<td style="text-;"> 탄소동위원소비(‰)</td>
		<td>-22.5‰이하 벌꿀 / -22.5‰초과 사양꿀</td>
		<td><input type = "text" name="c12" value=<%=qury_c12 %>></td>
		<td>27</td>
		<td style="text-;"> 플루메쓰린</td>
		<td>0.01ppm이하</td>
		<td>
		<%if("".equals(qury_PLUME)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_PLUME) > 10){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<br/><input type = "text" name="플루메쓰린" value=<%=format.format(Double.parseDouble(qury_PLUME)) %>>
		        	<%	}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td>13</td>
			<td style="text-;"> 클로람페니콜</td>
		<td>불검출</td>
		<td>
		<%if("".equals(qury_CRO)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_CRO) > 0){
		%>
		검출<br/>
		<%}else{%>
		불검출
		<%			
				}%>
				<input type = "text" name="클로암페니콜" value=<%=format.format(Double.parseDouble(qury_CRO)) %>>
		        	<%	}catch(Exception e){}
		} %>
		</td>
		<td>28</td>
		<td style="text-;"> 네오마이신</td>
		<td>0.10ppm이하</td>
		<td>
		<%if("".equals(qury_NEOMA)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_NEOMA) > 100){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<br/><input type = "text" name="네오마이신" value=<%=format.format(Double.parseDouble(qury_NEOMA)) %>>
		        	<%	}catch(Exception e){}
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
			검출
			<%}else{%>
			불검출
			<%			
					}%>
					<br/><input type = "text" name="스트렙토마이신" value=<%=format.format(Double.parseDouble(qury_STREPTO)) %>>
			        	<%	}catch(Exception e){}
			} %>
			</td>
			<td>29</td>
			<td style="text-align:left;"> 브로모프로필레이트</td>
			<td><%=certiType == AdminCertiDao.CERTI_TYPE_HAN_1 ? "0.01ppm" : "0.03ppm" %>이하</td>
			<td>
				<%if("".equals(qury_BROMOP)){ %>
				-
				  	<%}else{
				 		try{
				 			if(Double.parseDouble(qury_BROMOP) > (certiType == AdminCertiDao.CERTI_TYPE_HAN_1 ? 10 : 30)){
				%>
				검출
				<%}else{%>
				불검출
				<%			
						}%>
						<br/><input type = "text" name="브로모프로필레이트" value=<%=format.format(Double.parseDouble(qury_BROMOP)) %>>
				        	<%	}catch(Exception e){}
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
				검출
				<%}else{%>
				불검출
				<%			
						}%>
							<br/><input type = "text" name="시미아졸" value=<%=format.format(Double.parseDouble(qury_SIMIAOZOL)) %>>
				        	<%	}catch(Exception e){}
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
				검출
				<%}else{%>
				불검출
				<%			
						}%>
						<br/><input type = "text" name="그레이아노톡신" value=<%=format.format(Double.parseDouble(qury_GRAYANO)) %>>
				        	<%	}catch(Exception e){}
				} %>
			</td>
		</tr>
		<tr style="display: none;" id="OverallResult">
			<td colspan="2">기준 초과 항목</td>
			
			<!-- 로직으로 판정에서 엑셀 판정입력 데이터로 변경 15-07-08 -->
			<%-- <td colspan="2"><%=OverallResult %></td> --%>
			<td colspan="2"><%=TextFormatter.convNvl(ExcessItems, "-") %></td>
			
			<td colspan="2" bgcolor="f4f4f4">등급 판정</td>
			<td colspan="2">
				<%if("1+".equals(qury_RATING_RESULT)){ %>
				<%=qury_RATING_RESULT %>
				<%}else if("1".equals(qury_RATING_RESULT)){ %>
				<%=qury_RATING_RESULT %>
				<%}else if("2".equals(qury_RATING_RESULT)){ %>
				<%=qury_RATING_RESULT %>
				<%}else{ %>
				<%=qury_RATING_RESULT %>
				<%} %>
			</td>
		</tr>
			<%if(("한벌꿀(봉인)".equals(qury_rqst_prdt_name)
			|| "벌집꿀(봉인)".equals(qury_rqst_prdt_name)
			|| "봉인".equals(qury_rqst_prdt_name)
			|| "전체(참고)".equals(qury_rqst_prdt_name))
			){ %>
		<tr>
			<td colspan="2" bgcolor="f4f4f4">종합 결과</td>
			<td colspan="6" bgcolor="f4f4f4"><%=qury_test_rslt %></td>
		</tr>
		<%} %>
	</table>
	<%}else{ %>
	   <table class="table01" border="1">
      <colgroup>
         <col width="8%">
         <col width="15%">
         <col width="15%">
         <col width="12%">
         <col width="8%">
         <col width="15%">
         <col width="15%">
         <col width="12%">
      </colgroup>
      <tr class="titlecell">
         <th>NO.</th>
         <th>항 목</th>
         <th>기 준</th>
         <th>결 과</th>
         <th>NO.</th>
         <th>항 목</th>
         <th>기 준</th>
         <th>결 과</th>
      </tr>
		<tr>
	    	<td>1</td>
	       	<td style="text-;"> 성상</td>
	       	<td>적합</td>
	       	<td><input type = "text" name="sung_valu" value=<%=qury_sung_valu%>></td>
	       	<td>13</td>
	       	<td style="text-;">니트로푸란</td>
	       	<td>불검출</td>
	      	<td>
	       		<%if("".equals(qury_NITRO)){ %>
	       		-
	           	<%}else{
	           		try{
	           			if(Double.parseDouble(qury_NITRO) > 0){
	           			니트로푸란 = Double.parseDouble(qury_NITRO) > 0 ? 1 : 0;
						%>
							검출
						<%}else{%>
							불검출
					<%	}%>
	           			</br>
	           			<input type = "text" name="니트로퓨란" value=<%=format.format(Double.parseDouble(qury_NITRO)) %>>
	           		<% }catch(Exception e){}
				} %>
	       	</td>
		</tr>
		<tr>
	       	<td>2</td>
	       		<td style="text-;"> 수분(%)</td>
	       		<%
	       		if(qury_rqst_prdt_name.contains("벌집꿀")){
	       		%>
	       			<td>23.0 이하</td>
	       		<%}else{ %>
	       			<td>20.0 이하</td>
	       		<%} %>
	       		
	       		<td><input type = "text" name="wter" value=<%=qury_wter %>></td>
       		<td>14</td>
	       		<td style="text-;"> 옥시테트라싸이클린</td>
	       		<td>0.30ppm이하</td>
	       		<td>
	       		<%if("".equals(qury_OXITE)){ %>
	       		-
	           	<%}else{
	           		try{
	           			if(Double.parseDouble(qury_OXITE) > 300){
					%>
						검출
						<%}else{%>
						불검출
					<%	}%>
					<br/><input type = "text" name="옥시테트라" value=<%=format.format(Double.parseDouble(qury_OXITE)) %>>
	           	<% 	}catch(Exception e){}
				} %>
	       	</td>
		</tr>       	
		<tr>
	       	<td>3</td>
	       		<td style="text-;"> 자당(%)</td>
	       		
	       		<%
	       		if(qury_rqst_prdt_name.contains("벌집꿀")){
	       		%>
	       			<td>15.0 이하</td>
	       		<%}else{ %>
	       			<td>7.0 이하</td>
	       		<%} %>
	       		
	       		<td><input type = "text" name="ja_sgar" value=<%=qury_ja_sgar %>></td>
       		<td>15</td>
	       		<td style="text-;"> 코마포스</td>
	       		<td>0.10ppm이하</td>
	       		<td>
	       		<%if("".equals(qury_QUMAPOS)){ %>
	       		-
	           	<%}else{
	           		try{
	           			if(Double.parseDouble(qury_QUMAPOS) > 100){
					%>
						검출
						<%}else{%>
						불검출
					<%			
						}%>
						<br/><input type = "text" name="쿠마포스" value=<%=format.format(Double.parseDouble(qury_QUMAPOS)) %>>
	           		<% }catch(Exception e){}
				} %>
	       	</td>
		</tr>
		<tr>
			<td>4</td>
				<td style="text-;"> 전화당(%)</td>
				
					<%
					if(qury_rqst_prdt_name.contains("벌집꿀")){
					%>
				<td>50.0 이상</td>
					<%}else{ %>
				<td>60.0 이상</td>
					<%} %>
				
				<td><input type = "text" name="june_sgar" value=<%=qury_june_sgar %>></td>
			<td>16</td>
	    		<td style="text-align:left;"> 시미아졸</td>
				<td>1.00ppm이하</td>
				<td>
					<%if("".equals(qury_SIMIAOZOL)){ %>
					-
					        	<%}else{
					 		try{
					 			if(Double.parseDouble(qury_SIMIAOZOL) > 50){
					%>
					검출
					<%}else{%>
					불검출
					<%			
							}%>
								<br/><input type = "text" name="시미아졸" value=<%=format.format(Double.parseDouble(qury_SIMIAOZOL)) %>>
					        	<%	}catch(Exception e){}
					} %>
			</td>
		
		</tr>

		<tr>
			<td>5</td>
			<td style="text-;"> 당비율(F/G)</td>
		<td>-</td>
		<td>
		<input type = "text" name="fng" value=<%=qury_fng %>>
		
		</td>
		<td>17</td>
		<td style="text-;"> 테트라싸이클린</td>
		<td>0.03ppm이하</td>
		<td>
		<%if("".equals(qury_TETRASA)){ %>
		-
	  	<%}else{
	 		try{
	 			if(Double.parseDouble(qury_TETRASA) > 30){	%>
					검출
				<%}else{%>
					불검출
			<%	}%>
			<br/><input type = "text" name="테트라사이클린" value=<%=format.format(Double.parseDouble(qury_TETRASA)) %>>
	     <%	}catch(Exception e){}
		} %>
			</td>
		</tr>

		<tr>
			<td>6</td>
			<td style="text-;"> H.M.F(mg/kg)</td>
		<td>80.0 이하</td>
		<td><input type = "text" name="hmf" value=<%=qury_hmf %>></td>
		<td>18</td>
		<td style="text-;"> 아미트라즈</td>
		<td>0.20ppm이하</td>
		<td>
		<%if("".equals(qury_AMITRAZ)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_AMITRAZ) > 200){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
					<br/><input type = "text" name="아미트라즈" value=<%=format.format(Double.parseDouble(qury_AMITRAZ)) %>>					
		        <%		}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td>7</td>
			<td style="text-;"> 산도(meq/kg)</td>
			<td>40.0 이하</td>
			<td><input type = "text" name="sando" value=<%=qury_sando %>></td>
			<td>19</td>
			<td style="text-align:left;"> 스트렙토마이신</td>
			<td>0.10ppm이하</td>
			<td>
			<%if("".equals(qury_STREPTO)){ %>
			-
			  	<%}else{
			 		try{
			 			if(Double.parseDouble(qury_STREPTO) > 100){
			%>
			검출
			<%}else{%>
			불검출
			<%			
					}%>
					<br/><input type = "text" name="스트렙토마이신" value=<%=format.format(Double.parseDouble(qury_STREPTO)) %>>
			        	<%	}catch(Exception e){}
			} %>
			</td>
			
		</tr>

		<tr>
			<td>8</td>
			<td style="text-;"> 물불용물(%)</td>
		<td>0.5 이하</td>
		<td><input type = "text" name="hwoi" value=<%=qury_hwoi %>></td>
		<td>20</td>
			<td style="text-align:left;"> 브로모프로필레이트</td>
			<td><%=certiType == AdminCertiDao.CERTI_TYPE_HAN_1 ? "0.01ppm" : "0.03ppm" %>이하</td>
			<td>
				<%if("".equals(qury_BROMOP)){ %>
				-
				  	<%}else{
				 		try{
				 			if(Double.parseDouble(qury_BROMOP) > (certiType == AdminCertiDao.CERTI_TYPE_HAN_1 ? 10 : 30)){
				%>
				검출
				<%}else{%>
				불검출
				<%			
						}%>
						<br/><input type = "text" name="브로모프로필레이트" value=<%=format.format(Double.parseDouble(qury_BROMOP)) %>>
				        	<%	}catch(Exception e){}
				} %>
			</td>
	
		</tr>

		<tr>
			<td>9</td>
			<td style="text-;"> 타르색소</td>
		<td>불검출</td>
		<td><input type ="text" name="tarr" value ="<%=qury_tarr %>"></td>
		<td>21</td>
		<td style="text-;"> 플루발리네이트</td>
		<td>0.05ppm이하</td>
		<td>
		<%if("".equals(qury_PLUBA)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_PLUBA) > 50){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<br/><input type = "text" name="플루바리네이트" value=<%=format.format(Double.parseDouble(qury_PLUBA)) %>>
		        	<%	}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td>10</td>
			<td style="text-;"> 사카린나트륨</td>
		<td>불검출</td>
		<td><input type = "text" name="gammoryo" value=<%=qury_gammoryo %>></td>
		
		    <td>22</td>
	    <td style="text-align:left;"> 그레이아노톡신 III</td>
		<td>불검출</td>
		<td>
			<%if("".equals(qury_GRAYANO)){ %>
			-
			  	<%}else{
			 		try{
			 			if(Double.parseDouble(qury_GRAYANO) > 0){
			%>
			검출
			<%}else{%>
			불검출
			<%			
					}%>
					<br/><input type = "text" name="그레이아노톡신" value=<%=format.format(Double.parseDouble(qury_GRAYANO)) %>>
			        	<%	}catch(Exception e){}
			} %>
		</td>
		</tr>
		
		<tr>
			<td>11</td>
			<td style="text-;"> 이성화당</td>
				<td>음성</td>
				<td><input type = "text" name="esung" value=<%=qury_esung %>></td>
			<td>23</td>
			<td style="text-;"> 클로람페니콜</td>
				<td>불검출</td>
				<td>
				<%if("".equals(qury_CRO)){ %>
				-
				  	<%}else{
				 		try{
				 			if(Double.parseDouble(qury_CRO) > 0){
				%>
				검출<br/>
				<%}else{%>
				불검출
				<%			
						}%>
						<input type = "text" name="클로암페니콜" value=<%=format.format(Double.parseDouble(qury_CRO)) %>>
				        	<%	}catch(Exception e){}
				} %>
		</td>
	
		</tr>
		
		<tr>
			<td>12</td>
			<td style="text-;"> 탄소동위원소비(‰)</td>
		<td>-22.5‰이하 벌꿀 / -22.5‰초과 사양꿀</td>
		<td><input type = "text" name="c12" value=<%=qury_c12 %>></td>
		<td>24</td>
		<td style="text-;"> 플루메쓰린</td>
		<td>0.01ppm이하</td>
		<td>
		<%if("".equals(qury_PLUME)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_PLUME) > 10){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<br/><input type = "text" name="플루메쓰린" value=<%=format.format(Double.parseDouble(qury_PLUME)) %>>
		        	<%	}catch(Exception e){}
		} %>
			</td>
		</tr>
		
		<tr>
			<td bgcolor="f4f4f4" colspan="2">기준 초과 항목</td>		
			<td colspan="2"><%=TextFormatter.convNvl(ExcessItems, "-") %></td>
		<td>25</td>
		<td style="text-;"> 네오마이신</td>
		<td>0.10ppm이하</td>
		<td>
		<%if("".equals(qury_NEOMA)){ %>
		-
		  	<%}else{
		 		try{
		 			if(Double.parseDouble(qury_NEOMA) > 100){
		%>
		검출
		<%}else{%>
		불검출
		<%			
				}%>
				<br/><input type = "text" name="네오마이신" value=<%=format.format(Double.parseDouble(qury_NEOMA)) %>>
		        	<%	}catch(Exception e){}
		} %>
			</td>
		</tr>
	
		<tr id="OverallResult">		
			<td colspan="2" bgcolor="f4f4f4">등급 판정</td>
			<td colspan="7">
				<%if("1+".equals(qury_RATING_RESULT)){ %>
					<input type="text" width="100px" name="등급판정" value=<%=qury_RATING_RESULT %>>
				<%}else if("1".equals(qury_RATING_RESULT)){ %>
					<input type="text" width="100px" name="등급판정" value=<%=qury_RATING_RESULT %>>
				<%}else if("2".equals(qury_RATING_RESULT)){ %>
					<input type="text" width="100px" name="등급판정" value=<%=qury_RATING_RESULT %>>
				<%}else{ %>
					<input type="text" style="width:400px" name="등급판정" value=<%=qury_RATING_RESULT %>>
				<%} %>
			</td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="f4f4f4">종합 결과</td>
			<td colspan="6" bgcolor="f4f4f4"><input type="text" name="test_rslt" value=<%=qury_test_rslt %>></td>
		</tr>
			<%if(("한벌꿀(봉인)".equals(qury_rqst_prdt_name)
			|| "벌집꿀(봉인)".equals(qury_rqst_prdt_name)
			|| "봉인".equals(qury_rqst_prdt_name)
			|| "전체(참고)".equals(qury_rqst_prdt_name))
			){ %>
		<%} %>
	</table>
	
	<%} %>
	<div class="korapis_result_bottom">
		<p class="korapis_result_btxt">상기와 같이 시험 결과를 통지 합니다.<br>
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
	    <img class="korapis_result_bimg" src="http://www.korapis.or.kr/images/korapis_test_result_bottom.gif">   
	</div>
	
	<div style="text-align: right;">
		<input type="checkbox" name="chk_reference_point" value="N" <%="N".equals(param.getString("chk_reference_point")) ? "checked" : "" %>/>
		참고용 도장삭제
		&nbsp;
		<input type="checkbox" name="chk_food_process" value="N" <%="N".equals(param.getString("chk_food_process")) ? "checked" : "" %>/>
		식품공정용 도장삭제
		&nbsp;
		<input type="checkbox" name="chk_add_show" value="Y" <%="Y".equals(param.getString("chk_add_show")) ? "checked" : "" %>/>
		종합결과항목
		&nbsp;
		<input type="checkbox" name="chk_disp_fig" value="Y" <%="Y".equals(param.getString("chk_disp_fig")) ? "checked" : "" %>/>
		잔류물질 수치표시
		&nbsp;
			<br/>
			<br/>
		</div>
		<div class="mt10">
			<span style="float:left">
		</span>
		<span style="float:right">
			<a href="javascript: f_update()" class="btn grey f_left">확인</a>
			<a href="javascript: history.back(-1)" class="btn grey f_left">취소</a>
			<a href="javascript: f_print()" class="btn grey f_left">출력</a><br/><br/><br/>
		</span>
		<br style="clear:both"/>
	</div>



</div>
<!-- Global Wrapper.e -->
</form>
</body>
</html>