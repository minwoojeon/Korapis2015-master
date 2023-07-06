package kr.or.korapis.vo;

import java.io.Serializable;

import kr.or.korapis.db.ResultSetEntity;



public class MemberVo implements Serializable{

	private static final long serialVersionUID = 762658175837191828L;
	
	public enum ContactStatus {
		NO_STATUS(""), 
		DECEASED("D"), 
		NO_ACTIVITY("N"), 
		OK("O"), 
		RETURN("R"), 
		REFUSE("K"),
		AVAILABLE("Y"),
		SUSPEND("H"),
		EXPEL("U");
		private final String value;
		private ContactStatus(final String value){ this.value = value; }
		@Override public String toString() { return value; }
	}
	
	public enum Level {
		NO_LEVEL(""),
		PRIMARY("O"),
		SECONDARY("R"),
		LEFT("X");
		private final String value;
		private Level(final String value){ this.value = value; }
		@Override public String toString() { return value; }
	}

	private boolean isEmpty = true;
	
	private String uid = ""; 
	private String name = ""; 
	private String id = ""; 
	private String passwd = ""; 
	private String age = ""; 
	private String sex = ""; 
	private String companyname = ""; 
	private String branch1 = ""; 
	private String branch2 = ""; 
	private String Hzipcode1 = ""; 
	private String Hzipcode2 = ""; 
	private String Hzipcode3 = ""; 
	private String Haddr1 = ""; 
	private String Haddr2 = ""; 
	private String Ozipcode1 = ""; 
	private String Ozipcode2 = ""; 
	private String Ozipcode3 = ""; 
	private String Oaddr1 = ""; 
	private String Oaddr2 = ""; 
	private String Hphone1 = ""; 
	private String Hphone2 = ""; 
	private String Hphone3 = ""; 
	private String Ophone1 = ""; 
	private String Ophone2 = ""; 
	private String Ophone3 = ""; 
	private String cp1 = ""; 
	private String cp2 = ""; 
	private String cp3 = ""; 
	private String Ofax1 = ""; 
	private String Ofax2 = ""; 
	private String Ofax3 = ""; 
	private String email = ""; 
	private String mailreceive = ""; 
	private String regnumber = ""; 
	private String regnumber2 = ""; 
	private String registDate = ""; 
	private String comment = ""; 
	private String biznumber1 = ""; 
	private String biznumber2 = ""; 
	private String biznumber3 = ""; 
	private String role = ""; 
	private String role_pos = ""; 
	private String O2phone1 = ""; 
	private String O2phone2 = ""; 
	private String O2phone3 = ""; 
	private String O3phone1 = ""; 
	private String O3phone2 = ""; 
	private String O3phone3 = ""; 
	private String breednumber = ""; 
	private String carrier = ""; 
	private String userlevel = ""; 
	private String mailsent = ""; 
	private String contact_status = ""; 
	private String join_bill = ""; 
	private String TS = "";
	private String member_code = "";
	
	//생성자. 
	public MemberVo() {
	}
	
	//생성자. 
	public MemberVo(ResultSetEntity d) {
		
		if(d!=null && d.next()){
		
			
			setUid(d.getString("uid")); 
			setName(d.getString("name")); 
			setId(d.getString("id")); 
			setPasswd(d.getString("passwd")); 
			setAge(d.getString("age")); 
			setSex(d.getString("sex")); 
			setCompanyname(d.getString("companyname")); 
			setBranch1(d.getString("branch1")); 
			setBranch2(d.getString("branch2")); 
			setHzipcode1(d.getString("hzipcode1")); 
			setHzipcode2(d.getString("hzipcode2")); 
			setHzipcode3(d.getString("hzipcode3")); 
			setHaddr1(d.getString("haddr1")); 
			setHaddr2(d.getString("haddr2")); 
			setOzipcode1(d.getString("ozipcode1")); 
			setOzipcode2(d.getString("ozipcode2")); 
			setOzipcode3(d.getString("ozipcode3")); 
			setOaddr1(d.getString("oaddr1")); 
			setOaddr2(d.getString("oaddr2")); 
			setHphone1(d.getString("hphone1")); 
			setHphone2(d.getString("hphone2")); 
			setHphone3(d.getString("hphone3")); 
			setOphone1(d.getString("ophone1")); 
			setOphone2(d.getString("ophone2")); 
			setOphone3(d.getString("ophone3")); 
			setCp1(d.getString("cp1")); 
			setCp2(d.getString("cp2")); 
			setCp3(d.getString("cp3")); 
			setOfax1(d.getString("Ofax1")); 
			setOfax2(d.getString("Ofax2")); 
			setOfax3(d.getString("Ofax3")); 
			
			setEmail(d.getString("email")); 
			setMailreceive(d.getString("mailreceive")); 
			setRegnumber(d.getString("regnumber")); 
			setRegnumber2(d.getString("regnumber2")); 
			setRegistDate(d.getString("registDate")); 
			setComment(d.getString("comment")); 
			setBiznumber1(d.getString("biznumber1")); 
			setBiznumber2(d.getString("biznumber2")); 
			setBiznumber3(d.getString("biznumber3")); 
			setRole(d.getString("role")); 
			setRole_pos(d.getString("role_pos")); 
			setO2phone1(d.getString("O2phone1")); 
			setO2phone2(d.getString("O2phone2")); 
			setO2phone3(d.getString("O2phone3")); 
			setO3phone1(d.getString("O3phone1")); 
			setO3phone2(d.getString("O3phone2")); 
			setO3phone3(d.getString("O3phone3")); 
			setBreednumber(d.getString("breednumber")); 
			setCarrier(d.getString("carrier")); 
			setUserlevel(d.getString("userlevel")); 
			setMailsent(d.getString("mailsent")); 
			setContact_status(d.getString("contact_status")); 
			setJoin_bill(d.getString("join_bill")); 
			setTS(d.getString("TS"));
			setMember_code(d.getString("member_code"));
			setEmpty(false);
		}
	}
	
	
	
	
	


