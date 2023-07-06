package kr.or.korapis.vo;

import kr.or.korapis.db.ResultSetEntity;

public class SelfcostVo {

	private boolean isEmpty = true;
	private String ins_id = "";
	private String ins_regdate = "";
	private String ins_regdate_yymmdd = "";
	private String ins_name = "";
	private String ins_price = "";
	private String ins_branch1 = "";
	private String ins_branch2 = "";
	private String ins_etc = "";
	private String ins_etc2 = "";
	
	
	public SelfcostVo(){
	}
	
	
	public SelfcostVo(ResultSetEntity d){
		if(d!=null && d.next()){
			setIns_id(d.getString("id"));
			setIns_regdate(d.getString("regdate"));
			setIns_regdate_yymmdd(d.getString("regdate_yymmdd"));
			setIns_name(d.getString("membername"));
			setIns_price(d.getString("price"));
			setIns_branch1(d.getString("branch1"));
			setIns_branch2(d.getString("branch2"));
			setIns_etc(d.getString("etc"));
			setIns_etc2(d.getString("etc2"));
			
			setEmpty(false);
		}
	}
	
	
	
	public String getIns_regdate() {
		return ins_regdate;
	}
	public void setIns_regdate(String ins_regdate) {
		this.ins_regdate = ins_regdate;
	}
	public String getIns_name() {
		return ins_name;
	}
	public void setIns_name(String ins_name) {
		this.ins_name = ins_name;
	}
	public String getIns_price() {
		return ins_price;
	}
	public void setIns_price(String ins_price) {
		this.ins_price = ins_price;
	}
	public String getIns_branch1() {
		return ins_branch1;
	}
	public void setIns_branch1(String ins_branch1) {
		this.ins_branch1 = ins_branch1;
	}
	public String getIns_branch2() {
		return ins_branch2;
	}
	public void setIns_branch2(String ins_branch2) {
		this.ins_branch2 = ins_branch2;
	}
	public String getIns_etc() {
		return ins_etc;
	}
	public void setIns_etc(String ins_etc) {
		this.ins_etc = ins_etc;
	}


	public boolean isEmpty() {
		return isEmpty;
	}


	public void setEmpty(boolean isEmpty) {
		this.isEmpty = isEmpty;
	}


	public String getIns_regdate_yymmdd() {
		return ins_regdate_yymmdd;
	}


	public void setIns_regdate_yymmdd(String ins_regdate_yymmdd) {
		this.ins_regdate_yymmdd = ins_regdate_yymmdd;
	}


	public String getIns_id() {
		return ins_id;
	}


	public void setIns_id(String ins_id) {
		this.ins_id = ins_id;
	}


	public String getIns_etc2() {
		return ins_etc2;
	}


	public void setIns_etc2(String ins_etc2) {
		this.ins_etc2 = ins_etc2;
	}
	
	
}
