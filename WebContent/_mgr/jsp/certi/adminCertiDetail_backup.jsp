<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.FunctionDao"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
MiceParam param = (MiceParam)request.getAttribute("param");
FunctionDao fDao = new FunctionDao();

ResultSetEntity d = (ResultSetEntity)request.getAttribute("dataDetail");


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

	if ( "O".equals(qury_mailreceive)){
		qury_addr = qury_offc_addr;
	}else{
		qury_addr = qury_home_addr;
	}

	
	datediff = d.getString("datediff");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">



function f_save(){
	if(confirm("회원정보를 수정하시겠습니까?")){
		var frm = document.forms.frmRegist;
		frm.method="post";
		frm.target="";
		frm.selAction.value = "modify";
		frm.action = "/memberList.do";
		
		frm.submit();
	}
}


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

<!-- Global Wrapper.s -->
<div id="wrap">
<!-- TNB.s -->
	<div id="tnb">
	
	</div>
<!-- TNB.e -->

<!-- Container.s -->
	<div id="container">

<!-- Content.s -->
		<div id="content">
		
<!-- 			<p class="cont_header bold">
				<span class="f_left">&nbsp;</span>
			</p> -->
			

			
				
			<div class="form_wrap" style="margin:50px 0;">
			
			        <p style="margin:0 0 20px 0; font-size:24px; text-align:center; font-weight:bold; color:#000000;">시 험 성 적 통 지 서</p>
			        <table width="725" class="form">
			          <tr>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>접수번호</strong></td>
			            <td align="center"><%=qury_regnum %></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>봉인번호</strong></td>
			            <td width="100" align="center">&nbsp;<%=qury_bongin %></td>
			            <td width="100" align="center" bgcolor="f4f4f4"><strong>접수일</strong></td>
			            <td align="center"><%=qury_recv_date %></td>
			          </tr>
			          <tr>
			            <td align="center" bgcolor="f4f4f4"><strong>의뢰자성명</strong></td>
			            <td align="center"><%=qury_name %></td>
			            <td align="center" bgcolor="f4f4f4"><strong>검체표시</strong></td>
			            <td colspan="3" align="center"><%=qury_prname %></td>
			          </tr>
			          <tr>
			            <td align="center" bgcolor="f4f4f4"><strong>주소</strong></td>
			            <td colspan="5" align="center"><%=qury_addr %></td>
			          </tr>
			          <tr>
			            <td align="center" bgcolor="f4f4f4"><strong>시험완료일</strong></td>
			            <td align="center"><%=qury_test_endd_date %></td>
			            <td align="center" bgcolor="f4f4f4"><strong>시험항목</strong></td>
			            <td colspan="3" align="center"><%=qury_rqst_prdt_name %></td>
			          </tr>
			        </table>
			        
			        
			        <p style="margin:20px 0; font-size:24px; text-align:center; font-weight:bold; color:#000000;">시 험 결 과</p>
			        <table width="725" class="form">
			          <tr>
			            <td width="120" height="40" align="center" bgcolor="f4f4f4">1.   성상</td>
			            <td width="100" align="center"><%=qury_sung_valu%><br /></td>
			            <td align="center" bgcolor="f4f4f4">5.자당<br />
			            (7.0%이하) </td>
			            <td width="100" align="center"><%=qury_ja_sgar %></td>
			            <td align="center" bgcolor="f4f4f4">9.타르색소</td>
			            <td width="100" align="center"><%=qury_tarr %></td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">2.수분(%)</td>
			            <td align="center"><%=qury_wter %></td>
			            <td align="center" bgcolor="f4f4f4">6.산도<br />
			            (40.0meq/kg이하) </td>
			            <td align="center"><%=qury_sando %></td>
			            <td align="center" bgcolor="f4f4f4">10.이성화당</td>
			            <td align="center"><%=qury_esung %></td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">3.물불용물<br />
			            (0.5%이하) </td>
			            <td align="center"><%=qury_hwoi %><br /></td>
			            <td align="center" bgcolor="f4f4f4">7.사카린나트륨</td>
			            <td align="center"><%=qury_gammoryo %></td>
			            <td align="center" bgcolor="f4f4f4">11.탄소동위원소</td>
			            <td align="center"><%=qury_c12 %></td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">4.전화당<br />
					        <%if("1".equals(datediff)){ %>
					        (60%이상)
					        <%}else{ %>
					        (65%이상)
					        <%} %>
			            </td>
			            <td align="center"><%=qury_june_sgar %></td>
			            <td align="center" bgcolor="f4f4f4">8.HMF<br />
			            (25/80mg/kg이하)</td>
			            <td align="center"><%=qury_hmf %></td>
			            <td align="center" bgcolor="f4f4f4">12.F/G</td>
			            <td align="center"><%=qury_fng %></td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" colspan="2" align="center">13.잔류물질 <%="".equals(qury_abtc) ? "" : "["+qury_abtc+"]" %></td>
			            <td align="center" bgcolor="f4f4f4">⑥네오마이신<br />
			            (100.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_NEOMA)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_NEOMA) > 100){
							%>
									검출<br/><%=qury_NEOMA %>
									<%}else{%>
									불검출<br/><%=qury_NEOMA %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			            </td>
			            <td align="center" bgcolor="f4f4f4">⑫브로모프로필레이트<br />
			            (50.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_BROMOP)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_BROMOP) > 50){
							%>
									검출<br/><%=qury_BROMOP %>
									<%}else{%>
									불검출<br/><%=qury_BROMOP %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
			            </td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">①클로람페니콜<br />
			            (불검출)</td>
			            <td align="center">
			            	<%if("".equals(qury_CRO)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_CRO) > 0){
							%>
									검출<br/><%=qury_CRO %>
									<%}else{%>
									불검출<br/><%=qury_CRO %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">⑦스트렙토마이신<br />
			            (100.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_STREPTO)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_STREPTO) > 100){
							%>
									검출<br/><%=qury_STREPTO %>
									<%}else{%>
									불검출<br/><%=qury_STREPTO %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">⑬시미아졸<br />
			            (50.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_SIMIAOZOL)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_SIMIAOZOL) > 50){
							%>
									검출<br/><%=qury_SIMIAOZOL %>
									<%}else{%>
									불검출<br/><%=qury_SIMIAOZOL %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">②니트로퓨란<br />
			            (불검출) </td>
			            <td align="center">
			            	<%if("".equals(qury_NITRO)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_NITRO) > 0){
							%>
									검출<br/><%=qury_NITRO %>
									<%}else{%>
									불검출<br/><%=qury_NITRO %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">⑧옥시테트라사이클린<br />
			            (300ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_OXITE)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_OXITE) > 300){
							%>
									검출<br/><%=qury_OXITE %>
									<%}else{%>
									불검출<br/><%=qury_OXITE %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">⑭쿠마포스<br />
			            (100.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_QUMAPOS)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_QUMAPOS) > 100){
							%>
									검출<br/><%=qury_QUMAPOS %>
									<%}else{%>
									불검출<br/><%=qury_QUMAPOS %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">③설폰아마이드<br />
			            (30.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_CERPON)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_CERPON) > 30){
							%>
									검출<br/><%=qury_CERPON %>
									<%}else{%>
									불검출<br/><%=qury_CERPON %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
						
			            <td align="center" bgcolor="f4f4f4">⑨테트라사이클린<br />
			            (30.0ppb이하) </td>
			            <td align="center">
			            	<%if("".equals(qury_TETRASA)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_TETRASA) > 30){
							%>
									검출<br/><%=qury_TETRASA %>
									<%}else{%>
									불검출<br/><%=qury_TETRASA %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">⑮아미트라즈<br />
			            (200.ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_AMITRAZ)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_AMITRAZ) > 200){
							%>
									검출<br/><%=qury_AMITRAZ %>
									<%}else{%>
									불검출<br/><%=qury_AMITRAZ %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">④매크로라이드<br />
			            (30.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_MECRO)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_MECRO) > 30){
							%>
									검출<br/><%=qury_MECRO %>
									<%}else{%>
									불검출<br/><%=qury_MECRO %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">⑩퀴놀론<br />
			            (30.0ppb이하) </td>
			            <td align="center">
			            	<%if("".equals(qury_QUENOL1)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_QUENOL1) > 30){
							%>
									검출<br/><%=qury_QUENOL1 %>
									<%}else{%>
									불검출<br/><%=qury_QUENOL1 %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">16 플루바리테이트<br />
			            (50.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_PLUBA)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_PLUBA) > 50){
							%>
									검출<br/><%=qury_PLUBA %>
									<%}else{%>
									불검출<br/><%=qury_PLUBA %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">⑤베타락탐<br />
			            (30.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_BETARA)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_BETARA) > 30){
							%>
									검출<br/><%=qury_BETARA %>
									<%}else{%>
									불검출<br/><%=qury_BETARA %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">⑪퀴놀론2<br />
			            (30.0ppb이하)</td>
			            <td align="center">
			            	<%if("".equals(qury_QUENOL2)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_QUENOL2) > 30){
							%>
									검출<br/><%=qury_QUENOL2 %>
									<%}else{%>
									불검출<br/><%=qury_QUENOL2 %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td align="center" bgcolor="f4f4f4">17 플루메쓰린<br />
			            (10.0ppb이하)<br /></td>
			            <td align="center">
			            	<%if("".equals(qury_PLUME)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_PLUME) > 10){
							%>
									검출<br/><%=qury_PLUME %>
									<%}else{%>
									불검출<br/><%=qury_PLUME %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			          </tr>
			          <tr>
			            <td align="center" bgcolor="f4f4f4">18 그레이아노톡신<br />
			            (불검출)</td>
			            <td align="center">
			            	<%if("".equals(qury_GRAYANO)){ %>
			            	<%}else{
			            		try{
			            			if(Integer.parseInt(qury_GRAYANO) > 0){
							%>
									검출<br/><%=qury_GRAYANO %>
									<%}else{%>
									불검출<br/><%=qury_GRAYANO %>
							<%			
									}
			            		}catch(Exception e){}
							} %>
						</td>
			            <td bgcolor="f4f4f4" align="center">* 기 타</td>
			            <td colspan="3" align="center"><%=qury_gita %></td>
			          </tr>
			          <tr>
			            <td bgcolor="f4f4f4" height="40" align="center">■ 판 정</td>
			            <td align="center"><%=qury_test_rslt %></td>
			            <td colspan="4" align="center" bgcolor="f4f4f4">* 본 성적서는 의뢰시료에 한하며, 복사하여 영업목적에   사용할 수 없음.</td>
			          </tr>
			        </table>
			        <p style="margin:20px 0; font-size:18px; text-align:center; font-weight:bold; color:#000000;">상기와 같이 시험결과를 통지합니다.</p>
			      	<p style="margin:20px 0; font-size:12px; text-align:center; font-weight:bold; color:#000000;">
			      		<%=DateC.getCurrentYYYY() %>년 <%=DateC.getCurrentMM() %>월 <%=DateC.getCurrentDD() %>일
					</p>
			      	<div style="text-align:center">
		          		<span style="font-size:11px; font-weight:bold; color:#000000;line-heith:20px">
		          			사단<br/>법인
		          		</span>
		          		<span style="font-size:24px; font-weight:bold; color:#000000; line-height:40px">&nbsp;한 국 양 봉 협 회</span>
			      	</div>      
			</div>



			
			<div class="mt10">
				<span style="float:left">
				</span>
			
				<span style="float:right">
					<a href="javascript: history.back(-1)" class="btn grey f_right">취소</a>
					<a href="javascript: alert('준비중입니다')" class="btn grey f_right">출력</a>
				</span>
				<br style="clear:both"/>
			</div>
			
			
			
		</div>
<!-- Content.e -->

<!-- Footer.s -->
		<div id="footer">
		</div>
<!-- Footer.e -->
	
	</div>
<!-- Container.e -->

</div>
<!-- Global Wrapper.e -->
</body>
</html>