package kr.or.korapis.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.vo.UserInfoVo;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
public class MemberAction extends BaseUserAction {
	
	public static final int ACT_CHANGE_STS = 110001;
	public static final int ACT_SAVE_SCORE = 110002;

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		MemberDao dao = new MemberDao();
		
		//회원목록 
		if("V".equals(selAction)){
			actionPage = "listPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 50);
			
			
			
			
			dataList = dao.getList(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getList_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);
			
			
		//회원상세
		}else if("DET".equals(selAction)){
			actionPage = "detailPage";
			
			request.setAttribute("vo", dao.getDetail(param.getString("uid")));
			
		}
		
		
		
		request.setAttribute("param", param);
		
		return mapping.findForward(actionPage);
		
		
	}

	


}
