<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.vo.MemberVo"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.util.FunctionDao"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
MiceParam param = (MiceParam)request.getAttribute("param");
FunctionDao fDao = new FunctionDao();

MemberVo vo = (MemberVo)request.getAttribute("vo");
ResultSetEntity d_pay = (ResultSetEntity)request.getAttribute("data_pay");
ResultSetEntity d_pay_n = (ResultSetEntity)request.getAttribute("data_pay_n");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/form.css" />
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/json2.js"></script>
<script type="text/javascript">



$(function(){
});
</script>


</head>
<body>

<!-- Global Wrapper.s -->
<div id="wrap">

<!-- Container.s -->
	<div id="container" style="min-width:600px">

<!-- Content.s -->
		<div id="content">
 			<p class="cont_header bold">
				<span class="f_left">회원정보</span>
			</p>
			
			<div class="form_wrap">
				<div style="width:600px">
							<table class="form" style="width:600px">
								<tr>
									<td class="cat" style="width:18%">가입일자</td>
									<td style="width:37%"><%=vo.getRegistDate() %></td>
									<td class="cat" style="width:18%">회원코드</td>
									<td><%=vo.getMember_code() %></td>
								</tr>
								<tr>
									<td class="cat" >아이디</td>
									<td style="width:37%"><%=vo.getId() %></td>
									<td class="cat" >비밀번호</td>
									<td><%=vo.getPasswd() %></td>
								</tr>
							</table>
							<br/>
							
							<table class="form" style="width:600px">
								<tr>
									<td class="cat" style="width:18%">이름</td>
									<td style="width:37%"><%=vo.getName() %></td>
									<td class="cat" style="width:18%">주민번호</td>
									<td><%=vo.getRegnumber() %> - <%=vo.getRegnumber2() %></td>
								</tr>
								<tr>
									<td class="cat" >사업장명</td>
									<td><%=vo.getCompanyname() %></td>
									<td class="cat" >사업자번호</td>
									<td><%=vo.getBiznumber1()+"-"+vo.getBiznumber2()+"-"+vo.getBiznumber3() %></td>
								</tr>
								<tr>
									<td class="cat" >나이</td>
									<td><%=vo.getAge() %></td>
									<td class="cat" >성별</td>
									<td><%="M".equals(vo.getSex()) ? "남성" : "여성" %></td>
								</tr>
								<tr>
									<td class="cat" >지회</td>
									<td><%=vo.getBranch1() %></td>
									<td class="cat" >지부</td>
									<td><%=vo.getBranch2() %></td>
								</tr>
								<tr>
									<td class="cat" >직책</td>
									<td colspan="3"><%=vo.getRole() %></td>
								</tr>
								
								
								<tr>
									<td class="cat" >우편번호지역</td>
									<td colspan="3"><%=vo.getHzipcode3() %></td>
								</tr>
								<tr>
									<td class="cat" >주소1(자택)</td>
									<td colspan="3"><%=vo.getHaddr1() %></td>
								</tr>
								<tr>
									<td class="cat" >주소2(자택)</td>
									<td colspan="3"><%=vo.getHaddr2() %></td>
								</tr>
								
								
								<tr>
									<td class="cat" >우편번호지역</td>
									<td colspan="3"><%=vo.getOzipcode3() %></td>
								</tr>
								<tr>
									<td class="cat" >주소1(사업장)</td>
									<td colspan="3"><%=vo.getOaddr1() %></td>
								</tr>
								<tr>
									<td class="cat" >주소2(사업장)</td>
									<td colspan="3"><%=vo.getOaddr2() %></td>
								</tr>
							</table><br/>
							
							<table class="form" style="width:600px">
								<tr>
									<td class="cat" style="width:18%">TEL자택</td>
									<td style="width:37%"><%=vo.getHphone1() %> - <%=vo.getHphone2() %> - <%=vo.getHphone3() %></td>
									<td class="cat" style="width:18%">TEL사업장1</td>
									<td><%=vo.getOphone1() %> - <%=vo.getOphone2() %> - <%=vo.getOphone3() %></td>
								</tr>
								<tr>
									<td class="cat" >휴대폰</td>
									<td><%=vo.getCp1() %> - <%=vo.getCp2() %> - <%=vo.getCp3() %></td>
									<td class="cat" >TEL사업장2</td>
									<td><%=vo.getO2phone1() %> - <%=vo.getO2phone2() %> - <%=vo.getO2phone3() %></td>
								</tr>
								<tr>
									<td class="cat" >FAX</td>
									<td><%=vo.getOfax1() %> - <%=vo.getOfax2() %> - <%=vo.getOfax3() %></td>
									<td class="cat" >TEL사업장3</td>
									<td><%=vo.getO3phone1() %> - <%=vo.getO3phone2() %> - <%=vo.getO3phone3() %></td>
								</tr>
								<tr>
									<td class="cat" >email</td>
									<td colspan="3"><%=vo.getEmail() %></td>
								</tr>
							</table><br/>
							
							
							<table class="form" style="width:600px">
								<tr>
									<td class="cat" style="width:18%">경력</td>
									<td style="width:37%"><%=vo.getCarrier() %></td>
									<td class="cat" style="width:18%">사육군수</td>
									<td><%=vo.getBreednumber() %></td>
								</tr>
								<tr>
									<td class="cat" >우편물수취</td>
									<td><%="H".equals(vo.getMailreceive()) ? "자택" : "사업장" %></td>
									<td class="cat" >연락상태</td>
									<td>
										<%
										String str_contact_status = "";
										if("D".equals(vo.getContact_status())){
											str_contact_status = "사망";
										}else if("N".equals(vo.getContact_status())){
											str_contact_status = "장기미활동";
										}else if("O".equals(vo.getContact_status())){
											str_contact_status = "OK";
										}else if("R".equals(vo.getContact_status())){
											str_contact_status = "반송";
										}else if("K".equals(vo.getContact_status())){
											str_contact_status = "거절";
										}else if("H".equals(vo.getContact_status())){
											str_contact_status = "자격정지";
										}else if("U".equals(vo.getContact_status())){
											str_contact_status = "제명";
										}else if("L".equals(vo.getContact_status())){
											str_contact_status = "탈퇴";
										}
										%>
									<%=str_contact_status %></td>
								</tr>
								<tr>
									<td class="cat" >비고</td>
									<td colspan="3"><%=vo.getComment() %></td>
								</tr>
							</table>
							
							
							<div class="mt10" style="text-align:center">
								<a href="javascript: window.close()" class="btn grey f_right">닫기</a>
							</div>							
				
				</div>
			</div>
			
		</div>
<!-- Content.e -->
	
	</div>
<!-- Container.e -->

</div>
<!-- Global Wrapper.e -->
</body>
</html>