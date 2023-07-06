<%@page import="kr.or.korapis.util.DefaultCode"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="kr.or.korapis.util.BufferCopy"%>
<%@page import="kr.or.korapis.vo.UserInfoVo"%>
<%@page import="java.io.File"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.io.IOException"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="kr.or.korapis.util.UploadedFileRenamePolicy"%>
<%@page import="kr.or.korapis.frame.Conf"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String bbsIdx = request.getParameter("bbs_idx");

try{
	request.setCharacterEncoding("UTF-8");
}catch(UnsupportedEncodingException e){
	e.printStackTrace();
}

	BbsDao bbsDao = new BbsDao();
	int script_ret = bbsDao.delete(bbsIdx);

%>
<script type="text/javascript">
<%
if(script_ret == DefaultCode.SUCCESS){
%>
alert("삭제되었습니다.");
parent.f_list();
<%
}else if(script_ret == DefaultCode.FAIL){
%>
alert("삭제에 실패하였습니다.");
parent.location.reload();
<%
}
%>
</script>
