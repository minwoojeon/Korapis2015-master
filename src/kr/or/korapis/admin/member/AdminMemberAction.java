package kr.or.korapis.admin.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.or.korapis.admin.pay.AdminPayDao;
import kr.or.korapis.admin.selfcost.AdminSelfcostDao;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.PagesVo;
import kr.or.korapis.vo.MemberVo;
import kr.or.korapis.vo.SelfcostVo;
import kr.or.korapis.vo.UserInfoVo;
public class AdminMemberAction extends BaseUserAction {
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		AdminMemberDao dao = new AdminMemberDao();
		SelfcostVo vo1 = new SelfcostVo();
		
		//회원목록 
		if("V".equals(selAction)){
			actionPage = "listPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 50);
			
			if(!"".equals(param.getString("sel_pay_yn")) || !"".equals(param.getString("selPayLimit"))){
				dataList = dao.getList(param, pagesVo.fromNumber(), pagesVo.toNumber());
				pagesVo.setTotalRows(dao.getList_tot(param));
			}else{
				dataList = dao.getList_order(param, pagesVo.fromNumber(), pagesVo.toNumber());
				pagesVo.setTotalRows(dao.getList_order_tot(param));
			}
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);
			request.setAttribute("vo1", vo1);
			
			
		//엑셀다운로드
		}else if("excel".equals(selAction)){
			actionPage = "downloadPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 999999);

			dataList = dao.getList(param, pagesVo.fromNumber(), pagesVo.toNumber());
			//pagesVo.setTotalRows(dao.getList_tot(param));
			//param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);
			
		//회원찾기 팝업
		}else if("searchpopup".equals(selAction)){
			actionPage = "popupPage";
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 50);
			
			dataList = dao.getList(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getList_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("dataList", dataList);
			request.setAttribute("pagesVo", pagesVo);
			
			
		//회원상세 팝업
		}else if("detail_popup".equals(selAction)){
			actionPage = "detailPage_popup";
			MemberVo vo = dao.getDetail(param.getString("uid"));
			request.setAttribute("vo", vo);
			
			
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
			
			MemberVo vo = dao.getDetail(param.getString("uid"));
			request.setAttribute("vo", vo);
			request.setAttribute("data_pay", dao.getDetail_pay(vo.getId()));
			
			
			PagesVo pagesVo = new PagesVo(param.getInt("selPageNo", 1), 15);
			ResultSetEntity data_certi = dao.getDetail_certi(param, pagesVo.fromNumber(), pagesVo.toNumber());
			pagesVo.setTotalRows(dao.getDetail_certi_tot(param));
			param.put("tot", pagesVo.getTotalRows());
			request.setAttribute("data_certi", data_certi);
			request.setAttribute("pagesVo", pagesVo);
			
			
			//미납내역
			ResultSetEntity data_pay_n = dao.getPayN(vo.getId());
			request.setAttribute("data_pay_n", data_pay_n);

		// 자조금납부
		}else if("cost_insert".equals(selAction)) {
			actionPage = "script";
			AdminPayDao payDao = new AdminPayDao();
			String memberUid = request.getParameter("price_memberuid");
			String arr[] = memberUid.split(",");
			script_act = DefaultCode.ACT_COST;
				
			for(int i=1;i<arr.length;i++) {
				script_ret = payDao.insert(param,arr[i]);
			}
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		}else if("self_insert".equals(selAction)) {
			actionPage = "script";
			AdminSelfcostDao selfDao = new AdminSelfcostDao();
			String insName = request.getParameter("ins_name");
			String arr[] = insName.split(",");
			script_act = DefaultCode.ACT_SELF;
			
			for(int i=1;i<arr.length;i++) {
				script_ret = selfDao.insert(param, arr[i]);
			}
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		}
		
		else if("MA".equals(selAction)){	
			actionPage = "registPage";
			
			MemberVo vo = null;
			if("".equals(param.getString("uid"))){
				vo = new MemberVo();
				vo.setRole("없음");	//역할은 '없음'
				vo.setRole_pos("평회원");	//직책은 '평회원'
				vo.setMailreceive("H");	// 우편물 수취는 '자택'
				vo.setContact_status("O");	// 연락상태는 'ok'가 기본값으로 설정되도록 부탁드립니다.
				
			}else{
				vo = dao.getDetail(param.getString("uid"));
			}
			request.setAttribute("vo", vo);
			
			
		//회원인증 출력
		}else if("print".equals(selAction)){
			actionPage = "printPage";
			request.setAttribute("vo", dao.getDetail(param.getString("uid")));
			
			
		//회원정보 삭제
		}else if("delete".equals(selAction)){
			actionPage = "script";
			script_act = DefaultCode.ACT_DEL;
			script_ret = dao.deleteMember(param);
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		//회원정보 수정
		}else if("update_member".equals(selAction)){
			actionPage = "script";
			script_act = DefaultCode.ACT_UPD;
			script_ret = dao.update_member(param);
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			
		//회원정보 등록 
		}else if("insert_member".equals(selAction)){
			actionPage = "script";
			script_act = DefaultCode.ACT_INS;
			String retStr = dao.insert_member(param);
			//script_ret = dao.insert_member(param);
			
			request.setAttribute("script_act", script_act);
			request.setAttribute("script_ret", script_ret);
			request.setAttribute("retStr", retStr);
		
		//회원 DM발송
		} else if("DMSEND".equals(selAction)){
			actionPage = "dmPage";
			dataList = dao.getDmList(param);
			//dataList = dao.getListTot(param);
			request.setAttribute("dataList", dataList);
			
		} else if("TEST_DMSEND".equals(selAction)) {
			actionPage = "dmPage";
			dataList = dao.getDmList(param);
			request.setAttribute("dataList", dataList);
		}
		
		
		
		request.setAttribute("param", param);
		
		return mapping.findForward(actionPage);
		
		
	}

	


}
