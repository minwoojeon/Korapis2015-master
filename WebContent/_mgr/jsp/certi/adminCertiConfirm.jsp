<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
MiceParam param = (MiceParam)request.getAttribute("param");

ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");
SelectBoxDao boxDao = new SelectBoxDao();


UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");


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
		$("input[name='searchText']").on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				f_search();
			}
		});
		
		$("#sel_recv_date_from").datepicker({changeYear:true});
		$("#sel_recv_date_from").datepicker("option", "dateFormat", "yymmdd");
		$("#sel_recv_date_from").datepicker("option", "yearRange", "-10:+0");
		$("#sel_recv_date_from").datepicker("setDate", "<%=param.getString("sel_recv_date_from") %>");
		
		$("#sel_recv_date_to").datepicker({changeYear:true});
		$("#sel_recv_date_to").datepicker("option", "dateFormat", "yymmdd");
		$("#sel_recv_date_to").datepicker("option", "yearRange", "-10:+0");
		$("#sel_recv_date_to").datepicker("setDate", "<%=param.getString("sel_recv_date_to") %>");
		
		
		
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
		$("#sel_recv_date_from").val("");
		$("#sel_recv_date_to").val("");
		$("#sel_regnum_from").val("");
		$("#sel_regnum_to").val("");
		$("#sel_name").val("");
		$("#sel_uripoomname").val("");
		$("#sel_test_endd_date_from").val("");
		$("#test_endd_date_to").val("");
		$("#sel_recv_date_from").val("");

		$("#sel_bongin_from").val("");
		$("#sel_bongin_to").val("");
		$("#sel_rqst_prdt_name").val("");
		$("#sel_uid_from").val("");
		$("#sel_uid_to").val("");
		$("#sel_test_rslt").val("");
		$("#sel_han").val("");
		
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
		
		frm.selAction.value = "V";
		frm.selPageNo.value = "1";
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminCerti.do";
		frm.submit();	
	}
	
	//엑셀다운로드
	function f_print_all(){
		alert("준비중입니다. ");
		return false;
		
		/* var frm = document.forms.frmList;
		frm.selAction.value = "XLS";
		frm.target = "hidFrame";
		frm.method="post";
		frm.action = "/adminCerti.do";
		frm.submit(); */
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
				<span class="f_left">시험성적서 업로드 확인</span>
				<span class="f_right">총 <%=pagesVo.getTotalRows() %></span>
			</p>
			
			

<!-- 검색엔진 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->			
						
									
			<div class="search_form">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="" />
				<input type="hidden" name="uid" value="" />
				
				<div>
					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">시험완료일:</span>
						<input type="text" style="width:65px;" name="sel_test_endd_date_from" id="sel_test_endd_date_from" value="<%=param.getString("sel_test_endd_date_from") %>"  maxlength="8"/>
						~ <input type="text" style="width:65px;" name="sel_test_endd_date_to" id="sel_test_endd_date_to" value="<%=param.getString("sel_test_endd_date_to") %>"  maxlength="8"/>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">봉인번호:</span>
						<input type="text" style="width:65px;" name="sel_bongin_from" id="sel_bongin_from" value="<%=param.getString("sel_bongin_from") %>"  maxlength="8"/>
						~ <input type="text" style="width:65px;" name="sel_bongin_to" id="sel_bongin_to" value="<%=param.getString("sel_bongin_to") %>"  maxlength="8"/>
					
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">시험항목:</span>
						<input type="text" style="width:100px;" name="sel_rqst_prdt_name" id="sel_rqst_prdt_name" value="<%=param.getString("sel_rqst_prdt_name") %>" />
						
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:200px">
						<a href="javascript: f_search()" class="btn grey">검색</a>
						<a href="javascript: f_reset()" class="btn grey">검색조건 초기화</a>
						</span>
					</div>
					<br style="clear:both;" />
				</div>
				
				
				
				
				
				</form>
			</div>			
<!-- 검색엔진 END -->		
			
			<div class="list_wrap">
				<table class="list rowhover">
					<tr>
						<th>NO</th>
						<th>접수번호</th>
						<th>접수일</th>
						<th>시험완료일</th>
						<th>봉인번호</th>
						<th>한벌꿀</th>
						<th>검체표시</th>
						<th>의뢰자ID</th>
						<th>성명</th>
						<th>시험항목</th>
						<th>기타</th>
						<th>판정</th>
						<th>우편물</th>
					</tr>
						
					<%
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
					%>
					<tr>
						<td class="first ta_center"><%=dataList.getString("NO") %></td>
						<td class="ta_center">
							<span onclick="javascript: f_detail('<%=dataList.getString("NO") %>')" style="text-decoration:underline"><%=dataList.getString("접수번호") %></span>
						</td>
						<td class="ta_center"><%=dataList.getString("접수일") %></td>
						<td class="ta_center"><%=dataList.getString("시험완료일") %></td>
						<td class="ta_center"><%=dataList.getString("봉인번호") %></td>
						<td class="ta_center"><%=dataList.getString("한벌꿀") %></td>
						<td class="ta_center"><%=dataList.getString("검체표시") %></td>
						<td class="ta_center"><%=dataList.getString("의뢰자ID") %></td>
						<td class="ta_center"><%=dataList.getString("성명") %></td>
						<td class="ta_center"><%=dataList.getString("시험항목") %></td>
						<td class="ta_center"><%=dataList.getString("기타") %></td>
						<td class="ta_center"><%=dataList.getString("판정") %></td>
						<td class="last ta_center"><%=dataList.getString("우편물수취") %></td>
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