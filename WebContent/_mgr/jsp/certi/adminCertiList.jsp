<%@page import="java.util.HashMap"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
MiceParam param = (MiceParam)request.getAttribute("param");

ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");
SelectBoxDao boxDao = new SelectBoxDao();


UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

String [] chkbox = request.getParameterValues("checkbox_no");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">


$(function(){
    //전체선택 체크박스 클릭
	$("#allCheck").click(function(){
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#allCheck").prop("checked")) {
			//해당화면에 전체 checkbox들을 체크해준다
			$(".checkbox_no").prop("checked",true);
			$("#checkedCount").text($(".checkbox_no:checked").length);
		// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$(".checkbox_no").prop("checked",false);
			$("#checkedCount").text($(".checkbox_no:checked").length);
		}
	})
});

$(function(){
	$(".checkbox_no").change(function(){	
		$("#checkedCount").text($(".checkbox_no:checked").length);
	});
})
	//이름 클릭 시 팝업으로 상세화면 띄우기
	function  f_detailuser(i_muid){
		var top = 30;
		var left = screen.availWidth/2 - 180;
		
		var p1 = window.open("/adminMember.do?selAction=detail_popup&uid="+i_muid,"pop_detailmember","top="+top+",left="+left+",status=no,width=650,height=600");
		p1.focus();
	}
	$(function(){
		$(".searchinput").on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				f_search();
			}
		});
		
		
		
		$("#sel_test_endd_date_from").datepicker({changeYear:true});
		$("#sel_test_endd_date_from").datepicker("option", "dateFormat", "yymmdd");
		$("#sel_test_endd_date_from").datepicker("option", "yearRange", "-10:+0");
		$("#sel_test_endd_date_from").datepicker("setDate", "<%=param.getString("sel_test_endd_date_from") %>");
		
		$("#sel_test_endd_date_to").datepicker({changeYear:true});
		$("#sel_test_endd_date_to").datepicker("option", "dateFormat", "yymmdd");
		$("#sel_test_endd_date_to").datepicker("option", "yearRange", "-10:+0");
		$("#sel_test_endd_date_to").datepicker("setDate", "<%=param.getString("sel_test_endd_date_to") %>");
	});

	//페이징.
	function f_goPage(no){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		frm.selPageNo.value = no;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminCerti.do";
		frm.submit();
	}
	
	


	//검색조건 초기화
	function f_reset(){
	
		$("#sel_issuenum").val("");
		$("#sel_regnum_from").val("");
		$("#sel_regnum_to").val("");
		$("#sel_name").val("");
		$("#sel_uripoomname").val("");
		$("#sel_test_endd_date_from").val("");
		$("#sel_test_endd_date_to").val("");
		$("#test_endd_date_from").val("");
		$("#test_endd_date_to").val("");

		$("#sel_bongin_from").val("");
		$("#sel_bongin_to").val("");
		$("#sel_rqst_prdt_name").val("");
		$("#sel_member_code").val("");
		$("#sel_test_rslt").val("");
		
		$("#selPageNo").val("1");
		f_search();
	}
	
	
	
	
	
	
	//상세화면 이동
	function f_detail(i_uid){
		var frm = document.forms.frmList;
		frm.selAction.value = "detail";
		frm.uid.value = i_uid;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminCerti.do";
		frm.submit();
	}
	
	
	
	
	//검색
	function f_search(){
		var frm = document.forms.frmList;
		
		if($("#sel_bongin_from").val()=="" && !$("#sel_bongin_to").val()=="" ){
		
			alert('시작번호 항목에 검색할 봉인번호를 입력하세요');
			return false;
		
		}else if($("#sel_regnum_from").val()=="" && !$("#sel_regnum_to").val()=="" ){
		
			alert('시작번호 항목에 검색할 접수번호를 입력하세요');
			return false;
		
		}else if($("#sel_test_endd_date_from").val()=="" && !$("#sel_test_endd_date_to").val()=="" ){
		
			alert('시작번호 항목에 검색할 시험완료일을 입력하세요');
			return false;
		
		}
		

		
		
		frm.selAction.value = "V";
		frm.selPageNo.value = "1";
		
		frm.target = "";
		frm.method = "get";
		frm.action = "/adminCerti.do";
		frm.submit();	
	}
	
	
	//성적서 삭제
	function f_goDel(){
		var idx = "0";
		var idx1 = "0";
		
		var chkbox = document.getElementsByName("checkbox_no");
		var chkbox1 = document.getElementsByName("regnum_no");
		
		for(var i=0; i<chkbox.length; i++){
			if(chkbox[i].checked){			
				idx += ","+ chkbox[i].value;
				idx1 += ","+chkbox1[i].value;
			}		
		}
		if(idx == "0"){
			alert("삭제할 성적서를 선택해 주십시요.");		
		} else {
			var frm = document.forms.frmList;
			if(confirm("선택된 성적서를 삭제하시겠습니까?")){
				frm.selAction.value = "del_board_chk";
				
				//frm.BOARD_IDX.value = i_boardIdx;
				frm.target = "";
				frm.method = "post";
				frm.regnum.value = idx1;
				frm.no.value = idx;
				frm.action = "/adminCerti.do";
				frm.submit();
			} 
		}
	}
	
	
	//PDF다운로드
	function f_print(NoIdx, subGubun){
		
		
			if(subGubun == "PDF"){
				
				var frm = document.forms.frmList;
				frm.selAction.value = "PDF";
				frm.uid.value = NoIdx;
				frm.subSelAction.value = subGubun;
				
				
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
				
				
			}else{
			
				//검색수가 300건보다 많다면 다운로드를 할수없다.
				<%if(pagesVo.getTotalRows() > 300){%>	
					
				
					var idx = "'0'";
					var chkbox = document.getElementsByName("checkbox_no");
					for(var i=0; i<chkbox.length; i++){
						if(chkbox[i].checked){			
							idx += ",'"+ chkbox[i].value+"'";
						}		
					}
				
					if(idx == "0"){
						alert("검색된 결과수 가 너무 많습니다.\n최대 300건 까지 가능합니다.\n현재 건수 :"+<%=pagesVo.getTotalRows()%>+" 건");
						return;
						
					} else {
						
						//체크박스 선택했을경우에.
						if(confirm("선택한 건수에 비례하여 로딩 시간이 길어 질 수 있습니다.\n다운로드 하시겠습니까?")){
							var frm = document.forms.frmList;
							//frm.selAction.value = "timetable_pdf_all";
							
							frm.selAction.value = "PDF";
							frm.uid.value = NoIdx;
							frm.subSelAction.value = subGubun;
							frm.no.value = idx;
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
							
							var btn = $("#download_pdf");
							btn.attr("href","javascript:;").html('<img src="/_mgr/image/progress-bar.gif" alt="PDF 합성 중" />');
							
							$.ajax("/Json.do",{
								type:"post",
								dataType:"json",
								data:$(frm).serialize(),
								success:function(d){
									if(d.result == "success"){
										var filename = d.filename;
										frm.action="/adminCerti.do";
										frm.target="hidFrame";
										frm.selAction.value="PDF_ALL";
										var input = document.createElement("input");
										input.name="filename";
										input.value=filename;
										frm.appendChild(input);
										frm.submit();
										frm.removeChild(input);
										var btn = $("#download_pdf");
										btn.attr("href","javascript:f_print('0', 'PDF_ALL')").html('시간표 PDF');
									}else{
										alert("파일 합성에 오류가 발생하였습니다.");
										var btn = $("#download_pdf");
										btn.attr("href","javascript:f_print('0', 'PDF_ALL')").html('시간표 PDF');
									}
								}
							});
						}
					}
				
				
				 	
				 	
				 
				<%}else if(pagesVo.getTotalRows() <= 0){%>	
				
					alert("검색된 결과가 존재하지않습니다.\n최소 1건부터 최대 300건까지 다운로드 가능합니다.");
				 	return false;
					
				<%}else{%>
				
					if(confirm("검색 건수에 비례하여 로딩 시간이 길어 질 수 있습니다.\n다운로드 하시겠습니까?")){
						var frm = document.forms.frmList;
						
						
						var idx = "'0'";
						var chkbox = document.getElementsByName("checkbox_no");
						for(var i=0; i<chkbox.length; i++){
							if(chkbox[i].checked){			
								idx += ",'"+ chkbox[i].value+"'";
							}		
						}
						//frm.selAction.value = "timetable_pdf_all";
						frm.no.value = idx;
						frm.selAction.value = "PDF";
						frm.uid.value = NoIdx;
						frm.subSelAction.value = subGubun;
						
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
						
						var btn = $("#download_pdf");
						btn.attr("href","javascript:;").html('<img src="/_mgr/image/progress-bar.gif" alt="PDF 합성 중" />');
						
						$.ajax("/Json.do",{
							type:"post",
							dataType:"json",
							data:$(frm).serialize(),
							success:function(d){
								if(d.result == "success"){
									var filename = d.filename;
									frm.action="/adminCerti.do";
									frm.target="hidFrame";
									frm.selAction.value="PDF_ALL";
									var input = document.createElement("input");
									input.name="filename";
									input.value=filename;
									frm.appendChild(input);
									frm.submit();
									frm.removeChild(input);
									var btn = $("#download_pdf");
									btn.attr("href","javascript:f_print('0', 'PDF_ALL')").html('시간표 PDF');
								}else{
									alert("파일 합성에 오류가 발생하였습니다.");
									var btn = $("#download_pdf");
									btn.attr("href","javascript:f_print('0', 'PDF_ALL')").html('시간표 PDF');
								}
							}
						});
					}
				<%}%>
			}
	}
	

