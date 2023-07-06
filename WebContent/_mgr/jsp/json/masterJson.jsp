<%@page import="kr.or.korapis.frame.MiceParam"%><%@page import="net.sf.json.JSONArray"%><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%><%
MiceParam param = (MiceParam)request.getAttribute("param");
String retJson = param.getString("retJson");
%><%=retJson %>