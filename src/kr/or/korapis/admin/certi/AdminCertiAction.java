package kr.or.korapis.admin.certi;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

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

import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.Conf;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.ItextPdfUtil;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.util.PdfDocumentWrite;
import kr.or.korapis.util.TextFormatter;
import kr.or.korapis.vo.UserInfoVo;
public class AdminCertiAction extends BaseUserAction {
	
	public static final int ACT_CHANGE_STS = 110001;
	public static final int ACT_SAVE_SCORE = 110002;

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		AdminCertiDao dao = new AdminCertiDao();
		
		//시험검사서 목록 
		if("V".equals(selAction) || "excelconfirm".equals(selAction)){
			actionPage = "listPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 50);
			
			dataList = dao.getList_admin(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getList_admin_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);

			
		/*//업로드된 엑셀화면(추후작업)
		}else if("excelconfirm".equals(selAction)){
			actionPage = "confirmPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 1000);
			
			dataList = dao.getList_admin(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getList_admin_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);*/
			
			
		//시험검사서 상세화면(수정)
		}else if("update_certi".equals(selAction)) {
			actionPage = "script";
			script_act = DefaultCode.ACT_UPD;
			script_ret = dao.update_certi(param);
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
		//시험검사서 상세화면	
		}else if("detail".equals(selAction)){
			actionPage = "detailPage";
			dataList = dao.getDetail(param, param.getString("uid"));
			
			request.setAttribute("dataList", dataList);
		//업로드화면으로 이동
		}else if("update".equals(selAction)){
			actionPage = "updatePage";
			dataList = dao.getDetail(param, param.getString("uid"));
			
			request.setAttribute("dataList", dataList);
		//업로드화면으로 이동
		}else if("upload_data".equals(selAction)){
			actionPage = "uploadPage";
		
			
		//리스트 PDF다운로드
		}else if("PDF_ALL".equals(selAction)){
			
			actionPage = "Pdf_ALL";
			
			String filePath = Conf.getInstance().getProperty("WEBROOT")+"Files/"+param.getString("filename");
			
			param.put("fileName", param.getString("filename"));
			param.put("fileURL", filePath);

		}else if("del_board_chk".equals(selAction)){
			actionPage = "script";
			script_act = DefaultCode.ACT_DEL;
			
			
			String No = TextFormatter.convNvl(request.getParameter("no"), "-1");
			String No1 = TextFormatter.convNvl(request.getParameter("regnum"), "-1");
			
			int ret = -1;
			int ret1 = -1;
			int ret2 = -1;
			
			String idx = "";
			if(!"".equals(param.get("no"))){
				
				String[] No_ar = No.split(",");
				String[] No_ar1 = No1.split(",");
				
				ArrayList<String> ar1 =new ArrayList<String>();
				
					for(int i=0;i<No_ar1.length;i++) {
						ar1.add(No_ar1[i]);
					};
					
				
				for(int i =1; i<No_ar.length; i++){

					ret = dao.del_Board(param, Integer.parseInt(No_ar[i]));
					
				}

				for(int i =1; i<No_ar1.length; i++){
					
					// regnum 으로 등록된 모든 삭제되지 않은 행들을 SELECT
					// ResulSetEntity 의 size()
					// data = dao.getRegnumData(No_ar1[i]);	// No_ar1[i] 저번에 수행했던 No_ar1[] 에 없는지를 확인
					// int i = 0;
					// while(data.next()){
					//		dao.updateRegnumCnt(data.getString("uid"), i++), 
					// }
					
					//ret1 = dao.update_maxRegnumCnt(param,No_ar1[i]);
					//ret2 = dao.update_otherRegnumCnt(param, No_ar1[i]);
					
					ret1= dao.update_regnumCnt(param, No_ar1[i], ar1.indexOf(No_ar[i]));
				}
				script_ret = DefaultCode.SUCCESS;
				
			}else{ 
				script_ret = DefaultCode.FAIL;
			}
			
			if(ret<0){
				script_ret = DefaultCode.FAIL;
			}
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
			
		/**
		 * 서브구분 사용하지않으니 참고.subSelAction 무조건 PDF
		 */
		}else if("PDF".equals(selAction)){
			
			ResultSetEntity data = null;
			
			//PDF다운로드 옵션값에 따라 전체 또는 단일
			if("PDF".equals(param.getString("subSelAction"))){
				data = dao.getDetail(param,param.getString("uid"));
			}else if("PDF_ALL".equals(param.getString("subSelAction"))){
				data = dao.getDetail_ALLPDF(param);
			}
			
			boolean isChkDisp = "Y".equals(param.getString("chk_disp"));
			
			// 2023.07.05. botbinoo.
			PdfWriter pdfWriter = null;
            // end 2023.07.05. botbinoo.
			
			 try{
				 DecimalFormat format = new DecimalFormat("###.###");
			    String webRoot = Conf.getInstance().getProperty("WEBROOT");
			    
		        //Document를 생성한다.				
				Document document = new Document(PageSize.A4, 20,20,30,30);
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();
	            // 2023.07.05. botbinoo.
//                PdfWriter.getInstance(document, baos);
                pdfWriter = PdfWriter.getInstance(document, baos);
	            // end 2023.07.05. botbinoo.
	            
	            String firstRegnum = "";
	            String lastRegnum = "";

	            document.open();
	            
	            //data 가져오기.
		        while(data!=null&&data.next()){
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
//					int 니트로푸란 = 0;
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
					String OverallResult = ""; //종합판정
					String RATING_RESULT = ""; //등급판정
					String ExcessItems = ""; //기준초과항목

					int certiType = AdminCertiDao.CERTI_TYPE_DEFAULT;

					if("0".equals(han)){
						certiType = AdminCertiDao.CERTI_TYPE_HAN_0;
					}else if("1".equals(han)){
						certiType = AdminCertiDao.CERTI_TYPE_HAN_1;
						defaultCellHeight = 21;
					}
					
					
		            Paragraph preface = new Paragraph();
		            PdfPCell cell;
		            //베이스 폰트로는 한글입력이 되지 않기 때문에 TTF 를 직접 지정한다
		            //BaseFont objBaseFont_dotum = BaseFont.createFont("D:/workspace/Korapis2015/WebContent/_mgr/css/font/KoPubdotum.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		            BaseFont objBaseFont_dotum = BaseFont.createFont(webRoot+"_mgr/css/font/CONV_DOTUM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		            BaseFont objBaseFont_newgulim = BaseFont.createFont(webRoot+"_mgr/css/font/NGULIM.TTF", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
		            // 타이들 객체를 생성한다
		            
		            
		            //로고.
		            Image image_logo = Image.getInstance(webRoot+"images/logo.jpg");
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
		            
		            //직인.
		            Image image_in = Image.getInstance(webRoot+"images/in01.png");
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
		            
		            //사단법인 TOP.
		            Image image_TOP = Image.getInstance(webRoot+"images/top.jpg");
		            image_TOP.setAbsolutePosition(155, 782);
		            image_TOP.scalePercent(4);
		            preface.add(image_TOP);
		            
		            //사단법인 BOTTOM.
		            Image image_BOT = Image.getInstance(webRoot+"images/bot.jpg");
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
		            Paragraph title_addr = new Paragraph("우)137-878 서울시 서초구 서초중앙로 6길 9", new Font(objBaseFont_dotum, 10, Font.BOLD));
		            Paragraph title_tel = new Paragraph("TEL) 02-3486-0882~5  FAX) 02-3486-0886", new Font(objBaseFont_dotum, 10, Font.BOLD));

		            title.setAlignment(Paragraph.ALIGN_CENTER);
		            title_addr.setAlignment(Paragraph.ALIGN_CENTER);
		            title_tel.setAlignment(Paragraph.ALIGN_CENTER);
		            title_tel.setSpacingAfter(10);
		            preface.add(title);
		            preface.add(title_addr);
		            preface.add(title_tel);
		            
		            // 깔끔한 구분라인을 표시하기 위하여 이미지를 이용한다.
		            Image image_line = Image.getInstance(webRoot+"_mgr/css/font/line.png");
		            image_line.setAlignment(Image.ALIGN_CENTER);
		            image_line.scalePercent(116, 73);
		            preface.add(image_line);

	                // 2023.07.12. botbinoo. 양식 변경
//	                String subTitleText = "시험 성적 통지서";
	                String subTitleText = PdfDocumentWrite.getSubTitleText2(prdNm);
	                if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
//	                    subTitleText = "시험 결과 통지서";
	                    subTitleText = PdfDocumentWrite.getSubTitleText(prdNm);
	                }
	                BaseColor tableBaseColor = PdfDocumentWrite.getTableBaseColor(prdNm);
	                // end 2023.07.12. botbinoo. 양식 변경
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
                    // 2023.07.12. botbinoo. 양식 변경
//		            table.getDefaultCell().setBackgroundColor(new BaseColor(208,234,237));
	                table.getDefaultCell().setBackgroundColor(tableBaseColor);
	                // end 2023.07.12. botbinoo. 양식 변경
		            
		            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_0){
			            table.addCell(new Paragraph("·발급번호 : "+data.getString("sel_issuenum"), new Font(objBaseFont_dotum, 11)));
		            }else if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
			            table.addCell(new Paragraph("·의 뢰 자 : "+data.getString("name"), new Font(objBaseFont_dotum, 11)));
		            }
		            