function f_senddm(){
	var idx = '0';
	var chkbox = document.getElementsByName("checkbox_no");
	for(var i=0; i<chkbox.length; i++){
		if(chkbox[i].checked){			
			idx += ",'"+ chkbox[i].value+"'";
		}else{
			idx = "";
		}
		
	}
	window.open('/jsp/common/pageLoading.html', 'TEST_DMSEND', 'scrollbars=yes,top=100px,left=200px,width=700px,height=500px');

	var frm = document.forms.frmList;

	frm.selAction.value = "TEST_DMSEND";
	frm.test.value = "Y";
	//frm.CFAIR_IDX.value = i_corpIdx;
	frm.no.value = idx;
	frm.method = "post";
	frm.target = "TEST_DMSEND";
	frm.action = "/adminMember.do";
	frm.submit();

};
</script>


</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
</form>
<!-- 공통폼 E. -->
<form name="frmDetail" id="frmDetail" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="uid" id="uid" value=""/>
<input type="hidden" name="list_gubun" id="list_gubun" value=""/>
<input type="hidden" name="price_action" id="price_action" value=""/>
<input type="hidden" name="price_memberuid" 	id="price_memberuid" value=""/>
<input type="hidden" name="price_uid" 	id="price_uid" value=""/>
<input type="hidden" name="price_gubun" id="price_gubun" value=""/>
<input type="hidden" name="price_paydate" id="price_paydate" value=""/>
<input type="hidden" name="price_pay" 	id="price_pay" value=""/>
<input type="hidden" name="price_price" id="price_price" value=""/>

