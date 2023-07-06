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
	if(!"01".equals(userInfo.getUserGbn())){
		response.sendRedirect("/jsp/sub9-1.jsp");
	}
}
SelectBoxDao boxDao = new SelectBoxDao();
MemberDao dao = new MemberDao();
MemberVo vo = dao.getDetail(userInfo.getUid());

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
	if(!$(frm.mailreceive).filter(":checked").length){
		alert("우편물 수취 여부를 선택하십시오.");
		frm.mailreceive.focus();
		return false;
	}
	
	//Validation End
	
	var iframe = document.getElementById("hidFrame") || document.createElement("iframe");
	iframe.name = iframe.id = "hidFrame";
	iframe.style.display="none";
	iframe.src = "";
	document.body.appendChild(iframe);
	
	frm.target = "hidFrame";
	frm.action="/jsp/sub8-1_update.jsp";
	frm.method="post";

	return true;
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
        
<jsp:include page="inc/header.jsp" />

<!-- sub_wrap START -->
    <div id="sub_wrap">

        <jsp:include page="inc/leftmenu.jsp" />

        <!-- sub_contents START -->
        <div id="sub_contents">

            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">회원정보수정</h2>
                    <div class="location">홈  &gt; <span>마이페이지</span></div>
                </div>
                <div class="sub_body_box " >


