<%@page import="kr.or.korapis.admin.member.AdminMemberDao"%>
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

String user_id = request.getParameter("user_id");
AdminMemberDao adminDao = new AdminMemberDao();

ResultSetEntity d_pay = adminDao.getDetail_pay(user_id);
ResultSetEntity d_pay_n = adminDao.getPayN(user_id);

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


</script>
</head>
<body>
<div id="skipToContent" title="스킵네비게이션">
		<a href="#main_menu">메뉴 바로가기</a>
		<a href="#search">프로그램 검색 바로가기</a>
		<a href="#footer">카피라이터 바로가기</a>
</div>
<!-- sub_wrap_main START -->
<div style="padding:40px;">
		
<!-- sub_wrap START -->
 
<h2 id="container_title">회원회비내역</h2>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">
    <div class="tbl_head01 tbl_wrap">
    
        <table style="font-size:12px">
        <caption>회원회비내역</caption>
        <thead>
			<tr>
				<th>회비구분</th> 
				<th>납부일자</th>
				<th>납부</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<%
			while(d_pay!=null && d_pay.next()){
			%>
			<tr>
				<td style="text-align:center;"><%=d_pay.getString("gubun") %></td>
				<td style="text-align:center;"><%=d_pay.getString("paydate") %></td>
				<td style="text-align:center;<%="Y".equals(d_pay.getString("pay"))?"":"color:red;" %>"><%="Y".equals(d_pay.getString("pay"))?"납부":"미납" %></td>
				<td style="text-align:right;"><%=d_pay.getString("price") %></td>
			</tr>
			<%
			}
			%>
			</tbody>
		</table><br/>
		<table style="font-size:12px;">
			<thead>
			<tr>
				<th>미납내역</th>
			</tr>
			</thead>
			<tbody>
			<%
			while(d_pay_n!=null && d_pay_n.next()){
			%>
			<tr>
				<td style="text-align:center"><%=d_pay_n.getString("gubun") %></td>
			</tr>
			<%
			}
			%>
			</tbody>
        </table>
    </div>

               
</div>

<!-- 페이지 -->
</div>
<!--// sub_wrap_main END -->



</body>
</html>
