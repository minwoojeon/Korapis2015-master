<%@page import="java.util.Enumeration"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%><%@page import="kr.or.korapis.util.TextFormatter"%><%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="kr.or.korapis.member.MemberDao"%><%@page import="kr.or.korapis.vo.UserInfoVo"%><%@ page isELIgnored="false" contentType = "text/html; charset=euc-kr"%><%@ page import="java.io.*" %><%
	
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


MiceParam param = new MiceParam();
Enumeration<String> en = request.getParameterNames();
String name,  values[];
while( en.hasMoreElements()) {
	name = en.nextElement();
	param.put(name, request.getParameterValues(name));
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
%>"�̸�","��ȸ","����"<%if("Y".equals(addPay)){ %>,"2015","2014","2013","2012"<%} %>,"��å","�޴���","�ֹε�Ϲ�ȣ","���̵�","����","����","������","����ڵ�Ϲ�ȣ","�����ȣ(����)","�ּ�1(����)","�ּ�2(����)","TEL(����)","�����ȣ(�����)","�ּ�1(�����)","�ּ�2(�����)","TEL(�����1)","TEL(�����2)","TEL(�����3)","FAX","E-mail","���� ����","��������","���","��������"
<%
if(d!=null && d.size()>0){

String str_ho = "";
String str_sex = "";

for(int i=0; i<d.size(); i++){
	d.next();
	
				
	
	//ȸ������	�̸�	���̵�	��ȣ	����
	//����,�ֹε�Ϲ�ȣ,������,����ڵ�Ϲ�ȣ,��ȸ,����,����,��å,
	//�����ȣ(����),�ּ�1(����),�ּ�2(����),TEL(����),�����ȣ(�����),�ּ�1(�����),�ּ�2(�����),
	//TEL(�����1),TEL(�����2),TEL(�����3),
	//�޴���,FAX,E-mail,
	//���� ����,��������,���,��������,���

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
	
%>"<%=d.getString("name") %>","<%=d.getString("branch1") %>","<%=d.getString("branch2") %>"<%if("Y".equals(addPay)){ %>,"<%=!"".equals(d.getString("pay_2015"))?"O":"" %>","<%=!"".equals(d.getString("pay_2014"))?"O":"" %>","<%=!"".equals(d.getString("pay_2013"))?"O":"" %>","<%=!"".equals(d.getString("pay_2012"))?"O":"" %>"<%} %>,"<%=d.getString("role_pos") %>","<%=d.getString("cp1")+"-"+d.getString("cp2")+"-"+d.getString("cp3") %>","<%=d.getString("regnumber")+"-*******" %>",<%=d.getString("id") %>","<%=d.getString("age") %>","<%=str_sex %>","<%=d.getString("companyname")%>","<%=d.getString("biznumber1")+"-"+d.getString("biznumber2")+"-"+d.getString("biznumber3") %>","<%=d.getString("hzipcode3") %>","<%=d.getString("haddr1") %>","<%=d.getString("haddr2") %>","<%=d.getString("hphone1")+"-"+d.getString("hphone2")+"-"+d.getString("hphone3") %>","<%=d.getString("ozipcode3") %>","<%=d.getString("oaddr1") %>","<%=d.getString("oaddr2") %>","<%=d.getString("ophone1")+"-"+d.getString("ophone2")+"-"+d.getString("ophone3") %>","<%=d.getString("o2phone1")+"-"+d.getString("o2phone2")+"-"+d.getString("o2phone3") %>","<%=d.getString("o3phone1")+"-"+d.getString("o3phone2")+"-"+d.getString("o3phone3") %>","<%=d.getString("ofax1")+"-"+d.getString("ofax2")+"-"+d.getString("ofax3") %>","<%=d.getString("email") %>","<%=str_ho %>","<%=d.getString("registdate") %>","<%=d.getString("carrier") %>","<%=d.getString("breednumber") %>"
<%
	}
} 
%>