		            table.addCell(new Paragraph("·접수번호 : "+data.getString("regnum").replaceAll("\\(.*?\\)", ""), new Font(objBaseFont_dotum, 11)));
		            table.addCell(new Paragraph("·접 수 일 : "+data.getString("recv_date"), new Font(objBaseFont_dotum, 11)));

		            table.addCell(new Paragraph("·시험항목 : "+prdNm, new Font(objBaseFont_dotum, 11)));
		            table.addCell(new Paragraph("·봉인번호 : "+data.getString("bongin"), new Font(objBaseFont_dotum, 11)));
		            table.addCell(new Paragraph("·완 료 일 : "+compleate_date, new Font(objBaseFont_dotum, 11)));
		            
		            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_0){
		            	table.addCell(new Paragraph("·의 뢰 자 : "+data.getString("name"), new Font(objBaseFont_dotum, 11)));
		            	table.addCell(new Paragraph("·검체표시 : "+data.getString("검체표시"), new Font(objBaseFont_dotum, 11)));
		            }else if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
			            PdfPCell cell_gumche = new PdfPCell(new Phrase("·검체표시 : "+data.getString("검체표시"), new Font(objBaseFont_dotum, 11)));	
	                    // 2023.07.12. botbinoo. 양식 변경
//			            cell_gumche.setBackgroundColor(new BaseColor(208,234,237));
			            cell_gumche.setBackgroundColor(tableBaseColor);
	                    // end 2023.07.12. botbinoo. 양식 변경
			            cell_gumche.setHorizontalAlignment(Element.ALIGN_LEFT);
			            cell_gumche.setFixedHeight(19);
			            cell_gumche.setColspan(2);
			            table.addCell(cell_gumche);
		            }
		            
		            //전화번호Hphone 1순위 2순위 휴대폰
		            table.addCell(new Paragraph("·연 락 처 : "+(!"--".equals(data.getString("Hphone")) ? data.getString("Hphone") : data.getString("mobile")), new Font(objBaseFont_dotum, 11)));
		            
		            PdfPCell c2 = new PdfPCell(new Phrase("·주소 : "+("H".equals(data.getString("mailreceive")) ? data.getString("home_addr") : data.getString("offc_addr")), new Font(objBaseFont_dotum, 11)));	

                    // end 2023.07.12. botbinoo. 양식 변경
