
package kr.or.korapis.util;

import java.io.File;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;





public class BufferCopy {

 /**
  * source에서 target으로의 파일 복사
  * @param source
  * @param target
  */
 public static void copy(String source, String target) {
  //복사 대상이 되는 파일 생성 
  File sourceFile = new File( source );
  
  //스트림, 버퍼 선언
  FileInputStream inputStream = null;
  FileOutputStream outputStream = null;
  BufferedInputStream bin = null;
  BufferedOutputStream bout = null;
  
  try {
   //스트림 생성
   inputStream = new FileInputStream(sourceFile);
   outputStream = new FileOutputStream(target);
   //버퍼 생성
   bin = new BufferedInputStream(inputStream);
   bout = new BufferedOutputStream(outputStream);
   
   //버퍼를 통한 스트림 쓰기
   int bytesRead = 0;
   byte[] buffer = new byte[1024];
   while ((bytesRead = bin.read(buffer, 0, 1024)) != -1) {
    bout.write(buffer, 0, bytesRead);
   }
   bout.flush();

  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   //자원 해제
   try{
    outputStream.close();
   }catch(IOException ioe){}
   try{
    inputStream.close();
   }catch(IOException ioe){}
   try{
    bin.close();
   }catch(IOException ioe){}
   try{
    bout.close();
   }catch(IOException ioe){}
  }
 }
 
 public static void copy(InputStream is, String target){

	  //스트림, 버퍼 선언
	  FileOutputStream outputStream = null;
	  BufferedInputStream bin = null;
	  BufferedOutputStream bout = null;
	  
	  try {
	   //스트림 생성
	   outputStream = new FileOutputStream(target);
	   //버퍼 생성
	   bin = new BufferedInputStream(is);
	   bout = new BufferedOutputStream(outputStream);
	   
	   //버퍼를 통한 스트림 쓰기
	   int bytesRead = 0;
	   byte[] buffer = new byte[1024];
	   while ((bytesRead = bin.read(buffer, 0, 1024)) != -1) {
	    bout.write(buffer, 0, bytesRead);
	   }
	   bout.flush();

	  } catch (Exception e) {
	   e.printStackTrace();
	  } finally {
	   //자원 해제
	   try{
	    outputStream.close();
	   }catch(IOException ioe){}
	   try{
	    is.close();
	   }catch(IOException ioe){}
	   try{
	    bin.close();
	   }catch(IOException ioe){}
	   try{
	    bout.close();
	   }catch(IOException ioe){}
	  }
 }
}
