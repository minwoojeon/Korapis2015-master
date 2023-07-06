<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.vo.SelfcostVo"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%!
public String commify(String n){
	Pattern pat = Pattern.compile("^([+-]?[0-9]+)([0-9]{3})");
	String n2 = n;
	
	Matcher mat = pat.matcher(n2);
	int i = 0;
	while(mat.find()){
		n2 = mat.replaceFirst("$1,$2");
		mat = pat.matcher(n2);
		if(i >= 20){
			return n;
		}
		i++;
	}
	return n2;
}
%>
<%
MiceParam param = (MiceParam)request.getAttribute("param");

ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");
SelectBoxDao boxDao = new SelectBoxDao();

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

SelfcostVo vo = (SelfcostVo)request.getAttribute("vo");
if(vo.isEmpty()){
	vo.setIns_regdate_yymmdd(param.getString("ins_regdate"));
	vo.setIns_price(param.getString("ins_price"));
	vo.setIns_branch1(param.getString("ins_branch1"));
	vo.setIns_branch2(param.getString("ins_branch2"));
	vo.setIns_etc2(param.getString("ins_etc2"));
}

Calendar oCalendar = Calendar.getInstance();
String today = (new SimpleDateFormat("yyyyMMdd").format(oCalendar.getTime()));


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		
		$(".searchinput").on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				f_search();
			}
		});
		
		
		$(".registinput").on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				<%if(vo.isEmpty()){%>
				f_insert();
				<%}else{%>
				f_update();
				<%}%>
			}
		});
		
		
		
		
		$("#selRegdate_from").datepicker({changeYear:true});
		$("#selRegdate_from").datepicker("option", "dateFormat", "yymmdd");
		$("#selRegdate_from").datepicker("option", "yearRange", "-10:+0");
		$("#selRegdate_from").datepicker("setDate", "<%=param.getString("selRegdate_from") %>");
		
		$("#selRegdate_to").datepicker({changeYear:true});
		$("#selRegdate_to").datepicker("option", "dateFormat", "yymmdd");
		$("#selRegdate_to").datepicker("option", "yearRange", "-10:+0");
		$("#selRegdate_to").datepicker("setDate", "<%=param.getString("selRegdate_to") %>");
		
		
		
		$("#ins_regdate").datepicker({changeYear:true});
		$("#ins_regdate").datepicker("option", "dateFormat", "yymmdd");
		$("#ins_regdate").datepicker("option", "yearRange", "-10:+0");
		<%if(vo.isEmpty()){%>
		$("#ins_regdate").datepicker("setDate", "<%=param.getString("ins_regdate", today) %>");
		<%}else{%>
		$("#ins_regdate").datepicker("setDate", "<%=vo.getIns_regdate_yymmdd() %>");
		<%}%>
		
		$("#ins_name").focus();
		
	});

	//페이징.
	function f_goPage(no){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		frm.selPageNo.value = no;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminSelfcost.do";
		frm.submit();
	}
	
	
	
	//등록, 수정요청
	function f_goRegist(i_insid){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		if(i_insid){
			frm.id.value = i_insid;
		}
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminSelfcost.do";
		frm.submit();
	}
	
	
	//추가
	function f_insert(){
		
		if($("#ins_regdate").val()==""){
			alert("납부일은 필수 입력사항입니다.");
			$("#ins_regdate").trigger("focus");
			return false;
		}
		if($("#ins_name").val()==""){
			alert("납부자는 필수 입력사항입니다.");
			$("#ins_name").trigger("focus");
			return false;
		}
		
		
		
		if(confirm("자조금납부 정보를 추가하시겠습니까?")){
			var frm = document.forms.frmRegist;
			
			frm.ins_price.value = $("#ins_price_txt").val().replace(/,/g, '');
			frm.selAction.value = "insert";
			frm.target = "";
			frm.method = "post";
			frm.action = "/adminSelfcost.do";
			frm.submit();
		}
	}
	//수정
	function f_update(){
		if($("#ins_regdate").val()==""){
			alert("납부일은 필수 입력사항입니다.");
			$("#ins_regdate").trigger("focus");
			return false;
		}
		if($("#ins_name").val()==""){
			alert("납부자는 필수 입력사항입니다.");
			$("#ins_name").trigger("focus");
			return false;
		}
		
		if(confirm("자조금납부 정보를 수정하시겠습니까?")){
			var frm = document.forms.frmRegist;
			
			frm.ins_price.value = $("#ins_price_txt").val().replace(/,/g, '');
			frm.selAction.value = "update";
			frm.target = "";
			frm.method = "post";
			frm.action = "/adminSelfcost.do";
			frm.submit();
		}
	}
	//삭제
	function f_delete(){
		if(confirm("자조금납부 정보를 삭제하시겠습니까?")){
			var frm = document.forms.frmRegist;
			frm.selAction.value = "delete";
			frm.target = "";
			frm.method = "post";
			frm.action = "/adminSelfcost.do";
			frm.submit();
		}
	}
	
	
	//검색조건 초기화
	function f_reset(){
		$("#selUserlevel").val("");
		$("#selPageNo").val("1");
		f_search();
	}
	
	
	//검색
	function f_search(){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		frm.selPageNo.value = "1";
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminSelfcost.do";
		frm.submit();	
	}
	
	
	
	//리프레쉬한다.
	function f_reload(){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminSelfcost.do";
		frm.submit();	
	}
	
	//지부정보를 가져온다
	function f_get_branch2(){
		$.ajax({
			url: "/adminJson.do", 
			type: "post",
			data: {
				"selAction" : "get_branch2",
				"ins_branch1" : $("#ins_branch1").val()
			},
			dataType:"json",
			error: function(){
				alert("지부정보를 불러올 수 없습니다.");
			},
			success: function(data){
				$("#ins_branch2").empty();
				$("#ins_branch2").append( new Option("= 선택 =", "") );
				$.each(data, function(key, ele){
					$("#ins_branch2").append( new Option(data[key].id, data[key].name) );
				});
			}
		});
	}
	
	
	
	//엑셀다운로드
	function f_excel(){
		var frm = document.forms.frmList;
		frm.selAction.value = "excel";
		frm.target = "hidFrame";
		frm.method="post";
		frm.action = "/adminSelfcost.do";
		frm.submit();
	}
	
	function f_print(i_id){
		
		var top = screen.availHeight/2 - 100;
		var left = screen.availWidth/2 - 180;
		
		var frm = document.forms.frmPrint;
		var isSuccession = "";		
		if(frm.Succession.checked){
			isSuccession ="Y";
		} else {
			isSuccession ="N";
		}
		var p1 = window.open("/adminSelfcost.do?selAction=print&isSuccession="+isSuccession+"&id="+i_id,"pop_printmember","top="+top+",left="+left+",status=no,width=880,height=600,scrollbars=yes");
		p1.focus();
	}
	
	
	<%--
	/************************************************************/
	/*      숫자만 입력해주는 스크립트     */
	/************************************************************/
	--%>
	function getOnlyNumberKey() {

	  if ((event.keyCode >=48 && event.keyCode <=57)   // 자판 0~9
	   || (event.keyCode == 8)              // back space
	 ) 
	  {
	   event.returnValue = true;
	  } else {
	   event.returnValue = false;
	  }
	}
	<%--
	/************************************************************/
	/*      숫자가 0일경우 공백으로 리턴       */
	/************************************************************/
	--%>
	function zeroNullChange(num) {
	 var retNum;
	 
	  if(num==0){
	   retNum = "";
	  }else{
	   retNum = num;
	  }
	 return retNum;
	}
	<%--
	/************************************************************/
	/*      천단위 콤마찍기         */
	/************************************************************/
	--%>
	function num_format(n) {
	   var pre_reg = /[^0-9]/gi;
	   n = String(n);
	   n = n.replace(pre_reg, '');
	 
	   var reg = /(^[+-]?\d+)(\d{3})/;   // 정규식
	   n = String(n);                    // 숫자를 문자열로 변환
	  
	   while (reg.test(n))
	     n = n.replace(reg, '$1' + ',' + '$2');
	   return n;
	}
	<%--
	/************************************************************/
	/*      천단위 콤마제거         */
	/************************************************************/
	--%>
	function del_Comma(n) {

	   var pre_reg = /[^0-9]/gi;
	   n = String(n);
	   n = n.replace(pre_reg, '');
	   return n;
	}
	<%--
	/************************************************************/
	/*      숫자외 문자 걸러내고 클립보드 데이터 변경
			익스플로러 클립보드사용창으로 인하여 사용안함.     */
	/************************************************************/
	--%>
	/* function notNumberFormatReplace(str){
	 
	 var reg = /[^0-9]/gi;
	 var clipData = window.clipboardData.getData("Text");  //클립보드 데이터 가져오기

	 clipData = String(clipData);

	 if(window.event.ctrlKey && window.event.keyCode == 86) {
	  clipData = clipData.replace(reg, '');
	  window.clipboardData.setData('Text',clipData);
	   
	  return clipData; 
	 }else{
	  return str;
	 } 
	} */
	
	/* $(function () {
		//$(document).on("keyup", "input:text[class=numberOnly]",function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"")); });
		$(document).on("focusout", "input:text[class=numberOnly]",function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"")); });
		$(".top_sel").selectbox();
	}); */
	
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
		<div id="content" style="min-width:980px">
		
			<p class="cont_header bold">
				<span class="f_left">자조금 조회/등록</span>
				<span class="f_right"><span style="font-size:14px; padding-right:15px;">총 금액 : </span> <%=commify(String.format("%.0f", Double.parseDouble(param.getString("tot_price", "0")))) %> 원</span>
				<%-- <span class="f_right">총 <%=param.get("tot") %></span> --%>
			</p>
			
			

