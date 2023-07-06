<%@page import="kr.or.korapis.member.CertiDao"%>
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
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");

SelectBoxDao boxDao = new SelectBoxDao();
CertiDao dao = new CertiDao();


MiceParam param = new MiceParam();
param.put("member_id", userInfo.getId());
ResultSetEntity d = dao.getList(param);

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
	//시험결과 샅세화면으로 이동한다.
	function f_detail(i_uid){
		alert('성적서 관련 문의는 양봉협회 유선전화로 연락 바랍니다.');
		/*
		var frm = document.forms.frmDetail;
		frm.uid.value = i_uid;
		
		frm.target = "";
		frm.method = "post";
		frm.action = "/jsp/sub8-3_1.jsp";
		frm.submit();
		*/
	}

</script>
</head>
<body>
<form name="frmDetail" method="post">
<input type="hidden" name="uid" value=""/>
</form>

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
                    <h2 class="page_title">시험성적서</h2>
                    <div class="location">홈  &gt; <span>마이페이지</span></div>
                </div>
                <div class="sub_body_box " >








<h2 id="container_title"><span class="sound_only">시험성적서</span><span class="sound_only"> 목록</span></h2>

<!-- 게시판 목록 시작 { -->
<div id="bo_list" style="width:100%">


    <!-- 게시판 페이지 정보 및 버튼 시작 { -->
    <div class="bo_fx" style="padding:0px 5px">
        <div style="float:right">
        </div>	
    </div>



    <div class="tbl_head01 tbl_wrap">
        <table style="font-size:12px">
        <caption>시험성적서</caption>
        <thead>
	        <tr style="font-size:13px">
	            <th scope="col">처리번호</th>
	            <th scope="col">봉인번호</th>
	            <th scope="col">검체표시</th>
	            <th scope="col">접수번호</th>
	            <th scope="col">접수일자</th>
	            <th scope="col">판정</th>
			</tr>
        </thead>
        <tbody>
        	<%
        	if(d!=null && d.size()>0){
        		for(int i=0; i<d.size(); i++){
        			d.next();
        			
        	%>
				<tr class="">
            		<td style="text-align:center;cursor:pointer;" onclick="javascript: f_detail('<%=d.getString("uid") %>')">
            			<%=d.getString("regnum") %>
            		</td>
            		<td style="text-align:center"><%=d.getString("bongin") %></td>
            		<td style="text-align:center"><%=d.getString("검체표시") %></td>
            		<td style="text-align:center"><%=d.getString("rqst_nmbr") %></td>
            		<td style="text-align:center"><%=d.getString("recv_date") %></td>
            		<td style="text-align:center"><%=d.getString("test_rslt") %></td>
				</tr>
           <%	}
        	}else{%>
        		<tr class="">
            		<td style="text-align:center" colspan="6">시험검사 결과가 없습니다.</td>
				</tr>
        	<%} %>
           
           
             
            	
			</tbody>
        </table>
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
