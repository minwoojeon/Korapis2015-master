package kr.or.korapis.vo;

import kr.or.korapis.db.ResultSetEntity;

public class BbsFileVo {
	
	boolean isEmpty = true;

	String fileIdx = "";
	String bbsIdx = "";
	String fileName = "";
	String filePath = "";
	String fileExt = "";
	int fileSize = 0;
	int fileHit = 0;
	String cdate = "";
	String udate = "";
	boolean isBanner = false;
	
	public BbsFileVo(){
		
	}
	public BbsFileVo(ResultSetEntity data){
		if(data!=null && data.next()){
			this.fileIdx = data.getString("file_idx");
			this.bbsIdx = data.getString("bbs_idx");
			this.fileName = data.getString("file_name");
			this.filePath = data.getString("file_path");
			this.fileExt = data.getString("file_ext");
			this.fileSize = data.getInt("file_size");
			this.fileHit = data.getInt("file_hit");
			this.cdate = data.getString("cdate");
			this.udate = data.getString("udate");
			this.isBanner = data.getString("banner_yn").equals("Y");
			
			this.isEmpty = false;
		}
	}
	
	public String getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(String fileIdx) {
		this.fileIdx = fileIdx;
	}
	public String getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(String bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileExt() {
		return fileExt;
	}
	public void setFileExt(String fileExt) {
		this.fileExt = fileExt;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public int getFileHit() {
		return fileHit;
	}
	public void setFileHit(int fileHit) {
		this.fileHit = fileHit;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public boolean isBanner() {
		return isBanner;
	}
	public void setBanner(boolean isBanner) {
		this.isBanner = isBanner;
	}
	public boolean isEmpty(){
		return isEmpty;
	}
	public void setEmpty(boolean isEmpty){
		this.isEmpty = isEmpty;
	}
	
}
