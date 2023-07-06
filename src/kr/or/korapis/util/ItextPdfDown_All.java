package kr.or.korapis.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import kr.or.korapis.admin.certi.AdminCertiDao;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.Conf;
import kr.or.korapis.frame.MiceParam;

//외곽선
public class ItextPdfDown_All {

	public String getListPDF(HttpServletResponse response, MiceParam param, String fileName) throws IOException {

		AdminCertiDao dao = new AdminCertiDao();
		ResultSetEntity data = null;
		data = dao.getDetail_ALLPDF(param);

		boolean isChkDisp = "Y".equals(param.getString("chk_disp"));

		try {
			DecimalFormat format = new DecimalFormat("###.###");
			String webRoot = Conf.getInstance().getProperty("WEBROOT");

			// Document를 생성한다.
			Document document = new Document(PageSize.A4, 20, 20, 30, 30);

			// 폴더 생성
			File dir = new File(webRoot + "/Files/");

			if (!dir.exists()) {
				dir.mkdirs();
			}

			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(webRoot + "/Files/" + fileName));

            String firstRegnum = "";
            String lastRegnum = "";
            
			document.open();

			// data 가져오기.
			while (data != null && data.next()) {
				document.newPage();
				String compleate_date = data.getString("test_endd_date");
	        	String han = data.getString("han").trim();
	        	String prdNm = data.getString("rqst_prdt_name");

	        	int defaultCellHeight = 20;

	        	if(firstRegnum.isEmpty()){
	        		firstRegnum = data.getString("regnum");
	        	}
	        	lastRegnum = data.getString("regnum");
	        	
				int 성상 = 0;
				int 수분 = 0;
				int 자당 = 0;
				int 전화당 = 0;
				int 당비율 = 0;
				int HMF = 0;
				int 산도 = 0;
				int 물불용물 = 0;
				int 타르색소 = 0;
				int 사카린나트륨 = 0;
				int 이성화당 = 0;
				int 탄소동위원소비 = 0;
				int 클로람페니콜 = 0;
				int 스트렙토마이신 = 0;
				int 시미아졸 = 0;
				int 니트로푸란 = 0;
				int 옥시테트라싸이클린 = 0;
				int 코마포스 = 0;
				int 설폰아마이드 = 0;
				int 테트라싸이클린 = 0;
				int 아미트라즈 = 0;
				int 매크로라이드 = 0;
				int 퀴놀론1 = 0;
				int 플루발리네이트 = 0;
				int 베타락탐 = 0;
				int 퀴놀론2 = 0;
				int 플루메쓰린 = 0;
				int 네오마이신 = 0;
				int 브로모프로필레이트 = 0;
				int 그레이아노톡신 = 0;
				String OverallResult = ""; // 종합판정
				String ExcessItems = ""; // 기준초과항목
				String RATING_RESULT = ""; // 등급판정

				int certiType = AdminCertiDao.CERTI_TYPE_DEFAULT;

				if("0".equals(han)){
					certiType = AdminCertiDao.CERTI_TYPE_HAN_0;
				}else if("1".equals(han)){
					certiType = AdminCertiDao.CERTI_TYPE_HAN_1;
					defaultCellHeight = 21;
				}
				
				Paragraph preface = new Paragraph();
				PdfPCell cell;
				// 베이스 폰트로는 한글입력이 되지 않기 때문에 TTF 를 직접 지정한다
				// BaseFont objBaseFont_dotum =
				// BaseFont.createFont("D:/workspace/Korapis2015/WebContent/_mgr/css/font/KoPubdotum.ttf",
				// BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
				BaseFont objBaseFont_dotum = BaseFont.createFont( webRoot + "_mgr/css/font/CONV_DOTUM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
				BaseFont objBaseFont_newgulim = BaseFont.createFont( webRoot + "_mgr/css/font/NGULIM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
				// 타이들 객체를 생성한다

				// 로고.
				Image image_logo = Image.getInstance(webRoot + "images/logo.jpg");
				image_logo.setAbsolutePosition(86, 753);
				image_logo.scaleToFit(46, 46);
				preface.add(image_logo);

	            //qr코드.
	            Image image_qr = null;
	            switch(certiType){
	            case AdminCertiDao.CERTI_TYPE_HAN_1:
	            	image_qr = Image.getInstance(webRoot+"images/certi_qrcode_20180701.png");
		            image_qr.setAbsolutePosition(474, 757);
		            image_qr.scaleToFit(51, 51);
	            	break;
	            case AdminCertiDao.CERTI_TYPE_HAN_0:
	            default:
	            	image_qr = Image.getInstance(webRoot+"images/qrcode.jpg");
		            image_qr.setAbsolutePosition(474, 757);
		            image_qr.scaleToFit(39, 39);
	            	break;
	            }
	            preface.add(image_qr);

				// 직인.
				Image image_in = Image.getInstance(webRoot + "images/in01.png");
	            switch(certiType){
	            case AdminCertiDao.CERTI_TYPE_HAN_1:
		            image_in.setAbsolutePosition(350, 22);
	            	break;
	            case AdminCertiDao.CERTI_TYPE_HAN_0:
	            default:
		            image_in.setAbsolutePosition(350, 41);
	            	break;
	            }
				image_in.scalePercent(80);
				preface.add(image_in);

				// 사단법인 TOP.
				Image image_TOP = Image.getInstance(webRoot + "images/top.jpg");
				image_TOP.setAbsolutePosition(155, 782);
				image_TOP.scalePercent(4);
				preface.add(image_TOP);

				// 사단법인 BOTTOM.
				Image image_BOT = Image.getInstance(webRoot + "images/bot.jpg");
	            switch(certiType){
	            case AdminCertiDao.CERTI_TYPE_HAN_1:
		            image_BOT.setAbsolutePosition(195, 50);
	            	break;
	            case AdminCertiDao.CERTI_TYPE_HAN_0:
	            default:
		            image_BOT.setAbsolutePosition(195, 69);
	            	break;
	            }
				image_BOT.scalePercent(5);
				preface.add(image_BOT);

				Paragraph title = new Paragraph("   한국양봉협회 양봉산물연구소", new Font(objBaseFont_dotum, 20, Font.BOLD));
				Paragraph title_addr = new Paragraph("우)137-878 서울시 서초구 서초중앙로 6길 9",
						new Font(objBaseFont_dotum, 10, Font.BOLD));
				Paragraph title_tel = new Paragraph("TEL) 02-3486-0882~5  FAX) 02-3486-0886",
						new Font(objBaseFont_dotum, 10, Font.BOLD));

				title.setAlignment(Paragraph.ALIGN_CENTER);
				title_addr.setAlignment(Paragraph.ALIGN_CENTER);
				title_tel.setAlignment(Paragraph.ALIGN_CENTER);
				title_tel.setSpacingAfter(10);
				preface.add(title);
				preface.add(title_addr);
				preface.add(title_tel);

				// 깔끔한 구분라인을 표시하기 위하여 이미지를 이용한다.
				Image image_line = Image.getInstance(webRoot + "_mgr/css/font/line.png");
				image_line.setAlignment(Image.ALIGN_CENTER);
				image_line.scalePercent(116, 73);
				preface.add(image_line);

	            String subTitleText = "시험 성적 통지서";
	            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
	            	subTitleText = "시험 결과 통지서";
	            }
	            Paragraph sub_title = new Paragraph( subTitleText, new Font(objBaseFont_newgulim, 20, Font.BOLD) );
	            preface.add(sub_title); 
	            preface.add("");
	            sub_title.setAlignment(Paragraph.ALIGN_CENTER);

	            // 테이블을 생성한다.
	            PdfPTable table = new PdfPTable(new float[]{1f, 1f, 1f});
	            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
	            	table.setSpacingAfter(10);
	            }
	            table.setWidthPercentage(93);
	            table.getDefaultCell().setFixedHeight(19);
	            ItextPdfUtil event = new ItextPdfUtil();
	            table.setTableEvent(event);
	            table.getDefaultCell().setBackgroundColor(new BaseColor(208,234,237));
	            
	            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_0){
		            table.addCell(new Paragraph("·발급번호 : "+data.getString("sel_issuenum"), new Font(objBaseFont_dotum, 11)));
	            }else if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
		            table.addCell(new Paragraph("·의 뢰 자 : "+data.getString("name"), new Font(objBaseFont_dotum, 11)));
	            }
	            
