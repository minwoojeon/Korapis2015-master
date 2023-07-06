package kr.or.korapis.admin.selfcost;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DateC;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.util.TextFormatter;
import kr.or.korapis.vo.SelfcostVo;
import kr.or.korapis.vo.UserInfoVo;
public class AdminSelfcostAction extends BaseUserAction {
	

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		ResultSetEntity dataList_Print = null;
		AdminSelfcostDao dao = new AdminSelfcostDao();
		
		
		SelfcostVo vo = new SelfcostVo();
		//자조금 목록
		if("V".equals(selAction)){
			actionPage = "listPage";

			//상세정보를 가져온다.
			if(!"".equals(param.getString("id"))){
				vo = dao.getDetail(param.getString("id"));
			}
			
		//자조금현황
		}else if("stat_year".equals(selAction)){
			actionPage = "statPage_year";
			request.setAttribute("dataList_branch", dao.getListBranch_selfcost(param.getString("selBranchGubun", "branch1")));
			request.setAttribute("datamap", dao.getDataStat(param.getString("selBranchGubun", "branch1")));
			
		}else if("stat_month".equals(selAction)){
			actionPage = "statPage_month";
			request.setAttribute("dataList_branch", dao.getListBranch_selfcost(param.getString("selBranchGubun", "branch1")));
			request.setAttribute("datamap", dao.getDataStat_month(param.getString("selBranchGubun", "branch1"), TextFormatter.convNvl(param.getString("selYear"), DateC.getCurrentYYYY())));
			
			
		}else if("update".equals(selAction)){
			int ret = dao.update(param);
			if(ret==DefaultCode.FAIL){
				request.setAttribute("alert_msg", "update fail!");
			}
			param.put("selPageNo", 1);
			
		}else if("insert".equals(selAction)){
			String insName = request.getParameter("ins_name");
			int ret = dao.insert(param,insName);
			if(ret==DefaultCode.FAIL){
				request.setAttribute("alert_msg", "isnert fail!");
			}
			param.put("selPageNo", 1);
			
		}else if("delete".equals(selAction)){
			int ret = dao.delete(param);
			if(ret==DefaultCode.FAIL){
				request.setAttribute("alert_msg", "delete fail!");
			}
			param.put("selPageNo", 1);
			
		}
		
		
		
		if("excel".equals(selAction)){
			actionPage = "excelPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 99999);
			dataList = dao.getList(param, 0, 999999);
			request.setAttribute("dataList", dataList);
			
			request.setAttribute("param", param);
			//인쇄		
		}else if("print".equals(selAction)){
			actionPage = "printPage";
			vo = dao.getDetail(param.getString("id"));			
			
			if("Y".equals(param.getString("isSuccession"))){
				dataList_Print = dao.getList_Print_Y(param,vo.getIns_branch1(),vo.getIns_branch2(),vo.getIns_name());
			} else {
				dataList_Print = dao.getList_Print_N(param,param.getString("id"));
			}
			
			request.setAttribute("dataList_Print", dataList_Print);
			request.setAttribute("svo", vo);
		}else{
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 100);
			dataList = dao.getList(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getList_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			param.put("tot_price", dao.getList_tot_price(param));

			
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);
			request.setAttribute("param", param);
			request.setAttribute("vo", vo);
		}
				
				
		
		
		
		return mapping.findForward(actionPage);
		
		
	}

	


}