</form>

<iframe name="hidFrame" style="display:none"></iframe>


<!-- Global Wrapper.s -->
<div id="wrap">
<!-- TNB.s -->
	<div id="tnb">
	
	</div>
<!-- TNB.e -->

<!-- Container.s -->
	<div id="container">

<!-- Content.s -->
		<div id="content" style="min-width:1050px">
		
			<p class="cont_header bold">
				<span class="f_left">시험성적 목록</span>
				<span class="f_right">총 <%=pagesVo.getTotalRows() %></span>
			</p>
			
			

<!-- 검색엔진 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->			
						
									
			<div class="search_form">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="" />
				<input type="hidden" name="uid" value="" />
				<input type="hidden" name="regnum" value="" />
				<input type="hidden" name="chk_disp" value="" />
				<input type="hidden" name="chk_add" value="" />
				<input type="hidden" name="chk_food" value="" />
				<input type="hidden" name="chk_reference" value="" />
				<input type="hidden" name="subSelAction" value="" />
				<input type="hidden" name="no" value="" />
				<input type="hidden" name="test" value="" />
				
				
				
				<div>
		
					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">발급번호:</span>
						<input type="text" class="searchinput" style="width:152px;" name="sel_issuenum" id="sel_issuenum" value="<%=param.getString("sel_issuenum") %>"  maxlength="8"/>
					
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">봉인번호:</span>
						<input type="text" class="searchinput" style="width:65px;" name="sel_bongin_from" id="sel_bongin_from" value="<%=param.getString("sel_bongin_from") %>"/>
						~ <input type="text" class="searchinput" style="width:65px;" name="sel_bongin_to" id="sel_bongin_to" value="<%=param.getString("sel_bongin_to") %>"/>
						<input type="hidden" class="searchinput" style="width:65px;" name="sel_bongin_single" id="sel_bongin_single" value="<%=param.getString("sel_bongin_single") %>"/>
						
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">성명:</span>
						<input type="text" class="searchinput" style="width:100px; ime-mode:active;" name="sel_name" value="<%=param.getString("sel_name") %>"/>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">검체표시:</span>
						<input type="text" class="searchinput" style="width:100px; ime-mode:active;" name="sel_uripoomname" value="<%=param.getString("sel_uripoomname") %>"/>
					</div>
					
					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">시험완료일:</span>
						<input type="text" style="width:65px;" name="sel_test_endd_date_from" id="sel_test_endd_date_from" value="<%=param.getString("sel_test_endd_date_from") %>"  maxlength="8"/>
						~ <input type="text" style="width:65px;" name="sel_test_endd_date_to" id="sel_test_endd_date_to" value="<%=param.getString("sel_test_endd_date_to") %>"  maxlength="8"/>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">접수번호:</span>
						<input type="text" class="searchinput" style="width:65px;" name="sel_regnum_from" id="sel_regnum_from" value="<%=param.getString("sel_regnum_from") %>"/>
						~ <input type="text" class="searchinput" style="width:65px;" name="sel_regnum_to" id="sel_regnum_to" value="<%=param.getString("sel_regnum_to") %>"/>
											
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">시험항목:</span>
						<input type="text" class="searchinput" style="width:100px; ime-mode:active;" name="sel_rqst_prdt_name" id="sel_rqst_prdt_name" value="<%=param.getString("sel_rqst_prdt_name") %>" />
					</div>
					
					<div class="search_input">
					<!-- 
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">협회코드:</span>
						<input type="text" class="searchinput" style="width:152px;" name="sel_member_code" id="sel_member_code" value="<%=param.getString("sel_member_code") %>"  maxlength="8"/>
					 -->
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">판정여부</span>
						<select name="sel_test_rslt" id="sel_test_rslt" style="" onchange="f_search()">
							<option value="">= 전체 =</option>
							<option value="적합" <%="적합".equals(param.getString("sel_test_rslt")) ? "selected" : "" %>>적합</option>
							<option value="부적합" <%="부적합".equals(param.getString("sel_test_rslt")) ? "selected" : "" %>>부적합</option>
						</select>
						
						<span style="text-align:right; display:inline-block; padding-left:20px; width:200px">
						<a href="javascript: f_search()" class="btn grey">검색</a>
						<a href="javascript: f_reset()" class="btn grey">검색조건 초기화</a>
						</span>
						<span style="float: right;"><a href="javascript: f_senddm()" class="btn grey">DM발송</a></span>
						<span style="float: right;"><a href="javascript: f_goDel()" class="btn grey">성적서 삭제</a></span>
					</div>
										
										
					
					
					
					<div class="f_right">
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
						→
						<span style="float: right;"><a href="javascript: f_print('0', 'PDF_ALL')" class="btn grey" id="download_pdf">인쇄</a></span>
					</div>
					
					
					
					
					<br style="clear:both;" />
				</div>
				
				
				
				
				
				</form>
			</div>			
