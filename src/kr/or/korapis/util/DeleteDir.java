package kr.or.korapis.util;

import java.io.File;
import java.io.IOException;

public class DeleteDir{
	  
	public static void deleteDir(String deleteDir) throws IOException{
		DeleteDir del = new DeleteDir();
		File toDelete = new File(deleteDir);
		String[] list = toDelete.list (); 
		if(list.length != 0){            // 하위 폴더에 내용이 있을경우
			for(int i=0;i<list.length;i++){      // 내용들을 일일히 체크
				File delFile = new File(toDelete+File.separator+list[i]);// 디렉토리\\화일(혹은디렉토리)
				if(delFile.isDirectory()){      // 디렉토리이면 루프를 한번더돌리기위해 매소드 호출
					del.checkFile(toDelete+File.separator+list[i]);
				}else{                // 화일이면 삭제
					//System.out.println("화일 삭제:" + list[i]);         
					delFile.delete();
				}
			}
		}
		System.out.println("폴더 삭제:" + del);       // 마지막에 자기자신 폴더 삭제
		//toDelete.delete();
	}
	public void checkFile(String path)throws IOException{
		File file = new File(path);
		String[] list = file.list();
		if(list.length != 0){                         // 하위 폴더에 내용이 있을경우
			for(int i=0;i<list.length;i++){           // 내용들을 일일히 체크
				File delFile = new File(path+File.separator+list[i]); // 디렉토리\\화일(혹은디렉토리)
				if(delFile.isDirectory()){            // 디렉토리이면 루프를 한번더돌리기위해 자기자신 호출(현재디렉토리\\화일(혹은디렉토리))
					checkFile(path+File.separator+list[i]);
				}else{                  // 화일이면 삭제
					System.out.println("화일 삭제:" + list[i]);         
					delFile.delete();
				}
			}
		}
		System.out.println("폴더 삭제:" + file);     // 마지막으로 주어진 폴더 삭제
		file.delete();
	}       
}
