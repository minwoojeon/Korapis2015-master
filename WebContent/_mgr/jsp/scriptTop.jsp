<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
�ش� ���������� �ε��ϴ� �������� top�� �ݿ���. 
--%>
<script>
	alert("<%=request.getAttribute("script_msg") %>");
	top.location = "<%=request.getAttribute("script_location") %>";
</script>