<!-- 검색엔진 END -->		
			
			<div class="list_wrap">
				<table class="list rowhover" style="table-layout: fixed;">
				
					<tr>
						<th><p id="checkedCount"></p><input type="checkbox" id="allCheck" name="allCheck" value=""/></th>
						<th>의뢰자</th>
						<th>시험항목</th>
						<th>시험완료일</th>
						<th>검체표시</th>
						<th>접수번호</th>
						<th>봉인번호</th>
						<th>수분</th>
						<th>전화당</th>
						<th>자당</th>
						<th>당비율</th>
						<th>H.M.F</th>
						<th>탄소동위원소비</th>
						<th>기준 초과 항목</th>
						<th>등급판정</th>
						<th>인쇄</th>
					</tr>
						
					<%
					Map<String,Integer> standard = new HashMap<String,Integer>();
					standard.put("수분", 20);
					standard.put("자당", 7);
					standard.put("HMF", 7);
	
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
						String overList = "";
						
						if(Double.parseDouble(dataList.getString("수분","0"))>20){
							overList += "수분 ";
						}
						if(Double.parseDouble(dataList.getString("전화당","0"))<60){		
							overList += "전화당 ";
						}
						if(dataList.getInt("자당")>7){
							overList += "자당 ";
						}
						if(dataList.getInt("HMF")>80){
							overList += "H.M.F ";
						}
						String regnumCnt = "("+dataList.getString("접수번호 수")+")";
						if("".equals(dataList.getString("접수번호 수"))||Integer.parseInt(dataList.getString("접수번호 수"))<1){
							regnumCnt = "";
							
							
						
						}
					%>
					<tr>
						<td class="first ta_center">
							<input type="checkbox" class="checkbox_no" name="checkbox_no" value="<%=dataList.getString("NO") %>"/>
							<input type="hidden" class="checkbox_no" name="regnum_no" value="<%=dataList.getString("접수번호") %>"/>
						</td>
						<td class="ta_center">
							<span onclick="javascript: f_detailuser('<%=dataList.getString("member_uid") %>')" style="text-decoration:underline"><%=dataList.getString("성명") %></span>
						</td>
						<%-- <td class="ta_center"><%=dataList.getString("sel_issuenum") %></td> --%>
						<td class="ta_center"><%=dataList.getString("시험항목") %></td>
						<td class="ta_center"><%=dataList.getString("시험완료일") %></td>
						<td class="ta_center"><%=dataList.getString("검체표시") %></td>
						<td class="ta_center">
							<span onclick="javascript: f_detail('<%=dataList.getString("NO") %>')" style="text-decoration:underline"><%=dataList.getString("접수번호") %><%=regnumCnt %></span>
						</td>
						<td class="ta_center"><%=dataList.getString("봉인번호") %></td>
						<td class="ta_center"><%=dataList.getString("수분") %></td>
						<%-- <td class="ta_center"><%=dataList.getString("member_code") %></td> --%>
						<td class="ta_center"><%=dataList.getString("전화당") %></td>
						<td class="ta_center"><%=dataList.getString("자당") %></td>
						<td class="ta_center"><%=dataList.getString("F/G") %></td>
						<td class="ta_center"><%=dataList.getString("HMF") %></td>
						<td class="ta_center"><%=dataList.getString("탄소동위원소") %></td>
						<td class="ta_center"><%=overList %></td>
						<td class="ta_center"><%=dataList.getString("등급판정") %></td>
						<td class="last ta_center"><a href="javascript: f_print('<%=dataList.getString("NO") %>', 'PDF')" class="btn grey">인쇄 (<%=dataList.getString("한벌꿀") %>)</a></td>
					</tr>					
					<%
					}
					%>
				</table>
				
				<div class="page">
					<%=pagesVo.getPageHtml() %>				
				</div>
			
			</div>
			
			<div class="mt10">
				&nbsp;
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