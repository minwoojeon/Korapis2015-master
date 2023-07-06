<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

BbsDao dao = new BbsDao();

MiceParam param1 = new MiceParam();
MiceParam param2 = new MiceParam();
MiceParam param3 = new MiceParam();
MiceParam param4 = new MiceParam();

String bflag = request.getParameter("bflag");

if(bflag==null){
	bflag="01";
}
param1.put("bflag", bflag);

param2.put("bflag", "10");

param3.put("bflag", "04");

param4.put("bflag", "05");

ResultSetEntity bbsList1 = dao.getBbsList(param1, 0, 5,true);
ResultSetEntity bbsList2 = dao.getBbsList(param2, 0, 5,false);
ResultSetEntity bbsList3 = dao.getBbsList(param3, 0, 5,false);
ResultSetEntity bbsList4 = dao.getBbsList(param4, 0, 5,false);

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
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>

<link rel="stylesheet" type="text/css" href="/slick/slick.css">
<link rel="stylesheet" type="text/css" href="/slick/slick-theme.css">
<script src="/slick/slick.min.js"></script>
<style type="text/css">
.popup-list {
	position:fixed;
	top:0;
	left:0;
	width:0px;
	height:0px;
	z-index:11;
}

.popup-item {
	position:absolute;
	top:50px;
	left:50px;
	padding:30px 15px 15px 15px;
	background-color:#fff;
	border:1px solid #ddd;
	box-shadow:0 4px 12px rgba(0,0,0,0.2);
}
.popup-item .btn-close {
	position:absolute;
	top:4px;
	right:4px;
	color:red;
	font-size:15px;
	line-height:1;
	font-weight:bold;
	text-decoration:none;
}
.popup-item iframe {
	display:block;
	width:300px;
	height:300px;
}
@media only screen and (max-width:960px) {
	.popup-item {
		left:10vw !important;
	}
	.popup-item iframe {
		max-width:calc(80vw - 30px);
		max-height:calc(80vh -  45px); 
	}
}
</style>
<script>

/*
	팝업 올리는 방법!!
	1. 팝업으로 사용할 html 파일을 jsp 폴더 안에 만듭니다. 예) popup_noticeXX.html
	2. 아래 var popup_ids = [ ... ]; 에 팝업의 이름(ID)를 추가합니다. 예) var popup_ids = [ ... , "popupXX" ];
	3. f_popup(id) 함수에 "popupXX" 를 구별하는  
*/


function f_popup(id){
	if(id == 'popup53'){
		layer_popup(
			'/jsp/pop_notice53.html',
			'popup53',
			{
				width: "450px",
				height: "380px"
			}
		);
	}
}
	
function layer_popup(url, popup_id, options){
	var $list = $(".popup-list");
	options = options || {};
	var top = options.top || 50;
	var left = options.left || 50;
	var width = options.width || 300;
	var height = options.height || 300;
	top = typeof top === 'number' ? top+"px" : top;
	left = typeof left === 'number' ? left+"px" : left;
	width = typeof width === 'number' ? width+"px" : width;
	height = typeof height === 'number' ? height+"px" : height;
	var zIndex = $list.find(".popup-item").length + 11;
	var $popup = $([
		'<div class="popup-item" id="popup-'+popup_id+'" style="top:'+top+';left:'+left+';z-index:'+zIndex+';">',
			'<div class="popup-item-inner">',
				'<a class="btn-close" href="javascript:void(0);" onclick="f_closePopup(\''+popup_id+'\')">닫기</a>',
				'<iframe src="'+url+'" style="width:'+width+';height:'+height+';" frameborder="0"></iframe>',
			'</div>',
		'</div>'
	].join(''));
	
	$list.append($popup);
}

function f_closePopup(popup_id){
	$("#popup-"+popup_id).remove();
}

// var popup_ids = ['popup48'];
var popup_ids = ['popup53']; // 팝업 여기에 넣어야함_위 주석 참고
 $(function(){
	 var ck = document.cookie;
		
	for(var i = 0; i < popup_ids.length; i++){
		 if(ck.indexOf(popup_ids[i]+"=Y")<0){
			f_popup(popup_ids[i])
		 }
	 }
 });


function main_bbs(cl){	
	$(".recent_list").hide();
	$("#"+cl).show();
	$(".boardTab > ul > li").removeClass("active");
	$("#"+cl+"_menu").addClass("active");
	   
 };

function f_goDetail(no,bflagIdx){
	
	var frm = document.forms.frmDetail;
	
	frm.selAction.value = "V";
	frm.no.value = no ;
	frm.bflag.value = bflagIdx;
	
	frm.target = "";
	frm.method = "get";
	frm.action = "/jsp/sub6-3_01.jsp";
	frm.submit();
}
 
function f_search(){
	
	//var code = $("#search_text").val();
	//var length = code.length;
	//var searchCode = code.substr(0,2)+"."+code.substr(2,length);
	//location.href = "/jsp/sub5-5.jsp?qrcd="+searchCode;
	
	var frm = document.forms.frmSearch;
	var qrcdTxt = $("#search_text").val();
	var number = qrcdTxt.replace(/[^0-9]/g,'');
	var category = qrcdTxt.replace(number, '');
	var qrcdValue = category+"."+number;
	
	frm.action = '/jsp/sub5-5.jsp';
	frm.method = 'post';
	frm.qrcd.value = qrcdValue;
	
	frm.submit();
	
}



