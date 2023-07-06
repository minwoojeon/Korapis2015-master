<%@page import="kr.or.korapis.frame.MiceParam"%><%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%
MiceParam param = (MiceParam)request.getAttribute("param");

String str = "";
str = param.getString("result");
%><%=str%>