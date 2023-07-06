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
		frm.selAction.value = "stat_month";
		
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
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">년도</span>
						<span style="display:inline-block; width:150px">
						<select name="selYear"  style="width:130px" onchange="javascript:f_search()">
						<%
						int y = Math.max(year, 2015);
						while(y >= 2015){
						%>
			            	<option value="<%=y %>" <%=String.valueOf(y).equals(param.getString("selYear")) ? "selected":"" %>><%=y-- %></option>
			            <%
						}
						%>
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
						<!-- <th>순번</th> -->
						<th>지회</th>
						<%if("branch2".equals(param.getString("selBranchGubun"))){ %>
						<th>지부</th> 
						<%} %>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
					</tr>
						
					<%
					int tot = d_branch.size();
					String key_prefix = "";
					String[] m_data = new String[12];
					int[] m_data_sum = {0,0,0,0,0,0,0,0,0,0,0,0};
					
					while(d_branch!=null&&d_branch.next()){
						key_prefix = d_branch.getString("branch1_name");
						if("branch2".equals(param.getString("selBranchGubun"))){
							key_prefix += "_"+d_branch.getString("branch2_name");
						}
						key_prefix += "_"+param.getString("selYear", DateC.getCurrentYYYY());
						

						
						m_data[0] = TextFormatter.convNvl(datamap.get(key_prefix+"_01"), "0");
						m_data[1] = TextFormatter.convNvl(datamap.get(key_prefix+"_02"), "0");
						m_data[2] = TextFormatter.convNvl(datamap.get(key_prefix+"_03"), "0");
						m_data[3] = TextFormatter.convNvl(datamap.get(key_prefix+"_04"), "0");
						m_data[4] = TextFormatter.convNvl(datamap.get(key_prefix+"_05"), "0");
						m_data[5] = TextFormatter.convNvl(datamap.get(key_prefix+"_06"), "0");
						m_data[6] = TextFormatter.convNvl(datamap.get(key_prefix+"_07"), "0");
						m_data[7] = TextFormatter.convNvl(datamap.get(key_prefix+"_08"), "0");
						m_data[8] = TextFormatter.convNvl(datamap.get(key_prefix+"_09"), "0");
						m_data[9] = TextFormatter.convNvl(datamap.get(key_prefix+"_10"), "0");
						m_data[10] = TextFormatter.convNvl(datamap.get(key_prefix+"_11"), "0");
						m_data[11] = TextFormatter.convNvl(datamap.get(key_prefix+"_12"), "0");
						
						
						m_data_sum[0] += Integer.parseInt(m_data[0].replace(",", ""));
						m_data_sum[1] += Integer.parseInt(m_data[1].replace(",", ""));
						m_data_sum[2] += Integer.parseInt(m_data[2].replace(",", ""));
						m_data_sum[3] += Integer.parseInt(m_data[3].replace(",", ""));
						m_data_sum[4] += Integer.parseInt(m_data[4].replace(",", ""));
						m_data_sum[5] += Integer.parseInt(m_data[5].replace(",", ""));
						m_data_sum[6] += Integer.parseInt(m_data[6].replace(",", ""));
						m_data_sum[7] += Integer.parseInt(m_data[7].replace(",", ""));
						m_data_sum[8] += Integer.parseInt(m_data[8].replace(",", ""));
						m_data_sum[9] += Integer.parseInt(m_data[9].replace(",", ""));
						m_data_sum[10] += Integer.parseInt(m_data[10].replace(",", ""));
						m_data_sum[11] += Integer.parseInt(m_data[11].replace(",", ""));
						
					%>
					<tr>
						<%-- <td class="first ta_center" style="width:90px"><%=tot-- %></td> --%>
						<td class="first ta_center" style="width:110px"><%=d_branch.getString("branch1_name") %></td>
						<%if("branch2".equals(param.getString("selBranchGubun"))){ %>
						<td class="ta_center" style="width:110px"><%=d_branch.getString("branch2_name") %></td>
						<%} %>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_01"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_02"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_03"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_04"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_05"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_06"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_07"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_08"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_09"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_10"), "0") %></td>
						<td class="ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_11"), "0") %></td>
						<td class="last ta_center"><%=TextFormatter.convNvl(datamap.get(key_prefix+"_12"), "0") %></td>
					</tr>					
					<%
					}
					%>
					
					
					<tr>
						<td style="background-color:#C7C7C7" class="first ta_center" <%="branch2".equals(param.getString("selBranchGubun")) ? "colspan='2'" : "" %>>소계</td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[0]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[1]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[2]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[3]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[4]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[5]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[6]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[7]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[8]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[9]) %></td>
						<td style="background-color:#C7C7C7" class="ta_center"><%=TextFormatter.formatNum(m_data_sum[10]) %></td>
						<td style="background-color:#C7C7C7" class="last ta_center"><%=TextFormatter.formatNum(m_data_sum[11]) %></td>
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