<!-- 검색엔진 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->	
	<div>		
			<div class="search_form" style="float:left; width:300px; padding:10px; height:140px; ">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="<%=param.getString("selPageNo") %>" />
				<input type="hidden" name="id" value=""/>
				
				<div>
					<div class="search_input" style="line-height:30px;">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:50px">납부일자</span>
						<input type="text" class="searchinput" style="width:60px;" name="selRegdate_from" id="selRegdate_from" value="<%=param.getString("selRegdate_from") %>"  maxlength="8"/>
						~ <input type="text" class="searchinput" style="width:60px;" name="selRegdate_to" id="selRegdate_to" value="<%=param.getString("selRegdate_to") %>"  maxlength="8"/>
						
						<span style="padding-left:10px"><a href="javascript: f_search()" class="btn grey">검색</a></span>
						<br/>
						<span style="text-align:right; display:inline-block; padding-right:5px; width:50px">지회</span>
						<select name="selBranch1" onchange="f_search()" style="width:120px">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getBranch1_onlylocal(param.getString("selBranch1")) %>
		            	</select>
		            	<span style="padding-left:10px"><a href="javascript: f_excel()" class="btn grey">엑셀다운</a></span>
		            	<br/>
						<span style="text-align:right; display:inline-block; padding-right:5px; width:50px">지부</span>
						<select name="selBranch2" onchange="f_search()" style="width:120px">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getBranch2(param.getString("selBranch1"), param.getString("selBranch2")) %>
			            </select>
			           	<br/>					
						<span style="text-align:right; display:inline-block; padding-right:5px; width:50px">납부자</span>
						<input type="text" class="searchinput" style="width:115px; ime-mode:active;" name="selName" value="<%=param.getString("selName") %>"/>
						<br/>
						<%-- <span style="text-align:right; display:inline-block; padding-right:5px; width:50px">기타</span>					
						<select name="selEtc2" onchange="f_search()" style="width:120px">
			            	<option value="">= 선택 =</option>
			            	<option value="임원" <%="임원".equals(param.getString("selEtc2")) ? "selected" : "" %>>임원</option>
			            	<option value="업체" <%="업체".equals(param.getString("selEtc2")) ? "selected" : "" %>>업체</option>
							<option value="기타" <%="기타".equals(param.getString("selEtc2")) ? "selected" : "" %>>기타</option>			            	
			            </select> --%>
					</div>
				</div>
				</form>
			</div>			
			
			

			<div class="search_form" style="float:left; margin-left:20px; width:600px; padding:10px; height:140px">
				<form name="frmRegist">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="<%=param.getString("selPageNo") %>" />
				<input type="hidden" name="ins_id" id="ins_id" value="<%=vo.getIns_id() %>" />
				<input type="hidden" name="ins_price" id="ins_price" value="" />
				
				<div class="search_input" style="padding:0px">
						<table class="form">
							<tr>
								<td class="cat">납부일</td>
								<td><input type="text" class="registinput" name="ins_regdate" id="ins_regdate" value="<%="".equals(vo.getIns_regdate_yymmdd()) ? "" : vo.getIns_regdate_yymmdd() %>" style="width:60px"/></td>
								<td class="cat">납부자</td>
								<td><input type="text" class="registinput" name="ins_name" id="ins_name" value="<%=vo.getIns_name() %>" style="width:80px"/></td>
								<td class="cat">금액</td>
								<td><input type="text" class="registinput" name="ins_price_txt" id="ins_price_txt" 
								 		   onkeypress="this.value=del_Comma(this.value);getOnlyNumberKey();if(this.value==0){this.value='';}" 
             							   onKeyUp="if(this.value==''){this.value=''}else{this.value=num_format(this.value);}" 
                 						   onblur="this.value=num_format(this.value); if(this.value=='0') this.value='';" 
                 						   onFocus="this.value=zeroNullChange(this.value);" 
                 						   ondblclick="if(this.value!=0){this.value='';}" 
								value="<%="".equals(vo.getIns_price()) ? "" : TextFormatter.formatNum(vo.getIns_price()) %>" style="width:80px"/></td>
							</tr>
							<tr>
								<td class="cat">지회</td>
								<td>
									<select class="registinput" name="ins_branch1" id="ins_branch1" onchange="f_get_branch2()" style="">
						            	<option value="">= 선택 =</option>
						            	<%=boxDao.getBranch1_onlylocal(vo.getIns_branch1()) %>
					            	</select>
					            	
									<%-- <select class="registinput" name="ins_branch1" id="ins_branch1" onchange="f_get_branch2()" style="">
						            	<option value="">= 선택 =</option>
						            	<option value="강원" <%="강원".equals(vo.getIns_branch1()) ? "selected" : "" %>>강원</option>
						            	<option value="경기" <%="경기".equals(vo.getIns_branch1()) ? "selected" : "" %>>경기</option>
						            	<option value="경남" <%="경남".equals(vo.getIns_branch1()) ? "selected" : "" %>>경남</option>
						            	<option value="경북" <%="경북".equals(vo.getIns_branch1()) ? "selected" : "" %>>경북</option>
						            	<option value="광주전남" <%="광주전남".equals(vo.getIns_branch1()) ? "selected" : "" %>>광주전남</option>
						            	<option value="대구" <%="대구".equals(vo.getIns_branch1()) ? "selected" : "" %>>대구</option>
						            	<option value="대전" <%="대전".equals(vo.getIns_branch1()) ? "selected" : "" %>>대전</option>
						            	<option value="부산" <%="부산".equals(vo.getIns_branch1()) ? "selected" : "" %>>부산</option>
						            	<option value="서울" <%="서울".equals(vo.getIns_branch1()) ? "selected" : "" %>>서울</option>
						            	<option value="울산" <%="울산".equals(vo.getIns_branch1()) ? "selected" : "" %>>울산</option>
						            	<option value="인천" <%="인천".equals(vo.getIns_branch1()) ? "selected" : "" %>>인천</option>
						            	<option value="전북" <%="전북".equals(vo.getIns_branch1()) ? "selected" : "" %>>전북</option>
						            	<option value="제주" <%="제주".equals(vo.getIns_branch1()) ? "selected" : "" %>>제주</option>
						            	<option value="충남" <%="충남".equals(vo.getIns_branch1()) ? "selected" : "" %>>충남</option>
						            	<option value="충북" <%="충북".equals(vo.getIns_branch1()) ? "selected" : "" %>>충북</option>
						            	<option value="임원" <%="임원".equals(vo.getIns_branch1()) ? "selected" : "" %>>임원</option>
						            	<option value="업체" <%="업체".equals(vo.getIns_branch1()) ? "selected" : "" %>>업체</option>
						            	<option value="기타" <%="기타".equals(vo.getIns_branch1()) ? "selected" : "" %>>기타</option>
					            	</select> --%>
									<%-- <select class="registinput" name="ins_branch1" id="ins_branch1" onchange="f_get_branch2()" style="">
						            	<option value="">= 선택 =</option>
						            	<%=boxDao.getBranch1(vo.getIns_branch1()) %>
					            	</select> --%>
					            </td>
					            <td class="cat">지부</td>
								<td colspan="3"> 
									<select class="registinput" name="ins_branch2" id="ins_branch2">
						            	<option value="">= 선택 =</option>
						            	<%=boxDao.getBranch2(vo.getIns_branch1(),vo.getIns_branch2()) %>
						            </select>
			            		</td>
			            		<%-- <td class="cat">기타</td>
								<td> 
									<select name="ins_etc2" id="ins_etc2">
						            	<option value="">= 선택 =</option>
						            	<option value="임원" <%="임원".equals(vo.getIns_etc2()) ? "selected" : "" %>>임원</option>
						            	<option value="업체" <%="업체".equals(vo.getIns_etc2()) ? "selected" : "" %>>업체</option>
										<option value="기타" <%="기타".equals(vo.getIns_etc2()) ? "selected" : "" %>>기타</option>			            	
			          				 </select>
			            		</td> --%>
							</tr>
							<tr>
								<td class="cat">비고</td>
								<td colspan="5"><textarea name="ins_etc" style="width:98%; height:40px"><%=vo.getIns_etc() %></textarea></td>
							</tr>
						</table>
						<span style="float:right">
							<%if(vo!=null && !vo.isEmpty()){ %>
							<a href="javascript: f_update()" class="btn grey">저장</a>
							<a href="javascript: f_reload()" class="btn grey">취소</a>
							<a href="javascript: f_delete()" class="btn grey">삭제</a>
							<%}else{ %>
							<a href="javascript: f_insert()" class="btn grey">추가</a>
							<%} %>
						</span>
						
				</div>
				</form>
				
			</div>
			
		<br style="clear:both"/>
		</div>		
