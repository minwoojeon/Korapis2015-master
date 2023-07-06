package kr.or.korapis.admin.pay;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.or.korapis.admin.member.AdminMemberDao;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.vo.MemberVo;
import kr.or.korapis.vo.UserInfoVo;
public class AdminPayAction extends BaseUserAction {
	
	public static final int ACT_CHANGE_STS = 110001;
	public static final int ACT_SAVE_SCORE = 110002;

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		AdminPayDao dao = new AdminPayDao();
		AdminMemberDao mdao = new AdminMemberDao();
		
		//회비납부 목록 
		if("V".equals(selAction)){
			actionPage = "listPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 50);
			
			dataList = dao.getList_admin(param, pagesVo.fromNumber(), pagesVo.toNumber());
			long[] tot = dao.getList_admin_tot(param);
			pagesVo.setTotalRows((int)tot[0]);
			param.put("tot", pagesVo.getTotalRows());
			param.put("total_pay", tot[1]);
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);

			
		}else if("excel".equals(selAction)){
			actionPage = "downloadPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 999999);

			dataList = dao.getList_admin(param, pagesVo.fromNumber(), pagesVo.toNumber());
			//pagesVo.setTotalRows(dao.getList_tot(param));
			//param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);
			
			
			
		
		//회비납부 등록.수정
		}else if("MA".equals(selAction)){
			actionPage = "registPage";
			request.setAttribute("vo", dao.getDetail(param.getString("uid")));
			
			
			
//		//회비납부 상세화면
//		}else if("detail".equals(selAction)){
//			actionPage = "detailPage";
//			request.setAttribute("vo", dao.getDetail(param.getString("uid")));
			
		//회원상세
		}else if("detail".equals(selAction)){
			actionPage = "detailPage";

			
			//회비납부내역 등록시
			if(!"".equals(param.getString("price_action"))){
				AdminPayDao payDao = new AdminPayDao();
				if("insert".equals(param.getString("price_action"))){
					String memberUid = request.getParameter("price_memberuid");			
					payDao.insert(param,memberUid);
				}else if("update".equals(param.getString("price_action"))){
					payDao.update(param);
				}else if("delete".equals(param.getString("price_action"))){
					payDao.delete(param);
				}
			}
			
			
			if("".equals(param.getString("list_gubun"))){
				param.put("list_gubun", "list1");
			}
			
			MemberVo vo = mdao.getDetail(param.getString("uid"));
			request.setAttribute("vo", vo);
			request.setAttribute("data_pay", mdao.getDetail_pay(vo.getId()));
			
			
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 15);
			ResultSetEntity data_certi = mdao.getDetail_certi(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(mdao.getDetail_certi_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("data_certi", data_certi);
			request.setAttribute("pagesVo", pagesVo);
			
			
			//미납내역
			ResultSetEntity data_pay_n = mdao.getPayN(vo.getId());
			request.setAttribute("data_pay_n", data_pay_n);
			
			
		//등록.수정
		}else if("update".equals(selAction)){
			actionPage = "script";
			script_act = DefaultCode.ACT_UPD;
			if("".equals(param.getString("uid"))){
				String memberUid = request.getParameter("price_memberuid");		
				script_ret = dao.insert(param,memberUid);
			}else{
				//script_ret = dao.update(param);
			}
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
		}
		
		
		
		request.setAttribute("param", param);
		
		return mapping.findForward(actionPage);
		
		
	}

	


}

