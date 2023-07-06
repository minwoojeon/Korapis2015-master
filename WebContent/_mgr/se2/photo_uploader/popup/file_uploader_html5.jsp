<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %> 
<% 

System.out.println("-----------------");

 String savePath="C:/_drive_/00_MediaCore/ROOT/hanwha/Files/"; // 첨부파일 저장할 디렉토리 (절대경로)
 int sizeLimit = 30 * 1024 * 1024 ; // 25메가까지 제한 넘어서면 예외발생

String filename = "";

 try{
	MultipartRequest multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	System.out.println("....");
	filename = request.getHeader("file-name");
	System.out.println(filename);
	/*
 Enumeration names = request.getHeaderNames();
 String header  = "";
 
 while(names.hasMoreElements()){
  header = (String) names.nextElement();
  out.println(header + " :: " + request.getHeader(header) + "<br>");
 }
 */

	

 } catch(Exception e) {
	e.printStackTrace();
 }
 %>
 <%="&bNewLine=true&sFileName="+filename+"&sFileURL=/hanwha/Files/"+filename %>