package kr.or.korapis.vo;

import kr.or.korapis.db.ResultSetEntity;

public class PayVo {

	private boolean isEmpty = true;
	
	private String uid = ""; 
	private String member_uid = ""; 
	private String gubun = ""; 
	private String paydate = ""; 
	private String pay = ""; 
	private String price = "";
	private String TS = "";
	
	
	private String member_id = "";
	private String member_name = "";
	
	
	
	public PayVo(){
		
	}

	//생성자. 
	public PayVo(ResultSetEntity d) {
		if(d!=null && d.next()){
			
			setUid(d.getString("uid"));
			setMember_uid(d.getString("member_uid"));
			setGubun(d.getString("gubun"));
			setPaydate(d.getString("paydate"));
			setPay(d.getString("pay"));
			setPrice(d.getString("price"));
			setTS(d.getString("ts"));
			
			
			setMember_id(d.getString("member_id"));
			setMember_name(d.getString("member_name"));
			
			setEmpty(false);
		}
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getMember_uid() {
		return member_uid;
	}
	public void setMember_uid(String member_uid) {
		this.member_uid = member_uid;
	}
	public String getGubun() {
		return gubun;
	}
	public void setGubun(String gubun) {
		this.gubun = gubun;
	}
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTS() {
		return TS;
	}
	public void setTS(String tS) {
		TS = tS;
	}

	public boolean isEmpty() {
		return isEmpty;
	}

	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
}
