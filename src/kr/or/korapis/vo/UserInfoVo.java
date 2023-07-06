package kr.or.korapis.vo;

import java.io.Serializable;

import kr.or.korapis.db.ResultSetEntity;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;




/**
 * 사용자 정보
 * @author david.Lee <stick2me@mediacore.co.kr>
 *
 */
public class UserInfoVo implements Serializable{

	private static final long serialVersionUID = 1L;
	private static final Logger LOG = LogManager.getLogger( UserInfoVo.class );

	public static final int ADMIN = 1;
	public static final int MEMBER = 2;
	
	
	private boolean isAdmin = false;
	
	
	private String uid = ""; 
	private String name = ""; 
	private String id = ""; 
	private String passwd = ""; 
	private String regnumber = ""; 
	private String regnumber2 = ""; 
	private String Hzipcode1 = ""; 
	private String Hzipcode2 = ""; 
	private String Haddr1 = ""; 
	private String Haddr2 = ""; 
	private String Hphone1 = ""; 
	private String Hphone2 = ""; 
	private String Hphone3 = ""; 
	private String cp1 = ""; 
	private String cp2 = ""; 
	private String cp3 = ""; 
	private String email = ""; 
	private String userlevel = ""; 
	private String registdate = ""; 
	private String outdate = "";
	

	private String role = "";
	private String role_pos = "";
	private String branch1 = "";
	private String branch2 = "";
	
	private String userGbn = "";

	public UserInfoVo(ResultSetEntity d, int ugubun){
		if(ugubun == UserInfoVo.ADMIN){
			if(d!=null  && d.size()==1 && d.next()){
				setUid(d.getString("uid")); 
				setName(d.getString("name")); 
				setId(d.getString("id")); 
				setPasswd(d.getString("passwd")); 
				setRegnumber(d.getString("regnumber")); 
				setRegnumber2(d.getString("regnumber2")); 
				setHzipcode1(d.getString("Hzipcode1")); 
				setHzipcode2(d.getString("Hzipcode2")); 
				setHaddr1(d.getString("Haddr1")); 
				setHaddr2(d.getString("Haddr2")); 
				setHphone1(d.getString("Hphone1")); 
				setHphone2(d.getString("Hphone2")); 
				setHphone3(d.getString("Hphone3")); 
				setCp1(d.getString("cp1")); 
				setCp2(d.getString("cp2")); 
				setCp3(d.getString("cp3")); 
				setEmail(d.getString("email")); 
				setUserlevel(d.getString("userlevel")); 
				setRegistdate(d.getString("registdate")); 
				setOutdate(d.getString("outdate"));
				
				
				setAdmin(true);
			}
		}else{
			if(d!=null  && d.size()==1 && d.next()){
				setUid(d.getString("uid")); 
				setName(d.getString("name")); 
				setId(d.getString("id"));
				setRole_pos(d.getString("role_pos"));
				setBranch1(d.getString("branch1"));
				setBranch2(d.getString("branch2"));
				setRole(d.getString("role"));
				setRegistdate(d.getString("registDate"));
				
				setAdmin(false);
			}	
		}
	}
	public UserInfoVo(){
	}
	
	
	
	
	
	

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getRegnumber() {
		return regnumber;
	}

	public void setRegnumber(String regnumber) {
		this.regnumber = regnumber;
	}

	public String getRegnumber2() {
		return regnumber2;
	}

	public void setRegnumber2(String regnumber2) {
		this.regnumber2 = regnumber2;
	}

	public String getHzipcode1() {
		return Hzipcode1;
	}

	public void setHzipcode1(String hzipcode1) {
		Hzipcode1 = hzipcode1;
	}

	public String getHzipcode2() {
		return Hzipcode2;
	}

	public void setHzipcode2(String hzipcode2) {
		Hzipcode2 = hzipcode2;
	}

	public String getHaddr1() {
		return Haddr1;
	}

	public void setHaddr1(String haddr1) {
		Haddr1 = haddr1;
	}

	public String getHaddr2() {
		return Haddr2;
	}

	public void setHaddr2(String haddr2) {
		Haddr2 = haddr2;
	}

	public String getHphone1() {
		return Hphone1;
	}

	public void setHphone1(String hphone1) {
		Hphone1 = hphone1;
	}

	public String getHphone2() {
		return Hphone2;
	}

	public void setHphone2(String hphone2) {
		Hphone2 = hphone2;
	}

	public String getHphone3() {
		return Hphone3;
	}

	public void setHphone3(String hphone3) {
		Hphone3 = hphone3;
	}

	public String getCp1() {
		return cp1;
	}

	public void setCp1(String cp1) {
		this.cp1 = cp1;
	}

	public String getCp2() {
		return cp2;
	}

	public void setCp2(String cp2) {
		this.cp2 = cp2;
	}

	public String getCp3() {
		return cp3;
	}

	public void setCp3(String cp3) {
		this.cp3 = cp3;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserlevel() {
		return userlevel;
	}

	public void setUserlevel(String userlevel) {
		this.userlevel = userlevel;
	}

	public String getRegistdate() {
		return registdate;
	}

	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}

	public String getOutdate() {
		return outdate;
	}

	public void setOutdate(String outdate) {
		this.outdate = outdate;
	}
	public String getRole_pos() {
		return role_pos;
	}
	public void setRole_pos(String role_pos) {
		this.role_pos = role_pos;
	}
	public String getBranch1() {
		return branch1;
	}
	public void setBranch1(String branch1) {
		this.branch1 = branch1;
	}
	public String getBranch2() {
		return branch2;
	}
	public void setBranch2(String branch2) {
		this.branch2 = branch2;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getUserGbn() {
		return userGbn;
	}
	public void setUserGbn(String userGbn) {
		this.userGbn = userGbn;
	}



	
	
}
