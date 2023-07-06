package kr.or.korapis.util;

import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.BaseUserAction;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.vo.UserInfoVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


/**
 * JSON ACTION
 * @author mj.sung
 *
 */

public class JsonAction extends BaseUserAction {

	@Override
	public ActionForward mcExecuete(UserInfoVo userInfo, MiceParam param,
			ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		
		dumpParameters(request);
		
		/*
		 * 리턴값이 
		 * 단순 text일경우 textPage --> "result":"결과값"
		 * json형태일 경우 jsonPage --> masterJson.jsp 에서 해당결과를 json형태로 생성.
		 */
			
		//리스트 전체PDF
		if("PDF".equals(selAction)){
			
			actionPage = "jsonPage";

			ItextPdfDown_All pdf = new ItextPdfDown_All();
			String result = "";
			String filename = pdf.getListPDF(response, param, "T-all-list_"+System.currentTimeMillis()+".pdf");
			if(filename.equals("")){
				result = "fail";
			}else{
				result = "success";
			}
			JSONObject jo = new JSONObject();
			jo.put("result",result);
			jo.put("filename",filename);
			param.put("retJson",jo.toString());
			
		}else{
			actionPage = "textPage";

			param.put("result", "FAIL");
		}
		
		
		request.setAttribute("script_act", script_act);
		request.setAttribute("script_ret", script_ret);
		request.setAttribute("selAction", selAction);
		request.setAttribute("param", param);
		
		
		return mapping.findForward(actionPage);
		
	}

	
	
	private void addParam(MiceParam param){
		//json데이터 --> miceparam 추가
		JSONArray jsonArr = JSONArray.fromObject(param.get("json"));
		Iterator iter = jsonArr.iterator();
		while(iter.hasNext()){
			JSONObject jo = (JSONObject)iter.next();
			param.put(jo.get("name"), jo.get("value"));
			System.out.println("name:"+jo.get("name")+" value:"+jo.get("value"));
		}
		//end.
		
	}
	
}
