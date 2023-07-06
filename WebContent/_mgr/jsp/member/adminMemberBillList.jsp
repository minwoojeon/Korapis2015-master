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
		
		
		$("#selRegdate_from").datepicker({changeYear:true});
		$("#selRegdate_from").datepicker("option", "dateFormat", "yymmdd");
		$("#selRegdate_from").datepicker("option", "yearRange", "-10:+0");
		$("#selRegdate_from").datepicker("setDate", "<%=param.getString("selRegdate_from") %>");
		
		$("#selRegdate_to").datepicker({changeYear:true});
		$("#selRegdate_to").datepicker("option", "dateFormat", "yymmdd");
		$("#selRegdate_to").datepicker("option", "yearRange", "-10:+0");
		$("#selRegdate_to").datepicker("setDate", "<%=param.getString("selRegdate_to") %>");
		
		
	});

	//페이징.
	function f_goPage(no){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		frm.selPageNo.value = no;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminMember.do";
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
		frm.action = "/adminMember.do";
		frm.submit();
	}
	
	
	
	
	//검색
	function f_search(){
		var frm = document.forms.frmList;
		
		frm.selAction.value = "V";
		frm.selPageNo.value = "1";
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminMember.do";
		frm.submit();	
	}
	
	//엑셀다운로드
	function f_downExcel(){
		alert("준비중입니다. ");
		return false;
		
		var frm = document.forms.frmList;
		
		frm.selAction.value = "XLS";
		frm.target = "hidFrame";
		frm.method="post";
		frm.action = "/adminMember.do";
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
		<div id="content">
		
			<p class="cont_header bold">
				<span class="f_left">회원 목록</span>
				<span class="f_right">총 <%=param.get("tot") %></span>
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
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">회원구분</span>
						<span style="display:inline-block; width:100px">
						<select name="selUserlevel" onchange="f_search()" style="width:95px">
			  				<option value="">= 전체 =</option>
			  				<option value="O" <%="O".equals(param.getString("selUserlevel")) ? "selected" : "" %>>정회원</option>
			  				<option value="R" <%="R".equals(param.getString("selUserlevel")) ? "selected" : "" %>>준회원</option>
			  				<option value="X" <%="X".equals(param.getString("selUserlevel")) ? "selected" : "" %>>탈퇴회원</option>
						</select>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">이름</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selName" value="<%=param.getString("selName") %>"/>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">주민등록번호</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selRegnum" value="<%=param.getString("selRegnum") %>"/>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">휴대폰</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selCphone" value="<%=param.getString("selCphone") %>"/>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">TEL자택</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selHphone" value="<%=param.getString("selHphone") %>"/>
						</span>						
					</div>
					
					
					
					<div class="search_input">

						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">지회</span>
						<span style="display:inline-block; width:100px">
						<select name="selBranch1" onchange="f_search()" style="width:95px">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getBranch1(param.getString("selBranch1")) %>
		            	</select>
		            	</span>
	            
											
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">지부</span>
						<span style="display:inline-block; width:100px">
						<select name="selBranch2" onchange="f_search()" style="width:95px">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getBranch2(param.getString("selBranch1"), param.getString("selBranch2")) %>
			            </select>
			            </span>
						
        
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">역할</span>
						<span style="display:inline-block; width:100px">
						<select name="selRole" onchange="f_search()" style="width:95px">
			            	<option value="">= 선택 =</option>	
			            	<%=boxDao.getYrole(param.getString("selRole")) %>
			        	</select>
			        	</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">직책</span>
						<span style="display:inline-block; width:100px">
						<select name="selRolepos" onchange="f_search()" style="width:95px">
			            	<option value="">= 선택 =</option>
			            	<%=boxDao.getGrole(param.getString("selRolepos")) %>
			            </select>
						</span>			            
			            
			            
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">사업장명</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selCompanyname" value="<%=param.getString("selCompanyname") %>"/>
						</span>
					</div>
					
					
					
					<div class="search_input">
			            						

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">우편물수취</span>
						<span style="display:inline-block; width:100px">
						<select name="selMailreceive" onchange="f_search()" style="width:95px">
							<option value="" <%="".equals(param.getString("selMailreceive")) ? "selected" : "" %>>= 전체 =</option>
							<option value="H" <%="H".equals(param.getString("selMailreceive")) ? "selected" : "" %>>자택</option>
							<option value="O" <%="O".equals(param.getString("selMailreceive")) ? "selected" : "" %>>사업장</option>
						</select>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">우편물발송</span>
						<span style="display:inline-block; width:100px">
						<select name="selMailsent" onchange="f_search()" >
							<option value="" <%="".equals(param.getString("selMailsent")) ? "selected" : "" %>>= 선택 =</option>
							<option value="Y" <%="Y".equals(param.getString("selMailsent")) ? "selected" : "" %>>발송</option>
							<option value="N" <%="N".equals(param.getString("selMailsent")) ? "selected" : "" %>>미발송</option>
						</select>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">연락상태</span>
						<span style="display:inline-block; width:100px">
						<select name="selContactStatus" onchange="f_search()">
							<option value="D-include" <%="D-include".equals(param.getString("selContactStatus")) ? "selected" : "" %>>사망자 포함</option>
							<option value="N" <%="N".equals(param.getString("selContactStatus")) ? "selected" : "" %>>장기미활동</option>
							<option value="O" <%="O".equals(param.getString("selContactStatus")) ? "selected" : "" %>>OK</option>
							<option value="R" <%="R".equals(param.getString("selContactStatus")) ? "selected" : "" %>>반송</option>
							<option value="K" <%="K".equals(param.getString("selContactStatus")) ? "selected" : "" %>>거절</option>
							<option value="H" <%="H".equals(param.getString("selContactStatus")) ? "selected" : "" %>>자격정지</option>
							<option value="U" <%="U".equals(param.getString("selContactStatus")) ? "selected" : "" %>>제명</option>
							<option value="L" <%="L".equals(param.getString("selContactStatus")) ? "selected" : "" %>>탈퇴</option>
							<option value="D" <%="D".equals(param.getString("selContactStatus")) ? "selected" : "" %>>사망자만 검색</option>
						</select>
						</span>
						
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">가입비납부</span>
						<span style="display:inline-block; width:100px">
						<select name="selJoinbill" onchange="f_search()" >
							<option value="" <%="".equals(param.getString("selJoinbill")) ? "selected" : "" %>>= 전체 =</option>
							<option value="Y" <%="Y".equals(param.getString("selJoinbill")) ? "selected" : "" %>>Y</option>
							<option value="N" <%="N".equals(param.getString("selJoinbill")) ? "selected" : "" %>>N</option>
						</select>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">주소(자택)</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:100px" name="selHaddr" value="<%=param.getString("selHaddr") %>"/>
						</span>
						
					</div>
					
					
					
					
					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">가입일자</span>
						<span style="display:inline-block; width:292px">
						<input type="text" class="searchinput" style="width:60px;" name="selRegdate_from" id="selRegdate_from" value="<%=param.getString("selRegdate_from") %>"  maxlength="8"/>
						~ <input type="text" class="searchinput" style="width:60px;" name="selRegdate_to" id="selRegdate_to" value="<%=param.getString("selRegdate_to") %>"  maxlength="8"/>
						</span>
						
						
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">나이</span>
						<span style="display:inline-block; width:100px">
						<input type="text" class="searchinput" style="width:30px;" name="selAge_from" id="selAge_from" value="<%=param.getString("selAge_from") %>"  maxlength="2"/>
						~ <input type="text" class="searchinput" style="width:30px;" name="selAge_to" id="selAge_to" value="<%=param.getString("selAge_to") %>"  maxlength="2"/>
						</span>
						
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">주소(사업장)</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px" name="selOaddr" value="<%=param.getString("selOaddr") %>"/>
						</span>
						
						<%--
						회비납부(전체, 납부, 미납, 2014, 2013, 2012, 2011)
						(납부내역표시, 출려NO~)
						봉투연속지
						DM라벨 --%>
						
					</div>
					
									
					
					<div class="f_right">
						<a href="javascript: f_search()" class="btn grey">검색</a>
						<a href="javascript: f_downExcel()" class="btn grey">엑셀다운로드</a>
					</div>
					
					<br style="clear:both;" />
				</div>
				
				</form>
			</div>			
<!-- 검색엔진 END -->		
			
			<div class="list_wrap">
				<table class="list rowhover">
					<tr>
						<th>납부일자</th> 
						<th>아이디</th>
						<th>지회</th>
						<th>지부</th>
						<th>이름</th>
						<th>회비구분</th>
						<th>납부</th>
						<th>금액</th>
					</tr>
						
					<%
					int no = pagesVo.getTopNo();
					while(dataList!=null&&dataList.next()){
					%>
					<tr>
						<td class="first ta_center"><%=dataList.getString("uid") %></td>
						<td class="ta_center"><%=dataList.getString("id") %></td>
						<td class="ta_center">
							<span style="text-decoration:underline" onclick="javascript: f_goRegist('<%=dataList.getString("uid") %>')"><%=dataList.getString("name") %></span>
						</td>
						<td class="ta_center">-</td>
						<td class="ta_center">-</td>
						<td class="ta_center">-</td>
						<td class="ta_center">-</td>
						<td class="last ta_center" style="width:150px">&nbsp;</td>
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