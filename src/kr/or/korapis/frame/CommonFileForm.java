package kr.or.korapis.frame;

import java.io.Serializable;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class CommonFileForm extends ActionForm implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private FormFile FILE01;
	private FormFile FILE02;
	private FormFile FILE03;
	private FormFile FILE04;
	private FormFile FILE05;
	
	public FormFile getFILE01() {
		return FILE01;
	}
	public void setFILE01(FormFile fILE01) {
		FILE01 = fILE01;
	}
	public FormFile getFILE02() {
		return FILE02;
	}
	public void setFILE02(FormFile fILE02) {
		FILE02 = fILE02;
	}
	public FormFile getFILE03() {
		return FILE03;
	}
	public void setFILE03(FormFile fILE03) {
		FILE03 = fILE03;
	}
	public FormFile getFILE04() {
		return FILE04;
	}
	public void setFILE04(FormFile fILE04) {
		FILE04 = fILE04;
	}
	public FormFile getFILE05() {
		return FILE05;
	}
	public void setFILE05(FormFile fILE05) {
		FILE05 = fILE05;
	}
	
	
	 
	
}
