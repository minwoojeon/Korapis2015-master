<%@page import="java.util.HashMap"%>
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
<%
MiceParam param = (MiceParam)request.getAttribute("param");

ResultSetEntity d_branch = (ResultSetEntity)request.getAttribute("dataList_branch");
HashMap<String, String> datamap = (HashMap<String, String>)request.getAttribute("datamap");
SelectBoxDao boxDao = new SelectBoxDao();
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

int year = DateC.getKorapisBillYear();

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
	});

	
	//검색
	function f_search(){
		var frm = document.forms.frmList;
		frm.selAction.value = "stat_year";
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminSelfcost.do";
		frm.submit();	
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
		<div id="content" style="min-width:980px">
		
			<p class="cont_header bold">
				<span class="f_left">자조금 현황</span>
				<span class="f_right">&nbsp;</span>
			</p>
			
			

<!-- 검색엔진 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->			
			<div class="search_form">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="" />
				
				<div>
					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">지회/지부별</span>
						<span style="display:inline-block; width:150px">
						<select name="selBranchGubun"  style="width:130px" onchange="javascript:f_search()">
			            	<option value="branch1" <%="branch1".equals(param.getString("selBranchGubun")) ? "selected":"" %>>지회별 현황</option>
			            	<option value="branch2" <%="branch2".equals(param.getString("selBranchGubun")) ? "selected":"" %>>지부별 현황</option>
			            </select>
						</span>	
						
						
						<span style="padding-left:20px">
							<a href="javascript: f_search()" class="btn grey">검색</a>
						</span>
						
		            </div>
				</div>
				</form>
			</div>			
<!-- 검색엔진 END -->



		
			
			<div class="list_wrap">
				<table class="list rowhover">
					<tr>
						<th>지회</th>
						<%if("branch2".equals(param.getString("selBranchGubun"))){ %>
						<th>지부</th> 
						<%}%>
						<%
						int y = Math.max(year, 2015), i = 0;
						while(y >= 2015 && i < 12){
						  out.print("<th>"+(y--)+"</th>");
						  ++i;
						}
						%>
					</tr>
						
					<%
					int tot = d_branch.size();
					String key_prefix = "";
					
					String[] y_data = new String[i];
					int[] y_data_sum = new int[i];
					while(d_branch!=null&&d_branch.next()){
						key_prefix = d_branch.getString("branch1_name");
						if("branch2".equals(param.getString("selBranchGubun"))){
							key_prefix += "_"+d_branch.getString("branch2_name");	
						}

						y = Math.max(year, 2015);
						i = 0;
						while(y >= 2015 && i < 12){
						  y_data[i] = TextFormatter.convNvl(datamap.get(key_prefix+"_"+(y--)), "0");
						  y_data_sum[i] += Integer.parseInt(y_data[i].replace(",", ""));
						  ++i;
						}
						
					%>
					<tr>
						<%-- <td class="first ta_center" style="width:90px"><%=tot-- %></td> --%>
						<td class="first ta_center" style="width:110px"><%=d_branch.getString("branch1_name") %></td>
						<%if("branch2".equals(param.getString("selBranchGubun"))){ %>
						<td class="ta_center" style="width:110px"><%=d_branch.getString("branch2_name") %></td>
						<%} %>
						<%
						i = 0;
						while(i < y_data.length){
						%>
						<td class="<%=i == y_data.length - 1 ? "last" : "" %> ta_center"><%=y_data[i] %></td>
						<%
						  ++i;
						}
						%>
					</tr>					
					<%
					}
					%>
					
					<tr>
						<td style="background-color:#C7C7C7" class="first ta_center" <%="branch2".equals(param.getString("selBranchGubun")) ? "colspan='2'" : "" %>>소계</td>
						<%
						i = 0;
						while(i < y_data.length){
						%>
						<td style="background-color:#C7C7C7" class="<%=i == y_data.length - 1 ? "last" : "" %> ta_center"><%=TextFormatter.formatNum(y_data_sum[i]) %></td>
						<%
						  ++i;
						}
						%>
					</tr>
				</table>
				
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