<%@page import="kr.or.korapis.frame.Conf"%>
<%@page import="kr.or.korapis.util.TextFormatter"%>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8"%>
<%@ page import="java.io.*" %>
<%

String fileName = request.getParameter("fileName");
String fileURL = TextFormatter.convNvl(request.getParameter("fileURL"), "/datafile/");
String filePath = Conf.getInstance().getProperty("WEBROOT") + fileURL;


String debug = "";

InputStream in= null;
OutputStream os = null;

File file= null;

String client= "";
try {
 try {
  file = new File(filePath);
  
  System.out.println("file : " + file);
  debug += file;
  in= new FileInputStream(file);
 } catch(FileNotFoundException fe) {
	fe.printStackTrace();
	
	 debug += fe.toString();
 }//catch
 

 if(!"".equals(fileURL)){
	 response.reset();
	 client = request.getHeader("User-Agent");
	 
	 
	 /* out.println(new String(fileName.getBytes("MS949"),"8859_1"));
	 out.println(new String(fileName)); */
	  
 	response.setHeader("Content-Description", "JSP Generated Data");

	response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
	response.setHeader("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("MS949"),"8859_1")+"\";");
	
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
}//finally


out.println(debug);

%>

