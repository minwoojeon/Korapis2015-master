package kr.or.korapis.admin.QRCode;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.vo.UserInfoVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class AdminSelfQRCodeAction extends BaseUserAction {
	
	public static final int ACT_CHANGE_STS = 110001;
	public static final int ACT_SAVE_SCORE = 110002;

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		dumpParameters(request);
		ResultSetEntity dataList = null;
		ResultSetEntity categoryList = null;
		ResultSetEntity ownerList = null;
		
		
		int dataCnt;
		
		//팝업 목록 
		if("V".equals(selAction)){
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 100);
			
			dataList = dao.getQRCode_ownerList(param, pagesVo.fromNumber());
			dataCnt = dao.getQRCodeList_cnt1(param);
			categoryList = dao.get_prod_categoryList();
			
			pagesVo.setTotalRows(dataCnt);
			
//			HttpSession session = request.getSession();
//			String qrcd_from = param.getString("qrcd_from");
//			Object qrcd_to = param.getString("qrcd_to");
//			
			request.setAttribute("dataList", dataList);
			request.setAttribute("dataCnt", dataCnt);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("param", param);
			request.setAttribute("pagesVo", pagesVo);
				
//			if(!"".equals(qrcd_to)) {
//				session.setAttribute("qrcd_to", qrcd_to);				
//			}else{
//				session.setAttribute("qrcd_to", "");
//			}
//			
//			if(!"".equals(qrcd_from)) {
//				session.setAttribute("qrcd_from", qrcd_from);				
//			}else{
//				session.setAttribute("qrcd_from", "");
//			}
			
			actionPage = "listPage";
			
		}else if("detail".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			int from = param.getInt0("from");
			dataList = dao.getQRCodeList(param,from);
			ownerList = dao.getOwnerList(param);
			request.setAttribute("dataList", dataList);
			request.setAttribute("ownerList", ownerList);
			actionPage = "detailPage";
			
		}else if("update".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			int from = param.getInt0("from");
			
			dataList = dao.getQRCodeList(param,from);
			categoryList = dao.get_prod_categoryList();
			
			request.setAttribute("categoryList", categoryList);	
			request.setAttribute("dataList", dataList);
			actionPage = "updatePage";
			
		}else if("update_QRCode".equals(selAction)) {
			actionPage = "script";
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			script_act = DefaultCode.ACT_UPD;
			script_ret = dao.update_QRCodeList(param);
		
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
			
			
		}else if("pub_qrcd".equals(selAction)) {
			
			actionPage = "script";
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			String idx = (String) request.getParameter("prod_idx");
			String [] idxList = idx.split(",");
			
			int from = param.getInt("prod_seq_from");
			int to = param.getInt("prod_seq_to");
			int pubCnt;
			int maxCnt;
			int seq_to = param.getInt("prod_seq_to");
			String category = param.getString("prod_category");
			String ownerInfo = "";
			
			
			
				
			JSONArray ownerData = JSONArray.fromObject(param.getString("ownerData"));
			System.out.println("ownerData:"+ownerData);
			pubCnt = dao.getQrcode_pub_cnt(param);
			maxCnt = dao.getQrcode_maxCnt(param);
			for(int i = 0; i < ownerData.size(); ++i) {			
				
				JSONObject owner = ownerData.getJSONObject(i);	
				
				if(pubCnt>0) {
					script_ret = DefaultCode.FAIL;
					
				}else if(maxCnt<seq_to){
					script_ret = DefaultCode.FAIL_CNT;
					
				}else {
					String comma = "";
					if(i<ownerData.size()-1) {
						comma = ",";
					}else {
						comma = "";
					}
					
					
					script_ret = dao.pub_owner(
					param, owner.getString("name")
					, owner.getString("no")
					, owner.getString("orign")
					, owner.getString("orign1")
					, owner.getString("rating")
					, owner.getString("province")
					, owner.getString("date"));		
					
					ownerInfo+=owner.getString("name")+"("+owner.getString("no")+")"+comma;
					
					int prodIdx = dao.last_idx();
					
					for(int j = from;j <= to; j++) {
						
						if(pubCnt>0) {
							script_ret = DefaultCode.FAIL;					
						}else if(maxCnt<seq_to){
							script_ret = DefaultCode.FAIL_CNT;
							
						}else {
							script_ret = dao.insert_pub_owner(param.getString("prod_category"), j, prodIdx);
						}
					}
													
				}
			}
		
			if(pubCnt>0) {
				script_ret = DefaultCode.FAIL;		
				
			}else if(maxCnt<seq_to){
				script_ret = DefaultCode.FAIL_CNT;
				
			}else {
				script_ret = dao.pub_history(category, ownerInfo, from, to);	
			}
					
			for(int i=0;i<idxList.length;i++) {
				
				if(pubCnt>0) {
					script_ret = DefaultCode.FAIL;
				}else if(maxCnt<seq_to){
					script_ret = DefaultCode.FAIL_CNT;
					
				}else{
					script_ret = dao.pub_qrcdist(param, idxList[i]);	
				}		
			}
			script_act = DefaultCode.ACT_PUB;
			request.setAttribute("pubCnt", pubCnt);
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
						
		}else if("pub".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			actionPage = "pubPage";
			categoryList = dao.get_prod_categoryList();
			request.setAttribute("categoryList", categoryList);
			
		}else if("detail_owner".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			actionPage = "ownerDetailPage";
			
			dataList = dao.getOwnerDetail(param);
			categoryList = dao.get_prod_categoryList();
			
			request.setAttribute("dataList", dataList);
			request.setAttribute("categoryList", categoryList);
		}else if("update_owner".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			actionPage = "script";
			
			script_act = DefaultCode.ACT_UPD;
			script_ret = dao.update_owner(param);
		
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		}else if("update_history_owner".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			actionPage = "script";
			
			script_act = DefaultCode.ACT_UPD;
			script_ret = dao.update_history_owner(param);
		
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		}else if("delete_owner".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			actionPage = "ownerDeletePage";
			
			dataList = dao.getOwnerDetail(param);
			categoryList = dao.get_prod_categoryList();
			
			request.setAttribute("dataList", dataList);
			request.setAttribute("categoryList", categoryList);
			
		}else if("add_owner_page".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			actionPage = "ownerAddPage";
			categoryList = dao.get_prod_categoryList();
			request.setAttribute("categoryList", categoryList);
			
		}else if("add_owner".equals(selAction)) {
			actionPage = "script";
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			int from = param.getInt("prod_seq_from");
			int to = param.getInt("prod_seq_to");
				
			JSONArray ownerData = JSONArray.fromObject(param.getString("ownerData"));
			
			for(int i = 0; i < ownerData.size(); ++i) {			
				
				JSONObject owner = ownerData.getJSONObject(i);	
					
					script_ret = dao.pub_owner(
					param, owner.getString("name")
					, owner.getString("no")
					, owner.getString("orign")
					, owner.getString("orign")
					, owner.getString("rating")
					, owner.getString("province")
					, owner.getString("date"));		
					
					int prodIdx = dao.last_idx();
					
					for(int j = from;j <= to; j++) {
							
						script_ret = dao.insert_pub_owner(param.getString("prod_category"), j, prodIdx);
						
					}	
			}		
			script_act = DefaultCode.ACT_UPD;
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		}else if("history".equals(selAction)) {
			
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			
			dataCnt = dao.getQrcode_history_cnt(param);
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 100);
			pagesVo.setTotalRows(dataCnt);
			
			dataList = dao.getQrcode_history(param);
			categoryList = dao.getQrcode_history(param);
			actionPage = "historyPage";
			
			request.setAttribute("dataList", dataList);
			request.setAttribute("categoryList", categoryList);
			request.setAttribute("param", param);
			request.setAttribute("pagesVo", pagesVo);
			request.setAttribute("dataCnt", dataCnt);
			
		}else if("max_qrcd".equals(selAction)) {
			AdminSelfQRCodeDao dao = new AdminSelfQRCodeDao();
			actionPage = "pubPage";
			dao.getQrcode_maxCnt(param);
		}
		
		return mapping.findForward(actionPage);

	

	}

}

