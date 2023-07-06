<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
<%@page import="kr.or.korapis.member.MemberDao"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null){
	response.sendRedirect("/jsp/main.jsp");
}else{
	if(!"02".equals(userInfo.getUserGbn())){
		response.sendRedirect("/jsp/sub8-1.jsp");
	}
}

SelectBoxDao boxDao = new SelectBoxDao();
MemberDao dao = new MemberDao();
MemberVo vo = dao.getDetail_ilban(userInfo.getUid());

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
<!--[if lte IE 8]>
<script src="html5.js" ></script>
<![endif]-->
<script src="/js/jquery-1.8.3.min.js" ></script>
<script type="text/javascript">

function f_address(i_gubun){
	var l = screenX || screenLeft,
	t = screenY || screenTop,
	w = window.outerWidth || document.documentElement.clientWidth,
	h = window.outerHeight || document.documentElement.clientHeight;
	
	var opt = "left="+(l+w/2-375)+
				",top="+(t+h/2-365)+
				",width=750,height=670,status=no,resizable=yes,scrollbars=yes";
	window.open("/_mgr/jsp/member/addressList.jsp?gubun="+i_gubun,"address_popup",opt);
}
function f_addressCallback(gubun, part1, part2, zipno){
	var frm = document.forms.frmRegist;
	frm[gubun+'addr1'].value = part1;
	frm[gubun+'addr2'].value = part2;
	frm[gubun+'zipcode3'].value=zipno;
	$(frm[gubun+'addr2']).trigger("focus").trigger("select");
}

function f_submit(){
	var frm = document.forms.frmRegist;
	
	//Validation Start
	if(!frm.passwd.value){
		alert("비밀번호를 입력해 주십시오.");
		frm.passwd.focus();
		return false;
	}
	if(!frm.passwd_chk.value){
		alert("비밀번호 확인을 입력해 주십시오.");
		frm.passwd_chk.focus();
		return false;
	}
	if(frm.passwd.value != frm.passwd_chk.value){
		alert("비밀번호가 일치하지 않습니다.");
		frm.passwd_chk.focus();
		frm.passwd_chk.select();
		return false;
	}
	
	if(frm.hzipcode3.value == '' || frm.haddr1.value == ''){
		alert("주소를 입력해 주십시오.");
		frm.haddr2.focus();
		return false;
	}
	
	if((frm.hphone1.value + frm.hphone2.value + frm.hphone3.value) == ''){
		alert("자택 전화전호를 입력해 주십시오.");
		frm.hphone1.focus();
		return false;
	}
	
	//Validation End
	
	var iframe = document.getElementById("hidFrame") || document.createElement("iframe");
	iframe.name = iframe.id = "hidFrame";
	iframe.style.display="none";
	iframe.src = "";
	document.body.appendChild(iframe);
	
	frm.target = "hidFrame";
	frm.action="/jsp/sub9-1_update.jsp";
	frm.method="post";
	
	frm.submit();
}
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
		
<!-- sub_wrap START -->
 	<div id="sub_wrap">
 	
		<jsp:include page="inc/header.jsp" />
		
        <!-- sub_contents START -->
        <div id="sub_contents">
        	
        	<jsp:include page="inc/leftmenu.jsp" />
        	
            <!-- sub_con START -->
         <div id="sub_con_box">
            	<div class="sub_top_box">
                	<div class="location"><img src="/images/home_icon.gif" alt="home" style="margin-top:-2px;" /> &gt; <span>마이페이지</span></div>
                    <h2>회원정보수정</h2>
                </div>
                <div class="sub_body_box " >


