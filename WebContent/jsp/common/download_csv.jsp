<%@page import="java.util.regex.Matcher"%><%@page import="java.util.regex.Pattern"%><%@page import="kr.or.korapis.util.DateC"%><%@page import="java.util.Enumeration"%><%@page import="kr.or.korapis.db.ResultSetEntity"%><%@page import="kr.or.korapis.util.TextFormatter"%><%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="kr.or.korapis.member.MemberDao"%><%@page import="kr.or.korapis.vo.UserInfoVo"%><%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr"%><%@ page import="java.io.*" %><%

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
if(userInfo==null) response.sendRedirect("/jsp/main.jsp");

MemberDao dao = new MemberDao();
int selPageNo = TextFormatter.convNvl(request.getParameter("selPageNo"), 1);
String selUserlevel = TextFormatter.convNvl(request.getParameter("selUserlevel"), "");
String searchGubun = TextFormatter.convNvl(request.getParameter("searchGubun"), "");
String searchText = TextFormatter.convNvl(request.getParameter("searchText"), "");
String addPay = TextFormatter.convNvl(request.getParameter("addPay"),"");


//ȸ������, �������� ��� ���γ��� �������� ó��
addPay = "Y";

int startYear = DateC.getKorapisBillYear();

MiceParam param = new MiceParam();
Enumeration<String> en = request.getParameterNames();
String name,  values[];
while( en.hasMoreElements()) {
	name = en.nextElement();
	param.put(name, request.getParameterValues(name));
}


if("�繫��(�ѹ�)".equals(userInfo.getRole())){
	userInfo.setRole_pos("������");
}

param.put("role_pos", userInfo.getRole_pos());
param.put("branch1", userInfo.getBranch1());
param.put("branch2", userInfo.getBranch2());


String fname = "";
if("��ȸ��".equals(userInfo.getRole_pos())){
	fname = userInfo.getBranch1()+"��ȸ ȸ������.csv";
}else if("�繫����".equals(userInfo.getRole_pos())){
	fname = userInfo.getBranch1()+"��ȸ ȸ������.csv";
}else if("������".equals(userInfo.getRole_pos())){
	fname = userInfo.getBranch2()+"���� ȸ������.csv";
}


ResultSetEntity d = dao.getList_branch_pay(param, 0, 999999);
response.setHeader("Content-Type", "text/csv; charset=MS949"); //������ Ÿ��
response.setHeader("Content-Description", "JSP Generated Data");
response.setHeader("Content-Disposition", "attachment; filename=\""+new String((fname).getBytes("MS949"),"8859_1")+"\";");
response.setHeader("Pragma", "no-cache;");
response.setHeader("Expires", "-1;");
%>"�̸�","�������","��ȸ","����","�ּ�","HP",<%
for(int i = startYear; i > startYear - 4; i--){
%>"<%=i %>",<%
} %>"��������"
<%
if(d!=null && d.size()>0){

String str_ho = "";
String str_sex = "";
String addr = "";

String[] payArr = new String[4];
String str2017 = "";
String str2016 = "";
String str2015 = "";
String str2014 = "";

for(int i=0; i<d.size(); i++){
	d.next();



	//ȸ������	�̸�	���̵�	��ȣ	����
	//����,�ֹε�Ϲ�ȣ,������,����ڵ�Ϲ�ȣ,��ȸ,����,����,��å,
	//�����ȣ(����),�ּ�1(����),�ּ�2(����),TEL(����),�����ȣ(�����),�ּ�1(�����),�ּ�2(�����),
	//TEL(�����1),TEL(�����2),TEL(�����3),
	//�޴���,FAX,E-mail,
	//���� ����,��������,���,��������,���

	int signYear = Integer.parseInt(d.getString("id").split("-")[0]);
	
	if("H".equals(d.getString("mailreceive"))){
		str_ho = "����";
	}else if("O".equals(d.getString("mailreceive"))){
		str_ho = "�����";
	}

	if("M".equals(d.getString("sex"))){
		str_sex = "��";
	}else{
		str_sex = "��";
	}
	
	for(int y = startYear; y > startYear - 4; y--){
		if(y == 2013){
			payArr[startYear-y] = d.getInt("pay_"+y) < 100000 ? "X" : "O";
		}else if(y-signYear<0){
			payArr[startYear-y] = "-";
		}else{
			payArr[startYear-y] = (d.getInt("pay_"+y) > 0 ? "O" : "X");
		}
	}


		String regnumber = d.getString("regnumber");
		if(regnumber.length() == 6){
			Pattern pat = Pattern.compile("^([0-9]{2})([0-9]{2})([0-9]{2})$");
			Matcher mat = pat.matcher(regnumber);
			if(mat.find()){
				regnumber = "'"+mat.group(1) +"-"+mat.group(2)+"-"+mat.group(3);
			}
		}else{
			regnumber = "-";
		}

%>"<%=d.getString("name") %>","<%=regnumber %>","<%=d.getString("branch1") %>","<%=d.getString("branch2") %>","<%=d.getString("haddr1")+" "+d.getString("haddr2") %>","<%=d.getString("cp1")+"-"+d.getString("cp2")+"-"+d.getString("cp3") %>","<%=payArr[0] %>","<%=payArr[1] %>","<%=payArr[2] %>","<%=payArr[3] %>","<%=d.getString("registdate") %>"
<%
	}
}
%>