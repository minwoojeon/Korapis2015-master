<%@page import="kr.or.korapis.frame.Conf"%>
<%@page import="kr.or.korapis.db.ResultSetEntity"%>
<%@page import="kr.or.korapis.bbs.BbsDao"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String file_idx = (String) request.getParameter("file_idx");

	BbsDao bbsDao = new BbsDao();
	ResultSetEntity data = bbsDao.getBbsFile(file_idx);
	if (data != null && data.next()) {

		String fileName = data.getString("file_name");
		String bbsDir = "bbs01";
		if("08".equals(data.getString("bflag"))){
			bbsDir = "bbs7";
		}
		String filePath = Conf.getInstance().getProperty("WEBROOT")+"/datafile/upData/"+bbsDir+"/"+ data.getString("file_path");

		InputStream in = null;
		OutputStream os = null;
		
		File file = null;

		String client = "";
		try {
			try {
				file = new File(filePath);

				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {

			}//catch

			if (!"".equals(data.getString("file_path"))) {
				response.reset();
				client = request.getHeader("User-Agent");

				response.setHeader("Content-Description","JSP Generated Data");

				response.setHeader("Content-Type","application/octet-stream; charset=utf-8");
				response.setHeader("Content-Disposition","attachment; filename=\""+ new String(fileName.getBytes("MS949"),"8859_1") + "\";");

				response.setHeader("Content-Transfer-Encoding","binary;");
				response.setHeader("Content-Length", "" + file.length());
				response.setHeader("Pragma", "no-cache;");
				response.setHeader("Expires", "-1;");
				out.clear();
				out = pageContext.pushBody();
				os = new BufferedOutputStream(
						response.getOutputStream());
				byte b[] = new byte[1024];
				int leng = 0;
				while ((leng = in.read(b)) > 0) {
					os.write(b, 0, leng);
				}//while
				os.flush();
				os.close();
				in.close();
			} else {
				out.println("<script language='javascript'>");
				out.println("alert('잘못된 경로로 접근했거나 파일이 없습니다.');");
				out.println("</script>");
				return;
			}//else
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		} finally {
			if (in != null)
				in.close();
			if (os != null)
				os.close();
		}//finally

	}
%>
