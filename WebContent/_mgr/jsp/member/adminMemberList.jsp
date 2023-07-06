<%@page import="java.util.Calendar"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@page import="kr.or.korapis.util.DateC"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="kr.or.korapis.vo.SelfcostVo"%>
<%@page import="kr.or.korapis.util.SelectBoxDao"%>
<%@page import="kr.or.korapis.util.PagesVo"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
MiceParam param = (MiceParam)request.getAttribute("param");

ResultSetEntity dataList = (ResultSetEntity)request.getAttribute("dataList");
PagesVo pagesVo = (PagesVo)request.getAttribute("pagesVo");
SelectBoxDao boxDao = new SelectBoxDao();
SelfcostVo vo1 = (SelfcostVo)request.getAttribute("vo1");
DateC datec = new DateC();

String selName = request.getParameter("selName");

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

Calendar cal = Calendar.getInstance();
int currentYear = cal.get(Calendar.YEAR);
int startYear = DateC.getKorapisBillYear();
int countYear = 5;

session.setAttribute("selName", selName);


String selName1 = (String)session.getAttribute("selName");

String idx = "";

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
a{color:#000;}
 
.mask{width:100%; height:100%; position:fixed; left:0; top:0; z-index:10; background:#000; opacity:.5; filter:alpha(opacity=50);}
 
#modalLayer_cost{display:none; position:relative;}
#modalLayer_cost .modalContent{width:440px; padding:20px; border:1px solid #ccc; position:fixed; left:16.6%; 
top:4%; z-index:11; background:#fff;}
#modalLayer_cost .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}


#modalLayer_self{display:none; position:relative;}
#modalLayer_self .modalContent{width:440px; padding:20px; border:1px solid #ccc; position:fixed; left:16.6%; 
top:4%; z-index:11; background:#fff;}
#modalLayer_self .modalContent button{position:absolute; right:0; top:0; cursor:pointer;}


#costNameList {padding:10px;}
#costNameList span {display:inline-block; width:25%;}

#selfCost_nameList {padding:10px;}
#selfCost_nameList span {display:inline-block; width:25%;}


</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<link rel="stylesheet" type="text/css" href="/_mgr/css/custom-theme/jquery-ui-1.10.2.custom.css" />
<link rel="stylesheet" type="text/css" href="/_mgr/css/common.css">
<script type="text/javascript" src="/_mgr/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="/_mgr/js/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript">

var costNameList;
var uidList;
var selfNameList;

	$(function(){
		
		$("[name=selName]").focus();
		
		// 검색창
		var $searchInput = $(".searchinput");
		$searchInput.on("keypress",function(e){
			if(e.which==13){
				e.preventDefault();
				f_search();
			}
		});//.on("focus",function(e){
			//$(this).val("");
		//});

		// 회원가입일 ~부터
		var $regDateFrom = $("#selRegdate_from");
		$regDateFrom.datepicker({
			changeYear : true
			, yearRange : "-10:+0"
			, dateFormat : "yymmdd"
		});
		$regDateFrom.datepicker("setDate", $regDateFrom.data("value"));

		// 회원가입일 ~까지
		var $regDateTo = $("#selRegdate_to");
		$regDateTo.datepicker({
			changeYear:true
			, yearRange : "-10:+0"
			, dateFormat : "yymmdd"
		});
		$regDateTo.datepicker("setDate", $regDateTo.data("value"));

	});

	//페이징.
	function f_goPage(no){
		var frm = document.forms.frmList;
		frm.selAction.value = "V";
		frm.selPageNo.value = no;

		frm.target = "";
		frm.method = "post";
		frm.action = "/adminMember.do";
		frm.submit();
	}

	//검색조건 초기화
	function f_reset(){
		$("#selUserlevel").val("");
		$("#selPageNo").val("1");
		f_search();
	}

	//상세화면 이동
	function f_goDetail(i_uid){
		
		
		var selName = $("[name=selName]").val();
		
		
		var frm = document.forms.frmList;
		frm.selAction.value = "detail";
		frm.uid.value = i_uid;

		frm.target = "";
		frm.method = "post";
		frm.action = "/adminMember.do";
		frm.submit();
	}


	//신규추가화면으로 이동
	function f_goRegist(){
		var frm = document.forms.frmList;
		frm.method="post";
		frm.target="";
		frm.selAction.value = "MA";
		frm.uid.value = "";
		frm.action = "/adminMember.do";

		frm.submit();
	}



	//검색
	function f_search(){
		var frm = document.forms.frmList;

		frm.selAction.value = "V";
		frm.selPageNo.value = "1";

		frm.target = "";
		frm.method = "post";
		frm.action = "/adminMember.do";
		frm.submit();
	}

	//엑셀다운로드
	function f_downExcel(){

		var frm = document.forms.frmList;
		frm.selAction.value = "excel";
		frm.target = "hidFrame";
		frm.method="post";
		frm.action = "/adminMember.do";
		frm.submit();
	}


	//sms발송
	function f_sendsms(){
		var frm = document.forms.frmList;

		frm.selAction.value = "V_frommember";

		frm.target = "";
		frm.method = "post";
		frm.action = "/adminSms.do";
		frm.submit();
	}



	//지부정보를 가져온다
	function f_get_branch2(){
		$.ajax({
			url: "/adminJson.do",
			type: "post",
			data: {
				"selAction" : "get_branch2",
				"ins_branch1" : $("#selBranch1").val()
			},
			dataType:"json",
			error: function(){
				alert("지부정보를 불러올 수 없습니다.");
			},
			success: function(data){
				$("#selBranch2").empty();
				$("#selBranch2").append( new Option("= 선택 =", "") );
				$.each(data, function(key, ele){
					$("#selBranch2").append( new Option(data[key].id, data[key].name) );
				});
			}
		});
	}

	//DM발송 출력
	function f_senddm(){
		window.open('/jsp/common/pageLoading.html', 'DMSEND', 'scrollbars=yes,top=100px,left=200px,width=850px,height=500px');

		var frm = document.forms.frmList;

		frm.selAction.value = "DMSEND";
		//frm.CFAIR_IDX.value = i_corpIdx;

		frm.method = "post";
		frm.target = "DMSEND";
		frm.action = "/adminMember.do";
		frm.submit();

	};
	//체크박스 컨트롤
	
	$(function(){
		
		
		$("#allCheck").click(function(){
			if($("#allCheck").prop("checked")){
				
				$(".checkbox_no").prop("checked",true);			
				$("#checkedCount").text($(".checkbox_no:checked").length);
				
			}else{
				$(".checkbox_no").prop("checked",false);
				$("#checkedCount").text($(".checkbox_no:checked").length);
			}
		}); //전체선택 ,해제
		
		$(".checkbox_no").click(function(){	
			$("#checkedCount").text($(".checkbox_no:checked").length);
		}); //체크된 갯수 표시
		
	});

	$(document).ready(function(){
		
		  var modalLayer_cost = $("#modalLayer_cost");
		  var modalLayer_self = $("#modalLayer_self");
		  var costRegist = $("#costRegist");
		  
		  var modalCont = $(".modalContent");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 
		  
		  var idx = "0";
		  var idx1 = "0";
		  var idx2 = "0";
		  var brIdx1;
		  var brIdx2;		
		  
		  var chkbox = document.getElementsByName("checkbox_no");
		  var name = document.getElementsByName("user_name");
		  var branch1 = document.getElementsByName("branch1");
		  var branch2 = document.getElementsByName("branch2");
			
			$("#ins_paydate").datepicker({changeYear:true});
			$("#ins_paydate").datepicker("option", "dateFormat", "yy-mm-dd");
			$("#ins_paydate").datepicker("option", "yearRange", "-10:+0");
			$("#ins_paydate").datepicker("setDate", "<%=param.getString("ins_paydate", DateC.getCurrent_str("yyyy-MM-dd")) %>");
			
			$("#ins_regdate").datepicker({changeYear:true});
			$("#ins_regdate").datepicker("option", "dateFormat", "yy-mm-dd");
			$("#ins_regdate").datepicker("option", "yearRange", "-10:+0");
			$("#ins_regdate").datepicker("setDate", "<%=param.getString("ins_paydate", DateC.getCurrent_str("yyyy-MM-dd")) %>");
		  
		  //회비납부 여러명
		  costRegist.click(function(){
			  idx="";
			  idx1="";
			  
			  
			  for(var i=0;i<chkbox.length;i++){
					if(chkbox[i].checked){
							idx+=","+chkbox[i].value;
							idx1+="<span>· " + name[i].innerText +"</span>";									
					}
				}		
				costNameList = idx1;
				uidList = idx; 
			if(idx==""){
				alert('적어도 한명의 회원을 체크해주세요');
				
			}else{
			    modalLayer_cost.fadeIn("slow");
				    if(!costNameList==""){
				    	$("#costNameList").html(costNameList);
				    }
			    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
			    $(this).blur();
			    $(".modalContent > a").focus(); 
			    return false;
				}
			  });
			 //회비 모달창 hide
			  $("#btn_pay_cancel").click(function(){
			    modalLayer_cost.fadeOut("slow");
			    costRegist.focus();
			  });        
			  
			 //자조금납부 여러명
			  $("#selfRegist_modal").click(function(){		  
							  
				idx="";
				idx1="";  			
				idx2="";
				var chkSize = 0;
				var branchArr = new Array();
				var chkBranchArr = new Array();
				var brList="";
				var brList1="";
				
					for(var i=0;i<chkbox.length;i++){
						
						if(chkbox[i].checked){
							var data = new Object();
							data.branch1 = branch1[i].innerText;
							data.branch2 = branch2[i].innerText;
							
							chkBranchArr.push(data);
							branchArr.push(chkBranchArr[0]);
							
							
							idx+=","+chkbox[i].value;
							idx1+="<span>· " + name[i].innerText +"</span>";	
							idx2+=","+name[i].innerText;
									
						}
					}		
					selfNameList = idx2;
					uidList = idx;
										
					if(JSON.stringify(branchArr) != JSON.stringify(chkBranchArr)){
						alert('같은 지회,지부인 회원끼리만 선택 가능합니다');				
						return false;	
					}
				
					
					if(idx==""){
						alert('적어도 한명의 회원을 체크해주세요');
						
					}
							
					else{
						modalLayer_self.fadeIn("slow");
						$("#selfCost_nameList").html(idx1);
						$("#ins_branch1").val(chkBranchArr[0].branch1);
						$("#ins_branch2").val(chkBranchArr[0].branch2);
					};
				});
			 
			 //자조금 모달창 hide
			 $("#btn_selfpay_cancel").click(function(){
				 modalLayer_self.fadeOut("slow");
				 
			 });
		  
		});

	function f_costRegist(){
		var frm = document.getElementById("frmCostRegist");
		
		frm.selAction.value = "cost_insert";
		frm.price_gubun.value = $("#ins_gubun").val();
		frm.price_memberuid.value = uidList;
		frm.price_price.value = $("#ins_price").val();
		frm.price_pay.value = $("#ins_pay").val();
		frm.target = "";
		frm.method = "post";
		frm.action = "/adminMember.do";
		
		$("#price_paydate").val($("#ins_paydate").val());
		frm.submit();
	}

	function f_selfRegist(){
		var frm = document.getElementById("frmSelfRegist");
		
		frm.selAction.value = "self_insert";
		frm.ins_price.value = $("#ins_price_self").val();
		frm.ins_regdate.value = $("#ins_regdate").val();
		frm.ins_name.value = selfNameList;
		frm.ins_price_txt.value = $("#ins_price_txt").val();
		frm.ins_branch1.value = $("#ins_branch1").val();
		frm.ins_branch2.value = $("#ins_branch2").val();
		frm.ins_etc.value = $("#ins_etc").val();
		frm.submit();
	}
	
	//년도변경시
	function f_changeInsGubun(){
		if(($("#ins_gubun").val()|0) >= 2013){
			$("#ins_price").val("100000");
		}else if($("#ins_gubun").val()=="가입비"){
			$("#ins_price").val("50000");
		}else{
			$("#ins_price").val("");
		}
	}


	
	

</script>


</head>

<body>
<!-- 공통폼 S.-->
<form name="frmMenu" id="frmMenu" method="post" target="">
<input type="hidden" name="selAction" value=""/>
</form>
<!-- 공통폼 E. -->
<form name="frmCostRegist" id="frmCostRegist" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="uid" id="uid" value=""/>
<input type="hidden" name="selPageNo" value=""/>
<input type="hidden" name="list_gubun" id="list_gubun" value=""/>
<input type="hidden" name="price_action" id="price_action" value=""/>
<input type="hidden" name="price_memberuid" 	id="price_memberuid" value=""/>
<input type="hidden" name="price_uid" 	id="price_uid" value=""/>
<input type="hidden" name="price_gubun" id="price_gubun" value=""/>
<input type="hidden" name="price_paydate" id="price_paydate" value=""/>
<input type="hidden" name="price_pay" 	id="price_pay" value=""/>
<input type="hidden" name="price_price" id="price_price" value=""/>
</form>


<form name="frmSelfRegist" id="frmSelfRegist" method="post" target="">
<input type="hidden" name="selAction" value=""/>
<input type="hidden" name="selPageNo" value=""/>
<input type="hidden" name="ins_id" value=""/>
<input type="hidden" name="ins_price" value=""/>
<input type="hidden" name="ins_regdate" value=""/>
<input type="hidden" name="ins_name" value=""/>
<input type="hidden" name="ins_price_txt" value=""/>
<input type="hidden" name="ins_branch1" value=""/>
<input type="hidden" name="ins_branch2" value=""/>
<input type="hidden" name="ins_etc" value=""/>


</form>

<iframe name="hidFrame" style="display:none"></iframe>

<!-- Global Wrapper.s -->
<div id="wrap">
<!-- TNB.s -->
	<div id="tnb">

	</div>
<!-- TNB.e -->

<!-- Container.s -->
	<div id="container">

<!-- Content.s -->
		<div id="content" style="min-width:1050px">

			<p class="cont_header bold">
				<span class="f_left">회원 목록</span>
				<span class="f_right">총 <%=param.get("tot") %></span>
			</p>
<!-- 검색폼 START -->
<!-- 분류 상관없이 이어서 (f_left) 클래스를 붙여주면됨-->
			<div class="search_form">
				<form name="frmList">
				<input type="hidden" name="selAction" value="" />
				<input type="hidden" name="selPageNo" value="" />
				<input type="hidden" name="uid" value="" />

				<div>

					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">이름</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px; ime-mode:active;" name="selName" value="<%=param.getString("selName") %>"/>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">주민등록번호</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px" name="selRegnum" value="<%=param.getString("selRegnum") %>"/>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">휴대폰</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px" name="selCphone" value="<%=param.getString("selCphone") %>"/>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">TEL자택</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px" name="selHphone" value="<%=param.getString("selHphone") %>"/>
						</span>


						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">연락상태</span>
						<span style="display:inline-block; width:100px">
							<select id="selContactStatus" name="selContactStatus" onchange="javascript: f_search()">
								<option value="">=선택=</option>
								<option value="D-include" <%="D-include".equals(param.getString("selContactStatus")) ? "selected" : "" %>>사망자 포함</option>
								<option value="N" <%="N".equals(param.getString("selContactStatus")) ? "selected" : "" %>>장기미활동</option>
								<option value="O" <%="O".equals(param.getString("selContactStatus")) ? "selected" : "" %>>OK</option>
								<option value="R" <%="R".equals(param.getString("selContactStatus")) ? "selected" : "" %>>반송</option>
								<option value="K" <%="K".equals(param.getString("selContactStatus")) ? "selected" : "" %>>거절</option>
								<option value="H" <%="H".equals(param.getString("selContactStatus")) ? "selected" : "" %>>자격정지</option>
								<option value="U" <%="U".equals(param.getString("selContactStatus")) ? "selected" : "" %>>제명</option>
								<option value="L" <%="L".equals(param.getString("selContactStatus")) ? "selected" : "" %>>탈퇴자만 검색</option>
								<option value="D" <%="D".equals(param.getString("selContactStatus")) ? "selected" : "" %>>사망자만 검색</option>
							</select>
						</span>

	            </div>
	            <div class="search_input">
	            		<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">지회</span>
						<span style="display:inline-block; width:100px">
							<select name="selBranch1" id="selBranch1" style="width:95px" onchange="javascript: f_get_branch2()">
				            	<option value="">= 선택 =</option>
				            	<%=boxDao.getBranch1(param.getString("selBranch1")) %>
			            	</select>
		            	</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">지부</span>
						<span style="display:inline-block; width:100px">
							<select name="selBranch2" id="selBranch2" style="width:95px" onchange="javascript: f_search()">
				            	<option value="">= 선택 =</option>
				            	<%=boxDao.getBranch2(param.getString("selBranch1"), param.getString("selBranch2")) %>
				            </select>
			            </span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">회원코드</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="selMember_code" style="width:100px" name="selMember_code" value="<%=param.getString("selMember_code") %>"/>
						</span>


						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">직책</span>
						<span style="display:inline-block; width:100px">
							<select name="selRolepos"  style="width:95px">
				            	<option value="">= 선택 =</option>
				            	<%=boxDao.getGrole(param.getString("selRolepos")) %>
				            </select>
						</span>



						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">사업장명</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px; ime-mode:active;" name="selCompanyname" value="<%=param.getString("selCompanyname") %>"/>
						</span>
					</div>



					<div class="search_input">


						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">주소(사업장)</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px; ime-mode:active;" name="selOaddr" value="<%=param.getString("selOaddr") %>"/>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">주소(자택)</span>
						<span style="display:inline-block; width:100px">
							<input type="text" class="searchinput" style="width:100px; ime-mode:active;" name="selHaddr" value="<%=param.getString("selHaddr") %>"/>
						</span>

						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">가입일자</span>
						<span style="display:inline-block; ">
							<input type="text" style="width:60px;" name="selRegdate_from" id="selRegdate_from" 
								data-value="<%=param.getString("selRegdate_from") %>" value="<%=param.getString("selRegdate_from") %>"  maxlength="8" />
							~ <input type="text" style="width:60px;" name="selRegdate_to" id="selRegdate_to" 
								data-value="<%=param.getString("selRegdate_to") %>"  value="<%=param.getString("selRegdate_to") %>"  maxlength="8" />
						</span>


						<span style="padding-left:20px">
							<a href="javascript: f_search()" class="btn grey">검색</a>
							<a href="javascript: f_downExcel()" class="btn grey">엑셀다운로드</a>
						</span>
					</div>


					<div class="search_input">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">역할</span>
						<span style="display:inline-block; width:100px">
							<select name="selRole">
			            		<option value="">= 선택 =</option>
			            		<%=boxDao.getYrole(param.getString("selRole")) %>
			            	</select>
						</span>
					</div>



					<div class="f_left">
						<span style="text-align:right; display:inline-block; padding-right:5px; width:80px">회비납부</span>
						<span style="display:inline-block;">

						<input type="radio" name="sel_pay_yn" value="" <%="".equals(param.getString("sel_pay_yn")) ? "checked" : "" %> />전체
						<input type="radio" name="sel_pay_yn" value="A" <%="A".equals(param.getString("sel_pay_yn")) ? "checked" : "" %> />연속납부
						<input type="radio" name="sel_pay_yn" value="Y" <%="Y".equals(param.getString("sel_pay_yn")) ? "checked" : "" %> />납부
						<input type="radio" name="sel_pay_yn" value="N" <%="N".equals(param.getString("sel_pay_yn")) ? "checked" : "" %> />미납

						<select name="sel_pay_from" style="width:60px; min-width:10px">
							<%
							String selPayFrom = param.getString("sel_pay_from");
							for(int i = startYear; i >= 2012; i--){ %>
								<option value="<%=i %>" <%=String.valueOf(i).equals(selPayFrom) || (selPayFrom.isEmpty() && String.valueOf(currentYear).equals(selPayFrom)) ? "selected" : "" %>><%=i%></option>
							<%} %>
						</select> ~
						<select name="sel_pay_to" style="width:60px; min-width:10px">
							<%
							String selPayTo = param.getString("sel_pay_to");
							for(int i = startYear; i >= 2012; i--){ %>
								<option value="<%=i %>" <%=String.valueOf(i).equals(selPayTo) || (selPayTo.isEmpty() && String.valueOf(currentYear).equals(selPayTo)) ? "selected" : "" %>><%=i%></option>
							<%} %>
						</select>

						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" name="selPayLimit" value="Y" <%="Y".equals(param.getString("selPayLimit")) ? "checked" : "" %> />
						2013년 6만원 납부자
						</span>
					</div>
					<div class="f_right">
						<input type="checkbox" value="N" name="Dmgubun"> 회비납부 표시안함 →
						<a href="javascript: f_senddm()" class="btn grey">DM발송</a>
						<a href="javascript: f_sendsms()" class="btn grey">SMS발송</a>
					</div>

					<br style="clear:both;" />
				</div>

				</form>
			</div>
<!-- 검색폼 END -->

			<div class="list_wrap">
				<p style="padding-bottom:7px; padding-top:10px">
				<span style="">
				<%if(!"".equals(param.getString("selBranch1")) || !"".equals(param.getString("selBranch2"))){ %>
					[ 정렬기준: <span style="color:red; font-weight:bold">이름순</span> ]
				<%}else if("".equals(param.getString("sel_pay_yn"))){%>
					[ 정렬기준: <span style="color:red; font-weight:bold">최종수정일</span> ]
				<%}else{%>
					[ 정렬기준: <span style="color:red; font-weight:bold">고유번호</span> ]
				<%}%>
				</span>

				<span style="padding-left:40px">(회비납부 조건이 있을경우 "고유번호" 기준으로 정렬 , 지회.지부조건이 있을경우 "이름순"으로 정렬됨 )</span>

				</p>
				
				<div class="cle">
					<a class="btn blue fL" href="#modalLayer_cost" id="costRegist" >회비 납부</a>
					<a class="btn green fR" href="#modalLayer_selfCost" id="selfRegist_modal">자조금 납부</a>
                </div>
                
				<table class="list rowhover">
					<tr>
						<th style="width:65px"><p id="checkedCount"></p><input type="checkbox" id="allCheck" name="allCheck" value=""/></th>
						<th style="width:65px">번호</th>
						<th style="width:80px">아이디</th>
						<th style="width:70px">이름</th>
						<th style="width:80px">지회</th>
						<th style="width:80px">지부</th>
						<th>핸드폰</th>
						<th style="width:200px">주소</th>
						<th>가입년도</th>
						<%for(int i = startYear; i > startYear - countYear; i--){ %>
						<th><%=i %>년<br/>납부</th>
						<%} %>
						<th>최종수정일</th>

						<!--
						<th>NO</th>
						<th>아이디</th>
						<th>회원구분</th>

						<th>가입비<br/>납부</th>
						<th>연락<br/>상태</th>
						<th>우편물<br/>발송</th>
						-->
					</tr>

					<%
					int no = pagesVo.getTopNo();
					String strAddr = "";
					String strUserlevel = "";
					String strContactStatus = "";

					String[] totArr = new String[countYear];

					while(dataList!=null&&dataList.next()){


						//보낼주소(자택, 사업장 )
						if("H".equals(dataList.getString("mailreceive"))){
							//strAddr = dataList.getString("Hzipcode1") +"-"+ dataList.getString("Hzipcode2");
							strAddr = dataList.getString("Hzipcode3");
							strAddr = "".equals(strAddr) ? "" : strAddr+"&nbsp;&nbsp;";
							strAddr += dataList.getString("Haddr1") + dataList.getString("Haddr2");
						}else if("O".equals(dataList.getString("mailreceive"))){
							//strAddr = dataList.getString("Ozipcode1") +"-"+ dataList.getString("Ozipcode2");
							strAddr = dataList.getString("Ozipcode3");
							strAddr = "".equals(strAddr) ? "" : strAddr+"&nbsp;&nbsp;";
							strAddr += dataList.getString("Oaddr1") + dataList.getString("Oaddr2");
						}else{
							strAddr = "";
						}


						if("O".equals(dataList.getString("userlevel"))){
							strUserlevel = "정회원";
						}else if("R".equals(dataList.getString("userlevel"))){
							strUserlevel = "준회원";
						}else if("X".equals(dataList.getString("userlevel"))){
							strUserlevel = "탈퇴회원";
						}else{
							strUserlevel = "-";
						}



						if("D".equals(dataList.getString("contact_status"))){
							strContactStatus = "사망";
						}else if("N".equals(dataList.getString("contact_status"))){
							strContactStatus = "장기미활동";
						}else if("O".equals(dataList.getString("contact_status"))){
							strContactStatus = "OK";
						}else if("R".equals(dataList.getString("contact_status"))){
							strContactStatus = "반송";
						}else if("K".equals(dataList.getString("contact_status"))){
							strContactStatus = "거절";
						}else if("Y".equals(dataList.getString("contact_status"))){
							strContactStatus = "발송";
						}else if("H".equals(dataList.getString("contact_status"))){
							strContactStatus = "자격정지";
						}else if("U".equals(dataList.getString("contact_status"))){
							strContactStatus = "제명";
						}else if("L".equals(dataList.getString("contact_status"))){
							strContactStatus = "탈퇴";
						}else{
							strContactStatus = "";
						}

						int regist_year = TextFormatter.convNvl(dataList.getString("registDate").substring(0,4), -1);

						for(int y = startYear; y > startYear - countYear; y--){
							if(y == 2013){
								totArr[startYear-y] = dataList.getInt("tot_"+y) < 100000 ? "X" : "O";
							}else{
								totArr[startYear-y] = (dataList.getString("tot_"+y).equals("0") ? "X" : "O");
							}
							if(regist_year > y){
								totArr[startYear-y] = "-";
							}
						}
						/*
						//2017년납부
						tot_2017 = (dataList.getString("tot_2017").equals("0")) ? "X" :"O";
						//2016년납부
						tot_2016 = (dataList.getString("tot_2016").equals("0")) ? "X" :"O";
						//2015년납부
						tot_2015 = (dataList.getString("tot_2015").equals("0")) ? "X" :"O";
						//2014년 납부
						if(dataList.getInt("tot_2014") < 100000) {
							tot_2014 = "X";
						}else{
							tot_2014 = "O";
						}

						if(regist_year>=2017){
							tot_2016 = "-";
							tot_2015 = "-";
							tot_2014 = "-";
						}else if(regist_year>=2016){
							tot_2015 = "-";
							tot_2014 = "-";
						}else if(regist_year>=2015){
							tot_2014 = "-";
						}else if(regist_year>=2014){
						}
						*/



					%>
					<tr>
						<td class="first ta_center"><input type="checkbox" class="checkbox_no" name="checkbox_no" value="<%=dataList.getString("id") %>"/></td>
						<td class="ta_center" style="width:55px"><%=no-- %></td>
						<td class="ta_center"><%=dataList.getString("id") %></td>
						<td class="ta_center">
							<span style="text-decoration:underline" name="user_name" onclick="javascript: f_goDetail('<%=dataList.getString("uid") %>')"><%=dataList.getString("name") %></span>
						</td>
						<td class="ta_center" name="branch1"><%=dataList.getString("branch1") %></td>
						<td class="ta_center" name="branch2"><%=dataList.getString("branch2") %></td>
						<td class="ta_center" style="width:100px">
						<%if("".equals(dataList.getString("cp1"))){ %>
						<%} else { %>
							<%=dataList.getString("cp1") %>-<%=dataList.getString("cp2") %>-<%=dataList.getString("cp3") %>
						<%} %>
						</td>
						<td class="ta_center" style="width:200px"><%=strAddr %></td>

						<td class="ta_center" style="width:80px"><%=dataList.getString("registdate") %></td>
						<%for(int i = 0; i < countYear; ++i){ %>
							<td class="ta_center" style="width:60px"><%=totArr[i]  %></td>
						<%} %>
						<td class="last ta_center" style="width:90px"><%=DateC.chgMysqlDate(dataList.getString("ts"), "yyyy-MM-dd HH:mm")  %></td>
						<%--
						<td class="ta_center"><%=dataList.getString("uid") %></td>
						<td class="ta_center"><%=dataList.getString("id") %></td>
						<td class="ta_center"><%=strUserlevel %></td>

						<td class="ta_center"><%=dataList.getString("join_bill") %></td>
						<td class="ta_center"><%=strContactStatus %></td>
						<td class="ta_center"><%=dataList.getString("mailsent") %></td>
						--%>
					</tr>
					<%
					}
					%>
				</table>

				<div class="page">
					<%=pagesVo.getPageHtml() %>
				</div>

			</div>

			<div class="mt10">
				&nbsp;
			</div>

		</div>
		

<!-- Content.e -->
<div id="modalLayer_cost">
  <div class="modalContent">
  	<p><strong>명단</strong><p>
  	<p id="costNameList"></p>
  
    <table class="list" style="border-bottom:2px solid #949494;border-top:2px solid #949494;">
					<tr>
						<th>회비구분</th>
						<th>납부일자</th>
						<th>납부</th>
						<th>금액</th>
					</tr>
					<tr>
						<td class="first ta_center">
							<input type="hidden" name="ins_uid" id="ins_uid" value=""/>
							<select name="ins_gubun" id="ins_gubun" style="width:60px; min-width:40px" onchange="f_changeInsGubun()">
									<%
									for( int i = startYear; i > 1999; i--){
									%>
									<option value="<%=i %>" <%=i == (startYear) ? "selected" : "" %>><%=i %></option>
									<%
									}
									%>
									<option value="가입비">가입비</option>
							</select>
						</td>
						<td class="ta_center">
							<input type="text" name="ins_paydate" id="ins_paydate" value="" style="width:70px;" maxlength="8"/>
						</td>
						<td class="ta_center">
				
							<select name="ins_pay" id="ins_pay" style="width:50px; min-width:40px">
								<option value="Y">Y</option>
								<option value="N">N</option>
							</select>
						</td>
						<td class="last">
							<input type="text" name="ins_price" id="ins_price" value="100000" style="width:100px;"/>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="first last ta_right">
							<a href="javascript:f_costRegist()" class="btn grey" id="btn_pay_insert">등록</a>
							<a href="#" class="btn grey" id="btn_pay_cancel">취소</a>
						</td>
					</tr>
				</table>
  </div>
</div>


<div id="modalLayer_self">
  <div class="modalContent">
  	<p><strong>명단</strong><p>
  	<p id="selfCost_nameList"></p>
  
   <table class="form">
		<tr>
			<td class="cat">납부일</td>
			<td><input type="text" class="registinput" name="ins_regdate" id="ins_regdate" value="" style="width:80px"/></td>
			<td class="cat">금액</td>
			<td><input type="text" class="registinput" name="ins_price_txt" id="ins_price_self" value="" style="width:80px"/></td>
		</tr>
		<tr>
			<td class="cat">지회</td>
			<td>
				<input type="text" class="registinput" name="ins_branch1" id="ins_branch1" style="width:80px" readonly >     
            </td>
            <td class="cat">지부</td>
			<td colspan="3"> 
				<input type="text" class="registinput" name="ins_branch2" id="ins_branch2" style="width:80px" readonly >            	
          	</td>
		</tr>
		<tr>
			<td class="cat">비고</td>
			<td colspan="5"><textarea name="ins_etc" id="ins_etc" style="width:98%; height:40px"></textarea></td>
		</tr>
		<tr>
			<td colspan="6" class="first last ta_right">
				<a href="javascript:f_selfRegist()" class="btn grey" id="btn_selfpay_insert">등록</a>
				<a href="#" class="btn grey" id="btn_selfpay_cancel">취소</a>
			</td>
		</tr>
	</table>
  </div>
</div>


<!-- Footer.s -->
		<div id="footer">
		</div>
<!-- Footer.e -->

	</div>
		
<!-- Container.e -->

</div>
<!-- Global Wrapper.e -->

</body>
</html>