<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.Enumeration"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.util.DateFormatter"%>
<%@page import="kr.or.korapis.member.PayDao"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
<%@page import="kr.or.korapis.member.MemberDao"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) %><script>window.location.href="/jsp/main.jsp";</script><%

MemberDao dao = new MemberDao();
int selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), 1);

MiceParam param = new MiceParam();
Enumeration<String> en = request.getParameterNames();
String name,  values[];
while( en.hasMoreElements()) {
	name = en.nextElement();
	param.put(name, request.getParameterValues(name));
}

param.put("branch1", userInfo.getBranch1());
param.put("branch2", userInfo.getBranch2());
param.put("role_pos", userInfo.getRole_pos());
if("사무장(총무)".equals(userInfo.getRole())){
	param.put("role_pos", "지부장");
}
int startYear = DateC.getKorapisBillYear();

PagesVo pagesVo = new PagesVo(selPageNo, 10);
ResultSetEntity d = dao.getList_branch_pay(param, pagesVo.fromNumber(), pagesVo.toNumber());
int tot = dao.getList_branch_pay_tot(param);
pagesVo.setTotalRows(tot);

int tot_page = (tot%10==0) ? (int)(tot/10) : (int)tot/10+1;

SelectBoxDao boxDao = new SelectBoxDao();
int showYearCount = 23;  //23
String[] payArr = new String[showYearCount];
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
<link rel="stylesheet" href="/css/style.css" >
<link href="/css/sub.css"  rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.8.3.min.js" ></script>
<script>

//페이징.
function f_goPage(no){
	var frm = document.forms.frmList;
	frm.selAction.value = "V";
	frm.selPageNo.value = no;

	frm.target = "";
	frm.method = "post";
	frm.action = "/jsp/sub8-2_2.jsp";
	frm.submit();
}

//검색
function f_search(){
	var frm = document.forms.frmList;
	frm.selAction.value = "V";
	frm.selPageNo.value = "1";

	frm.target = "";
	frm.method = "post";
	frm.action = "/jsp/sub8-2_2.jsp";
	frm.submit();
}

function f_detail(i_id){
	var frm = document.forms.frmList;
	frm.user_id.value = i_id;

	window.open("about:blank", "detail_popup", "status=no,left=100,top=100,width=500,height=600");
	frm.target = "detail_popup";
	frm.method="post";
	frm.action = "/jsp/sub8-2_3.jsp";
	frm.submit();
}

var down = false;
function f_excelDown(){
	if(down){
		alert("자료를 불러오는 중입니다.\n잠시 기다려 주시기바랍니다.");
		return;
	}
	down = true;
	var frm = document.forms.frmList;
	frm.target="";
	frm.method="post";
	frm.action="/jsp/common/download_csv.jsp";
	frm.submit();
	down = false;

}

function f_showDetailSearch(){
	var frm = document.forms.frmList;
	frm.selSearchType.value="1";

	$("#s_search").hide();
	$("#d_search").show();
}



$(function(){
	var frm = document.forms.frmList;
	$(frm).find("input[type='text']").on("keydown",function(e){
		if(e.which == 13)
			f_search();
	});
});



$(document).ready(function(){

	hideDetailPayments();

	function showDetailPayments(){
		for(var i = 23; i<5 , i--;){
			$(".pay_year_" + i).show();
		}
		for(var i = 2000; i < 2019; i++){
			$(".pay_title_"+i).show();
		}
		$("#payments_area").attr('style', " max-width: 100%; overflow-x: auto");
		$("#payments_table").attr('style', "font-size:12px; width: 168% ")
	}

	function hideDetailPayments(){

		for(var i = 23; i > 3;  i--){
			$(".pay_year_" + i).hide();
		}
		for(var i = 2000; i < 2019; i++){
			$(".pay_title_"+i).hide();
		}

		$("#payments_area").attr('style', " ");
		$("#payments_table").attr('style', "font-size:12px ")
	}

	$("#payment_check").change(function(e){
		var isChecked = e.target.checked;
		if(isChecked){
			showDetailPayments();
		}else{
			hideDetailPayments();
		}
	});
});


