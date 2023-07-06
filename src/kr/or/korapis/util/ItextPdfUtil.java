package kr.or.korapis.util;

import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfPTableEvent;


//외곽선
public class ItextPdfUtil implements PdfPTableEvent {  
	public void tableLayout(PdfPTable table, float[][] widths, float[] heights,
	int headerRows, int rowStart, PdfContentByte[] canvases) {
		float width[] = widths[0];
		float x = width[0];         // x축 좌표
		float y = heights[heights.length - 1];     // y축 좌표
		float w = width[width.length - 1] - width[0];   // 테이블 넓이
		float h = heights[0] - heights[heights.length - 1]; // 테이블 높이
		PdfContentByte cb = canvases[PdfPTable.TEXTCANVAS];
		cb.saveState();
		cb.setLineWidth(1f);
		cb.setRGBColorStroke(0, 0, 0);
		cb.rectangle(x, y, w, h);
		cb.stroke();
		
		return;
	}
	
	//더블 파싱을 위한 메소드
    public double parseDouble_method(String v){
    	try{
    		return Double.parseDouble(v);
    	}catch(Exception e){
    		return 9999;
    	}
    }
}