<!-- 검색엔진 END -->		
			
			<div class="list_wrap">
				<form name="frmPrint">
				<p style="text-align:right">
					<input type="checkbox" id="Succession" > 자조금 연속납부 출력 
				</p>
				</form>
				<table class="list rowhover">
					<tr>
						<th>납부일</th> 
						<th>지회</th>
						<th>지부</th>
						<th>납부자</th>
						<!-- <th>기타</th> -->
						<th>금액</th>
						<th>비고</th>
						<th>수정일시</th>
						<th>확인증</th>
					</tr>
						
					<%
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
					%>
					<tr>
						<td class="first ta_center" style="width:90px"><%=dataList.getString("regdate") %></td>
						<td class="ta_center" style="width:110px"><%=dataList.getString("branch1") %></td>
						<td class="ta_center" style="width:110px"><%=dataList.getString("branch2") %></td>
						<td class="ta_center" style="text-decoration:underline; width:110px">
							<span onclick="javascript: f_goRegist('<%=dataList.getString("id") %>')"><%=dataList.getString("membername") %></span>
						</td>
						<%-- <td class="ta_center" style="width:80px"><%=dataList.getString("etc2") %></td> --%>
						<td class="ta_center" style="width:80px"><%=TextFormatter.formatNum(dataList.getString("price")) %></td>
						<td class="ta_left"><%=dataList.getString("etc") %></td>
						<td class="ta_center" style="width:130px;"><%=DateC.chgMysqlDate( dataList.getString("ts"), "yyyy-MM-dd HH:mm:ss") %></td>
						<td class="last ta_center" style="width:60px"><a href="javascript: f_print('<%=dataList.getString("id") %>')" class="btn grey">출력</a></td>
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