//		            c2.setBackgroundColor(new BaseColor(208,234,237));
		            c2.setBackgroundColor(tableBaseColor);
                    // end 2023.07.12. botbinoo. 양식 변경
		            c2.setHorizontalAlignment(Element.ALIGN_LEFT);
		            c2.setFixedHeight(19);
		            c2.setColspan(3); 
		            table.addCell(c2);
		            
		            preface.add(table);
		            

	                // 2023.07.06. 불필요한 중복 내용 삭제
	/*
	                Paragraph mid_footer_1 = new Paragraph("      ·이 통지서는 식품공전에 의거한 검사 성적서이며, 검사 완료 후 6개월간 유효합니다. ", new Font(objBaseFont_newgulim, 10));
//	              Paragraph mid_footer_2 = new Paragraph("      ·이 통지서는 홍보, 선전, 광고 및 소송용으로 사용할 수 없으며 납품 및 참고자료 이외의 사용을 금합니다.", new Font(objBaseFont_newgulim, 10));
//	                Paragraph mid_footer_2 = new Paragraph("      ·NO.1~12 벌꿀규격 및 일반 성상/ NO.13~18 항생제/ NO.19 구충제/ NO.20~24 농약/ NO.25 독성물질", new Font(objBaseFont_newgulim, 10));
	                Paragraph mid_footer_2 = new Paragraph("      ·NO.1~12 벌꿀규격 및 일반 성상/ NO.13~17 항생제/ NO.18 구충제/ NO.19~23 농약/ NO.24 독성물질", new Font(objBaseFont_newgulim, 10));
	                
	                Paragraph mid_footer = new Paragraph("                              ", new Font(objBaseFont_newgulim, 10));
	                
	                mid_footer_1.setAlignment(Paragraph.ALIGN_LEFT);
	                mid_footer_2.setAlignment(Paragraph.ALIGN_LEFT);
	                mid_footer.setAlignment(Paragraph.ALIGN_LEFT);
	                
	                preface.add(mid_footer_1);
	                preface.add(mid_footer_2);
	                preface.add(mid_footer);
	                */
	                if(PdfDocumentWrite.isReferToDoc(prdNm)) {
	                    Paragraph mid_footer_1 = new Paragraph("      ·이 통지서는 의뢰자가 제시한 시료에 한정된 결과로서 전체 제품에 대한 품질을 보증하지는 않습니다. ", new Font(objBaseFont_newgulim, 11, Font.BOLD));
	                    Paragraph mid_footer_2 = new Paragraph("      ·이 통지서는 홍보 선전 광고 및 소송용으로 사용될 수 없으며 용도 이외의 사용을 금합니다. ", new Font(objBaseFont_newgulim, 10));
	                    Paragraph mid_footer_3 = new Paragraph("      ·이 통지서의 일부만을 발췌 또는 수정하여 사용할 수 없습니다. ", new Font(objBaseFont_newgulim, 10));
	                    
	                    Paragraph mid_footer_4 = new Paragraph("      ·이 통지서는 식품공전에 의거한 검사 성적서이며, 검사 완료 후 6개월간 유효합니다. ", new Font(objBaseFont_newgulim, 10));
	                    Paragraph mid_footer_5 = new Paragraph("      ·NO.1~12 벌꿀규격 및 일반 성상/ NO.13~17 항생제/ NO.18 구충제/ NO.19~23 농약/ NO.24 독성물질", new Font(objBaseFont_newgulim, 10));
	                    Paragraph mid_footer = new Paragraph("                              ", new Font(objBaseFont_newgulim, 10));
	                    
	                    mid_footer_1.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer_2.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer_3.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer_4.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer_5.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer.setAlignment(Paragraph.ALIGN_LEFT);

                        preface.add(mid_footer_1);
                        preface.add(new Paragraph("                              ", new Font(objBaseFont_newgulim, 6)));
	                    preface.add(mid_footer_2);
	                    preface.add(mid_footer_3);
	                    preface.add(mid_footer_4);
	                    preface.add(mid_footer_5);
	                    preface.add(mid_footer);
	                    preface.add(new Paragraph("                              ", new Font(objBaseFont_newgulim, 16)));
	                } else {

	                    Paragraph mid_footer_2 = new Paragraph("      ·이 통지서는 홍보 선전 광고 및 소송용으로 사용될 수 없으며 납품 및 참고자료 이외의 사용을 금합니다. ", new Font(objBaseFont_newgulim, 10));
	                    Paragraph mid_footer_3 = new Paragraph("      ·이 통지서의 일부만을 발췌 또는 수정하여 사용할 수 없습니다. ", new Font(objBaseFont_newgulim, 10));
	                    
	                    Paragraph mid_footer_4 = new Paragraph("      ·이 통지서는 식품공전에 의거한 검사 성적서이며, 검사 완료 후 6개월간 유효합니다. ", new Font(objBaseFont_newgulim, 10));
	                    Paragraph mid_footer_5 = new Paragraph("      ·NO.1~12 벌꿀규격 및 일반 성상/ NO.13~17 항생제/ NO.18 구충제/ NO.19~23 농약/ NO.24 독성물질", new Font(objBaseFont_newgulim, 10));
	                    Paragraph mid_footer = new Paragraph("                              ", new Font(objBaseFont_newgulim, 10));
	                    
	                    mid_footer_2.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer_3.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer_4.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer_5.setAlignment(Paragraph.ALIGN_LEFT);
	                    mid_footer.setAlignment(Paragraph.ALIGN_LEFT);
	                    
	                    preface.add(mid_footer_2);
	                    preface.add(mid_footer_3);
	                    preface.add(mid_footer_4);
	                    preface.add(mid_footer_5);
	                    preface.add(mid_footer);
	                }
	                
	                // end 2023.07.06. 불필요한 중복 내용 삭제
		            
		            if(certiType == AdminCertiDao.CERTI_TYPE_HAN_1){
		                /*
		            	 Paragraph mid_footer_3 = new Paragraph("      ·이 통지서는 홍보, 선전, 광고 및 소송용으로 사용할 수 없으며 납품 및 참고자료 이외의 사용을 금합니다.", new Font(objBaseFont_dotum, 10, Font.BOLD));
				         mid_footer_3.setAlignment(Paragraph.ALIGN_LEFT);
				         preface.add(mid_footer_3);
				         preface.add(Chunk.NEWLINE);
				         */
		            }else{
			            Paragraph mid_title_head = new Paragraph("시 험 결 과", new Font(objBaseFont_dotum, 20, Font.BOLD));
			            mid_title_head.setAlignment(Paragraph.ALIGN_CENTER);
			            preface.add(mid_title_head);
		            }
