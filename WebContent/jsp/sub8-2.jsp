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
if(userInfo==null){
	response.sendRedirect("/jsp/sub7-1.jsp?redirectUrl=/jsp/sub8-2.jsp");
	return;
}

SelectBoxDao boxDao = new SelectBoxDao();
PayDao payDao = new PayDao();


MiceParam param = new MiceParam();
param.put("member_uid", userInfo.getId());
ResultSetEntity d = payDao.getPayList(param);

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
                    <h2 class="page_title">회비납부내역</h2>
                    <div class="location">홈  &gt; <span>마이페이지</span></div>
                </div>
                <div class="sub_body_box " >








<h2 id="container_title"><span class="sound_only">회비납부내역</span><span class="sound_only"> 목록</span></h2>

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
        </div>	
       	<br style="clear:both"/>
    </div>



    <div class="tbl_head01 tbl_wrap">
    	<br/>
        <table style="font-size:12px">
        <caption>회비납부내역</caption>
        <thead>
	        <tr style="font-size:13px">
	            <th scope="col">회비구분</th>
	            <th scope="col">금액</th>
	            <th scope="col">납부일자</th>
	            <th scope="col">납부현황</th>
			</tr>
        </thead>
        <tbody>
        	<%
        		
			String yearlyPay = TextFormatter.convNvl(payDao.getYearlyPay(), "0");
        	System.out.println(userInfo.getRegistdate());
        	int startYear = Math.max(2000, TextFormatter.convNvl(userInfo.getRegistdate().substring(0,4), 2000));
        		
        	int curyear = Integer.parseInt(DateC.getCurrentYYYY());
        	String payday = "";
        	String paygubun = "";
        	for(int i=curyear; i>=startYear; i--){
        		payday = "-";
        		paygubun = "미납";
        		
        		d.initCursor();
        		while(d!=null && d.next()){
					if((i==d.getInt("gubun")) && "Y".equals(d.getString("pay"))){
	        			payday = d.getString("paydate", "-");
	        			paygubun = "납부";
	        			yearlyPay = d.getString("price");
						break;
					}
        		}
        			
				       				
        	%>
				<tr class="">
            		<td style="text-align:center"><%=i%> 년</td>
                    <td style="text-align:center"><%=yearlyPay %> 원</td>
		            <td style="text-align:center"><%=payday %></td>
		            <td style="text-align:center;<%="미납".equals(paygubun)?"color:red;":"" %>"><%=paygubun %></td>
				</tr>
           <%} %>
           <%
           //가입비 출력
           d.initCursor();
           while( d != null && d.next() ){
				if("가입비".equals(d.getString("gubun"))){
           %>
           	<tr class="">
           		<td style="text-align:center">가입비</td>
           		<td style="text-align:center"><%=d.getString("price") %> 원</td>
           		<td style="text-align:center"><%=d.getString("paydate", "-") %></td>
           		<td style="text-align:center;<%=!"Y".equals(d.getString("pay"))?"color:red;":"" %>"><%="Y".equals(d.getString("pay"))?"납부":"미납" %></td>
           	</tr>
           <%
				break;
				}
           }
           %>
           
           
             
            	
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
