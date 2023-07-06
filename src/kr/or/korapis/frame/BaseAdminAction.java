package kr.or.korapis.frame;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.korapis.vo.UserInfoVo;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 * 로그인 후 Action의 최초 진입점
 * @author david.Lee <stick2me@mediacore.co.kr>
 *
 */
public abstract class BaseAdminAction extends Action{
	
	
	private Logger log = Logger.getLogger(this.getClass());
	
	protected int script_act = -1;
	protected int script_ret = -1;
	protected String actionPage = "";
	protected String selAction = "";
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, 
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		
		

		//홈페이지는 회원, 비회원 모두 접속가능.
		HttpSession session = request.getSession(false);
		UserInfoVo userInfo = (UserInfoVo)session.getAttribute("userInfo");
		
		
		
		//세션정보가 없거나 로그인정보가 없을 경우 메인 홈페이지로 보내버린다.
		if(session==null || session.getAttribute("userInfo")==null){
			return new ActionForward("/logout.do");
			
			
		}else{
			
			//관리자 권한이 없을 경우 로그아웃.
			if(!userInfo.isAdmin()){
				return new ActionForward("/logout.do");	
			}
			
			
			//파라미터처리
			MiceParam param = new MiceParam();
			Enumeration en = request.getParameterNames();
			String name,  values[];
			while( en.hasMoreElements()) {
				name = (String)en.nextElement();
				values = request.getParameterValues(name);
				
				param.put(name, values);
			}
			
			
			
			
			

			//수정,등록자 아이디
			param.put("id"	, userInfo.getId());
					
			
			//기본값 셋업
			actionPage = "";
			selAction = param.getString("selAction", "V");
			
			return mcExecuete(userInfo, param, mapping, form, request, response);
		}

	}

	
	
	
	
	
	
	public abstract ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param, ActionMapping mapping, ActionForm form, 
			HttpServletRequest request, HttpServletResponse response ) throws Exception;
	
	
	
	
	
	/**
	 * Paremeter dump
	 * @param request
	 */
	public void dumpParameters( HttpServletRequest request) {
		Enumeration en = request.getParameterNames();
		String name,  values[];
		StringBuffer s = new StringBuffer();
		
		s.append("\n"+request.getRequestURI() + " parameter dump start -------------");
		while( en.hasMoreElements()) {
			name = (String)en.nextElement();
			values = request.getParameterValues(name);
			s.append(name + "=" );
			for (int i = 0; i < values.length; i++) {
				if( i>0) s.append(","); 
				s.append(values[i]);
				
			}
			s.append("\n.");
		}
		s.append("\n"+ request.getRequestURI() + " parameter dump end -------------");
		log.info(s);
	}

	/**
	 * Attribute dump
	 * @param request
	 */
	public void dumpAttributes( HttpServletRequest request) {
		Enumeration en = request.getAttributeNames();
		String name;
		Object value;
		StringBuffer s = new StringBuffer();
		
		s.append("\n"+request.getRequestURI() + " attribute dump start -------------");
		while( en.hasMoreElements()) {
			name = (String)en.nextElement();
			value = request.getAttribute(name);
			s.append("\n"+name + "=" + value==null ? "<null>" : value.toString());
		}
		s.append("\n"+ request.getRequestURI() + " attribute dump end -------------");
		log.info(s);
	}

}
