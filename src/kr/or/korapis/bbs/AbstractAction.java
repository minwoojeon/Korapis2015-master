package kr.or.korapis.bbs;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.vo.UserInfoVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.WordUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
public class AbstractAction extends BaseUserAction {
	
	public static final int ACT_CHANGE_STS = 110001;
	public static final int ACT_SAVE_SCORE = 110002;

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		BbsDao dao = new BbsDao();
		/*
		//초록목록 
		if("V".equals(selAction)){
			actionPage = "listPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 50);
			
			
			if("".equals(param.getString("selCategory"))){
				if(!"Y".equals(userInfo.getCHIEF_YN())){
					param.put("selCategory", userInfo.getCONF_GUBUN());
				}else{
					param.put("selCategory", "BE");
				}
			}
			
			
			dataList = dao.getAbstractList(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getAbstractList_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);
			
			
			ResultSetEntity d_method = dao.getCountByMethod(param);
			String cntOral = "0";
			String cntPoster = "0";
			while(d_method!=null && d_method.next()){
				if("ORAL".equals(d_method.getString("conf_gubun"))){
					cntOral = d_method.getString("cnt");
				}else if("POSTER".equals(d_method.getString("conf_gubun"))){
					cntPoster = d_method.getString("cnt");
				}
			}
			param.put("cntOral", cntOral);
			param.put("cntPoster", cntPoster);

		//초록상세
		}else if("DET".equals(selAction)){
			actionPage = "detailPage";
			
			ApimondiaConferenceDao conferenceDao = new ApimondiaConferenceDao();
			request.setAttribute("data", conferenceDao.getConference(param));
			
			
		//코멘트 저장
		}else if("save_score".equals(selAction)){
			actionPage = "script";
			script_act = ACT_SAVE_SCORE;
			script_ret = dao.save_score(param, userInfo);
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		//엑셀다운로드
		}else if("XLS".equals(selAction)){
		
			
			
			
			
			
		//PDF다운로드
		}else if("PDF".equals(selAction)){
			ApimondiaConferenceDao conferenceDao = new ApimondiaConferenceDao();
			ResultSetEntity data = conferenceDao.getConference(param);

			
			 try{
				 
				data.next();
				
				Font font = FontFactory.getFont("Times-Roman", 12);
			     Font fontbold = FontFactory.getFont("Times-Roman", 15, Font.BOLD);
			     Font fonttext = FontFactory.getFont("Times-Roman", 10);
			        
			        
				
	            Document document = new Document();
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();
	            PdfWriter.getInstance(document, baos);
	            document.open();

	            
	            
	            Paragraph p_preface = new Paragraph(); 
	            p_preface.setFont(font);
	            p_preface.setAlignment(Element.ALIGN_LEFT);
	            p_preface.add("Category Code : "+data.getString("conf_category"));
	            p_preface.add(Chunk.NEWLINE);
	            p_preface.add("Presentation : "+WordUtils.capitalize(data.getString("conf_gubun").toLowerCase()));
	            
	           
	            
	            
	            Paragraph p_title = new Paragraph();
	            p_title.setFont(fontbold);
	            p_title.setAlignment(Element.ALIGN_CENTER);
	            p_title.add(data.getString("conf_title"));
	            
	            
	            JSONArray author = JSONArray.fromObject(data.getString("CONF_AUTHORS","[]"));
	            String strAuthor = "";
	            String presentor = "";
	            String presentor_org = "";
	            if(author!=null && author.size()>0){
	            	for(int i=0; i<author.size(); i++){
	            		JSONObject jo = author.optJSONObject(i);
	            		if(jo!=null){
	            			if(jo.optInt("pr", -1)!=-1){
	            				presentor_org = jo.getString("inst");
	            				presentor = jo.getString("fname") +" "+ jo.getString("lname");
	            			}else{
	            				strAuthor += ","+jo.getString("fname") +" "+ jo.getString("lname");
	            			}
	            		}
	            		
	            		
	            	}
	            }
	            
	            
	            
	            
	            
					
	            Paragraph p_author = new Paragraph();
	            p_author.setFont(font);
	            p_author.setAlignment(Element.ALIGN_CENTER);
	            p_author.add(presentor + strAuthor);
	            p_author.add(Chunk.NEWLINE);
	            //p_author.add("Affiliation ("+presentor_org+")");
	            p_author.add(presentor_org);
	            
	            Paragraph p_text = new Paragraph();
	            p_text.setFont(fonttext);
	            
	            p_text.setAlignment(Element.ALIGN_LEFT);
	            p_text.add(data.getString("conf_content"));
	            
	            
	            Paragraph p_copyright = new Paragraph();
	            p_copyright.setFont(fonttext);
	            p_copyright.setAlignment(Element.ALIGN_LEFT);
	            String confAgree = data.getString("conf_agree_radio");
	            
	            if("01".equals(confAgree)){
	            	p_copyright.add("Copyright Transfer "+"Publish abstracts only");
	            }else if("02".equals(confAgree)){
	            	p_copyright.add("Copyright Transfer "+"Publish abstracts and presentation file(PDF)");
	            }else if("03".equals(confAgree)){
	            	p_copyright.add("Copyright Transfer "+"Publish Full paper");
	            }else if("04".equals(confAgree)){
	            	p_copyright.add("Copyright Transfer "+"All closed");
	            }
	            
				 
				
				
				
						

	            
	            document.add(p_preface);
	            document.add( Chunk.NEWLINE );
	            document.add( Chunk.NEWLINE );

	            document.add(p_title);
	            document.add( Chunk.NEWLINE );
	            
	            document.add(p_author);
	            document.add( Chunk.NEWLINE );
	            
	            document.add(p_text);
	            document.add( Chunk.NEWLINE );
	            document.add( Chunk.NEWLINE );
	            document.add( Chunk.NEWLINE );
	            document.add( Chunk.NEWLINE );
	            document.add(p_copyright);
	            
	            
	            
	            DecimalFormat df = new DecimalFormat("#######");
	            String filename = data.getString("conf_idx");
	            try{
	            	filename = df.format(data.getString("conf_idx"));
	            }catch (Exception e) {
					e.printStackTrace();
				}
	            
	            
	            document.close();
	            response.reset(); 
			    response.setContentType("application/vnd.ms-excel"); 
			    response.setHeader("Content-disposition", "attachment; filename=\""+filename+".pdf"+"\"");
			    
			    
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
		 
		
		}else if("PDF_ALL".equals(selAction)){
			
			
		}
		
		
		
		request.setAttribute("param", param);
*/		
		return mapping.findForward(actionPage);
		
		
	}

	


}
