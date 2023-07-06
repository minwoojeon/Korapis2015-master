<%@page import="kr.or.korapis.frame.Conf"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.net.*" %><% 

 //String savePath="D:/workspace/Micehub/WebContent/publish/localData/"; // 첨부파일 저장할 디렉토리 (절대경로)
 
 String path = Conf.getInstance().getProperty("WEBROOT")+"/datafile/se2/";
 
 			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		    String dateF = sdf.format(new java.util.Date()).substring(0,4);
		    
		    //폴더 생성
		    File dir = new File(path);
	        
	        if(!dir.exists()){
	            dir.mkdirs();
	        }
			
	        //저장경로
			String savePath= path; // 첨부파일 저장할 디렉토리 (절대경로)
			
						
			
//각 행사별 폴더와 게시판 명을 가져와야함... 생성해야함.. 
 //File dir = 
 //new File(Conf.getInstance().getProperty(DefaultCode.UPLOAD_BBS_IMG_PATH)+"/"+dateF+"/"+행사폴더+"/"+게시판명+"/image/");
 
 int sizeLimit = 30 * 1024 * 1024 ; // 30메가까지 제한 넘어서면 예외발생

String filename = "";
String sUrl ="";

 try{
	MultipartRequest multi=new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	String htImageInfo = multi.getParameter("htImageInfo");
	String callback = multi.getParameter("callback");
	String callback_func = multi.getParameter("callback_func");
	sUrl = callback+"?callback_func="+callback_func;

	out.print(htImageInfo);
	Enumeration e = multi.getFileNames();
	String strName = (String) e.nextElement();
	filename = URLEncoder.encode(((String)multi.getFilesystemName(strName)).replaceAll(" ","%20"),"utf-8");
	sUrl=sUrl + "&bNewLine=true&sFileName="+filename+"&sFileURL=/datafile/se2/"+filename;
	
	
	
 } catch(Exception e) {
	 sUrl.concat("&errstr=error");
	e.printStackTrace();
 }
 response.sendRedirect(sUrl);
 %>
