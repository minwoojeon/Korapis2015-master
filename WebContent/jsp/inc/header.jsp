<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null)
	response.sendRedirect("/jsp/main.jsp");

%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <!-- sub_top START -->
                <!-- top START -->
	    <div id="top">
      
	      	<a class="top_logo" href="/jsp/main.jsp"><img src="https://korapis.micehub.com/home/2019/korapis/image/logo.png"  alt="한국양봉협회" /></a>
	      	
	      	<!-- top_navi START -->
	        <div id="" class="top_navi ver_pc">
	            <ul>
	                <li><a href="/"  target="_self">Home</a></li>
	                <%if(userInfo==null){ %>
	                <li><a href="/jsp/sub7-1.jsp" target="_self">로그인</a></li>
	                <li><a href="/jsp/sub7-2_00.jsp"  target="_self">회원가입</a></li>
	                <%}else{ %>
	                <li><a href="/jsp/logout.jsp" target="_self">로그아웃</a></li>
	                <%if("01".equals(userInfo.getUserGbn())){ %>
	                	<li><a href="/jsp/sub8-1.jsp" target="_self">내정보</a></li>
	                <%}else{ %>
	                	<li><a href="/jsp/sub9-1.jsp" target="_self">내정보</a></li>
	                <%} %>
	                
	                <%} %> 
	            </ul>
	            <a href="/jsp/sub8-2.jsp" class="tnb_pay">납부확인</a>
	        </div>
	        <!--// top_navi END -->
	        
	        <!-- mobile menu btn START -->
    	        <a class="btn_m_menu m_menu_open" href="#"><img src="/images/btn_m_menu.png"  alt="모바일메뉴 오픈" /></a>
	        <!-- mobile menu btn END -->
	        
			<!-- top_menu pc START -->
			<nav id="gnb_wrap" class="ver_pc">
	            <div class="menu_container">	
	    			<ul class="gnb">
	      				<li class="menu_01">
                        	<a class="t_m01" href="/jsp/sub1-1.jsp"  target="_self">협회소개</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub1-1.jsp"  target="_self">인사말</a></li>
                                <li><a href="/jsp/sub1-2.jsp"  target="_self">설립목적및연혁</a></li>
                                <li><a href="/jsp/sub1-3.jsp"  target="_self">조직구성</a></li>
                                <li><a href="/jsp/sub1-8.jsp"  target="_self">협회임원소개</a></li>
                                <li><a href="/jsp/sub1-4.jsp"  target="_self">협회정관</a></li>
                                <li><a href="/jsp/sub1-5.jsp"  target="_self">회원가입방법</a></li>
    							<!-- <a href="/jsp/sub1-6.jsp"  target="_self">회비납부</a> -->
                                <li><a href="/jsp/sub1-7.jsp"  target="_self">찾아오시는길</a></li>
                            </ul>
                        </li>
                        <li class="menu_02">
                            <a class="t_m01" href="/jsp/sub2-1_2021.jsp"  target="_self">협회운영현황</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub2-1_2021.jsp"  target="_self">주요사업</a></li>
                                <li><a href="/jsp/sub2-2.jsp"  target="_self">양봉자조금사업</a></li>
                                <li><a href="/jsp/sub2-3.jsp"  target="_self">국제대회</a></li>
                            </ul>
                        </li>
                        <li class="menu_03">
                            <a class="t_m01" href="/jsp/sub3-1.jsp"  target="_self">양봉산업정보</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub3-1.jsp"  target="_self">꿀벌/사육수통계조사</a></li>
                                <li><a href="/book_beeplant/index.html"  target="_blank">한국의밀원식물현황</a></li>
                                <li><a href="/jsp/sub3-3.jsp"  target="_self">사양관리</a></li>
                            </ul>
                        </li>
                        <li class="menu_04">
                            <a class="t_m01" href="/jsp/sub4-1.jsp"  target="_self">양봉산물</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub4-1.jsp"  target="_self">양봉의역사</a></li>
                                <li><a href="/jsp/sub4-2.jsp"  target="_self">벌꿀의성분및효능</a></li>
                                <li><a href="/jsp/sub4-3.jsp"  target="_self">로얄제리</a></li>
                                <li><a href="/jsp/sub4-4.jsp"  target="_self">프로폴리스</a></li>
                                <li><a href="/jsp/sub4-5.jsp"  target="_self">화분</a></li>
                                <li><a href="/jsp/sub4-6.jsp"  target="_self">봉독</a></li>
                                <li><a href="/jsp/sub4-7.jsp"  target="_self">봉독의성분및효능</a></li>
                            </ul>
                        </li>
                        <li class="menu_05">
                        	<a class="t_m01" href="/jsp/sub5-1.jsp"  target="_self">양봉산물연구소</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub5-1.jsp"  target="_self">연구소 연혁</a></li>
                                <li><a href="/jsp/sub5-2.jsp"  target="_self">생산농가품질관리</a></li>
                                <li><a href="/jsp/sub5-3.jsp"  target="_self">실험진행순서</a></li>
                                <li><a href="/jsp/sub5-4.jsp"  target="_self">한 벌꿀 생산이력 검색</a></li>
                            </ul>
                        </li>
	                    <li class="menu_06">
	                    	<a class="t_m01" href="/jsp/sub6-1.jsp?bflag=02"  target="_self">홍보센터</a>
	                        <ul class="gnb_sub">
                                <li><a href="/jsp/sub6-1.jsp?bflag=02"  target="_self">홍보동영상</a></li>
								<!--<li><a href="/jsp/sub6-2.jsp"  target="_self">양봉협회보</a></li>-->
								<li><a href="/jsp/sub6-3.jsp?bflag=01"  target="_self">공지사항</a></li>
								<%--
								<li><a href="/jsp/sub6-4.jsp?bflag=10"  target="_self">협회소식</a></li>
								 --%>
								<li><a href="/jsp/sub6-3.jsp?bflag=04"  target="_self">종봉분양 및 판매</a></li>
								<li><a href="/jsp/sub6-3.jsp?bflag=05"  target="_self">자유게시판</a></li>
								<!-- <li><a href="/jsp/sub6-3.jsp?bflag=03"  target="_self">양봉뉴스</a></li> -->
								<li><a href="/jsp/sub6-3.jsp?bflag=06"  target="_self">Q&A</a></li>
	                        </ul>
	                    </li>
	  				</ul>
	  				<div class="gnb_sub_bg"></div>
	  			</div>
			</nav>
	        <!--// top_menu pc END -->
	        
	        <!-- top_menu mobile START -->
	        <div class="gnb_bg_m"></div>
            <nav id="" class="gnb_wrap_m ver_m">
                <div class="menu_container">
                    <a class="btn_m_menu m_menu_close" href="#"><img src="/images/CLOSE2.png"  alt="모바일메뉴 닫기" /></a>
                     
                    <ul class="gnb">
                        <li class="menu_01">
                            <a class="t_m01" href="/jsp/sub1-1.jsp"  target="_self">협회소개</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub1-1.jsp"  target="_self">인사말</a></li>
                                <li><a href="/jsp/sub1-2.jsp"  target="_self">설립목적및연혁</a></li>
                                <li><a href="/jsp/sub1-3.jsp"  target="_self">조직구성</a></li>
                                <li><a href="/jsp/sub1-4.jsp"  target="_self">협회정관</a></li>
                                <li><a href="/jsp/sub1-5.jsp"  target="_self">회원가입방법</a></li>
                                <!-- <a href="/jsp/sub1-6.jsp"  target="_self">회비납부</a> -->
                                <li><a href="/jsp/sub1-7.jsp"  target="_self">찾아오시는길</a></li>
                            </ul>
                        </li>
                        <li class="menu_02">
                            <a class="t_m01" href="/jsp/sub2-1.jsp"  target="_self">협회운영현황</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub2-1.jsp"  target="_self">주요사업</a></li>
                                <li><a href="/jsp/sub2-2.jsp"  target="_self">양봉자조금사업</a></li>
                                <li><a href="/jsp/sub2-3.jsp"  target="_self">국제대회</a></li>
                            </ul>
                        </li>
                        <li class="menu_03">
                            <a class="t_m01" href="/jsp/sub3-1.jsp"  target="_self">양봉산업정보</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub3-1.jsp"  target="_self">꿀벌/사육수통계조사</a></li>
                                <li><a href="/book_beeplant/index.html"  target="_blank">한국의밀원식물현황</a></li>
                                <li><a href="/jsp/sub3-3.jsp"  target="_self">사양관리</a></li>
                            </ul>
                        </li>
                        <li class="menu_04">
                            <a class="t_m01" href="/jsp/sub4-1.jsp"  target="_self">양봉산물</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub4-1.jsp"  target="_self">양봉의역사</a></li>
                                <li><a href="/jsp/sub4-2.jsp"  target="_self">벌꿀의성분및효능</a></li>
                                <li><a href="/jsp/sub4-3.jsp"  target="_self">로얄제리</a></li>
                                <li><a href="/jsp/sub4-4.jsp"  target="_self">프로폴리스</a></li>
                                <li><a href="/jsp/sub4-5.jsp"  target="_self">화분</a></li>
                                <li><a href="/jsp/sub4-6.jsp"  target="_self">봉독</a></li>
                                <li><a href="/jsp/sub4-7.jsp"  target="_self">봉독의성분및효능</a></li>
                            </ul>
                        </li>
                        <li class="menu_05">
                            <a class="t_m01" href="/jsp/sub5-1.jsp"  target="_self">양봉산물연구소</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub5-1.jsp"  target="_self">연구소 연혁</a></li>
                                <li><a href="/jsp/sub5-2.jsp"  target="_self">생산농가품질관리</a></li>
                                <li><a href="/jsp/sub5-3.jsp"  target="_self">실험진행순서</a></li>
                                <li><a href="/jsp/sub5-4.jsp"  target="_self">한 벌꿀 생산이력 검색</a></li>
                            </ul>
                        </li>
                        <li class="menu_06">
                            <a class="t_m01" href="/jsp/sub6-1.jsp?bflag=02"  target="_self">홍보센터</a>
                            <ul class="gnb_sub">
                                <li><a href="/jsp/sub6-1.jsp?bflag=02"  target="_self">홍보동영상</a></li>
                                <!--<li><a href="/jsp/sub6-2.jsp"  target="_self">양봉협회보</a></li>-->
                                <li><a href="/jsp/sub6-3.jsp?bflag=01"  target="_self">공지사항</a></li>
                                <%--
                                <li><a href="/jsp/sub6-4.jsp?bflag=10"  target="_self">협회소식</a></li>
                                 --%>
                                <li><a href="/jsp/sub6-3.jsp?bflag=04"  target="_self">종봉분양 및 판매</a></li>
                                <li><a href="/jsp/sub6-3.jsp?bflag=05"  target="_self">자유게시판</a></li>
                                <!-- <li><a href="/jsp/sub6-3.jsp?bflag=03"  target="_self">양봉뉴스</a></li> -->
                                <li><a href="/jsp/sub6-3.jsp?bflag=06"  target="_self">Q&A</a></li>
                            </ul>
                        </li>
                    </ul>
                    
                    <div class="top_navi">
                        <ul class="cle">
                            <li><a href="/"  target="_self">Home</a></li>
                            <%if(userInfo==null){ %>
                            <li><a href="/jsp/sub7-1.jsp" target="_self">로그인</a></li>
                            <li><a href="/jsp/sub7-2.jsp"  target="_self">회원가입</a></li>
                            <%}else{ %>
                            <li><a href="/jsp/logout.jsp" target="_self">로그아웃</a></li>
                            <%if("01".equals(userInfo.getUserGbn())){ %>
                                <li><a href="/jsp/sub8-1.jsp" target="_self">내정보</a></li>
                            <%}else{ %>
                                <li><a href="/jsp/sub9-1.jsp" target="_self">내정보</a></li>
                            <%} %>
                            
                            <%} %> 
                        </ul>
                        <a href="/jsp/sub8-2.jsp" class="tnb_pay">납부확인</a>
                    </div>
                </div>
            </nav>
            <!--// top_menu pc END -->
	   </div>
       <!--// top END -->
       <!--// sub_top END -->        
       
       <div class="sub_visual ver_pc"><img src="/images/sub_visual.png"  alt="서브비주얼"/></div>
       <div class="sub_visual ver_m"><img src="/images/sub_visual_m.png"  alt="서브비주얼"/></div>
       
       
      <script>
		   
		    $(document).ready(function(){
		
		    	//모바일메뉴
		        $(".m_menu_open").click(function(){
		            $(".gnb_wrap_m").animate({right : "0"}, 300);
                    $(".gnb_bg_m").fadeIn("fast");
		            return false;
		        });
		        $(".m_menu_close").click(function(){
		            $(".gnb_wrap_m").animate({right : "-82%"}, 300);
		            $(".gnb_bg_m").fadeOut("fast");
		            return false;
		        });
		    

	            $(document).on("click", '.gnb_wrap_m .gnb > li > a', function(e) {
	                var $this = $(this);    
                    $this.parent('li').children('.gnb_sub').stop().slideToggle();
                    $this.parent('li').siblings('li').find('.gnb_sub').stop().slideUp();
                    return false;
	                
	            });
		
		    });
		
		</script>

       
