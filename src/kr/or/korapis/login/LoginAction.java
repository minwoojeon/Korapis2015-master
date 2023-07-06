package kr.or.korapis.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.TextFormatter;
import kr.or.korapis.vo.UserInfoVo;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 * 관리자, 무역관, 체류업체가 로그인하는 로직
 * @author david.Lee <stick2me@mediacore.co.kr>
 */
public class LoginAction extends Action{

	private LoginDao dao = new LoginDao();
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		

		System.out.println(">>LoginAction ");
		
		String actionPage = "login";
		int script_act = DefaultCode.ACT_LOGIN;
		int script_ret = DefaultCode.FAIL;
		String selAction = TextFormatter.convNvl(request.getParameter("selAction"), "V");

		
		HttpSession session = request.getSession(false);
		session.setMaxInactiveInterval(-1);

		
		
		UserInfoVo userInfo = null;
		String userid = TextFormatter.convNvl(request.getParameter("id"), "");
		String userpwd= TextFormatter.convNvl(request.getParameter("password"), "");
		userInfo = dao.getAdminInfo(userid, userpwd);
			
		
		//로그인처리
		if(userInfo != null && !"".equals(userInfo.getId())){
			session.setAttribute("userInfo", userInfo);
			actionPage = "success";
			script_ret = DefaultCode.SUCCESS;
			System.out.println("login success");
		}else{
			script_ret = DefaultCode.FAIL_IDPWD;
			actionPage = "script";
			//request.setAttribute("forwardPage", "/");
			System.out.println("login fail");
		}
		
		
		
		request.setAttribute("selAction", selAction);
		request.setAttribute("script_act", script_act);
		request.setAttribute("script_ret", script_ret);
		
		return mapping.findForward(actionPage);
	

	}

	
}