<div class="mbskin" style="padding-left:20px">

   
    
    <form name="frmRegist" method="post" action="" onsubmit="return f_submit()">
    	<input type="hidden" name="selAction" value="" />
    	<input type="hidden" name="uid" value="<%=vo.getUid() %>" />

    <div class="tbl_frm01 tbl_wrap">
        <table>
        <tbody>
        <tr>
            <th scope="row" style="width:130px"><label>아이디</label></th>
            <td><%=vo.getId() %>
            	<input type="hidden" name="id" value="<%=vo.getId() %>" /></td>
        </tr>
        <tr>
            <th scope="row" style="width:130px"><label>협회코드</label></th>
            <td><%=vo.getMember_code() %>
            	<input type="hidden" name="member_code" value="<%=vo.getMember_code() %>" /></td>
        </tr>
        <tr>
            <th scope="row"><label>비밀번호 *</label></th>
            <td><input type="password" name="passwd" value="<%=vo.getPasswd() %>" class="frm_input minlength_3 required" maxlength="20"></td>
        </tr>
        <tr>
            <th scope="row"><label>비밀번호 확인 *</label></th>
            <td><input type="password" name="passwd_chk" value="" class="frm_input minlength_3 required" maxlength="20"></td>
        </tr>
        <tr>
            <th scope="row"><label>이름 *</label></th>
            <td><%=vo.getName() %>
            	<input type="hidden" name="name" value="<%=vo.getName() %>"/>
            </td>
        </tr>
        <tr>
            <th scope="row"><label>주민등록번호 *</label></th>
            <td><%=vo.getRegnumber() %>-<%=vo.getRegnumber2() %>
            	<input type="hidden" name="regnumber" value="<%=vo.getRegnumber() %>"/>
            	<input type="hidden" name="regnumber2" value="<%=vo.getRegnumber2() %>"/>
            </td>
        </tr>
        <tr>
            <th scope="row"><label>나이</label></th>
            <td><input type="text" name="age" value="<%=vo.getAge() %>" class="frm_input" style="width:40px"></td>
        </tr>
        <tr>
            <th scope="row"><label>성별</label></th>
            <td><%="M".equals(vo.getSex())?"남자":"F".equals(vo.getSex())?"여자":"" %>
            	<input type="hidden" name="sex" value="<%=vo.getSex() %>"/>
            </td>
        </tr>
        <tr>
            <th scope="row"><label>사업장명</label></th>
            <td><input type="text" name="companyname" value="<%=vo.getCompanyname() %>" class="frm_input"></td>
        </tr>
        <tr>
            <th scope="row"><label>사업자 등록번호</label></th>
            <td><input type="text" name="biznumber1" value="<%=vo.getBiznumber1() %>" class="frm_input" style="width:60px" maxlength="10">
            	- <input type="text" name="biznumber2" value="<%=vo.getBiznumber2() %>" class="frm_input" style="width:60px" maxlength="10">
            	- <input type="text" name="biznumber3" value="<%=vo.getBiznumber3() %>" class="frm_input" style="width:60px" maxlength="10">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>지회</label></th>
            <td><%=vo.getBranch1() %>
            <input type="hidden" name="branch1" value="<%=vo.getBranch1() %>" />
            </td>
        </tr>
        <tr>
            <th scope="row"><label>지부</label></th>
            <td><%=vo.getBranch2() %>
            <input type="hidden" name="branch2" value="<%=vo.getBranch2() %>" />
            </td>
        </tr>
        <tr>
            <th scope="row"><label>직책</label></th>
            <td><%=vo.getRole_pos() %>
	            <input type="hidden" name="role_pos" value="<%=vo.getRole_pos() %>" />
	            <input type="hidden" name="role" value="<%=vo.getRole() %>" />
	        </td>
        </tr>
        <tr>
            <th scope="row"><label>주소(자택)*</label></th>
            <td>
				<input type="text" name="hzipcode3" value="<%=vo.getHzipcode3() %>"" class="frm_input" style="width:70px" readonly maxlength="5" />
            	<a href="javascript:f_address('h')" class="btn_b01" style="font-size:12px;font-weight:bold;line-height:18px;">주소검색</a>
            	<br/><input type="text" name="haddr1" value="<%=vo.getHaddr1() %>" class="frm_input" style="width:500px; margin-top:5px" readonly>
            	<br/><input type="text" name="haddr2" value="<%=vo.getHaddr2() %>" class="frm_input" style="width:500px; margin-top:5px">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>주소(사업장)</label></th>
            <td>
				<input type="text" name="ozipcode3" value="<%=vo.getOzipcode3() %>"" class="frm_input" style="width:70px" readonly maxlength="5" />
            	<a href="javascript:f_address('o')" class="btn_b01" style="font-size:12px;font-weight:bold;line-height:18px;">주소검색</a>
            	<br/><input type="text" name="oaddr1" value="<%=vo.getOaddr1() %>" class="frm_input" style="width:500px; margin-top:5px" readonly>
            	<br/><input type="text" name="oaddr2" value="<%=vo.getOaddr2() %>" class="frm_input" style="width:500px; margin-top:5px">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>전화번호(자택) *</label></th>
            <td>
            	<input type="text" name="hphone1" value="<%=vo.getHphone1() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="hphone2" value="<%=vo.getHphone2() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="hphone3" value="<%=vo.getHphone3() %>" class="frm_input" style="width:40px" maxlength="4">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>휴대폰번호</label></th>
            <td>
            	<input type="text" name="cp1" value="<%=vo.getCp1() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="cp2" value="<%=vo.getCp2() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="cp3" value="<%=vo.getCp3() %>" class="frm_input" style="width:40px" maxlength="4">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>FAX</label></th>
            <td>
            	<input type="text" name="ofax1" value="<%=vo.getOfax1() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="ofax2" value="<%=vo.getOfax2() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="ofax3" value="<%=vo.getOfax3() %>" class="frm_input" style="width:40px" maxlength="4">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>전화번호(사업장1)</label></th>
            <td>
            	<input type="text" name="ophone1" value="<%=vo.getOphone1() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="ophone2" value="<%=vo.getOphone2() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="ophone3" value="<%=vo.getOphone3() %>" class="frm_input" style="width:40px" maxlength="4">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>전화번호(사업장2)</label></th>
            <td>
            	<input type="text" name="o2phone1" value="<%=vo.getO2phone1() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="o2phone2" value="<%=vo.getO2phone2() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="o2phone3" value="<%=vo.getO2phone3() %>" class="frm_input" style="width:40px" maxlength="4">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>전화번호(사업장3)</label></th>
            <td>
            	<input type="text" name="o3phone1" value="<%=vo.getO3phone1() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="o3phone2" value="<%=vo.getO3phone2() %>" class="frm_input" style="width:40px" maxlength="4">
            	- <input type="text" name="o3phone3" value="<%=vo.getO3phone3() %>" class="frm_input" style="width:40px" maxlength="4">
            </td>
        </tr>
        <tr>
            <th scope="row"><label>이메일</label></th>
            <td><input type="text" name="email" value="<%=vo.getEmail() %>" class="frm_input"></td>
        </tr>
        <tr>
            <th scope="row"><label>양봉경력</label></th>
            <td><input type="text" name="carrier" value="<%=vo.getCarrier() %>" class="frm_input" style="width:50px"> 년</td>
        </tr>
        <tr>
            <th scope="row"><label>사육군수</label></th>
            <td><input type="text" name="breednumber" value="<%=vo.getBreednumber() %>" class="frm_input" style="width:50px"> 군</td>
        </tr>
        <tr>
            <th scope="row"><label>우편물수취 *</label></th>
            <td>
            	<input type="radio" name="mailreceive" value="H" <%="H".equals(vo.getMailreceive()) ? "checked" : "" %> class=""> 자택&nbsp;&nbsp; 
            	<input type="radio" name="mailreceive" value="O" <%="O".equals(vo.getMailreceive()) ? "checked" : "" %> class=""> 사업장
            </td>
        </tr>
        </tbody>
        </table>
    </div>



    

    <div class="btn_confirm">
        <input type="submit" value="정보수정" id="btn_submit" class="btn sub2" >
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


</body>
</html>