</script>


<style>
	.sub_visual {display:none}
</style>
</head>
<body>
<form name="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="no" value=""/>
<input type="hidden" name="bflag" value=""/>
</form>
<div id="skipToContent" title="스킵네비게이션">
	<a href="#main_menu">메뉴 바로가기</a>
	<a href="#search">프로그램 검색 바로가기</a>
	<a href="#footer">카피라이터 바로가기</a>
</div>
<!-- wrap_main START -->
<div id="wrap_main">
	
	<!-- wrap START -->
	<div id="wrap">
	
		<jsp:include page="inc/header.jsp" />
		
		<!--   메인비주얼  START -->
		<div class="mainSlideArea">
			<div class="slideVisual">
				<div class="slide-item slide1"></div>
				<div class="slide-item slide2"></div>
				<div class="slide-item slide3"></div>
				<div class="slide-item slide4"></div>
			</div>
			<div class="mainVisual_quickArea">
				<div class="mainVisual_quickWrap">
					<%if(userInfo==null){ %>
						<a href="/jsp/sub7-2.jsp" class="btn1">회원가입</a>
					<%}else{ %>
						<a href="/jsp/sub8-1.jsp" class="btn1">내정보</a>
					<%} %>
					
					<a href="/jsp/sub8-2.jsp" class="btn2">납부확인</a>
				</div>
			</div>
		</div>
		<script>
			$('.slideVisual').slick({
				dots: true,
				infinite: true,
				speed: 300,
				fade: true,
				cssEase: 'linear',
				adaptiveHeight: true,
				mobileFirst: true,
				autoplay: true,
				autoplaySpeed: 5000,
				pauseOnFocus: false,
				pauseOnHover: false
			});
		</script>
		<!-- 메인비주얼 END -->
		

		<!-- contents START -->
		<div class="main_container">
			<div class="main_section1">
				<ul class="section1_btn_zone cle">
					<li><a class="btn1" href="/jsp/sub1-1.jsp">한국양봉협회</a></li>
					<li><a class="btn2" href="/jsp/sub2-1.jsp">협회활동</a></li>
					<li><a class="btn3" href="/jsp/sub3-1.jsp">양봉산업정보</a></li>
					<li><a class="btn4" href="/jsp/sub1-7.jsp">찾아오시는길</a></li>
					<li><a class="btn5" href="/jsp/sub6-1.jsp?bflag=02">홍보센터</a></li>
				</ul>
			</div>

			<div class="main_section2">
				<div id="bbsBox" class="boardArea mainBox">
					<div class="boardTab">
						<ul>
							<li id="korapis_notice_menu"  class="active">
								<a href="javascript:main_bbs('korapis_notice')" class="tab-button"  data-type="notice">공지사항</a>
								<a href="/jsp/sub6-3.jsp?bflag=01" class="btn_more"><span class=""><img src="/images/bbs_more.png" /></span></a>
							</li>
							<li id="korapis_news_menu" name="bflag=10">
								<a href="javascript:main_bbs('korapis_news');" class="tab-button" data-type="news">협회소식</a>
								<a href="/jsp/sub6-4.jsp?bflag=10" class="btn_more"><span class=""><img src="/images/bbs_more.png" /></span></a>
							</li>
							<li id="korapis_freeBoard_menu" name="bflag=05">
								<a href="javascript:main_bbs('korapis_freeBoard');" class="tab-button" data-type="news">자유게시판</a>
								<a href="/jsp/sub6-3.jsp?bflag=05" class="btn_more"><span class=""><img src="/images/bbs_more.png" /></span></a>
							</li>
							<li id="korapis_etc_board_menu" name="bflag=04">
								<a href="javascript:main_bbs('korapis_etc_board');" class="tab-button"  data-type="ect_board">종봉분양 및 판매</a>
								<a href="/jsp/sub6-3.jsp?bflag=04" class="btn_more"><span class=""><img src="/images/bbs_more.png" /></span></a>
							</li>
							<!--<li id="korapis_etc_board_menu" name="bflag=04">
								<a href="javascript:main_bbs('korapis_etc_board');" class="tab-button"  data-type="ect_board">홍보동영상</a>
								<a href="/jsp/sub6-3.jsp?bflag=04" class="btn_more"><span class=""><img src="/images/bbs_more.png" /></span></a>
							</li>-->
						</ul>

					</div>
					<div class="tab_content">
						<div id="korapis_notice" class="recent_list">
							<ul class="main_bbs">
								<%for(int i=0;i<4;i++) {
									bbsList1.next();
									%>          	
									<li>
										<a href="javascript:f_goDetail('<%=bbsList1.getString("bbs_idx")%>','01')">
											<strong class="title" name="bflag01"><%=bbsList1.getString("bbs_title") %></strong><span class="date"><%=bbsList1.getString("cdate").substring(2, Math.min(bbsList1.getString("cdate").length(), 10))%></span>
										</a>
									</li>				
								<%} %>
							</ul>
						</div>
						<div id="korapis_news" class="recent_list">
							<ul class="main_bbs">
								<%for(int i=0;i<4;i++) {
									bbsList2.next();
									%>          	
									<li>
										<a href="javascript:f_goDetail('<%=bbsList2.getString("bbs_idx")%>','10')">
											<strong class="title"><%=bbsList2.getString("bbs_title") %></strong><span class="date"><%=bbsList2.getString("cdate").substring(2, Math.min(bbsList1.getString("cdate").length(), 10))%></span>
										</a>
									</li>				
								<%} %>                        	
							</ul>
						</div>
						   <div id="korapis_freeBoard" class="recent_list">
							<ul class="main_bbs">
								<%for(int i=0;i<4;i++) {
									bbsList4.next();
									%>          	
									<li>
										<a href="javascript:f_goDetail('<%=bbsList4.getString("bbs_idx")%>','05')">
											<strong class="title"><%=bbsList4.getString("bbs_title") %></strong><span class="date"><%=bbsList4.getString("cdate").substring(2, Math.min(bbsList1.getString("cdate").length(), 10))%></span>
										</a>
									</li>				
								<%} %>                        	
							</ul>
						</div>
						<div id="korapis_etc_board" class="recent_list">
							<ul class="main_bbs">
								<%for(int i=0;i<4;i++) {
									bbsList3.next();
									%>          	
									<li>
										<a href="javascript:f_goDetail('<%=bbsList3.getString("bbs_idx")%>','04')">
											<strong class="title"><%=bbsList3.getString("bbs_title") %></strong><span class="date"><%=bbsList3.getString("cdate").substring(2, Math.min(bbsList1.getString("cdate").length(), 10))%></span>
										</a>
									</li>				
								<%} %>   
							</ul>
						</div>
					</div>
				</div>
				<div id="" class="mainVideoArea mainBox">
					<!-- <div>
						<iframe src="https://www.youtube.com/embed/BgILX851Z5Q?loop=1&playlist=mVBptLHws4s" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div> -->
					<div class="mainSchArea">
						<strong>한 벌꿀 생산이력 검색</strong>
						<div class="keywordArea">
							<form name="frmSearch">
								<input type="hidden" name="qrcd">
								<input type="text" id="search_text" value="">
								<button onclick="f_search()">검색</button>
							</form>
						</div>
						<div class="mainSchTxt">구입하신 제품의 뚜껑, 라벨에 부착된 한 일련번호를 검색창에 입력하시면 제품의 이력을 조회할 수 있습니다.</div>
						<a href="https://www.korapis.or.kr/jsp/sub5-4.jsp" class="mainSchLink">자세히보기</a>
					</div>
				</div>
			</div>
			
			<div class="main_section3">
				<ul>
					<li><a href="https://www.apimondia.org" target="_blink"><img src="/images/main_banner01.png" alt="Apimondia"/></a></li>
					<li><a href="http://www.mafra.go.kr" target="_blink"><img src="/images/main_banner03.png" alt="농립축산식품부"/></a></li>
					<li><a href="http://www.rda.go.kr" target="_blink"><img src="/images/main_banner04.png" alt="농촌진흥청"/></a></li>
					<li><a href="http://www.forest.go.kr" target="_blink"><img src="/images/main_banner05.png" alt="산림청"/></a></li>
					<!-- <li><a href="http://ubkkorea.com/" target="_blink"><img src="/images/main_banner07.png" alt="도시양봉지원사업"/></a></li>-->
					<li><a href="http://www.moleg.go.kr" target="_blink"><img src="/images/main_banner08.png" alt="법제처"/></a></li>
				</ul>
			</div>
		</div>
		<!--// contents END -->
	</div>
	<!--// wrap END -->
</div>
<!--// wrap_main END -->

<!-- main_footer START -->
<div class="main_footer">
	<!-- footer_copy START -->
	<div class="footer">
		<img src="/images/footer_logo.png" alt="organized by Kotra">
		
		<div class="footer_right">
			<div class="footer_link">
			   <a href="/jsp/sub7-4.jsp">저작권 정책</a>
			   <a href="/jsp/sub7-5.jsp">개인정보취급방침</a>
			   <a href="/jsp/sub7-6.jsp">이메일무단수집거부</a>
			   <a href="/jsp/sub1-7.jsp">찾아오시는길</a>
			</div>
	
			<address>
				<p>(06643)서울 특별시 서초구 서초중앙로 6길 9, 제2축산회관 4층 (지하철역 남부터미널역 1번출구)</p>
				<p>Tel 02-3486-0882, 0883, 0884, 0885 Fax 02-3486-0886 E-mail apiary@korapis.or.kr</p>
				<p class="copyright">Copyrightⓒkorapis.or.kr 한국양봉협회 2018 All Right Reserved.</p>
			</address>
		</div>
	</div>
	<!--// footer_q END -->
</div>
<!--// main_footer END -->

<div class="popup-list">

</div>


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
