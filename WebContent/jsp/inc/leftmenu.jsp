<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Pattern pat = Pattern.compile("^/jsp/sub(\\d+)-(\\d+)(_(\\d+))?\\.jsp$");
Matcher mat = pat.matcher(request.getRequestURI());
int main = 1;
int sub = 1;
if(mat.matches()){
   main = TextFormatter.convNvl(mat.group(1), 1);
   sub = TextFormatter.convNvl(mat.group(2), 1);
}

MiceParam param = new MiceParam();

BbsDao dao = new BbsDao();
ResultSetEntity list = dao.getBbsLastCdate();

int[] temp = new int[list.size()];

for (int i=0; i<list.size(); i++) {
   list.next();
   temp[i] = list.getInt("cdateRecentWeek");
}

String l_bflag = TextFormatter.convNvl(request.getParameter("bflag"), "02");
%>
<!-- left_menu START -->
<div id="left_menu">
<%
switch(main){
case 1:
%>
   <h2>협회소개</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub1-1.jsp"  target="_self">인사말</a></li>
      <li <%=sub==2?"class='selected'":""%>><a href="/jsp/sub1-2.jsp"  target="_self">설립목적및연혁</a></li>
      <li <%=sub==3?"class='selected'":""%>><a href="/jsp/sub1-3.jsp"  target="_self">조직구성</a></li>
      <li <%=sub==8?"class='selected'":""%>><a href="/jsp/sub1-8.jsp"  target="_self">협회임원소개</a></li>
      <li <%=sub==4?"class='selected'":""%>><a href="/jsp/sub1-4.jsp"  target="_self">협회정관</a></li>
      <li <%=sub==5?"class='selected'":""%>><a href="/jsp/sub1-5.jsp"  target="_self">회원가입방법</a></li>
      <!--  <li <%=sub==6?"class='selected'":""%>><a href="/jsp/sub1-6.jsp"  target="_self">회비납부</a></li>-->
      <li <%=sub==7?"class='selected'":""%>><a href="/jsp/sub1-7.jsp"  target="_self">찾아오시는길</a></li>
   </ul>
<%
break;
case 2:
%>
<h2>협회운영현황</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub2-1_2021.jsp"  target="_self">주요사업</a></li>
      <li <%=sub==2?"class='selected'":""%>><a href="/jsp/sub2-2.jsp"  target="_self">양봉자조금사업</a></li>
      <li <%=sub==3?"class='selected'":""%>><a href="/jsp/sub2-3.jsp"  target="_self">국제대회</a></li>
   </ul>
<%
break;
case 3:
%>
<h2>양봉산업정보</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub3-1.jsp"  target="_self">꿀벌/사육수통계조사</a></li>
      <li <%=sub==2?"class='selected'":""%>><a href="http://www.korapis.or.kr/book_beeplant/index.html"  target="_blank">한국의밀원식물현황</a></li>
      <li <%=sub==3?"class='selected'":""%>><a href="/jsp/sub3-3.jsp"  target="_self">사양관리</a></li>
   </ul>
<%
break;
case 4:
%>
<h2>양봉산물</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub4-1.jsp"  target="_self">양봉의역사</a></li>
      <li <%=sub==2?"class='selected'":""%>><a href="/jsp/sub4-2.jsp"  target="_self">벌꿀의성분및효능</a></li>
      <li <%=sub==3?"class='selected'":""%>><a href="/jsp/sub4-3.jsp"  target="_self">로얄제리</a></li>
      <li <%=sub==4?"class='selected'":""%>><a href="/jsp/sub4-4.jsp"  target="_self">프로폴리스</a></li>
      <li <%=sub==5?"class='selected'":""%>><a href="/jsp/sub4-5.jsp"  target="_self">화분</a></li>
      <li <%=sub==6?"class='selected'":""%>><a href="/jsp/sub4-6.jsp"  target="_self">봉독</a></li>
      <li <%=sub==7?"class='selected'":""%>><a href="/jsp/sub4-7.jsp"  target="_self">봉독의성분및효능</a></li>
   </ul>
<%
break;
case 5:
%>
<h2>양봉산물연구소</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub5-1.jsp"  target="_self">연구소 연혁</a></li>
      <li <%=sub==2?"class='selected'":""%>><a href="/jsp/sub5-2.jsp"  target="_self">생산농가품질관리</a></li>
      <li <%=sub==3?"class='selected'":""%>><a href="/jsp/sub5-3.jsp"  target="_self">실험진행순서</a></li>
	  <li <%=sub==4 || sub==5?"class='selected'":""%>><a href="/jsp/sub5-4.jsp"  target="_self">한 벌꿀 생산이력 검색</a></li>
      <!--<li <%=sub==5?"class='selected'":""%>><a href="/jsp/sub5-5.jsp"  target="_self">한 벌꿀 생산이력 검색</a></li>-->
   </ul>
<%
break;
case 6:
%>
<h2>홍보센터</h2>
   <ul class="form">
      <li <%="02".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-1.jsp?bflag=02"  target="_self">홍보동영상<%= temp[1] <= 2 ? "<span class='new_badge'></span>" : "" %></a></li>
<!--      <li <%="07".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-2.jsp"  target="_self">양봉협회보 <%= temp[6] <= 2 ? "<span class='new_badge'></span>" : "" %></a></li> -->
      <li <%="01".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-3.jsp?bflag=01"  target="_self">공지사항 <%= temp[0] <= 2 ? "<span class='new_badge'></span>" : "" %></a></li>
      <li <%="10".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-4.jsp?bflag=10" target="_self">협회소식 <%= temp[8] <= 2 ? "<span class='new_badge'></span>" : "" %></a></li>
      <li <%="04".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-3.jsp?bflag=04"  target="_self">종봉분양 및 판매 <%= temp[3] <= 2 ? "<span class='new_badge'></span>" : "" %></a></li>
      <li <%="05".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-3.jsp?bflag=05"  target="_self">자유게시판 <%= temp[4] <= 2 ? "<span class='new_badge'></span>" : "" %></a></li>
      <%-- <li <%="03".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-3.jsp?bflag=03"  target="_self">양봉뉴스</a></li> --%>
      <li <%="06".equals(l_bflag) ?"class='selected'":""%>><a href="/jsp/sub6-3.jsp?bflag=06"  target="_self">Q&A<%= temp[5] <= 2 ? "<span class='new_badge'></span>" : "" %></a></li>
   </ul>
<%
break;
case 7:
%>
<h2>운영체제</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub7-1.jsp"  target="_self">로그인</a></li>
      <li <%=sub==2?"class='selected'":""%>><a href="/jsp/sub7-2_00.jsp"  target="_self">회원가입</a></li>
      <li <%=sub==3?"class='selected'":""%>><a href="/jsp/sub7-3.jsp"  target="_self">아이디/비밀번호 찾기</a></li>
      <li <%=sub==4?"class='selected'":""%>><a href="/jsp/sub7-4.jsp"  target="_self">저작권정책</a></li>
      <li <%=sub==5?"class='selected'":""%>><a href="/jsp/sub7-5.jsp"  target="_self">개인정보취급방침 </a></li>
      <li <%=sub==6?"class='selected'":""%>><a href="/jsp/sub7-6.jsp"  target="_self">이메일무단수집거부</a></li>
   </ul>
<%
break;
case 8:
%>
<h2>마이페이지</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub8-1.jsp"  target="_self">회원정보 수정</a></li>
      <li <%=sub==2?"class='selected'":""%>><a href="/jsp/sub8-2.jsp"  target="_self">회비납부내역</a></li>
      <li <%=sub==3?"class='selected'":""%>><a href="/jsp/sub8-3.jsp"  target="_self">시험성적서</a></li>
   </ul>
   
<%
break;
case 9:
%>
<h2>마이페이지</h2>
   <ul class="form">
      <li <%=sub==1?"class='selected'":""%>><a href="/jsp/sub9-1.jsp"  target="_self">회원정보 수정</a></li>
   </ul>   
   
<%

}
%>
</div>
   <!--// left_menu END -->
