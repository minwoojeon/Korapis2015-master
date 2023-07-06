<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
해당 페이지에서 로딩하는 페이지는 top에 반영됨. 
--%>
<script>
	alert("<%=request.getAttribute("script_msg") %>");
	top.location = "<%=request.getAttribute("script_location") %>";
</script>