	public boolean isEmpty() {
		return isEmpty;
	}


	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
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


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getCompanyname() {
		return companyname;
	}


	public void setCompanyname(String companyname) {
		this.companyname = companyname;
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


	public String getOzipcode1() {
		return Ozipcode1;
	}


	public void setOzipcode1(String ozipcode1) {
		Ozipcode1 = ozipcode1;
	}


	public String getOzipcode2() {
		return Ozipcode2;
	}


	public void setOzipcode2(String ozipcode2) {
		Ozipcode2 = ozipcode2;
	}


	public String getOaddr1() {
		return Oaddr1;
	}


	public void setOaddr1(String oaddr1) {
		Oaddr1 = oaddr1;
	}


	public String getOaddr2() {
		return Oaddr2;
	}


	public void setOaddr2(String oaddr2) {
		Oaddr2 = oaddr2;
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


	public String getOphone1() {
		return Ophone1;
	}


	public void setOphone1(String ophone1) {
		Ophone1 = ophone1;
	}


	public String getOphone2() {
		return Ophone2;
	}


	public void setOphone2(String ophone2) {
		Ophone2 = ophone2;
	}


	public String getOphone3() {
		return Ophone3;
	}


	public void setOphone3(String ophone3) {
		Ophone3 = ophone3;
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


	public String getOfax1() {
		return Ofax1;
	}


	public void setOfax1(String ofax1) {
		Ofax1 = ofax1;
	}


	public String getOfax2() {
		return Ofax2;
	}


	public void setOfax2(String ofax2) {
		Ofax2 = ofax2;
	}


	public String getOfax3() {
		return Ofax3;
	}


	public void setOfax3(String ofax3) {
		Ofax3 = ofax3;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMailreceive() {
		return mailreceive;
	}


	public void setMailreceive(String mailreceive) {
		this.mailreceive = mailreceive;
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


	public String getRegistDate() {
		return registDate;
	}


	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public String getBiznumber1() {
		return biznumber1;
	}


	public void setBiznumber1(String biznumber1) {
		this.biznumber1 = biznumber1;
	}


	public String getBiznumber2() {
		return biznumber2;
	}


	public void setBiznumber2(String biznumber2) {
		this.biznumber2 = biznumber2;
	}


	public String getBiznumber3() {
		return biznumber3;
	}


	public void setBiznumber3(String biznumber3) {
		this.biznumber3 = biznumber3;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getRole_pos() {
		return role_pos;
	}


	public void setRole_pos(String role_pos) {
		this.role_pos = role_pos;
	}


	public String getO2phone1() {
		return O2phone1;
	}


	public void setO2phone1(String o2phone1) {
		O2phone1 = o2phone1;
	}


	public String getO2phone2() {
		return O2phone2;
	}


	public void setO2phone2(String o2phone2) {
		O2phone2 = o2phone2;
	}


	public String getO2phone3() {
		return O2phone3;
	}


	public void setO2phone3(String o2phone3) {
		O2phone3 = o2phone3;
	}


	public String getO3phone1() {
		return O3phone1;
	}


	public void setO3phone1(String o3phone1) {
		O3phone1 = o3phone1;
	}


	public String getO3phone2() {
		return O3phone2;
	}


	public void setO3phone2(String o3phone2) {
		O3phone2 = o3phone2;
	}


	public String getO3phone3() {
		return O3phone3;
	}


	public void setO3phone3(String o3phone3) {
		O3phone3 = o3phone3;
	}


	public String getBreednumber() {
		return breednumber;
	}


	public void setBreednumber(String breednumber) {
		this.breednumber = breednumber;
	}


	public String getCarrier() {
		return carrier;
	}


	public void setCarrier(String carrier) {
		this.carrier = carrier;
	}


	public String getUserlevel() {
		return userlevel;
	}


	public void setUserlevel(String userlevel) {
		this.userlevel = userlevel;
	}


	public String getMailsent() {
		return mailsent;
	}


	public void setMailsent(String mailsent) {
		this.mailsent = mailsent;
	}


	public String getContact_status() {
		return contact_status;
	}


	public void setContact_status(String contact_status) {
		this.contact_status = contact_status;
	}


	public String getJoin_bill() {
		return join_bill;
	}


	public void setJoin_bill(String join_bill) {
		this.join_bill = join_bill;
	}


	public String getTS() {
		return TS;
	}


	public void setTS(String tS) {
		TS = tS;
	}

	public String getMember_code() {
		return member_code;
	}

	public void setMember_code(String member_code) {
		this.member_code = member_code;
	}

	public String getHzipcode3() {
		return Hzipcode3;
	}

	public void setHzipcode3(String hzipcode3) {
		Hzipcode3 = hzipcode3;
	}

	public String getOzipcode3() {
		return Ozipcode3;
	}

	public void setOzipcode3(String ozipcode3) {
		Ozipcode3 = ozipcode3;
	}
	
}