//		            preface.add("");
		            
		            
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

		            mid_table.getDefaultCell().setFixedHeight( defaultCellHeight );
		            
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
		            

                    // 2023.07.12. botbinoo. 양식 변경
		            /*s_header1.setBackgroundColor(new BaseColor(163,215,221));
		            s_header2.setBackgroundColor(new BaseColor(163,215,221));
		            s_header3.setBackgroundColor(new BaseColor(163,215,221));
		            s_header4.setBackgroundColor(new BaseColor(163,215,221));
		            s_header5.setBackgroundColor(new BaseColor(163,215,221));
		            s_header6.setBackgroundColor(new BaseColor(163,215,221));
		            s_header7.setBackgroundColor(new BaseColor(163,215,221));
		            s_header8.setBackgroundColor(new BaseColor(163,215,221));*/

                    s_header1.setBackgroundColor(tableBaseColor);
                    s_header2.setBackgroundColor(tableBaseColor);
                    s_header3.setBackgroundColor(tableBaseColor);
                    s_header4.setBackgroundColor(tableBaseColor);
                    s_header5.setBackgroundColor(tableBaseColor);
                    s_header6.setBackgroundColor(tableBaseColor);
                    s_header7.setBackgroundColor(tableBaseColor);
                    s_header8.setBackgroundColor(tableBaseColor);
                    // end 2023.07.12. botbinoo. 양식 변경
		            
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
			            

	                    // 2023.07.12. botbinoo. 양식 변경
			            /*
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
			            */
	                    // end 2023.07.12. botbinoo. 양식 변경
			            
			            
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
//		 	       			|| 니트로푸란 == 1
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
//							|| 니트로푸란 == 1
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

	                    // 2023.07.12. botbinoo. 양식 변경
