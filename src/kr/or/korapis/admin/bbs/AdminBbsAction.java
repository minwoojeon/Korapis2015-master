package kr.or.korapis.admin.bbs;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.or.korapis.bbs.BbsDao;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.vo.BbsVo;
import kr.or.korapis.vo.SelfcostVo;
import kr.or.korapis.vo.UserInfoVo;
public class AdminBbsAction extends BaseUserAction {
	

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		AdminBbsDao dao = new AdminBbsDao();
		
		
		SelfcostVo vo = new SelfcostVo();
		//게시판 목록
		if("V".equals(selAction)){
			actionPage = "listPage";

			
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 30);
			dataList = dao.getList(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getList_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);

		}else if("MA".equals(selAction)){
			actionPage = "detailPage";
			
			BbsDao bbsDao = new BbsDao();
			BbsVo bbsVo = bbsDao.getBbsDetail(param.getString("bbs_idx"));
			
			request.setAttribute("bbsVo", bbsVo);
			
		}else if("MA_R".equals(selAction)){
			actionPage = "detailPage";
			
			BbsDao bbsDao = new BbsDao();
			BbsVo bbsVo = bbsDao.getBbsDetail(param.getString("bbs_idx"));
			
			param.put("bbs_fid", param.getString("bbs_idx"));
			
			request.setAttribute("bbsVo", bbsVo);
			
		}else if("DEL".equals(selAction)){
			actionPage = "script";
			
			script_act = DefaultCode.ACT_DEL;
			BbsDao bbsDao = new BbsDao();
			script_ret = bbsDao.delete(param.getString("bbs_idx"));
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		}else if("MOVE".equals(selAction)){
			actionPage = "script";
								
			script_act = DefaultCode.ACT_MOVE;
		
			BbsDao bbsDao = new BbsDao();
			
			
			if("04".equals(param.getString("bflag"))) {
				script_ret = bbsDao.moveBbsList("05", param.getString("bbs_idx"));
			}else {
				script_ret = bbsDao.moveBbsList("04", param.getString("bbs_idx"));		
			}
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
		
		}
		
		request.setAttribute("param", param);
		request.setAttribute("vo", vo);
		
		return mapping.findForward(actionPage);
		
		
	}

	


}

