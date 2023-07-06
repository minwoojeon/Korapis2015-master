package kr.or.korapis.vo;

import java.util.ArrayList;

import kr.or.korapis.db.ResultSetEntity;

public class BbsVo {

	private boolean isEmpty = true;
	
	String bbsIdx = "";
	String bflag = "";
	String userID = "";
	String userName  = "";
	String userPwd = "";
	String userIP = "";
	String bbsTitle = "";
	String bbsContent = "";
	String bbsLinkType = "";
	String bbsLink = "";
	String bbsThread = "";
	String bbsFID = "";
	String cdate = "";
	String udate = "";
	boolean isSecret = false;
	boolean isHtml = false;
	boolean isNotice = false;
	boolean isBanner = false;
	int bbsHit = 0;
	int bbsLike = 0;
	String bbsPyear = "";
	
	ArrayList<BbsFileVo> files = new ArrayList<BbsFileVo>();


	public BbsVo() {
	}
	

	public BbsVo(ResultSetEntity data, ResultSetEntity dataFile) {
		
		if(data!=null && data.next()){
			
			this.bbsIdx = data.getString("bbs_idx");
			this.bflag = data.getString("bflag");
			this.userID = data.getString("user_id");
			this.userName = data.getString("user_name");
			this.userPwd = data.getString("user_pwd");
			this.userIP = data.getString("user_ip");
			this.bbsTitle = data.getString("bbs_title");
			this.bbsContent = data.getString("bbs_content");
			this.bbsLinkType = data.getString("bbs_link_type");
			this.bbsLink = data.getString("bbs_link");
			this.bbsThread = data.getString("bbs_thread");
			this.bbsFID = data.getString("bbs_fid");
			this.cdate = data.getString("cdate");
			this.udate = data.getString("udate");
			this.isSecret = data.getString("bbs_secret_yn").equals("Y");
			this.isHtml = data.getString("bbs_html_yn").equals("Y");
			this.isNotice = data.getString("bbs_notice_yn").equals("Y");
			this.isBanner = data.getString("bbs_banner_yn").equals("Y");
			this.bbsHit = data.getInt("bbs_hit");
			this.bbsLike = data.getInt("bbs_like");
			this.bbsPyear = data.getString("bbs_pyear");
			
			if(dataFile != null){
				int size = dataFile.size();
				for(int i=0; i<size; i++)
					files.add(new BbsFileVo(dataFile));
			}
			
			setEmpty(false);	
		}
	}
	
	public boolean isEmpty() {
		return isEmpty;
	}
	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}

	public String getBbsIdx() {
		return bbsIdx;
	}
	public void setBbsIdx(String bbsIdx) {
		this.bbsIdx = bbsIdx;
	}
	public String getBflag() {
		return bflag;
	}
	public void setBflag(String bflag) {
		this.bflag = bflag;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserIP() {
		return userIP;
	}
	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public String getBbsLinkType() {
		return bbsLinkType;
	}
	public void setBbsLinkType(String bbsLinkType) {
		this.bbsLinkType = bbsLinkType;
	}
	public String getBbsLink() {
		return bbsLink;
	}
	public void setBbsLink(String bbsLink) {
		this.bbsLink = bbsLink;
	}
	public String getBbsThread() {
		return bbsThread;
	}
	public void setBbsThread(String bbsThread) {
		this.bbsThread = bbsThread;
	}
	public String getBbsFID() {
		return bbsFID;
	}
	public void setBbsFID(String bbsFID) {
		this.bbsFID = bbsFID;
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
	public boolean isSecret() {
		return isSecret;
	}
	public void setSecret(boolean isSecret) {
		this.isSecret = isSecret;
	}
	public boolean isHtml() {
		return isHtml;
	}
	public void setHtml(boolean isHtml) {
		this.isHtml = isHtml;
	}
	public boolean isNotice() {
		return isNotice;
	}
	public void setNotice(boolean isNotice) {
		this.isNotice = isNotice;
	}
	public boolean isBanner() {
		return isBanner;
	}
	public void setBanner(boolean isBanner) {
		this.isBanner = isBanner;
	}
	public int getBbsHit() {
		return bbsHit;
	}
	public void setBbsHit(int bbsHit) {
		this.bbsHit = bbsHit;
	}
	public int getBbsLike() {
		return bbsLike;
	}
	public void setBbsLike(int bbsLike) {
		this.bbsLike = bbsLike;
	}
	public String getBbsPyear() {
		return bbsPyear;
	}
	public void setBbsPyear(String bbsPyear) {
		this.bbsPyear = bbsPyear;
	}
	public ArrayList<BbsFileVo> getFiles(){
		return files;
	}
	public void setFiles(ArrayList<BbsFileVo> files){
		this.files = new ArrayList<BbsFileVo>(files);
	}
	
	
}
