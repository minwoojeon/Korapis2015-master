<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">



//주민번호 중복체크
function f_check_userid(){
	
	if( $("#id").val()=="" || $("#id").val().length<3 ){
		alert("아이디를 입력해주세요\n최소 3자리이상 입력바랍니다.");
		return;
	}
	
	
	$.ajax({
		url: "/jsp/check_userid.jsp", 
		type: "post",
		data: {
			"selAction" : "check_userid",
			"id" : $("#id").val()
		},
		dataType:"json",
		error:function(r,s,e){
			alert("아이디 확인 시 오류가 발생했습니다.");
		},
		success: function(data){
			if(data.result == "SUCCESS"){
				alert("신규가입이 가능한 아이디입니다.");
				$("#check_userid").val("Y");
			}else{
				alert("이미 가입되어 있는 아이디입니다.");
				$("#check_userid").val("N");
				$("#id").val("");
			}
			
		}
	});
}


$(function(){
	$("#id").on("change", function(){
		$("#check_userid").val("N");
	});
	
});

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


/* function f_addressCallback(gubun, part1, part2, zipno){
	var frm = document.forms.frmRegist;
	frm[gubun+'addr1'].value = part1;
	frm[gubun+'addr2'].value = part2;
	var match = zipno.match(/^(\d\d\d)-(\d\d\d)$/);
	if(match){
		frm[gubun+'zipcode1'].value=match[1];
		frm[gubun+'zipcode2'].value=match[2];
	}
	$(frm[gubun+'addr2']).trigger("focus").trigger("select");
} */