	            table.addCell(new Paragraph("·접수번호 : "+data.getString("regnum"), new Font(objBaseFont_dotum, 11)));
	            table.addCell(new Paragraph("·접 수 일 : "+data.getString("recv_date"), new Font(objBaseFont_dotum, 11)));

	            table.addCell(new Paragraph("·시험항목 : "+prdNm, new Font(objBaseFont_dotum, 11)));
	            table.addCell(new Paragraph("·봉인번호 : "+data.getString("bongin"), new Font(objBaseFont_dotum, 11)));
	            table.addCell(new Paragraph("·완 료 일 : "+compleate_date, new Font(objBaseFont_dotum, 11)));
	            
	            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_0){
	            	table.addCell(new Paragraph("·의 뢰 자 : "+data.getString("name"), new Font(objBaseFont_dotum, 11)));
	            	table.addCell(new Paragraph("·검체표시 : "+data.getString("검체표시"), new Font(objBaseFont_dotum, 11)));
	            }else if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
		            PdfPCell cell_gumche = new PdfPCell(new Phrase("·검체표시 : "+data.getString("검체표시"), new Font(objBaseFont_dotum, 11)));	
		            cell_gumche.setBackgroundColor(new BaseColor(208,234,237));
		            cell_gumche.setHorizontalAlignment(Element.ALIGN_LEFT);
		            cell_gumche.setFixedHeight(19);
		            cell_gumche.setColspan(2);
		            table.addCell(cell_gumche);
	            }
	            
	            //전화번호Hphone 1순위 2순위 휴대폰
	            table.addCell(new Paragraph("·연 락 처 : "+(!"--".equals(data.getString("Hphone")) ? data.getString("Hphone") : data.getString("mobile")), new Font(objBaseFont_dotum, 11)));
	            
	            PdfPCell c2 = new PdfPCell(new Phrase("·주소 : "+("H".equals(data.getString("mailreceive")) ? data.getString("home_addr") : data.getString("offc_addr")), new Font(objBaseFont_dotum, 11)));	
	            c2.setBackgroundColor(new BaseColor(208,234,237));
	            c2.setHorizontalAlignment(Element.ALIGN_LEFT);
	            c2.setFixedHeight(19);
	            c2.setColspan(3); 
	            table.addCell(c2);
	            
	            preface.add(table);
	            
	            
	            Paragraph mid_footer_1 = new Paragraph("      ·이 통지서는 식품공전에 의거한 검사 성적서이며, 검사 완료 후 6개월간 유효합니다. ", new Font(objBaseFont_newgulim, 10));
	            Paragraph mid_footer_2 = new Paragraph("      ·이 통지서는 홍보, 선전, 광고 및 소송용으로 사용할 수 없으며 납품 및 참고자료 이외의 사용을 금합니다.", new Font(objBaseFont_newgulim, 10));
	            Paragraph mid_footer = new Paragraph("                              ", new Font(objBaseFont_newgulim, 10));
	            
	            mid_footer_1.setAlignment(Paragraph.ALIGN_LEFT);
	            mid_footer_2.setAlignment(Paragraph.ALIGN_LEFT);
	            mid_footer.setAlignment(Paragraph.ALIGN_LEFT);
	            
	            preface.add(mid_footer_1);
	            preface.add(mid_footer_2);
	            preface.add(mid_footer);
	            
	            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
					// 2023.07.05. 불필요한 중복 내용 삭제
	            	 Paragraph mid_footer_3 = new Paragraph("      ·이 통지서는 홍보, 선전, 광고 및 소송용으로 사용할 수 없으며 납품 및 참고자료 이외의 사용을 금합니다.", new Font(objBaseFont_dotum, 10, Font.BOLD));
			         mid_footer_3.setAlignment(Paragraph.ALIGN_LEFT);
			         preface.add(mid_footer_3);
			         preface.add(Chunk.NEWLINE);
	            }else{
		            Paragraph mid_title_head = new Paragraph("시 험 결 과", new Font(objBaseFont_dotum, 20, Font.BOLD));
		            mid_title_head.setAlignment(Paragraph.ALIGN_CENTER);
		            preface.add(mid_title_head);
	            }
	            preface.add("");
	            
	            
	            /**
	             * 시험결과 테이블을 생성한다.
	             * 헤더부분 cell 지정
	             * cell default align = center
	             * cell 추가부분은 align left 및 한칸띄우고시작 ///cell = new PdfPCell()
	             * 시험항목에따른 결과치 - 표기
	             */
	            PdfPTable mid_table = null;
				
	            if(isChkDisp){
	            	mid_table = new PdfPTable(new float[]{1f, 4f, 2f, 3f, 1f, 4f, 2f, 3f});
	            }else{
	            	mid_table = new PdfPTable(new float[]{1f, 4f, 3f, 2f, 1f, 4f, 3f, 2f});	
	            }
	            
	            
	            mid_table.setWidthPercentage(93);
	            mid_table.getDefaultCell().setFixedHeight(defaultCellHeight);
	            
	            mid_table.setTableEvent(event);
	            
	            PdfPCell s_header1 = new PdfPCell(new Phrase("NO.", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            PdfPCell s_header2 = new PdfPCell(new Phrase("항  목", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            PdfPCell s_header3 = new PdfPCell(new Phrase("기 준", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            PdfPCell s_header4 = new PdfPCell(new Phrase("결 과", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            
	            PdfPCell s_header5 = new PdfPCell(new Phrase("NO.", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            PdfPCell s_header6 = new PdfPCell(new Phrase("항  목", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            PdfPCell s_header7 = new PdfPCell(new Phrase("기 준", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            PdfPCell s_header8 = new PdfPCell(new Phrase("결 과", new Font(objBaseFont_dotum, 10, Font.BOLD)));
	            
	            
	            s_header1.setFixedHeight(20);
	            s_header2.setFixedHeight(20);
	            s_header3.setFixedHeight(20);
	            s_header4.setFixedHeight(20);
	            s_header5.setFixedHeight(20);
	            s_header6.setFixedHeight(20);
	            s_header7.setFixedHeight(20);
	            s_header8.setFixedHeight(20);
	            
	            s_header1.setHorizontalAlignment(Element.ALIGN_CENTER);
	            s_header2.setHorizontalAlignment(Element.ALIGN_CENTER);
	            s_header3.setHorizontalAlignment(Element.ALIGN_CENTER);
	            s_header4.setHorizontalAlignment(Element.ALIGN_CENTER);
	            s_header5.setHorizontalAlignment(Element.ALIGN_CENTER);
	            s_header6.setHorizontalAlignment(Element.ALIGN_CENTER);
	            s_header7.setHorizontalAlignment(Element.ALIGN_CENTER);
	            s_header8.setHorizontalAlignment(Element.ALIGN_CENTER);
	            
	            
	            s_header1.setBackgroundColor(new BaseColor(163,215,221));
	            s_header2.setBackgroundColor(new BaseColor(163,215,221));
	            s_header3.setBackgroundColor(new BaseColor(163,215,221));
	            s_header4.setBackgroundColor(new BaseColor(163,215,221));
	            s_header5.setBackgroundColor(new BaseColor(163,215,221));
	            s_header6.setBackgroundColor(new BaseColor(163,215,221));
	            s_header7.setBackgroundColor(new BaseColor(163,215,221));
	            s_header8.setBackgroundColor(new BaseColor(163,215,221));
	            
	            mid_table.addCell(s_header1);
	            mid_table.addCell(s_header2);
	            mid_table.addCell(s_header3);
	            mid_table.addCell(s_header4);
	            mid_table.addCell(s_header5);
	            mid_table.addCell(s_header6);
	            mid_table.addCell(s_header7);
	            mid_table.addCell(s_header8);
	            mid_table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
	            mid_table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	            
	            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_0){
		            
		            mid_table.addCell(new Paragraph("1", new Font(objBaseFont_dotum, 10)));
		            
		            cell = new PdfPCell(new Phrase(" 성상", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("적합", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            mid_table.addCell(new Paragraph(data.getString("sung_valu"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            
		            성상 = "적합".equals(data.getString("sung_valu")) ? 0 : 1;
		            
		            
		            mid_table.addCell(new Paragraph("16", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 니트로푸란", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("니트로퓨란"))){
		            		니트로푸란 = event.parseDouble_method(data.getString("니트로퓨란")) > 0 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("니트로퓨란")) > 0){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("니트로퓨란"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("니트로퓨란"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("니트로퓨란")) > 0){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
			            
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            mid_table.addCell(new Paragraph("2", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 수분(%)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            
		            if(prdNm.contains("벌집꿀")){
		            	mid_table.addCell(new Paragraph("23.0 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }else{
		            	mid_table.addCell(new Paragraph("20.0 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }
		            
		            //해당되는 시험항목 - 표기
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("wter"))){
		            		if(prdNm.contains("벌집꿀")){
			            		수분 = event.parseDouble_method(data.getString("wter")) > 23 ? 1 : 0;
			            	}else{
			            		수분 = event.parseDouble_method(data.getString("wter")) > 20 ? 1 : 0;
			            	}
		            		mid_table.addCell(new Paragraph(data.getString("wter"),  isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("17", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 옥시테트라싸이클린", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.30ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            
		            	if(!"".equals(data.getString("옥시테트라"))){
		            		
		            		옥시테트라싸이클린 = event.parseDouble_method(data.getString("옥시테트라")) > 300 ? 1 : 0;
		            		
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("옥시테트라")) > 300){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("옥시테트라"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("옥시테트라"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("옥시테트라")) > 300){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            
		            mid_table.addCell(new Paragraph("3", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 자당(%)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            if(prdNm.contains("벌집꿀")){
		            	mid_table.addCell(new Paragraph("15.0 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }else{
		            	mid_table.addCell(new Paragraph("7.0 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("ja_sgar"))){
		            		if(prdNm.contains("벌집꿀")){
			            		자당 = event.parseDouble_method(data.getString("ja_sgar")) > 15 ? 1 : 0;
			            	}else{
			            		자당 = event.parseDouble_method(data.getString("ja_sgar")) > 7 ? 1 : 0;
			            	}
		            		mid_table.addCell(new Paragraph(data.getString("ja_sgar"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            mid_table.addCell(new Paragraph("18", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 코마포스", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.10ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("쿠마포스"))){
		            		코마포스 = event.parseDouble_method(data.getString("쿠마포스")) > 100 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("쿠마포스")) > 100){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("쿠마포스"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("쿠마포스"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("쿠마포스")) > 100){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            
		            mid_table.addCell(new Paragraph("4", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 전화당(%)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            
		            if(prdNm.contains("벌집꿀")){
		            	mid_table.addCell(new Paragraph("50.0 이상", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }else{
		            	mid_table.addCell(new Paragraph("60.0 이상", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }
		            
		            //해당되는 시험항목 - 표기
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("june_sgar"))){
		            		if(prdNm.contains("벌집꿀")){
			            		전화당 = event.parseDouble_method(data.getString("june_sgar")) < 50 ? 1 : 0;
			            	}else{
			            		전화당 = event.parseDouble_method(data.getString("june_sgar")) < 60 ? 1 : 0;
			            	}
		            		mid_table.addCell(new Paragraph(data.getString("june_sgar"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("19", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 설폰아마이드", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("설폰아마이드"))){
		            		설폰아마이드 = event.parseDouble_method(data.getString("설폰아마이드")) > 30 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("설폰아마이드")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("설폰아마이드"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("설폰아마이드"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("설폰아마이드")) > 30){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            mid_table.addCell(new Paragraph("5", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 당비율(F/G)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	당비율 = 0;
		            	if(!"".equals(data.getString("fng"))){
		            		mid_table.addCell(new Paragraph(data.getString("fng"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("20", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 테트라싸이클린", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		          //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
			            if(!"".equals(data.getString("테트라사이클린"))){
			            	테트라싸이클린 = event.parseDouble_method(data.getString("테트라사이클린")) > 30 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("테트라사이클린")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("테트라사이클린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("테트라사이클린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("테트라사이클린")) > 30){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
			            }else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            

		            mid_table.addCell(new Paragraph("6", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" H.M.F(mg/kg)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("80.0 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("hmf"))){
		            		HMF = event.parseDouble_method(data.getString("hmf")) > 80 ? 1 : 0;
		            		mid_table.addCell(new Paragraph(data.getString("hmf"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            mid_table.addCell(new Paragraph("21", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 아미트라즈", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.20ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("아미트라즈"))){
		            		아미트라즈 = event.parseDouble_method(data.getString("아미트라즈")) > 200 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("아미트라즈")) > 200){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("아미트라즈"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("아미트라즈"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	
				            	if(event.parseDouble_method(data.getString("아미트라즈")) > 200){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            mid_table.addCell(new Paragraph("7", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 산도(meq/kg)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("40.0 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	산도 = "적합".equals(data.getString("sando")) ? 0 : 1;
		            	if(!"".equals(data.getString("sando"))){
		            		mid_table.addCell(new Paragraph(data.getString("sando"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 8)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("22", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 매크로라이드", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("매크로라이드"))){
		            		매크로라이드 = event.parseDouble_method(data.getString("매크로라이드")) > 30 ? 1 : 0;
			            	if(isChkDisp){
					            if(event.parseDouble_method(data.getString("매크로라이드")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("매크로라이드"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("매크로라이드"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	
				            	if(event.parseDouble_method(data.getString("매크로라이드")) > 30){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            mid_table.addCell(new Paragraph("8", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 물불용물(%)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.5이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            
		            //해당되는 시험항목 - 표기
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("hwoi"))){
		            		
		            		if("적합".equals(data.getString("hwoi"))
		            			|| "-".equals(data.getString("hwoi"))){
		            			물불용물 = 0;
		            		}else if("부적합".equals(data.getString("hwoi"))){
		            			물불용물 = 1;
		            		}else{
		            			물불용물 = event.parseDouble_method(data.getString("hwoi")) > 0.5 ? 1 : 0;
		            		}
		            		
		            		mid_table.addCell(new Paragraph(data.getString("hwoi"),  isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            		
		            		
		            
		            
		            mid_table.addCell(new Paragraph("23", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 퀴놀론1", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("퀴놀론1"))){
		            		퀴놀론1 = event.parseDouble_method(data.getString("퀴놀론1")) > 30 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("퀴놀론1")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("퀴놀론1"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("퀴놀론1"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("퀴놀론1")) > 30){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            mid_table.addCell(new Paragraph("9", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 타르색소", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	타르색소 = "불검출".equals(data.getString("tarr")) ? 0 : 1;
		            	if(!"".equals(data.getString("tarr"))){
		            		mid_table.addCell(new Paragraph(data.getString("tarr"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("24", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 플루발리네이트", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.05ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("플루바리네이트"))){
		            		플루발리네이트 = event.parseDouble_method(data.getString("플루바리네이트")) > 50 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("플루바리네이트")) > 50){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루바리네이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루바리네이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("플루바리네이트")) > 50){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            mid_table.addCell(new Paragraph("10", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 사카린나트륨", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	사카린나트륨 = "불검출".equals(data.getString("gammoryo")) ? 0 : 1;
		            	if(!"".equals(data.getString("gammoryo"))){
		            		mid_table.addCell(new Paragraph(data.getString("gammoryo"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("25", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 베타락탐", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("베타락탐"))){
		            		베타락탐 = event.parseDouble_method(data.getString("베타락탐")) > 30 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("베타락탐")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("베타락탐"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("베타락탐"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("베타락탐")) > 30){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("11", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 이성화당", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("음성", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "일반+잔류".equals(prdNm)
		            		|| "잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	이성화당 = "음성".equals(data.getString("esung")) ? 0 : 1;
		            	if(!"".equals(data.getString("esung"))){
		            		mid_table.addCell(new Paragraph(data.getString("esung"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("26", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 퀴놀론2", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("퀴놀론2"))){
		            		퀴놀론2 = event.parseDouble_method(data.getString("퀴놀론2")) > 30 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("퀴놀론2")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("퀴놀론2"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("퀴놀론2"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("퀴놀론2")) > 30){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            
		            mid_table.addCell(new Paragraph("12", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 탄소동위원소비(‰)", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("-22.5‰이하 벌꿀\n-22.5‰초과 사양꿀", new Font(objBaseFont_dotum, 8)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반+잔류".equals(prdNm)
		            		|| "잔류".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("c12"))){
		            		탄소동위원소비 = 0;
		            		mid_table.addCell(new Paragraph(data.getString("c12"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            mid_table.addCell(new Paragraph("27", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 플루메쓰린", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.01ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("플루메쓰린"))){
		            		플루메쓰린 =  event.parseDouble_method(data.getString("플루메쓰린")) > 10 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("플루메쓰린")) > 10){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루메쓰린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루메쓰린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("플루메쓰린")) > 10){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            mid_table.addCell(new Paragraph("13", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 클로람페니콜", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            
		            }else{
		            	if(!"".equals(data.getString("클로암페니콜"))){
		            		클로람페니콜 = event.parseDouble_method(data.getString("클로암페니콜")) > 0 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("클로암페니콜")) > 0){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("클로암페니콜"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("클로암페니콜"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("클로암페니콜")) > 0){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            mid_table.addCell(new Paragraph("28", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 네오마이신", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.10ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("네오마이신"))){
		            		네오마이신 = event.parseDouble_method(data.getString("네오마이신")) > 100 ? 1 : 0;
			            	if(isChkDisp){
			 		            if(event.parseDouble_method(data.getString("네오마이신")) > 100){
			 		            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("네오마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
			 		            }else{
			 		            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("네오마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
			 		            }
			 	            }else{
			 	            	if(event.parseDouble_method(data.getString("네오마이신")) > 100){
			 		            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
			 		            }else{
			 		            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
			 		            }
			 	            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		           
		            
		            mid_table.addCell(new Paragraph("14", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 스트렙토마이신", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.10ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	
		            	if(!"".equals(data.getString("스트렙토마이신"))){
		            		스트렙토마이신 = event.parseDouble_method(data.getString("스트렙토마이신")) > 100 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("스트렙토마이신")) > 100){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("스트렙토마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("스트렙토마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("스트렙토마이신")) > 100){
				            		mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            mid_table.addCell(new Paragraph("29", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 브로모프로필레이트", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("브로모프로필레이트"))){
		            		브로모프로필레이트 = event.parseDouble_method(data.getString("브로모프로필레이트")) > 30 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("브로모프로필레이트")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("브로모프로필레이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("브로모프로필레이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("브로모프로필레이트")) > 30){
				            		mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            mid_table.addCell(new Paragraph("15", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 시미아졸", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("1.00ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("시미아졸"))){
		            		시미아졸 = event.parseDouble_method(data.getString("시미아졸")) > 1000 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("시미아졸")) > 1000){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("시미아졸"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("시미아졸"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("시미아졸")) > 1000){
				            		mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            mid_table.addCell(new Paragraph("30", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 그레이아노톡신Ⅲ", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("그레이아노톡신"))){
		            		그레이아노톡신 = event.parseDouble_method(data.getString("그레이아노톡신")) > 0 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("그레이아노톡신")) > 0){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("그레이아노톡신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("그레이아노톡신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("그레이아노톡신")) > 0){
				            		mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            if( 성상 == 1
	 	       			|| 수분 == 1
	 	       			|| 자당 == 1
	 	       			|| 전화당 == 1
	 	       			|| 당비율 == 1
	 	       			|| HMF == 1
	 	       			|| 산도 == 1
	 	       			|| 물불용물 == 1
	 	       			|| 타르색소 == 1
	 	       			|| 사카린나트륨 == 1
	 	       			|| 이성화당 == 1
	 	       			//|| 탄소동위원소비 == 1
	 	       			|| 클로람페니콜 == 1
	 	       			|| 스트렙토마이신 == 1
	 	       			|| 시미아졸 == 1
	 	       			|| 니트로푸란 == 1
	 	       			|| 옥시테트라싸이클린 == 1
	 	       			|| 코마포스 == 1
	 	       			|| 설폰아마이드 == 1
	 	       			|| 테트라싸이클린 == 1
	 	       			|| 아미트라즈 == 1
	 	       			|| 매크로라이드 == 1
	 	       			|| 퀴놀론1 == 1
	 	       			|| 플루발리네이트 == 1
	 	       			|| 베타락탐 == 1
	 	       			|| 퀴놀론2 == 1
	 	       			|| 플루메쓰린 == 1
	 	       			|| 네오마이신 == 1
	 	       			|| 브로모프로필레이트 == 1
	 	       			|| 그레이아노톡신 == 1
		         	){
						OverallResult = "부적합";
	         		}else{
	         			OverallResult =	"적합";
	         		}
					
		            ExcessItems = (수분 == 1 ? "수분, " : "") 
		            					+ ( 성상 == 1 ? "성상, " : "") 
		            					+ ( 자당 == 1 ? "자당, " : "") 
		            					+ (전화당 == 1 ? "전화당, " : "")
							            + (당비율 == 1 ? "당비율, " : "")
										+ ( HMF == 1 ? "H.M.F(mg/kg), " : "" )
										+ ( 산도 == 1 ? "산도(meq/kg), " : "" )
										+ ( 물불용물 == 1 ? "물불용물(meq/kg), " : "" )
										+ ( 타르색소 == 1 ? "타르색소(meq/kg), " : "" )
										+ ( 사카린나트륨 == 1 ? "인공감미료(meq/kg), " : "" )
										+ ( 이성화당 == 1 ? "이성화당(meq/kg), " : "" );
		            
		   			if(클로람페니콜 == 1
						|| 스트렙토마이신 == 1
						|| 시미아졸 == 1
						|| 니트로푸란 == 1
						|| 옥시테트라싸이클린 == 1
						|| 코마포스 == 1
						|| 설폰아마이드 == 1
						|| 테트라싸이클린 == 1
						|| 아미트라즈 == 1
						|| 매크로라이드 == 1
						|| 퀴놀론1 == 1
						|| 플루발리네이트 == 1
						|| 베타락탐 == 1
						|| 퀴놀론2 == 1
						|| 플루메쓰린 == 1
						|| 네오마이신 == 1
						|| 브로모프로필레이트 == 1
						|| 그레이아노톡신 == 1
		     		){
		   				ExcessItems += "잔류";
		     		}else{
		     			ExcessItems += "";
		     			//마지막콤마 제거
			   			if(ExcessItems.lastIndexOf(",") != -1){
			   				ExcessItems = ExcessItems.substring(0,ExcessItems.lastIndexOf(","));
			   			}
		     		}

		            /**
		             * 초과항목 표기 한벌꿀, 봉인, 벌집꿀(봉인)무조건 표기
		             */
	        		RATING_RESULT = data.getString("등급판정");
	        		
	        		String testResultText = "-";
	        		String ratingResultText = "-";
	 	            String excessItemsText = "-";

		            if( "전체(참고)".equals(prdNm) ){
		            	if("Y".equals(param.getString("chk_add"))){
		            		testResultText = data.getString("test_rslt");
		            	}
	            		ratingResultText = RATING_RESULT;
		            }else if("한벌꿀(봉인)".equals(prdNm) || "봉인".equals(prdNm) || "벌집꿀(봉인)".equals(prdNm)){
	            		testResultText = data.getString("test_rslt");
	            		ratingResultText = RATING_RESULT;
		            }else{
		            	testResultText = "-";
		            	ratingResultText = "-";
		            }

	            	if( "한벌꿀(봉인)".equals(prdNm) || "벌집꿀(봉인)".equals(prdNm) || "봉인".equals(prdNm) || "전체(참고)".equals(prdNm) ){ 	
	            		excessItemsText = TextFormatter.convNvl(ExcessItems, "-");
	            	}
	            	
	            	Image stamp = Image.getInstance(webRoot + "images/stamp.png");
	            	stamp.setAbsolutePosition(86, 753);
					image_logo.scaleToFit(46, 46);
					

	        		PdfPCell sf_1 = new PdfPCell(new Phrase(" · 종합 결과", new Font(objBaseFont_dotum, 12)));
	        		PdfPCell sf_2 = new PdfPCell(new Phrase(testResultText, new Font(objBaseFont_dotum, 12)));
	 	            PdfPCell sf_3 = new PdfPCell(new Phrase(" · 등급 판정", new Font(objBaseFont_dotum, 12)));
	 	            PdfPCell sf_4 = new PdfPCell(new Phrase(ratingResultText, new Font(objBaseFont_dotum, 12)));
		            PdfPCell sf_5 = new PdfPCell(new Phrase(" · 기준 초과 항목", new Font(objBaseFont_dotum, 12)));
	 	            PdfPCell sf_6 = new PdfPCell(new Phrase(excessItemsText , new Font(objBaseFont_dotum, 12)));
	 	           
	 	            sf_1.setHorizontalAlignment(Element.ALIGN_LEFT); sf_1.setFixedHeight(22); sf_1.setColspan(2);
	 	            sf_2.setHorizontalAlignment(Element.ALIGN_CENTER); sf_2.setFixedHeight(22); sf_2.setColspan(2); 
	 	            sf_3.setHorizontalAlignment(Element.ALIGN_LEFT); sf_3.setFixedHeight(22); sf_3.setColspan(2);
	 	            sf_4.setHorizontalAlignment(Element.ALIGN_CENTER); sf_4.setFixedHeight(22); sf_4.setColspan(2);
	 	            sf_5.setHorizontalAlignment(Element.ALIGN_LEFT); sf_5.setFixedHeight(22); sf_5.setColspan(2);
	 	            sf_6.setHorizontalAlignment(Element.ALIGN_CENTER); sf_6.setFixedHeight(22); sf_6.setColspan(6);
	 	            
	 	            sf_3.setBackgroundColor(new BaseColor(208,234,237));
	 	            sf_6.setBackgroundColor(new BaseColor(208,234,237));
	 	            
	 	            mid_table.addCell(sf_1);
	 	            mid_table.addCell(sf_2);
	 	            mid_table.addCell(sf_3);
	 	            mid_table.addCell(sf_4);
	 	            mid_table.addCell(sf_5);
	 	            mid_table.addCell(sf_6);

	 	            preface.add(mid_table);
	 	            
	            }else if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1 || certiType == AdminCertiDao.CERTI_TYPE_DEFAULT){

	            	//성상
		            mid_table.addCell(new Paragraph("1", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 성상", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("적합", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            mid_table.addCell(new Paragraph(data.getString("sung_valu"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            
		            성상 = "적합".equals(data.getString("sung_valu")) ? 0 : 1;

		            // 네오마이신
		            mid_table.addCell(new Paragraph("13", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 네오마이신", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.10ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("네오마이신"))){
		            		네오마이신 = event.parseDouble_method(data.getString("네오마이신")) > 100 ? 1 : 0;
			            	if(isChkDisp){
			 		            if(event.parseDouble_method(data.getString("네오마이신")) > 100){
			 		            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("네오마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
			 		            }else{
			 		            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("네오마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
			 		            }
			 	            }else{
			 	            	if(event.parseDouble_method(data.getString("네오마이신")) > 100){
			 		            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
			 		            }else{
			 		            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
			 		            }
			 	            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            // 수분
		            mid_table.addCell(new Paragraph("2", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 수분", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            
		            if(prdNm.contains("벌집꿀")){
		            	mid_table.addCell(new Paragraph("23.0% 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }else{
		            	mid_table.addCell(new Paragraph("20.0% 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("wter"))){
		            		if(prdNm.contains("벌집꿀")){
			            		수분 = event.parseDouble_method(data.getString("wter")) > 23 ? 1 : 0;
			            	}else{
			            		수분 = event.parseDouble_method(data.getString("wter")) > 20 ? 1 : 0;
			            	}
		            		mid_table.addCell(new Paragraph(data.getString("wter"),  isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 니트로푸란
		            mid_table.addCell(new Paragraph("14", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 니트로푸란", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("니트로퓨란"))){
		            		니트로푸란 = event.parseDouble_method(data.getString("니트로퓨란")) > 0 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("니트로퓨란")) > 0){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("니트로퓨란"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("니트로퓨란"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("니트로퓨란")) > 0){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
			            
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            // 물불용물
		            mid_table.addCell(new Paragraph("3", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 물불용물", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.5% 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("hwoi"))){
		            		
		            		if("적합".equals(data.getString("hwoi"))
		            			|| "-".equals(data.getString("hwoi"))){
		            			물불용물 = 0;
		            		}else if("부적합".equals(data.getString("hwoi"))){
		            			물불용물 = 1;
		            		}else{
		            			물불용물 = event.parseDouble_method(data.getString("hwoi")) > 0.5 ? 1 : 0;
		            		}
		            		mid_table.addCell(new Paragraph(data.getString("hwoi"),  isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 스트렙토마이신
		            mid_table.addCell(new Paragraph("15", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 스트렙토마이신", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.10ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	
		            	if(!"".equals(data.getString("스트렙토마이신"))){
		            		스트렙토마이신 = event.parseDouble_method(data.getString("스트렙토마이신")) > 100 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("스트렙토마이신")) > 100){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("스트렙토마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("스트렙토마이신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("스트렙토마이신")) > 100){
				            		mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            //산도
		            mid_table.addCell(new Paragraph("4", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 산도", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("40.0meq/kg 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 9)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	산도 = "적합".equals(data.getString("sando")) ? 0 : 1;
		            	if(!"".equals(data.getString("sando"))){
		            		mid_table.addCell(new Paragraph(data.getString("sando"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 8)));
		            	}
		            }

		            // 옥시테트라싸이클린
		            mid_table.addCell(new Paragraph("16", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 옥시테트라싸이클린", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.30ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            
		            	if(!"".equals(data.getString("옥시테트라"))){
		            		
		            		옥시테트라싸이클린 = event.parseDouble_method(data.getString("옥시테트라")) > 300 ? 1 : 0;
		            		
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("옥시테트라")) > 300){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("옥시테트라"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("옥시테트라"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("옥시테트라")) > 300){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            
		            // 전화당
		            mid_table.addCell(new Paragraph("5", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 전화당", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            if(prdNm.contains("벌집꿀")){
		            	mid_table.addCell(new Paragraph("50.0% 이상", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }else{
		            	mid_table.addCell(new Paragraph("60.0% 이상", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("june_sgar"))){
		            		if(prdNm.contains("벌집꿀")){
			            		전화당 = event.parseDouble_method(data.getString("june_sgar")) < 50 ? 1 : 0;
			            	}else{
			            		전화당 = event.parseDouble_method(data.getString("june_sgar")) < 60 ? 1 : 0;
			            	}
		            		mid_table.addCell(new Paragraph(data.getString("june_sgar"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 클로람페니콜
		            mid_table.addCell(new Paragraph("17", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 클로람페니콜", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            
		            //해당되는 시험항목 - 표기
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            
		            }else{
		            	if(!"".equals(data.getString("클로암페니콜"))){
		            		클로람페니콜 = event.parseDouble_method(data.getString("클로암페니콜")) > 0 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("클로암페니콜")) > 0){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("클로암페니콜"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("클로암페니콜"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("클로암페니콜")) > 0){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            // 자당
		            mid_table.addCell(new Paragraph("6", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 자당", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            if(prdNm.contains("벌집꿀")){
		            	mid_table.addCell(new Paragraph("15.0% 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }else{
		            	mid_table.addCell(new Paragraph("7.0% 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            }
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("ja_sgar"))){
		            		if(prdNm.contains("벌집꿀")){
			            		자당 = event.parseDouble_method(data.getString("ja_sgar")) > 15 ? 1 : 0;
			            	}else{
			            		자당 = event.parseDouble_method(data.getString("ja_sgar")) > 7 ? 1 : 0;
			            	}
		            		mid_table.addCell(new Paragraph(data.getString("ja_sgar"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            //테트라싸이클린
		            mid_table.addCell(new Paragraph("18", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 테트라싸이클린", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.03ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
			            if(!"".equals(data.getString("테트라사이클린"))){
			            	테트라싸이클린 = event.parseDouble_method(data.getString("테트라사이클린")) > 30 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("테트라사이클린")) > 30){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("테트라사이클린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("테트라사이클린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("테트라사이클린")) > 30){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
			            }else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            //당비율
		            mid_table.addCell(new Paragraph("7", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 당비율", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("과당/포도당", new Font(objBaseFont_dotum, 10)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	당비율 = 0;
		            	if(!"".equals(data.getString("fng"))){
		            		mid_table.addCell(new Paragraph(data.getString("fng"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            //시미아졸
		            mid_table.addCell(new Paragraph("19", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 시미아졸", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("1.00ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("시미아졸"))){
		            		시미아졸 = event.parseDouble_method(data.getString("시미아졸")) > 1000 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("시미아졸")) > 1000){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("시미아졸"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("시미아졸"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("시미아졸")) > 1000){
				            		mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            // H.M.F
		            mid_table.addCell(new Paragraph("8", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" H.M.F", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("80.0mg/kg 이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 9)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	
		            	if(!"".equals(data.getString("hmf"))){
		            		HMF = event.parseDouble_method(data.getString("hmf")) > 80 ? 1 : 0;
		            		mid_table.addCell(new Paragraph(data.getString("hmf"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 브로모프로필레이트
		            mid_table.addCell(new Paragraph("20", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 브로모프로필레이트", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.01ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("브로모프로필레이트"))){
		            		브로모프로필레이트 = event.parseDouble_method(data.getString("브로모프로필레이트")) > 10 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("브로모프로필레이트")) > 10){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("브로모프로필레이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("브로모프로필레이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("브로모프로필레이트")) > 10){
				            		mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            // 타르색소
		            mid_table.addCell(new Paragraph("9", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 타르색소", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	타르색소 = "불검출".equals(data.getString("tarr")) ? 0 : 1;
		            	if(!"".equals(data.getString("tarr"))){
		            		mid_table.addCell(new Paragraph(data.getString("tarr"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 아미트라즈
		            mid_table.addCell(new Paragraph("21", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 아미트라즈", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.20ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("아미트라즈"))){
		            		아미트라즈 = event.parseDouble_method(data.getString("아미트라즈")) > 200 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("아미트라즈")) > 200){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("아미트라즈"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("아미트라즈"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("아미트라즈")) > 200){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            //사카린나트륨
		            mid_table.addCell(new Paragraph("10", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 사카린나트륨", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	사카린나트륨 = "불검출".equals(data.getString("gammoryo")) ? 0 : 1;
		            	if(!"".equals(data.getString("gammoryo"))){
		            		mid_table.addCell(new Paragraph(data.getString("gammoryo"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 코마포스
		            mid_table.addCell(new Paragraph("22", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 코마포스", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.10ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("쿠마포스"))){
		            		코마포스 = event.parseDouble_method(data.getString("쿠마포스")) > 100 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("쿠마포스")) > 100){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("쿠마포스"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("쿠마포스"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("쿠마포스")) > 100){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            // 이성화당
		            mid_table.addCell(new Paragraph("11", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 이성화당", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("음성", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "일반+잔류".equals(prdNm)
		            		|| "잔류".equals(prdNm)
		            		|| "잔류+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	이성화당 = "음성".equals(data.getString("esung")) ? 0 : 1;
		            	if(!"".equals(data.getString("esung"))){
		            		mid_table.addCell(new Paragraph(data.getString("esung"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 폴루메쓰린
		            mid_table.addCell(new Paragraph("23", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 플루메쓰린", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.01ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("플루메쓰린"))){
		            		플루메쓰린 =  event.parseDouble_method(data.getString("플루메쓰린")) > 10 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("플루메쓰린")) > 10){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루메쓰린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루메쓰린"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("플루메쓰린")) > 10){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            
		            //탄소동위원소비
		            mid_table.addCell(new Paragraph("12", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 탄소동위원소비", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("-22.5‰이하 벌  꿀\n-22.5‰초과 사양꿀", new Font(objBaseFont_dotum, 8)));
		            if("일반+잔류".equals(prdNm)
		            		|| "잔류".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("c12"))){
		            		탄소동위원소비 = 0;
		            		mid_table.addCell(new Paragraph(data.getString("c12"), isChkDisp ? new Font(objBaseFont_dotum, 8) : new Font(objBaseFont_dotum, 10)));
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }

		            // 플루발리네이트
		            mid_table.addCell(new Paragraph("24", new Font(objBaseFont_dotum, 10)));
		            cell = new PdfPCell(new Phrase(" 플루발리네이트", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            mid_table.addCell(cell);
		            mid_table.addCell(new Paragraph("0.05ppm이하", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10)));
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            }else{
		            	if(!"".equals(data.getString("플루바리네이트"))){
		            		플루발리네이트 = event.parseDouble_method(data.getString("플루바리네이트")) > 50 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("플루바리네이트")) > 50){
					            	mid_table.addCell(new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루바리네이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("플루바리네이트"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8)));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("플루바리네이트")) > 50){
					            	mid_table.addCell(new Paragraph("검출", new Font(objBaseFont_dotum, 10)));
					            }else{
					            	mid_table.addCell(new Paragraph("불검출", new Font(objBaseFont_dotum, 10)));
					            }
				            }
		            	}else{
		            		mid_table.addCell(new Paragraph("-", new Font(objBaseFont_dotum, 10)));
		            	}
		            }
		            
		            Paragraph afterCell1 = new Paragraph("25", new Font(objBaseFont_dotum, 10));
				    cell = new PdfPCell(new Phrase(" 그레이아노톡신Ⅲ", new Font(objBaseFont_dotum, 10)));
		            cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
		            PdfPCell afterCell2 = cell;
		            Paragraph afterCell3 = new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10));
		            Paragraph afterCell4 = null;
		            
		            // 그레이아노톡신Ⅲ
		            if("일반".equals(prdNm)
		            		|| "일반+탄소".equals(prdNm)
		            		|| "탄소".equals(prdNm)
		            		){
		            	afterCell4 = new Paragraph("-", new Font(objBaseFont_dotum, 10));
		            }else{
		            	if(!"".equals(data.getString("그레이아노톡신"))){
		            		그레이아노톡신 = event.parseDouble_method(data.getString("그레이아노톡신")) > 0 ? 1 : 0;
				            if(isChkDisp){
					            if(event.parseDouble_method(data.getString("그레이아노톡신")) > 0){
					            	afterCell4 = new Paragraph("검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("그레이아노톡신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8));
					            }else{
					            	afterCell4 = new Paragraph("불검출 ( "+TextFormatter.convNvl(format.format(Double.parseDouble(data.getString("그레이아노톡신"))/1000), "0")+" )", new Font(objBaseFont_dotum, 8));
					            }
				            }else{
				            	if(event.parseDouble_method(data.getString("그레이아노톡신")) > 0){
				            		afterCell4 = new Paragraph("검출", new Font(objBaseFont_dotum, 10));
					            }else{
					            	afterCell4 = new Paragraph("불검출", new Font(objBaseFont_dotum, 10));
					            }
				            }
		            	}else{
		            		afterCell4 = new Paragraph("-", new Font(objBaseFont_dotum, 10));
		            	}
		            }
		            
		            if( 성상 == 1
	 	       			|| 수분 == 1
	 	       			|| 자당 == 1
	 	       			|| 전화당 == 1
	 	       			|| 당비율 == 1
	 	       			|| HMF == 1
	 	       			|| 산도 == 1
	 	       			|| 물불용물 == 1
	 	       			|| 타르색소 == 1
	 	       			|| 사카린나트륨 == 1
	 	       			|| 이성화당 == 1
	 	       			|| 클로람페니콜 == 1
	 	       			|| 스트렙토마이신 == 1
	 	       			|| 시미아졸 == 1
	 	       			|| 니트로푸란 == 1
	 	       			|| 옥시테트라싸이클린 == 1
	 	       			|| 코마포스 == 1
	 	       			|| 테트라싸이클린 == 1
	 	       			|| 아미트라즈 == 1
	 	       			|| 플루발리네이트 == 1
	 	       			|| 플루메쓰린 == 1
	 	       			|| 네오마이신 == 1
	 	       			|| 브로모프로필레이트 == 1
	 	       			|| 그레이아노톡신 == 1
		         	){
						OverallResult = "부적합";
	         		}else{
	         			OverallResult =	"적합";
	         		}
					
		            ExcessItems = (수분 == 1 ? "수분, " : "") 
		            					+ ( 성상 == 1 ? "성상, " : "") 
		            					+ ( 자당 == 1 ? "자당, " : "") 
		            					+ (전화당 == 1 ? "전화당, " : "")
							            + (당비율 == 1 ? "당비율, " : "")
										+ ( HMF == 1 ? "H.M.F(mg/kg), " : "" )
										+ ( 산도 == 1 ? "산도(meq/kg), " : "" )
										+ ( 물불용물 == 1 ? "물불용물(meq/kg), " : "" )
										+ ( 타르색소 == 1 ? "타르색소(meq/kg), " : "" )
										+ ( 사카린나트륨 == 1 ? "인공감미료(meq/kg), " : "" )
										+ ( 이성화당 == 1 ? "이성화당(meq/kg), " : "" );
		            
		   			if(클로람페니콜 == 1
						|| 스트렙토마이신 == 1
						|| 시미아졸 == 1
						|| 니트로푸란 == 1
						|| 옥시테트라싸이클린 == 1
						|| 코마포스 == 1
						|| 테트라싸이클린 == 1
						|| 아미트라즈 == 1
						|| 플루발리네이트 == 1
						|| 플루메쓰린 == 1
						|| 네오마이신 == 1
						|| 브로모프로필레이트 == 1
						|| 그레이아노톡신 == 1
		     		){
		   				ExcessItems += "잔류";
		     		}else{
		     			ExcessItems += "";
		     			//마지막콤마 제거
			   			if(ExcessItems.lastIndexOf(",") != -1){
			   				ExcessItems = ExcessItems.substring(0,ExcessItems.lastIndexOf(","));
			   			}
		     		}

		            /**
		             * 초과항목 표기 한벌꿀, 봉인, 벌집꿀(봉인)무조건 표기
		             */
	        		RATING_RESULT = data.getString("등급판정");
	        		
	        		String testResultText = "-";
	        		String ratingResultText = "-";
	 	            String excessItemsText = "-";

		            if( "전체(참고)".equals(prdNm) ){
		            	if("Y".equals(param.getString("chk_add"))){
		            		testResultText = data.getString("test_rslt");
		            	}
	            		ratingResultText = RATING_RESULT;
		            }else if("한벌꿀(봉인)".equals(prdNm) || "봉인".equals(prdNm) || "벌집꿀(봉인)".equals(prdNm)){
	            		testResultText = data.getString("test_rslt");
	            		ratingResultText = RATING_RESULT;
		            }else{
		            	testResultText = "-";
		            	ratingResultText = "-";
		            }

	            	if( "한벌꿀(봉인)".equals(prdNm) || "벌집꿀(봉인)".equals(prdNm) || "봉인".equals(prdNm) || "전체(참고)".equals(prdNm) ){ 	
	            		excessItemsText = TextFormatter.convNvl(ExcessItems, "-");
	            	}

		            PdfPCell sf_5 = new PdfPCell(new Phrase(" · 기준 초과 항목", new Font(objBaseFont_dotum, 12)));
	 	            PdfPCell sf_6 = new PdfPCell(new Phrase(excessItemsText , new Font(objBaseFont_dotum, 8)));
	        		PdfPCell sf_1 = new PdfPCell(new Phrase(" · 종합 결과", new Font(objBaseFont_dotum, 12)));
	        		PdfPCell sf_2 = new PdfPCell(new Phrase(testResultText, new Font(objBaseFont_dotum, 12)));
	 	            PdfPCell sf_3 = new PdfPCell(new Phrase(" · 등급 판정", new Font(objBaseFont_dotum, 12)));
	 	            PdfPCell sf_4 = new PdfPCell(new Phrase(ratingResultText, new Font(objBaseFont_dotum, 12)));
	 	            
	 	            
	 	            

	 	            sf_5.setHorizontalAlignment(Element.ALIGN_LEFT); sf_5.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_5.setFixedHeight(22); sf_5.setColspan(2);
	 	            sf_6.setHorizontalAlignment(Element.ALIGN_CENTER); sf_6.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_6.setFixedHeight(22); sf_6.setColspan(2);
	 	            
	 	            sf_1.setHorizontalAlignment(Element.ALIGN_LEFT); sf_1.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_1.setFixedHeight(22); sf_1.setColspan(2);
	 	            sf_2.setHorizontalAlignment(Element.ALIGN_CENTER); sf_2.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_2.setFixedHeight(22); sf_2.setColspan(6); 
	 	            sf_3.setHorizontalAlignment(Element.ALIGN_LEFT); sf_3.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_3.setFixedHeight(22); sf_3.setColspan(2);
	 	            sf_4.setHorizontalAlignment(Element.ALIGN_CENTER); sf_4.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_4.setFixedHeight(22); sf_4.setColspan(성상 == 1 ? 5 : 6);

	 	            sf_5.setBackgroundColor(new BaseColor(208,234,237));
	 	            sf_1.setBackgroundColor(new BaseColor(208,234,237));
	 	            sf_3.setBackgroundColor(new BaseColor(208,234,237));

	 	            mid_table.addCell(sf_5);
	 	            mid_table.addCell(sf_6);
	 	            
		            mid_table.addCell(afterCell1);
		            mid_table.addCell(afterCell2);
		            mid_table.addCell(afterCell3);
		            mid_table.addCell(afterCell4);
		            
	 	            mid_table.addCell(sf_1);
	 	            mid_table.addCell(sf_2);
	 	            mid_table.addCell(sf_3);
	 	            mid_table.addCell(sf_4);
	 	            
	 	            if(성상 == 1) {
	 	            	Image stampLogo = Image.getInstance(webRoot + "images/stamp.png");
		 	            PdfPCell stampCell = new PdfPCell(stampLogo);
		 	            stampCell.setHorizontalAlignment(Element.ALIGN_CENTER); stampCell.setVerticalAlignment(Element.ALIGN_MIDDLE); stampCell.setFixedHeight(22); stampCell.setColspan(1);
	 	            	mid_table.addCell(stampCell);
	 	            	
	 	            }

	 	            preface.add(mid_table);
	            }

 	            
	            Paragraph end_footer_1 = new Paragraph("상기와 같이 시험 결과를 통지 합니다.", new Font(objBaseFont_dotum, 13, Font.BOLD));
	            Paragraph end_footer_day = new Paragraph("");
	            
	            //완료일 형식이 2015-01-01이 아닌경우
	            if("".equals(compleate_date) || compleate_date.length() != 10
	            		){
	            	end_footer_day = new Paragraph("0000 년       00 월       00 일", new Font(objBaseFont_dotum, 12, Font.BOLD));
	            }else{
	            	end_footer_day = new Paragraph(compleate_date.substring(0,4)+" 년       "+compleate_date.substring(5,7)+" 월       "+compleate_date.substring(8,10)+" 일", new Font(objBaseFont_dotum, 12, Font.BOLD));
	            }
	            
	            
	            Paragraph end_footer_last = new Paragraph(" 한  국  양  봉  협  회", new Font(objBaseFont_newgulim, 16, Font.BOLD));

	            end_footer_1.setAlignment(Paragraph.ALIGN_CENTER);
	            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
	            	end_footer_1.setSpacingBefore(10);
	            }
	            end_footer_1.setSpacingAfter(10);
	            end_footer_day.setAlignment(Paragraph.ALIGN_CENTER);
	            end_footer_last.setAlignment(Paragraph.ALIGN_CENTER);
	            
	            preface.add(end_footer_1);
	            preface.add(end_footer_day);
	            preface.add(Chunk.NEWLINE);
	            preface.add(end_footer_last);
	            
	            
	            //참고용도장
	            if(!("한벌꿀(봉인)".equals(prdNm)
			            || "봉인".equals(prdNm)
			            || "벌집꿀(봉인)".equals(prdNm))
	            		){
	            	if(!"N".equals(param.getString("chk_reference"))){
		            	Image image_reference_top = Image.getInstance(webRoot+"images/for_reference_top.png");
		            	image_reference_top.setAbsolutePosition(225, 530);
		            	image_reference_top.scalePercent(12);
			            preface.add(image_reference_top);
	            	}
		            
	            }
	            
	            //식품공정용 도장
	            if(!("한벌꿀(봉인)".equals(prdNm)
	            		|| "봉인".equals(prdNm)
	            		|| "벌집꿀(봉인)".equals(prdNm)
	            		|| "전체(참고)".equals(prdNm))
	            		){
	            	if(!"N".equals(param.getString("chk_food"))){
			            Image image_food = Image.getInstance(webRoot+"images/for_reference_bot.png");
			            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
			            	image_food.setAbsolutePosition(155, 238);
			            }else{
			            	image_food.setAbsolutePosition(155, 210);
			            }
			            image_food.scalePercent(17);
			            preface.add(image_food);
	            	}
		            
	            }
	            
	            // Contens 생성을 끝내고 Document 에 저장한다.
	            document.add(preface);
	            document.resetPageCount();
			}

			document.close();
			/*
			 * response.reset();
			 * response.setContentType("application/vnd.ms-excel");
			 * response.setHeader("Content-disposition",
			 * "attachment; filename=\"test_ALL.pdf"+"\"");
			 * 
			 * 
			 * response.setContentLength(baos.size()); OutputStream os =
			 * response.getOutputStream(); baos.writeTo(os); os.flush();
			 * os.close();
			 */

		} catch (DocumentException e) {
			e.printStackTrace();
		} finally {

		}
		return fileName;
	}

}
