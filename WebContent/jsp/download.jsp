<%@page import="kr.or.korapis.util.DeleteDir"%>
<%@page import="kr.or.korapis.frame.Conf"%>
<%@page import="kr.or.korapis.frame.MiceParam"%>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%
	MiceParam param = (MiceParam)request.getAttribute("param");
	
	
	
	
	
	
	String fileName = param.getString("fileName").replaceAll("%20"," ");
	String fileURL = param.getString("fileURL");
	
	System.out.println(fileName);
	System.out.println(fileURL);
	
	String filePath = fileURL;



InputStream in= null;
OutputStream os = null;

File file= null;

String client= "";
try {
 try {
  file = new File(filePath);
  System.out.println("file : " + file);
  in= new FileInputStream(file);
 } catch(FileNotFoundException fe) {

 }//catch
 

 if(!"".equals(fileURL)){
	 response.reset();
	 client = request.getHeader("User-Agent");
	 
	response.setHeader("Content-Description", "JSP Generated Data");

	if(fileName.endsWith(".apk")){
		response.setHeader("Content-Type", "application/vnd.android.package-archive");
	}else{
		response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	}
	
	if(client.contains("Chrome")){
		response.setHeader("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("UTF-8"),"8859_1")+"\";");
	}else{
		response.setHeader("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("MS949"),"8859_1")+"\";");
	}
	
	response.setHeader("Content-Transfer-Encoding", "binary;");
	response.setHeader ("Content-Length", ""+file.length());
	response.setHeader("Pragma", "no-cache;");
	response.setHeader("Expires", "-1;");
	out.clear();
	out = pageContext.pushBody();
	os = new BufferedOutputStream(response.getOutputStream());
  byte b[] = new byte[1024];
  int leng = 0;
  while( (leng = in.read(b)) > 0 ){
   os.write(b,0,leng);
  }//while
	 os.flush();
  	os.close();
  	in.close();
 } else{
  out.println("<script language='javascript'>");
  out.println("alert('File Downloading Fail !!');");
  out.println("</script>");
   return;
 }//else
} catch(Exception e) {
e.printStackTrace();
 System.out.println(e);
} finally {
 if(in != null) in.close();
 if(os != null) os.close();
 
 
 //파일 생성 다운로드후 폴더 내에 파일들을 삭제한다.
 //DeleteDir.deleteDir(Conf.getInstance().getProperty("WEBROOT")+"/Files/");
 //생성 한 파일 삭제..? 로컬에선되는데.. 서버에서 적용이 될런지.....
 file.delete();
 
}//finally


%>

