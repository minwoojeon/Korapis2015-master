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
String updir = Conf.getInstance().getProperty("WEBROOT")+"/datafile/upData/";
int maxUploadSize = 50 * 1024 * 1024;

UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");

JSONObject jo = new JSONObject();
int script_ret = DefaultCode.FAIL; 

try{
	request.setCharacterEncoding("UTF-8");
}catch(UnsupportedEncodingException e){
	e.printStackTrace();
}
try{

	MultipartRequest multi = new MultipartRequest(request, updir, maxUploadSize, "UTF-8", new UploadedFileRenamePolicy());

	//파일 이외의 Input값 저장
	Enumeration<String> en = multi.getParameterNames();
	String name, value[];
	while( en.hasMoreElements()) {
		name = (String)en.nextElement();
		value = multi.getParameterValues(name);
		if(value.length == 1){
			jo.put(name, value[0]);
		}else{
			jo.put(name, value);
		}
	}
	
	String bbsDir = "bbs01";
	if("08".equals(jo.optString("bflag"))){
		bbsDir = "bbs7";
	}
	//파일 정보 저장
	JSONArray files = new JSONArray();
	Enumeration en2 = multi.getFileNames();
	String inputName, system, original;
	while( en2.hasMoreElements() ){
		JSONObject file = new JSONObject();
		inputName = (String)en2.nextElement();
		System.out.println(inputName);
		System.out.println((String)multi.getFilesystemName(inputName));
		if(multi.getFilesystemName(inputName) == null) continue;
		system = (String)multi.getFilesystemName(inputName);
		original=(String)multi.getOriginalFileName(inputName);
		if("bbs_link_file".equals(inputName)){
			jo.put("bbs_link", "/paper/"+jo.optString("bbs_pyear")+"/"+system);
			File newDir = new File(Conf.getInstance().getProperty("WEBROOT")+"/datafile/paper");
			newDir.mkdirs();
			multi.getFile(inputName).renameTo(new File(Conf.getInstance().getProperty("WEBROOT")+"/datafile/paper/"+jo.optString("bbs_pyear")+"/"+system));
		}else{
			file.put("inputName", inputName);
			file.put("name", system);
			file.put("oname",original);
			file.put("size", multi.getFile(inputName).length());
			if(inputName.equals("bbs_file0")){
				BufferCopy.copy(updir+system, updir+bbsDir+"/thumbs/"+system);
				file.put("isBanner", true);
			}else{
				file.put("isBanner",false);
			}
			multi.getFile(inputName).renameTo(new File(updir+bbsDir+"/"+system.substring(0, system.lastIndexOf(".")!=-1?system.lastIndexOf("."):system.length()-1)));
			files.add(file);
		}
	}
	jo.put("files", files);

	jo.put("user_pwd", userInfo.getPasswd());
	jo.put("user_ip", request.getHeader("HTTP_X_FORWARDED_FOR")!=null?request.getHeader("HTTP_X_FORWARDED_FOR"):request.getRemoteAddr());
	
	BbsDao bbsDao = new BbsDao();
	script_ret = bbsDao.regist(jo);

}catch(IOException e){
	e.printStackTrace();
	jo = null;
}catch(Exception e){
	e.printStackTrace();
	jo = null;
}
%>
<script type="text/javascript">
<%
if(script_ret == DefaultCode.SUCCESS){
%>
alert("저장되었습니다.");
parent.f_list();
<%
}else if(script_ret == DefaultCode.FAIL){
%>
alert("저장에 실패하였습니다.");
parent.location.reload();
<%
}
%>
</script>