<div class="mbskin" style="padding-left:20px">

    <form name="frmRegist" method="post" action="" onsubmit="f_submit()">
    	<input type="hidden" name="selAction" value="" />
    	<input type="hidden" name="uid" value="<%=vo.getUid() %>" />
    	
    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>사이트 및 시스템 이용정보 입력</caption>
        <tbody>
        <tr>
            <th scope="row"><label for="reg_mb_id">아이디</label></th>
            <td>
                <%=vo.getId() %>
            	<input type="hidden" name="id" value="<%=vo.getId() %>" />
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_password">비밀번호<strong class="sound_only">필수</strong></label></th>
            <td>
            	<%=vo.getPasswd() %>
            	<input type="hidden" name="passwd" id="passwd" value="<%=vo.getPasswd() %>" maxlength="20">
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_password_re">비밀번호 확인<strong class="sound_only">필수</strong></label></th>
            <td><input type="password" name="passwd_chk" id="passwd_chk" maxlength="20"></td>
        </tr>
        </tbody>
        </table>
    </div>

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <caption>개인정보 및 사업장정보 입력</caption>
        <tbody>
        <tr>
            <th scope="row"><label for="reg_mb_name">이름</label></th>
            <td><%=vo.getName() %>
            	<input type="hidden" name="name" value="<%=vo.getName() %>"/>
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_birth_y">생년월일<strong class="sound_only">필수</strong></label></th>
            <td>
	            <input name="regnumber" id="regnumber" type="text" value="<%=vo.getRegnumber() %>" class="frm_input" size="6" maxlength="6">
			</td>
        </tr>
               


        <tr>
            <th scope="row"><label for="reg_mb_email">E-mail<strong class="sound_only">필수</strong></label></th>
            <td>
                <input type="text" name="email" value="<%=vo.getEmail() %>" id="reg_mb_email" style="width:160px" class="frm_input email required" size="72" maxlength="100">
            </td>
        </tr>
        <tr>
            <th scope="row"><label for="reg_mb_tel">휴대폰번호</label></th>
            <td>	
			<input type="text" name="cp1" value="<%=vo.getCp1() %>" id="reg_mb_hp" style="width:40px" class="frm_input required" maxlength="3">
			-
			<input type="text" name="cp2" value="<%=vo.getCp2() %>" id="reg_mb_hp" style="width:40px" class="frm_input required" maxlength="4">
			-
			<input type="text" name="cp3" value="<%=vo.getCp3() %>" id="reg_mb_hp" style="width:40px" class="frm_input required" maxlength="4">
			
			</td>
        </tr>
        <tr>
        	<th scope="row"><label for="reg_mb_tel">자택전화<strong class="sound_only">필수</strong></label></th>
        	<td>
			 <input type="text" name="hphone1" value="<%=vo.getHphone1() %>" id="hphone1" class="frm_input" style="width:40px" maxlength="3">
			 -
			 <input type="text" name="hphone2" value="<%=vo.getHphone2() %>" id="hphone2" class="frm_input" style="width:40px" maxlength="4">
			 -
			 <input type="text" name="hphone3" value="<%=vo.getHphone3() %>" id="hphone3" class="frm_input" style="width:40px" maxlength="4">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>주소(자택)*</label></th>
            <td>
            	<input type="text" name="hzipcode3" value="<%=vo.getHzipcode3() %>" class="frm_input" style="width:70px;" readonly maxlength="5" />
            	<%-- <input type="text" name="hzipcode1" value="<%=vo.getHzipcode1() %>" class="frm_input" style="width:40px" readonly maxlength="3"> - <input type="text" name="hzipcode2" value="<%=vo.getHzipcode2() %>" class="frm_input" style="width:40px" readonly maxlength="3"> --%>
            	<a href="javascript:f_address('h')" class="btn_b01" style="font-size:12px;font-weight:bold;line-height:18px;">주소검색</a>
            	<br/><input type="text" name="haddr1" value="<%=vo.getHaddr1() %>" class="frm_input" style="width:500px; margin-top:5px" readonly>
            	<br/><input type="text" name="haddr2" value="<%=vo.getHaddr2() %>" class="frm_input" style="width:500px; margin-top:5px">
            </td>
        </tr>
        </tbody>
        </table>
    </div>



    

    <div class="btn_confirm">
        <input type="submit" value="정보수정" id="btn_submit" class="btn_submit" >
        <!-- <a href="" class="btn_cancel">취소</a> -->
    </div>
	<div style="float:left;width:100%;height:30px;">&nbsp;</div>
    </form>

 
</div></div></div>
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


<!-- ie6,7에서 사이드뷰가 게시판 목록에서 아래 사이드뷰에 가려지는 현상 수정 -->
<!--[if lte IE 7]>
<script>
$(function() {
    var $sv_use = $(".sv_use");
    var count = $sv_use.length;

    $sv_use.each(function() {
        $(this).css("z-index", count);
        $(this).css("position", "relative");
        count = count - 1;
    });
});
</script>
<![endif]-->

</body>
</html>
