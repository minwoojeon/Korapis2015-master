package kr.or.korapis.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;


public class UploadedFileRenamePolicy implements FileRenamePolicy{
	
	public UploadedFileRenamePolicy(){
		
	}
	
	public File rename(File f){
		SimpleDateFormat formatter = new SimpleDateFormat("_yyyyMMdd_HHmmss");
		String dateString = formatter.format(new Date());
		
		
		
		
		String uniqueFileName = "file"+dateString;
        String name = f.getName();
        String body = null;
        String ext = null;

		int dot = name.lastIndexOf(".");
		if (dot != -1) {
			body = name.substring(0, dot);
            ext = name.substring(dot);  // includes "."
		}else {
			body = name;
			ext = "";
		}
		 

		String tempName = uniqueFileName + ext;
        f = new File(f.getParent(), tempName);
        if (createNewFile(f)) {
             return f;
        }

        int count = 0;
        while (!createNewFile(f) && count < 9999) {
             count++;
             String newName = uniqueFileName + "_" + count + ext;
             f = new File(f.getParent(), newName);
        }

        return f;
        
	}
	


	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		}catch (IOException ignored) {
			return false;
		}
	}
	  
	
}