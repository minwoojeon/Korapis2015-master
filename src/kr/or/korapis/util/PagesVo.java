package kr.or.korapis.util;

import java.sql.ResultSet;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class PagesVo {

	private static final Logger LOGGER = LogManager.getLogger( PagesVo.class );
	
	// Variable
	private int nTotalRows;
	private int nTotalPages;
	private int nPageNo;
	private int nNumOfPages;	// Page에 출력되는 page갯수
	private int nNumOfRows; 	// Page에 출력되는 Row갯수
	private int nPrevPageNo;
	private int nNextPageNo;
	private int nNumOfGroup;
	private int[] aryPageNos;
	private int[] aryRowNos;

	private String imgPath = "/images/btn/";

	/**
	 * 생성자
	 */
	public PagesVo() {
		this.nPageNo = 1;
		this.nNumOfPages = 10;
		this.nNumOfRows = 15;
		
		this.nTotalRows = 0;
		this.nTotalPages = 0;
		this.nPrevPageNo = 0;
		this.nNextPageNo = 0;
		this.nNumOfGroup = 0;
		aryPageNos = new int[] {0,0};
		aryRowNos = new int[] {0,0};
	}
	
	
	/**
	 * 생성자
	 * @param selPageNo
	 */
	public PagesVo(int selPageNo){
		this.nPageNo = selPageNo;
		this.nNumOfPages = 10;
		this.nNumOfRows = 15;
		
		this.nTotalRows = 0;
		this.nTotalPages = 0;
		this.nPrevPageNo = 0;
		this.nNextPageNo = 0;
		this.nNumOfGroup = 0;
		aryPageNos = new int[] {0,0};
		aryRowNos = new int[] {0,0};
	}
	
	
	/**
	 * 생성자
	 * 페이지 사이즈 선택 추가.
	 * mj.sung
	 * @param selPageNo
	 */
	public PagesVo(int selPageNo, int numOfRows){
		this.nPageNo = selPageNo;
		this.nNumOfPages = 10;
		this.nNumOfRows = numOfRows;
		
		this.nTotalRows = 0;
		this.nTotalPages = 0;
		this.nPrevPageNo = 0;
		this.nNextPageNo = 0;
		this.nNumOfGroup = 0;
		aryPageNos = new int[] {0,0};
		aryRowNos = new int[] {0,0};
	}
	
	/**
	 * 생성자
	 * @param selPageNo
	 */
	public PagesVo(int selPageNo, int numOfPages, int numOfRows){
		this.nPageNo = selPageNo;
		this.nNumOfPages = numOfPages;
		this.nNumOfRows = numOfRows;
		
		this.nTotalRows = 0;
		this.nTotalPages = 0;
		this.nPrevPageNo = 0;
		this.nNextPageNo = 0;
		this.nNumOfGroup = 0;
		aryPageNos = new int[] {0,0};
		aryRowNos = new int[] {0,0};
	}
	
	
	
	
	
	/**
	 * 페이지 설정값을 지정한다.
	 * @param rs
	 */
	public void setInit() {
		setInit(this.nPageNo);
	}
	public void setInit(int nPageNo) {
		setInit(nPageNo, this.nNumOfRows);
	}
	public void setInit(String nPageNo){
		int pNo = TextFormatter.convNvl(nPageNo, 1);
		setInit(pNo, this.nNumOfRows);
	}
	public void setInit(int nPageNo, int nNumOfRows) {
		setInit(nPageNo, nNumOfRows, this.nNumOfPages);
	}
	public void setInit(int nPageNo, int nNumOfRows, int nNumOfPages) {
		setNumOfPages(nNumOfPages);
		setNumOfRows(nNumOfRows);
		setPageNo(nPageNo);
		setTotalRows();
		setTotalPages();
		setPrevNextPageNo();
	}
	
	
	/**
	 *	전체 row갯수 저장.
	 * @param nTotalRows
	 */
	public void setTotalRows(int nTotalRows) {
		this.nTotalRows = nTotalRows;
		
		setTotalRows();
		setTotalPages();
		setPrevNextPageNo();
	}
	public void setTotalRows(String nTotalRows) {
		int no = -1;
		try{
			no = Integer.parseInt(nTotalRows);
		}catch (Exception e) {
			LOGGER.error(" nTotalRows:["+nTotalRows+"] "+e.getMessage());
		}
		setTotalRows(no);
	}
	public void setTotalRows(ResultSet rs) {
		int no = -1;
		try {
			rs.last();
			no = rs.getRow();
		} catch(Exception e) {
			LOGGER.error(" 변환에러 "+e.getMessage());
		}
		setTotalRows(no);
	}
	
	
	
	public int getTotalRows() {
		return this.nTotalRows;
	}
	
	
	
	/**
	 * 쿼리에서 필요한 from, to 얻기
	 * --> Oracle
	 * @return
	 */
	public int fromNumber_oralce(){
		return nNumOfRows*(nPageNo-1) + 1;
	}
	public int toNumber_oracle(){
		return nNumOfRows*(nPageNo-1) + nNumOfRows;
	}
	
	public int fromNumber(){
		return nNumOfRows*(nPageNo-1);
	}
	public int toNumber(){
		return nNumOfRows;
	}
	
	/**
	 * 현재페이지의 최초게시물 번호를 가져온다.
	 * @return
	 */
	public int getTopNo(){
		return nTotalRows - nNumOfRows*(nPageNo-1);
	}
	
	
	
	
	
	/**
	 * 페이지번호 지정
	 * @param nPageNo
	 */
	public void setPageNo(int nPageNo) {
		if (nPageNo > 0)
			this.nPageNo = nPageNo;
	}
	
	/**
	 * 한페이지에 보여지는 Page 목록의 갯수를 지정한다. 
	 * @param nNumOfPages
	 */
	public void setNumOfPages(int nNumOfPages) {
		if (nNumOfPages > 0)
			this.nNumOfPages = nNumOfPages;
	}
	
	/**
	 * 한페이지 보여지는 Rows의 갯수를 지정한다.
	 * @param nNumOfRows
	 */
	public void setNumOfRows(int nNumOfRows) {
		if (nNumOfRows > 0)
			this.nNumOfRows = nNumOfRows;
	}
	
	/**
	 * 화살표 이미지경로 설정
	 * @param imgPath
	 */
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}


	/**
	 * jsp에서 보여지는 페이지 네비게이션 생성.
	 * @return
	 */
	public String getPageHtml() {
		StringBuffer strBuf = new StringBuffer();
		
		
		
		// 이전 page 목록 Nav (첫페이지, 이전10페이지)
		if (nPrevPageNo > 0) {
			strBuf.append(" <a href=\"javascript:f_goPage(1)\"><img src=\""+imgPath+"btn_first.png\" border=\"0\" alt=\"첫페이지\"></a>");
			strBuf.append(" <a href=\"javascript:f_goPage(" + nPrevPageNo + ")\"><img src=\""+imgPath+"btn_prev.png\" border=\"0\"  alt=\"이전 10 페이지\"></a>"); 
		} else {
			strBuf.append(" <a href=\"javascript:f_goPage(1)\"><img src=\""+imgPath+"btn_first.png\" border=\"0\" alt=\"첫페이지\"></a>");
		}

		// page list
		String strSlash = "";
		for (int n=aryPageNos[0]; n <= aryPageNos[1]; n++, strSlash=" / ") {
			if (nPageNo == n || n == 0)
				strBuf.append(strSlash + " <b>" + n + "</b>"); 
			else
				strBuf.append(strSlash + " <a href=\"javascript:f_goPage(" + n + ")\">" + n + "</a>"); 
		}
			
		// 다음 page 목록 Nav (다음10페이지, 마지막페이지)
		if (nNextPageNo > 0) {
			strBuf.append(" <a href=\"javascript:f_goPage(" + nNextPageNo + ")\"><img src=\""+imgPath+"btn_next.png\" border=\"0\" alt=\"다음 10 페이지\"></a>"); 
			strBuf.append(" <a href=\"javascript:f_goPage(" + nTotalPages + ")\"><img src=\""+imgPath+"btn_last.png\" border=\"0\" alt=\"마지막페이지\"></a>");
		} else {
			strBuf.append(" <a href=\"javascript:f_goPage(" + nTotalPages + ")\"><img src=\""+imgPath+"btn_last.png\" border=\"0\" alt=\"마지막페이지\"></a>");
		}

		return strBuf.toString();
	}
	
	
	
	
	
	
	
	
	
	/**
	 * 이전과 다음 Page 목록 번호를 구한다.
	 */
	public void setPrevNextPageNo() {
		int nGroupNo = (int) Math.ceil((1.0 * this.nPageNo / this.nNumOfPages));
		this.nPrevPageNo = this.nNumOfPages * (nGroupNo - 1);
		if (nTotalPages > nGroupNo * this.nNumOfPages)
			this.nNextPageNo = this.nNumOfPages * nGroupNo + 1;
		aryPageNos[0] = this.nNumOfPages * (nGroupNo - 1) +1;
		aryPageNos[1] = this.nNumOfPages * nGroupNo;
		if (aryPageNos[1] > this.nTotalPages)
			aryPageNos[1] = this.nTotalPages;
		
		/*
 		for (nGroupNo=1; false && nGroupNo <= this.nNumOfGroup; nGroupNo++) {
			if (nPageNo <= nGroupNo*this.nNumOfPages) {
				if (nGroupNo > 1)
					this.nPrevPageNo = this.nNumOfPages * (nGroupNo - 1);
				if (nTotalPages > nGroupNo * this.nNumOfPages)
					this.nNextPageNo = this.nNumOfPages * nGroupNo + 1;
				aryPageNos[0] = this.nNumOfPages * (nGroupNo - 1) +1;
				aryPageNos[1] = this.nNumOfPages * nGroupNo;
				if (aryPageNos[1] > this.nTotalPages)
					aryPageNos[1] = this.nTotalPages;
				break;
			}
		}
		*/
		
	}
	
	private void setTotalPages() {
		if (this.nTotalRows > 0) {
			this.nTotalPages = (int) Math.ceil((1.0 * this.nTotalRows / this.nNumOfRows));
			this.nNumOfGroup = (int) Math.ceil((1.0 * this.nTotalPages / this.nNumOfPages));
		}
		this.nNumOfGroup *= 1;
	}
	private void setTotalRows() {
		this.aryRowNos[0] = (this.nPageNo-1)*this.nNumOfRows + 1;
		this.aryRowNos[1] = this.nPageNo*this.nNumOfRows;
		if (this.aryRowNos[1] > this.nTotalRows)
			this.aryRowNos[1] = this.nTotalRows;
	}
	

	
}
