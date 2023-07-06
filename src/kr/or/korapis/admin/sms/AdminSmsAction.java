package kr.or.korapis.admin.sms;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.korapis.admin.member.AdminMemberDao;
import kr.or.korapis.admin.sms.coolsms.Coolsms;
import kr.or.korapis.admin.sms.coolsms.SendResult;
import kr.or.korapis.admin.sms.coolsms.Set;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.vo.UserInfoVo;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
public class AdminSmsAction extends BaseUserAction {
	

	public final static int ACT_SMSSEND = 1;
	
	
	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		
		
		dumpParameters(request);
		actionPage = "listPage";
		ResultSetEntity dataList = null;
		
		//발송화면 
		if("V".equals(selAction)){
			actionPage = "sendPage";

			Coolsms coolsms = new Coolsms();
			request.setAttribute("balance", coolsms.balance().getCash());

		}else if("V_frommember".equals(selAction)){
			actionPage = "sendPage";
			AdminMemberDao dao = new AdminMemberDao();
			dataList = dao.getList(param, 0, 99999);
			request.setAttribute("dataList", dataList);

			Coolsms coolsms = new Coolsms();
			request.setAttribute("balance", coolsms.balance().getCash());
			
		}else if("sendsms".equals(selAction)){
			actionPage = "script";
			String[] rcvNumber = param.getString("sendnumber").replace(" ", "").replace("-", "").split(",");
			for(int i=0; i<rcvNumber.length; i++){
				System.out.println("sms 발송 대상자:"+rcvNumber[i]);
			}

			
			
			Coolsms coolsms = new Coolsms();
			Set set = new Set();
			set.setCountry("KR"); // 국가코드 한국:KR 일본:JP 미국:US 중국:CN
			set.setCharset("utf8"); // 인코딩 방식
			set.setType("SMS"); // 메시지 타입
			//90바이트 넘는지 여부 2차확인 후 넘을 경우 MMS로 변경
			System.out.println("sms content length:"+param.getString("sms_content").getBytes("EUC-KR").length);
			if(param.getString("sms_content").getBytes("EUC-KR").length > 90){
				set.setType("LMS");
				set.setSubject(param.getString("sms_content").substring(0, 30)); 		
			}
			set.setFrom(param.getString("from_number")); // 보내는 사람 번호
			set.setText(param.getString("sms_content")); // 문자내용 SMS(80바이트), LMS(장문 2,000바이트), MMS(장문+이미지)
			
			//set.setTo("010-8157-1146"); // 받는사람 번호
			//set.setTo(new String[] {"010-8157-1146", "ANBCC"}); // 받는사람 번호
			set.setTo(rcvNumber);	//여러개 발송시
			
			
			//SendResult result = null;
			SendResult result = coolsms.send(set); // 보내기&전송결과받기
			
			
			if(result !=null && result.getErrorString() == null){
				request.setAttribute("script_act", AdminSmsAction.ACT_SMSSEND);
				request.setAttribute("script_ret", DefaultCode.SUCCESS);
				
				param.put("GROUP_ID", result.getGroup_id());
				param.put("RESULT_CODE", result.getResult_code()); // 결과코드
				param.put("RESULT_MESSAGE", result.getResult_message());  // 결과 메시지
				param.put("SUCCESS_COUNT", result.getSuccessCount()); // 메시지아이디
				param.put("ERROR_COUNT", result.getErrorCount());  // 여러개 보낼시 오류난 메시지 수
				
//				System.out.println("group id:"+result.getGroup_id()); // 그룹아이디			
//				System.out.println("result code:"+result.getResult_code()); // 결과코드
//				System.out.println("result msg:"+result.getResult_message());  // 결과 메시지
//				System.out.println("success cnt:"+result.getSuccessCount()); // 메시지아이디
//				System.out.println("error cnt:"+result.getErrorCount());  // 여러개 보낼시 오류난 메시지 수
				
			}else{
				request.setAttribute("script_act", AdminSmsAction.ACT_SMSSEND);
				request.setAttribute("script_ret", DefaultCode.FAIL);

				param.put("GROUP_ID", result.getGroup_id());
				param.put("RESULT_CODE", result.getResult_code()); // 결과코드
				param.put("RESULT_MESSAGE", result.getResult_message());  // 결과 메시지
				param.put("SUCCESS_COUNT", result.getSuccessCount()); // 메시지아이디
				param.put("ERROR_COUNT", result.getErrorCount());  // 여러개 보낼시 오류난 메시지 수
				param.put("ERROR_STRING", result.getErrorCount());  // 에러 메시지
				
				System.out.println("group id:"+result.getGroup_id()); // 그룹아이디			
				System.out.println("result code:"+result.getResult_code()); // 결과코드
				System.out.println("result msg:"+result.getResult_message());  // 결과 메시지
				System.out.println("success cnt:"+result.getSuccessCount()); // 메시지아이디
				System.out.println("error cnt:"+result.getErrorCount());  // 여러개 보낼시 오류난 메시지 수
				System.out.println("error msg:"+result.getErrorString()); // 에러 메시지
			}		
			
			
			
		}
		
		
		
		request.setAttribute("param", param);
		
		return mapping.findForward(actionPage);
		
		
	}

	


}
