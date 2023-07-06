<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String gubun = request.getParameter("gubun");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도로명 주소 검색</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/popup.css">
<script type="text/javascript" src="/_mgr/js/jquery-latest.min.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">
$(function(){
	var frm = document.forms.form;
	$(frm.keyword).on("keydown",function(e){
		if(e.which == 13){
			e.preventDefault();
			f_search();
			//$("#id_currentPage").val("1");
			//getAddr();	
		}
	});
});

function f_search(){
	$("#id_currentPage").val("1");
	getAddr();	
}

/**
 * 주소검색
 요청:
	 cu	rrentPage=1			//현재 페이지 번호
	 &countPerPage = 10	//페이지당 항목 수
	 &confmKey=승인키
	 &keyword=검색어
 
 응답:
 <results>
	<common>
		<totalCount>110</totalCount>
		<currentPage>1</currentPage>
		<countPerPage>10</countPerPage>
		<errorCode>0</errorCode>
		<errorMessage>정상</errorMessage>
	</common>
	<juso>
		<roadAddr>
<![CDATA[ 서울특별시 서초구 강남대로12길 6 (양재동) ]]>
		</roadAddr>
		<roadAddrPart1>
<![CDATA[ 서울특별시 서초구 강남대로12길 6 ]]>
		</roadAddrPart1>
		<roadAddrPart2>
<![CDATA[ (양재동) ]]>
		</roadAddrPart2>
		<jibunAddr>
<![CDATA[ 서울특별시 서초구 양재동 326-1 ]]>
		</jibunAddr>
		<engAddr>
<![CDATA[ 6, Gangnam-daero 12-gil, Seocho-gu, Seoul ]]>
		</engAddr>
		<zipNo>
<![CDATA[ 137-897 ]]>
		</zipNo>
		<admCd>
<![CDATA[ 1165010200 ]]>
		</admCd>
		<rnMgtSn>
<![CDATA[ 116504163008 ]]>
		</rnMgtSn>
		<bdMgtSn>
<![CDATA[ 1165010200103260001002677 ]]>
		</bdMgtSn>
	</juso>
 */