//	                  sf_3.setBackgroundColor(new BaseColor(208,234,237));
//	                  sf_6.setBackgroundColor(new BaseColor(208,234,237));
	                       sf_3.setBackgroundColor(tableBaseColor);
	                       sf_6.setBackgroundColor(tableBaseColor);
	                    // end 2023.07.12. botbinoo. 양식 변경

	                    // 2023.07.12. botbinoo. 양식 변경
	                    /*mid_table.addCell(sf_1);
	                    mid_table.addCell(sf_2);
	                    mid_table.addCell(sf_3);
	                    mid_table.addCell(sf_4);
	                    mid_table.addCell(sf_5);
	                    mid_table.addCell(sf_6);
	                    */
	                    if(!PdfDocumentWrite.isReferToDoc(prdNm)) {
	                        // 참고용 문서가 아닌 경우에만 종합 결과, 등급 판정 row 추가
	                        mid_table.addCell(sf_1);
	                        mid_table.addCell(sf_2);
	                        mid_table.addCell(sf_3);
	                        mid_table.addCell(sf_4);
	                    } else {
	                        preface.add(Chunk.NEWLINE);
	                    }
	                    mid_table.addCell(sf_5);
	                    mid_table.addCell(sf_6);
	                    // end 2023.07.12. botbinoo. 양식 변경

		 	            preface.add(mid_table);
		                preface.add(Chunk.NEWLINE);
			   			
		            }else if(certiType == AdminCertiDao.CERTI_TYPE_HAN_0 || certiType == AdminCertiDao.CERTI_TYPE_DEFAULT){

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
	                    // 2023.07.12. botbinoo. 양식 변경
			            /*
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
			            */
	                    // end 2023.07.12. botbinoo. 양식 변경
                        // 스트렙토마이신
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("15", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("14", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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
			            
			            // 옥시테트라싸이클린
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("16", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("15", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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


                        // 클로람페니콜
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("17", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("16", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

                        //테트라싸이클린
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("18", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("17", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

                        //시미아졸
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("19", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("18", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

                        // 브로모프로필레이트
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("20", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("19", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

                        // 아미트라즈
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("21", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("20", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

                        // 코마포스
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("22", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("21", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

                        // 폴루메쓰린
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("23", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("22", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

                        // 플루발리네이트
                        // 2023.07.12. botbinoo. 양식 변경
//                        mid_table.addCell(new Paragraph("24", new Font(objBaseFont_dotum, 10)));
                        mid_table.addCell(new Paragraph("23", new Font(objBaseFont_dotum, 10)));
                        // end 2023.07.12. botbinoo. 양식 변경
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

	                    // 그레이아노톡신Ⅲ
	                    // 2023.07.12. botbinoo. 양식 변경
	                    /*
	                     * 
	                    Paragraph afterCell1 = new Paragraph("24", new Font(objBaseFont_dotum, 10));
	                    cell = new PdfPCell(new Phrase(" 그레이아노톡신Ⅲ", new Font(objBaseFont_dotum, 10)));
	                    cell.setHorizontalAlignment(Element.ALIGN_LEFT); cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	                    PdfPCell afterCell2 = cell;
	                    Paragraph afterCell3 = new Paragraph("불검출", isChkDisp ? new Font(objBaseFont_dotum, 7) : new Font(objBaseFont_dotum, 10));
	                    Paragraph afterCell4 = null;
	                    
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
	                     * */
	                    mid_table.addCell(new Paragraph("24", new Font(objBaseFont_dotum, 10)));
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
	                    // end 2023.07.12. botbinoo. 양식 변경
			            
			            
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
//		 	       			|| 니트로푸란 == 1
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
			            					+ (성상 == 1 ? "성상, ":"")
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
//							|| 니트로푸란 == 1
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
				   				ExcessItems = ExcessItems.substring(0, ExcessItems.lastIndexOf(","));
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

                        // 2023.07.12. botbinoo. 양식 변경
		 	            sf_5.setHorizontalAlignment(Element.ALIGN_LEFT); sf_5.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_5.setFixedHeight(22); sf_5.setColspan(2);
		 	            sf_6.setHorizontalAlignment(Element.ALIGN_CENTER); sf_6.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_6.setFixedHeight(22); sf_6.setColspan(2);
		 	            
		 	            sf_1.setHorizontalAlignment(Element.ALIGN_LEFT); sf_1.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_1.setFixedHeight(22); sf_1.setColspan(2);
		 	            sf_2.setHorizontalAlignment(Element.ALIGN_CENTER); sf_2.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_2.setFixedHeight(22); sf_2.setColspan(6); 
		 	            sf_3.setHorizontalAlignment(Element.ALIGN_LEFT); sf_3.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_3.setFixedHeight(22); sf_3.setColspan(2);
		 	            sf_4.setHorizontalAlignment(Element.ALIGN_CENTER); sf_4.setVerticalAlignment(Element.ALIGN_MIDDLE); sf_4.setFixedHeight(22); sf_4.setColspan(성상 == 1 ? 5 : 6);

		 	           sf_6.setColspan(6);
		 	           sf_2.setColspan(6);
		 	           sf_4.setColspan(6);
//		                  sf_5.setBackgroundColor(new BaseColor(208,234,237));
//		                  sf_1.setBackgroundColor(new BaseColor(208,234,237));
//		                  sf_3.setBackgroundColor(new BaseColor(208,234,237));
		                    sf_5.setBackgroundColor(tableBaseColor);
		                    sf_1.setBackgroundColor(tableBaseColor);
		                    sf_3.setBackgroundColor(tableBaseColor);

		                    /*
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
		                    */
		                    
		                    mid_table.addCell(sf_5);
		                    mid_table.addCell(sf_6);
		                    
		                    if(!PdfDocumentWrite.isReferToDoc(prdNm)) {
		                        // 참고용 문서가 아닌 경우에만 종합 결과, 등급 판정 row 추가
		                        mid_table.addCell(sf_1);
		                        mid_table.addCell(sf_2);
		                        mid_table.addCell(sf_3);
		                        mid_table.addCell(sf_4);
	                        } else {
//	                            preface.add(Chunk.NEWLINE);
	                        }
		                    // end 2023.07.12. botbinoo. 양식 변경
		 	            
		 	            if(성상 == 1) {
							// 2023.07.06. 부적합시 해당 도장 삭제
		 	                if(! "부적합".equals(OverallResult)) {
	                            Image stampLogo = Image.getInstance(webRoot + "images/stamp.png");
	                            PdfPCell stampCell = new PdfPCell(stampLogo);
	                            stampCell.setHorizontalAlignment(Element.ALIGN_CENTER); stampCell.setVerticalAlignment(Element.ALIGN_MIDDLE); stampCell.setFixedHeight(22); stampCell.setColspan(1);
	                            mid_table.addCell(stampCell);
		 	                }
                            // end 2023.07.06. 부적합시 해당 도장 삭제
		 	            	
		 	            }

		 	            preface.add(mid_table);
		                preface.add(Chunk.NEWLINE);
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
                    // 2023.07.12. botbinoo. 양식 변경
//                    end_footer_1.setSpacingAfter(10);
                    end_footer_1.setSpacingAfter(15);
                    // end 2023.07.12. botbinoo. 양식 변경
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
                            // 2023.07.05. dev, botbinoo. 이미지 투명도 조정
//                            Image image_reference_top = Image.getInstance(webRoot+"images/for_reference_top.png");
                            Image image_reference_top = Image.getInstance(webRoot+"images/for_reference_top_tmp55.png");
                            // end 2023.07.05. dev, botbinoo. 이미지 투명도 조정
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
                            // 2023.07.05. dev, botbinoo. 이미지 투명도 조정
//                            Image image_food = Image.getInstance(webRoot+"images/for_reference_bot.png");
                            Image image_food = Image.getInstance(webRoot+"images/for_reference_bot_tmp55.png");
                            if("일반".equals(prdNm)
                                || "일반+탄소".equals(prdNm)
                                || "탄소".equals(prdNm)
                                
                                || "잔류".equals(prdNm)
                                || "잔류+탄소".equals(prdNm)
                                || "탄소".equals(prdNm)
                                ){
                                
                                image_food = Image.getInstance(webRoot+"images/for_reference_bot_2_tmp55.png");
                            }
                            // end 2023.07.05. dev, botbinoo. 이미지 투명도 조정
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
	            response.reset(); 
			    response.setContentType("application/vnd.ms-excel"); 
			    String suffix = firstRegnum.equals(lastRegnum) ? firstRegnum : ("("+firstRegnum+"~"+lastRegnum+")");
			    response.setHeader("Content-disposition", "attachment; filename=\"test_result_"+suffix+".pdf"+"\"");
			    
			    
			    
	            response.setContentLength(baos.size());
	            OutputStream os = response.getOutputStream();
	            baos.writeTo(os);
	            os.flush();
	            os.close();
	            
            

		            
	        }catch(DocumentException e) {
	        	e.printStackTrace();
	        }finally{
	        }
			 return null;
		}
		
		
		
		request.setAttribute("param", param);
		
		return mapping.findForward(actionPage);
		
		
	}

	



}