function f_submit(){
	var frm = document.forms.frmRegist;
	
	if(!frm.id.value){
		alert("아이디를 입력해 주십시오.");
		frm.id.focus();
		return;
	}
	if($("#check_userid").val() != 'Y'){
		alert("아이디 중복체크를 확인 해주세요!");
		return;
	}
	
	
	
	//Validation Start
	if(!frm.passwd.value){
		alert("비밀번호를 입력해 주십시오.");
		frm.passwd.focus();
		return;
	}
	if(!frm.passwd_chk.value){
		alert("비밀번호 확인을 입력해 주십시오.");
		frm.passwd_chk.focus();
		return;
	}
	if(frm.passwd.value != frm.passwd_chk.value){
		alert("비밀번호가 일치하지 않습니다.");
		frm.passwd_chk.focus();
		frm.passwd_chk.select();
		return;
	}
	
	
	
	if(!frm.name.value){
		alert("이름을 입력해 주십시오.");
		frm.name.focus();
		return;
	}
	
	if(frm.hzipcode3.value == '' || frm.haddr1.value == ''){
		alert("주소를 입력해 주십시오.");
		frm.haddr2.focus();
		return;
	}
	
	if((frm.hphone1.value + frm.hphone2.value + frm.hphone3.value) == ''){
		alert("자택 전화전호를 입력해 주십시오.");
		frm.hphone1.focus();
		return;
	}
	
	//Validation End
	
	var iframe = document.getElementById("hidFrame") || document.createElement("iframe");
	iframe.name = iframe.id = "hidFrame";
	iframe.style.display="none";
	iframe.src = "";
	document.body.appendChild(iframe);
	
	frm.target = "hidFrame";
	frm.action="/jsp/sub7-2_insert.jsp";
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
    
<jsp:include page="inc/header.jsp" />
    
<!-- sub_wrap START -->
    <div id="sub_wrap">
        
        <jsp:include page="inc/leftmenu.jsp" />
        
        <!-- sub_contents START -->
        <div id="sub_contents">
            
            
            <!-- sub_con START -->
            <div id="sub_con_box">
                <div class="sub_top_box">
                    <h2 class="page_title">회원가입</h2>
                    <div class="location">홈  &gt; 운영체제 &gt; <span>일반회원가입</span></div>
                </div>
                <div class="sub_body_box " >


					<div class="mbskin">
					
					   
					    
					    <form name="frmRegist" method="post" action="">
					    	<input type="hidden" name="selAction" value="" />
					
					    
					    <div class="tbl_frm01 tbl_wrap">
					        <table>
					        <caption>사이트 및 시스템 이용정보 입력</caption>
					        <tbody>
					        <tr>
					            <th scope="row"><label for="reg_mb_id">아이디<strong class="sound_only">필수</strong></label></th>
					            <td>
					                <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 3자이상 입력하세요.</span>
					                <input type="text" name="id" value="" id="id" maxlength="20" class="frm_input">
					                
					                <input type="hidden" name="check_userid" id="check_userid" value="N"/>
									<a href="javascript: f_check_userid()" class="btn_b01 sub2">중복확인</a>
												
					            </td>
					        </tr>
					        <tr>
					            <th scope="row"><label for="reg_mb_password">비밀번호<strong class="sound_only">필수</strong></label></th>
					            <td><input type="password" name="passwd" id="passwd" maxlength="20" class="frm_input"></td>
					        </tr>
					        <tr>
					            <th scope="row"><label for="reg_mb_password_re">비밀번호 확인<strong class="sound_only">필수</strong></label></th>
					            <td><input type="password" name="passwd_chk" id="passwd_chk" maxlength="20" class="frm_input"></td>
					        </tr>
					        </tbody>
					        </table>
					    </div>
					
					    <div class="tbl_frm01 tbl_wrap">
					        <table>
					        <caption>개인정보 및 사업장정보 입력</caption>
					        <tbody>
					        <tr>
					            <th scope="row"><label for="reg_mb_name">이름<strong class="sound_only">필수</strong></label></th>
					            <td><input type="text" name="name" value="" class="frm_input"/></td>
					        </tr>
					        <tr>
					            <th scope="row"><label for="reg_mb_birth_y">생년월일<strong class="sound_only">필수</strong></label></th>
					            <td>
						            <input name="regnumber" id="regnumber" type="text" value="" class="frm_input" size="6" maxlength="6">
								</td>
					        </tr>
					               
					
					
					        <tr>
					            <th scope="row"><label for="reg_mb_email">E-mail<strong class="sound_only">필수</strong></label></th>
					            <td>
					                <input type="text" name="email" value="" id="reg_mb_email" style="width:160px" class="frm_input email required" size="72" maxlength="100">
					            </td>
					        </tr>
					        <tr>
					            <th scope="row"><label for="reg_mb_tel">휴대폰번호</label></th>
					            <td>	
								<input type="text" name="cp1" value="" id="reg_mb_hp" style="width:40px" class="frm_input required" maxlength="3">
								-
								<input type="text" name="cp2" value="" id="reg_mb_hp" style="width:40px" class="frm_input required" maxlength="4">
								-
								<input type="text" name="cp3" value="" id="reg_mb_hp" style="width:40px" class="frm_input required" maxlength="4">
								
								</td>
					        </tr>
					        <tr>
					        	<th scope="row"><label for="reg_mb_tel">자택전화<strong class="sound_only">필수</strong></label></th>
					        	<td>
								 <input type="text" name="hphone1" value="" id="hphone1" class="frm_input" maxlength="3"style="width:40px">
								 -
								 <input type="text" name="hphone2" value="" id="hphone2" class="frm_input" maxlength="4"style="width:40px">
								 -
								 <input type="text" name="hphone3" value="" id="hphone3" class="frm_input" maxlength="4"style="width:40px">
					            </td>
					        </tr>
					        
					        <tr>
					            <th scope="row">
					                주소
					                <strong class="sound_only">필수</strong>            </th>
					            <td>
					            	<input type="text" name="hzipcode3" value="" class="frm_input" style="width:70px;" readonly maxlength="5" />
					            	<!-- <input type="text" name="hzipcode1" value="" class="frm_input" style="width:40px" readonly maxlength="3"> - <input type="text" name="hzipcode2" value="" class="frm_input" style="width:40px" readonly maxlength="3"> -->
					            	<a href="javascript:f_address('h')" class="btn_b01" style="font-size:12px;font-weight:bold;line-height:18px;">주소검색</a>
					            	<br/><input type="text" name="haddr1" value="" class="frm_input mt5" readonly>
					            	<br/><input type="text" name="haddr2" value="" class="frm_input mt5">
					            </td>
					        </tr>
					      
					
					
					        </tbody>
					        </table>
					    </div>
					
					
					
					    
					
					    <div class="btn_confirm">
					        <input type="button" value="회원가입" id="btn_submit" class="btn sub2" onclick="f_submit()">
					        <a href="" class="btn cancel">취소</a>
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