function getAddr(){
	$.ajax({
		 url :"https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(xmlStr){
			var xmlData = null;
			if(navigator.appName.indexOf("Microsoft") > -1){
				xmlData = new ActiveXObject("Microsoft.XMLDOM");
				xmlData.loadXML(xmlStr.returnXml);
			}else{
				xmlData = xmlStr.returnXml;
			}
			$("#list").html("");		
			var errCode = $(xmlData).find("errorCode").text();
			var errDesc = $(xmlData).find("errorMessage").text();
			if(errCode != "0"){
				alert(errCode+"="+errDesc);
			}else{
				if(xmlStr != null){
					makeList(xmlData);	//주소 목록 및 페이징 생성
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

/**
 * 주소 목록 및 페이지 생성 함수
 * @parame String xmlStr		//xml 문서 문자열
 */
function makeList(xmlStr){
	var frm = document.forms.form;
	var xmlobj = $(xmlStr);
	var htmlStr = "";
	
	if(!xmlobj.find("juso").length){
		//검색된 주소가 없을때
		htmlStr = '<tr><td colspan="4" class="first last ta_center">검색어를 입력하고 [검색] 버튼을 누르세요.</td></tr>';
		
	}else{
		xmlobj.find("juso").each(function(i){
			var $that = $(this);
			htmlStr += "<tr>";
			htmlStr += "<td class='first ta_center'>"+((parseInt(frm.currentPage.value)-1)*parseInt(frm.countPerPage.value)+i+1)+"</td>";
			htmlStr += "<td onclick='f_select(\""+i+"\")' style='cursor:pointer'><strong class='road_addr_part1'>"+$that.find('roadAddrPart1').text()+"</strong> <strong class='road_addr_part2'>"+$that.find("roadAddrPart2").text()+"</strong><br/><span>[지번주소] ";
			htmlStr += $that.find('jibunAddr').text()+"</span></td>";
			htmlStr += "<td class='ta_center zip_no'>"+$that.find('zipNo').text()+"</td>";
			htmlStr += "<td class='last ta_center'><input type='radio' onclick='f_select(\""+i+"\")' /></td>";
			htmlStr += "</tr>";
		});
	}
	$("#list").html(htmlStr);
	
	//페이징
	var page = $("#page");
	page.html('');
	htmlStr = '';
	var cur = xmlobj.find("common currentPage").text()-0 || 1;	//현재페이지
	var total = xmlobj.find("common totalCount").text()-0 || 0;	//총 검색된 개수
	var start = cur-(cur-1)%10;	//시작번호
	var last = start+Math.min(9, Math.floor(((total-1)-(start-1)*10)/10) );		//시작번호+9
	last = last <= 0 ? 1 : last;
	if(cur != 1) htmlStr += '<a href="javascript:f_goPage(1)"><img src="/images/btn/btn_first.png" /></a>';
	if(start != 1) htmlStr += '<a href="javascript:f_goPage('+(start-1)+')"><img src="/images/btn/btn_prev.png" /></a>';
	while(last - start >= 0){
		if( start == cur ) htmlStr += '<strong>'+(start++)+'</strong>';
		else htmlStr += '<a href="javascript:f_goPage('+start+')">'+(start++)+'</a>';
		if(start-1 != last){
			 htmlStr += '&nbsp;/&nbsp;'; 
		}
	}
	if(last < Math.ceil(total/10)) htmlStr += '<a href="javascript:f_goPage('+(last+1)+')"><img src="/images/btn/btn_next.png" /></a>';
	if(cur != Math.ceil(total/10)) htmlStr += '<a href="javascript:f_goPage('+Math.ceil(total/10)+')"><img src="/images/btn/btn_last.png" /></a>';
	page.html(htmlStr);
}

//주소에 라디오 버튼 선택할 때 (팝업을 연 페이지에 f_addressCallback 함수를 등록해야 한다.)
function f_select(n){
	var tr = $("#list").find("tr").eq(n);
	opener.f_addressCallback('<%=gubun %>', tr.find(".road_addr_part1").text(), tr.find(".road_addr_part2").text(), tr.find(".zip_no").text());
	f_close();
}

function f_goPage(n){
	var frm = document.forms.form;
	frm.currentPage.value = n;
	getAddr();
}

function f_close(){
	window.close();
}

</script>
</head>
<body>
	<div id="header">
		<h2 class="title">도로명 주소 검색</h2>
		<a href="javascript:f_close()" title="Close Popup" class="btn_close"><img src="/_mgr/image/btn_close.gif" /></a>
	</div>
	
	<div id="content">
		<form id="form" name="form" method="post" style="position:relative;">
			<input type="hidden" name="currentPage" id="id_currentPage" value="1" />
			<input type="hidden" name="countPerPage" value="10" />
			<input type="hidden" name="confmKey" id="confmKey" value="U01TX0FVVEgyMDE1MDIyNDA5MjU1NQ==" />
			
			<input type="text" name="keyword" value="" style="box-sizing:border-box; width:100%;padding-right:50px; ime-mode:active;" />
			<a href="javascript:void(0);" onclick="f_search()" class="btn grey" style="position:absolute;top:0;right:0;margin:0;">검색</a>
		</form>
		<p style="margin:5px 0;"><strong>*검색어 예: </strong><span>지번(삼성동 25), 건물명(독립기념관), 도로명(반포대로 58)</span></p>
		
		<div style="background-color:#fff;margin-top:10px;">
			<table class="list rowhover">
				<thead>
					<tr>
						<th>No</th>
						<th>도로명주소</th>
						<th>우편번호</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody id="list">
					<tr>
						<td colspan="4" class="first last ta_center">검색어를 입력하고 [검색] 버튼을 누르세요.</td>
					</tr>
				</tbody>
			</table>
			
			<div id="page" class="page">
				<strong>1</strong>
			</div>
		</div>
	</div>
</body>
</html>