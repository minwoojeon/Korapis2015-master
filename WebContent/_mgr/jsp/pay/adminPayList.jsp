<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
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

int startYear = DateC.getKorapisBillYear();
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


		$("#selPaydate_from").datepicker({changeYear:true});
		$("#selPaydate_from").datepicker("option", "dateFormat", "yymmdd");
		$("#selPaydate_from").datepicker("option", "yearRange", "-10:+0");
		$("#selPaydate_from").datepicker("setDate", "<%=param.getString("selPaydate_from") %>");

		$("#selPaydate_to").datepicker({changeYear:true});
		$("#selPaydate_to").datepicker("option", "dateFormat", "yymmdd");
		$("#selPaydate_to").datepicker("option", "yearRange", "-10:+0");
		$("#selPaydate_to").datepicker("setDate", "<%=param.getString("selPaydate_to") %>");


	});

	//페이징.
	function f_goPage(no){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		frm.selPageNo.value = no;

		frm.target = "";
		frm.method = "post";
		frm.action = "/adminPay.do";
		frm.submit();
	}



	//등록, 수정요청
	function f_goRegist(){
		var frm = document.forms.frmMenu;
		frm.selAction.value = "MA";
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminPay.do";
		frm.submit();
	}






	//검색조건 초기화
	function f_reset(){
		$("#selUserlevel").val("");
		$("#selPageNo").val("1");
		f_search();
	}






	//상세화면 이동
	function f_goDetail(i_uid){
		var frm = document.forms.frmList;
		frm.selAction.value = "detail";
		frm.uid.value = i_uid;

		frm.target = "";
		frm.method = "post";
		frm.action = "/adminPay.do";
		frm.submit();
	}

	//검색
	function f_search(){
		var frm = document.forms.frmList;

		frm.selAction.value = "V";
		frm.selPageNo.value = "1";

		frm.target = "";
		frm.method = "post";
		frm.action = "/adminPay.do";
		frm.submit();
	}


	//지부정보를 가져온다
	function f_get_branch2(){
		$.ajax({
			url: "/adminJson.do",
			type: "post",
			data: {
				"selAction" : "get_branch2",
				"ins_branch1" : $("#selBranch1").val()
			},
			dataType:"json",
			error: function(){
				alert("지부정보를 불러올 수 없습니다.");
			},
			success: function(data){
				$("#selBranch2").empty();
				$("#selBranch2").append( new Option("= 선택 =", "") );
				$.each(data, function(key, ele){
					$("#selBranch2").append( new Option(data[key].id, data[key].name) );
				});
			}
		});
	}



	//엑셀다운로드
	function f_downExcel(){
		<%--
		<%if(pagesVo!=null && pagesVo.getTopNo()>3000){%>
			alert("엑셀다운로드는 3000명까지 가능합니다.\n\n검색조건으로 검색후 엑셀다운로드 해주시기 바랍니다.");
			return false;
		<%}%>
		--%>

		var frm = document.forms.frmList;
		frm.selAction.value = "excel";
		frm.target = "hidFrame";
		frm.method="post";
		frm.action = "/adminPay.do";
		frm.submit();
	}

</script>


</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="selPageNo" value="" />
<input type="hidden" name="uid" value="" />
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
		<div id="content">

			<p class="cont_header bold">
				<span class="f_left">회비납부 조회/등록</span>
				<span class="f_right">총 <%=TextFormatter.formatNum(param.get("total_pay")) %> 원</span>
			</p>



<!-- 검색엔진 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->


			<div class="search_form">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="<%=param.getString("selPageNo") %>" />
				<input type="hidden" name="uid" value="" />

				<div>

					<div class="search_input">

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">지회</span>
						<span style="display:inline-block; width:100px">
						<select name="selBranch1" id="selBranch1" style="width:95px" onchange="javascript: f_get_branch2()">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getBranch1(param.getString("selBranch1")) %>
		            	</select>
		            	</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">지부</span>
						<span style="display:inline-block; width:100px">
						<select name="selBranch2" id="selBranch2" style="width:95px" onchange="javascript: f_search()">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getBranch2(param.getString("selBranch1"), param.getString("selBranch2")) %>
			            </select>
			            </span>


						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">이름</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selName" value="<%=param.getString("selName") %>"/>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">아이디</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selId" value="<%=param.getString("selId") %>"/>
						</span>

					</div>




					<div class="search_input">


						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">회비구분</span>
						<span style="display:inline-block; width:100px">
						<select name="selGubun"  style="width:95px">
							<%
							String selGubun = param.getString("selGubun");
							%>
							<option value="" <%="".equals(selGubun) ? "selected" : "" %>>= 전체 =</option>
							<%
							for(int i = startYear; i >= 2009; i--){ %>
								<option value="<%=i %>" <%=String.valueOf(i).equals(selGubun) ? "selected" : "" %>><%=i %></option>
							<%} %>
							<option value="가입비" <%="가입비".equals(selGubun) ? "selected" : "" %>>가입비</option>
						</select>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">협회코드</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selMembercode" value="<%=param.getString("selMembercode") %>"/>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">납부일자</span>
						<span style="display:inline-block;">
						<input type="text" class="searchinput" style="width:60px;" name="selPaydate_from" id="selPaydate_from" value="<%=param.getString("selPaydate_from") %>"  maxlength="8"/>
						~ <input type="text" class="searchinput" style="width:60px;" name="selPaydate_to" id="selPaydate_to" value="<%=param.getString("selPaydate_to") %>"  maxlength="8"/>
						</span>


						<span style="padding-left:20px">
							<a href="javascript: f_search()" class="btn grey">검색</a>
							<a href="javascript: f_downExcel()" class="btn grey">엑셀다운로드</a>
						</span>

					</div>
				</div>

				</form>
			</div>
<!-- 검색엔진 END -->

			<div class="list_wrap">
				<table class="list rowhover">
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>지회</th>
						<th>지부</th>
						<th>회비구분</th>
						<th>금액</th>
						<th>납부일자</th>
					</tr>

					<%
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
					%>
					<tr>
						<td class="first ta_center"><%=no-- %></td>
						<td class="ta_center"><span style="text-decoration:underline" onclick="javascript: f_goDetail('<%=dataList.getString("muid") %>')"><%=dataList.getString("name") %></span></td>
						<td class="ta_center"><%=dataList.getString("branch1") %></td>
						<td class="ta_center"><%=dataList.getString("branch2") %></td>
						<td class="ta_center"><%=dataList.getString("gubun") %></td>
						<td class="ta_center" style="width:150px"><%="".equals(dataList.getString("price")) ? "-" : TextFormatter.formatNum(dataList.getString("price")) %></td>
						<td class="last ta_center"><%=dataList.getString("paydate") %></td>
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