</script>
</head>
<body>
<div id="skipToContent" title="스킵네비게이션">
		<a href="#main_menu">메뉴 바로가기</a>
		<a href="#search">프로그램 검색 바로가기</a>
		<a href="#footer">카피라이터 바로가기</a>
</div>

<!-- sub_wrap_main START -->
<div id="sub_wrap_main">

<jsp:include page="inc/header.jsp" />

<!-- sub_wrap START -->
    <div id="sub_wrap">

        <jsp:include page="inc/leftmenu.jsp" />

        <!-- sub_contents START -->
        <div id="sub_contents">

            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">지회회비내역</h2>
                    <div class="location">홈  &gt; <span>마이페이지</span></div>

                </div>
                <div class="sub_body_box " >








<h2 id="container_title"><span class="sound_only">지회회비내역</span><span class="sound_only"> 목록</span></h2>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">


    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div class="bo_fx" style="padding:0px 5px">
        <div style="float:right">
        	<%if("지회장".equals(userInfo.getRole_pos())){ %>
	        	<a href="/jsp/sub8-2_1.jsp" class="btn_cancel">지회회원정보</a>
	            <a href="/jsp/sub8-2_2.jsp" class="btn_cancel">지회회비내역</a>

        	<%}else if("사무국장".equals(userInfo.getRole_pos())){ %>
	        	<a href="/jsp/sub8-2_1.jsp" class="btn_cancel">지회회원정보</a>
	            <a href="/jsp/sub8-2_2.jsp" class="btn_cancel">지회회비내역</a>


        	<%}else if("지부장".equals(userInfo.getRole_pos())){ %>
	        	<a href="/jsp/sub8-2_1.jsp" class="btn_cancel">지부회원정보</a>
	            <a href="/jsp/sub8-2_2.jsp" class="btn_cancel">지부회비내역</a>
        	<%}else if("사무장(총무)".equals(userInfo.getRole())){ %>
        		<a href="/jsp/sub8-2_2.jsp" class="btn_cancel">지부회비내역</a>
        	<%} %>
        	<br style="clear:both"/>
        </div>
    </div>




	<form name="frmList" method="post" onsubmit="f_search()">
	    <input type="hidden" name="selAction" value=""/>
	    <input type="hidden" name="selPageNo" value="<%=selPageNo %>">
	    <input type="hidden" name="selSearchType" value="<%=param.getString("selSearchType") %>" />
	    <input type="hidden" name="addPay" value="Y" />
	    <input type="hidden" name="user_id" />

    <div id="s_search" <%if("1".equals(param.getString("selSearchType"))){ %>style="display:none;"<%} %>>
    <%--
		<select name="selUserlevel" onchange="f_search()">
 				<option value="">전체회원</option>
 				<option value="O" <%="O".equals(selUserlevel) ? "selected" : "" %>>정회원</option>
 				<option value="R" <%="R".equals(selUserlevel) ? "selected" : "" %>>준회원</option>
 				<option value="X" <%="X".equals(selUserlevel) ? "selected" : "" %>>탈퇴회원</option>
		</select>
	--%>
		<select name="searchGubun">
			  <option value="name" <%="name".equals(param.getString("searchGubun")) ? "selected" : "" %>>이름</option>
			  <option value="id" <%="id".equals(param.getString("searchGubun")) ? "selected" : "" %>>아이디</option>
			  <%if("지회장".equals(userInfo.getRole_pos()) || "사무국장".equals(userInfo.getRole_pos())){ %>
			  <option value="branch2" <%="branch2".equals(param.getString("searchGubun")) ? "selected" : "" %>>지부</option>
			  <%} %>
			  <option value="role_pos" <%="role_pos".equals(param.getString("searchGubun")) ? "selected" : "" %>>직책</option>
		</select>
		<input type="text" name="searchText" value="<%=param.getString("searchText") %>" style="ime-mode:active;"/>
		<a href="javascript: f_search()" class="btn_cancel">검색</a>
		<a href="javascript: f_showDetailSearch()" class="btn_cancel">상세검색</a>
	<label style="font-weight: 900">	<input type="checkbox" id="payment_check" value="<%%>"  />상세 납부내역 조회</label>
	</div>
	<div id="d_search" class="tbl_frm01 tbl_wrap" style="clear:both;padding-top:10px;<%if(!"1".equals(param.getString("selSearchType"))){ %>display:none;<%} %>">
		<table>
			<tr>
				<th>이름</th>
				<td><input type="text" name="selName" value="<%=param.getString("selName") %>" /></td>
				<th>성별</th>
				<td>
					<select name="selSex">
						<option value="">전체</option>
						<option value="M" <%="M".equals(param.getString("selSex"))?"checked":"" %>> 남자</option>
						<option value="F" <%="F".equals(param.getString("selSex"))?"checked":"" %>> 여자</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>자택주소</th>
				<td>
					<input type="text" name="selHaddr" value="<%=param.getString("selHaddr") %>" />
				</td>
				<th>사업장주소</th>
				<td>
					<input type="text" name="selOaddr" value="<%=param.getString("selOaddr") %>" />
				</td>
			</tr>
			<tr>
				<th>지회</th>
				<td>
				<%=userInfo.getBranch1() %>
				<input type="hidden" name="selBranch1" value="<%=userInfo.getBranch1() %>" />
				</td>
				<th>지부</th>
				<td>
				<%if("지회장".equals(userInfo.getRole_pos()) || "사무국장".equals(userInfo.getRole_pos())){ %>
					<select name="selBranch2">
						<option value="">전체지부</option>
						<%=boxDao.getBranch2(userInfo.getBranch1(),param.getString("selBranch2")) %>
					</select>
				<%}else{ %>
					<%=userInfo.getBranch2() %>
					<input type="hidden" name="selBranch2" value="<%=userInfo.getBranch2() %>" />
				<%} %>
				</td>
			</tr>
			<tr>
				<th>직책</th>
				<td>
					<select name="selRolePos">
						<option value="">전체역할</option>
						<option value="지부장" <%="지부장".equals(param.getString("selRolePos")) ? "selected" : "" %>>지부장</option>
						<option value="대의원" <%="대의원".equals(param.getString("selRolePos")) ? "selected" : "" %>>대의원</option>
						<option value="평회원" <%="평회원".equals(param.getString("selRolePos")) ? "selected" : "" %>>평회원</option>
					</select>
					<%-- <select name="selRolePos">
						<option value="">전체역할</option>
						<%=boxDao.getGrole(param.getString("selRolePos")) %>
					</select> --%>
				</td>
				<th>연락상태</th>
				<td>
					<select name="selContactStatus">
						<option value="" <%="".equals(param.getString("selContactStatus")) ? "selected" : "" %>>전체상태</option>
						<option value="O" <%="O".equals(param.getString("selContactStatus")) ? "selected" : "" %>>OK</option>
						<option value="N" <%="N".equals(param.getString("selContactStatus")) ? "selected" : "" %>>장기미활동</option>
						<option value="D" <%="D".equals(param.getString("selContactStatus")) ? "selected" : "" %>>사망</option>
						<option value="R" <%="R".equals(param.getString("selContactStatus")) ? "selected" : "" %>>반송</option>
						<option value="K" <%="K".equals(param.getString("selContactStatus")) ? "selected" : "" %>>거절</option>
						<option value="L" <%="L".equals(param.getString("selContactStatus")) ? "selected" : "" %>>탈퇴</option>
					</select>
				</td>
			</tr>
		</table>
		<div style="margin:10px 0; text-align:center;">
			<a href="javascript:f_search()" class="btn_cancel">상세검색</a>
		</div>
	</div>
	</form>

   	<br/>
	<div class="tbl_head01 tbl_wrap" id="payments_area">
		<table style="font-size:12px;" id="payments_table">
    <%--<div class="tbl_head01 tbl_wrap" style="max-width: 100%; overflow-x: auto">
        <table style="font-size:12px; width: 168%">--%>
        <caption>지회회비내역</caption>
        <thead>
	        <tr style="font-size:13px">
	        	<th scope="col" style="width:40px">No</th>
	        	<th scope="col" style="width:60px">이름</th>
	        	<th scope="col" style="width:90px">생년월일</th>
	        	<th scope="col" style="width:60px">지회</th>
	        	<th scope="col" style="width:60px">지부</th>
	        	<th scope="col" style="width: 184px">주소</th>
	        	<th scope="col" style="width:100px">HP</th>
	        	<%for(int i = startYear; i > startYear - payArr.length; i--){
				%>
	        		<th  name="patArr" scope="col" class="pay_title_<%=i%>"  style="width:35px"><%=i %></th>
	        	<%} %>

	        	<th scope="col" style="width:80px;">가입일자</th>
			</tr>
        </thead>
        <tbody>
		<%
		if(d!=null && d.size()>0){
      		int no = pagesVo.getTopNo();

      		String str_hphone = "";
      		String str_cp = "";


      		String str2017 = "";
      		String str2016 = "";
      		String str2015 = "";
      		String str2014 = "";
      		for(int i=0; i<d.size(); i++){
      			d.next();


      			str_hphone = d.getString("hphone1")+"-"+d.getString("hphone2")+"-"+d.getString("hphone3");
      			str_cp = d.getString("cp1")+"-"+d.getString("cp2")+"-"+d.getString("cp3");
				int signYear = Integer.parseInt(d.getString("id").split("-")[0]);

    			for(int y = startYear; y > startYear - showYearCount; y--){
    				if(y == 2013){
    					payArr[startYear-y] = d.getInt("pay_"+y) < 100000 ? "X" : "O";
    				}else if(y-signYear<0){
    					payArr[startYear-y] = "-";
    				}else{
    					payArr[startYear-y] = (d.getInt("pay_"+y) > 0 ? "O" : "X");
    				}
    			}


      			String regnumber = d.getString("regnumber");
      			if(regnumber.length() == 6){
      				Pattern pat = Pattern.compile("^([0-9]{2})([0-9]{2})([0-9]{2})$");
      				Matcher mat = pat.matcher(regnumber);
      				if(mat.find()){
      					regnumber = mat.group(1) +"-"+mat.group(2)+"-"+mat.group(3);
      				}
      			}else{
      				regnumber = "-";
      			}



        	%>
				<tr class="">
            		<td style="text-align:center"><%=no-- %></td>
            		<td style="text-align:center;text-decoration:underline;"><a href="javascript:f_detail('<%=d.getString("id") %>');"><%=d.getString("name") %></a></td>
            		<td style="text-align:center"><%=regnumber %></td>
            		<td style="text-align:center"><%=d.getString("branch1") %></td>
            		<td style="text-align:center"><%=d.getString("branch2") %></td>
            		<td style="text-align:left"><%=d.getString("haddr1")+" "+d.getString("haddr2") %></td>
            		<td style="text-align:center"><%=str_cp %></td>
					<%
					for(int x=0; x<payArr.length; x++){
						String pay = payArr[x];
					%>
						<td name="patArr" style="text-align:center" class="pay_year_<%=x%>"> <%=pay %> </td>
					<%}%>


            		<td style="text-align:center"><%=d.getString("registdate") %></td>
				</tr>
           <%
        		}
           }
           %>




			</tbody>
        </table>
    </div>


    <div style="text-align:center">
    	<%=pagesVo.getPageHtml() %>
    	<span style="float:right">
    		<a href="javascript:f_excelDown()" class="btn_cancel">엑셀저장</a>
    	</span>
	</div>


</div>

<!-- 페이지 -->

				</div>


			</div>
<!-- } 회원가입 약관 동의 끝 -->
            <!--// sub_con END -->

			<jsp:include page="inc/partner.jsp" />

        </div>
        <!--// sub_contents END -->
	</div>
    <!--// sub_wrap END -->
</div>
<!--// sub_wrap_main END -->

<jsp:include page="inc/footer.jsp" />


</body>
</html>
