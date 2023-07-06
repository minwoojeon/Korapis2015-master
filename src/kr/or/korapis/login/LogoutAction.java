package kr.or.korapis.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 * 
 * @author david.Lee <stick2me@mediacore.co.kr>
 *
 */
public class LogoutAction extends Action{

	private static final Logger LOGGER = LogManager.getLogger( LogoutAction.class );
	

	public ActionForward execute(ActionMapping mapping, ActionForm form, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		String actionPage = "scriptTop";
		String script_msg = "로그아웃되었습니다.";
		String script_location = "/";

		
		//세션 invalidate처리
		HttpSession session = request.getSession(true);
		session.invalidate();

		
		request.setAttribute("script_msg", script_msg);
		request.setAttribute("script_location", script_location);
		
		
		
		return mapping.findForward(actionPage);
	}

	
}
