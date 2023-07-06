package kr.or.korapis.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.vo.UserInfoVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class AdminJsonAction extends BaseUserAction {
	

	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		dumpParameters(request);
		
	
		AdminJsonDao dao = new AdminJsonDao();

		//지회선택시 지부정보 가져오기
		if("get_branch2".equals(selAction)){
			actionPage = "jsonPage";
			JSONArray retJson = new JSONArray();
			if("임원".equals(param.getString("ins_branch1"))){
				retJson = JSONArray.fromObject(DefaultCode.BRANCH2_EXECUTIVE);
				
			}else{
				ResultSetEntity data = dao.getBranch2(param.getString("ins_branch1"));
				while(data!=null && data.next()){
					JSONObject obj = new JSONObject();
					obj.put("id", data.getString("name"));
					obj.put("name", data.getString("name"));
					retJson.add(obj);
				}
			}
			param.put("retJson", retJson.toString());
			
		//주민번호 체크
		}else if("check_regnumber".equals(selAction)){
			actionPage = "textPage";
			String ret = dao.check_regnumber(param);
			if("Y".equals(ret)){
				param.put("result", "SUCCESS");
			}else{
				param.put("result", "FAIL");
			}
			
		//아이디 체크
		}else if("check_userid".equals(selAction)){
			actionPage = "textPage";
			String ret = dao.check_userid(param.getString("id"));
			if("Y".equals(ret)){
				param.put("result", "SUCCESS");
			}else{
				param.put("result", "FAIL");
			}
		
		//확인증 번호를 가져온다.
		}else if("check_number".equals(selAction)){
			
			actionPage = "textPage";
			String ret = dao.getCheckPrintNumber();
			param.put("result", ret);
			
		//확인증 번호를 가져온다.
		}else if("insert_printNumber".equals(selAction)){
			
			System.out.println(">>>>"+param.getString("PRINT_NUMBER"));
			
			actionPage = "textPage";
			String ret = dao.getInsertPrintNumber(param);  
			
			if("SUCCESS".equals(ret)){
				param.put("result", "SUCCESS");
			}else{
				param.put("result", "FAIL");
			}
		}
		
		request.setAttribute("param", param);
		
		return mapping.findForward(actionPage);
	}



}
