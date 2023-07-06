package kr.or.korapis.util;
import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class SelectBoxDao {

	private StringBuffer sql = new StringBuffer();

	
/*	
	 * 협회회원관리에서 회비납부내역의 조건생성.
	 * 해당년도 : year01
	 * @deprecated
	 * @param year
	 * @param def
	 * @return
	public String getSelectYear(String year, String def){
		StringBuffer sb = new StringBuffer();
		int intYear = Integer.parseInt(year);
		
		for(int i=1;i<=5; i++){
			sb.append("<option value='").append("year0"+i).append("' ").append( (String.valueOf(intYear).equals(def) || ("year0"+i).equals(def))?"selected":"" ).append(" >").append(intYear).append("</option>");
			intYear--;
		}
		
		return sb.toString();
	}
	*/
	
	
	/**
	 * 지회를 가져온다. 
	 * @param branch1	지회
	 * @return
	 */
	public String getBranch1(String branch1){
		sql.setLength(0);
		sql.append("\n	SELECT name, NAME	");
		sql.append("\n	FROM korapis_gihe	");
		//sql.append("\n	ORDER BY name asc	");
		sql.append("\n	ORDER BY ord asc	");
		
		return getOptionHtml(sql.toString(), branch1);
	}
	
	
	
	public String getBranch1_onlylocal(String branch1){
		
		StringBuffer sb = new StringBuffer();
		
		sb.setLength(0);
		sb.append("<option value='서울' >서울</option>");
		sb.append("<option value='경기' >경기</option>");
		sb.append("<option value='인천' >인천</option>");
		sb.append("<option value='강원' >강원</option>");
		sb.append("<option value='대전' >대전</option>");
		sb.append("<option value='충북' >충북</option>");
		sb.append("<option value='충남' >충남</option>");
		sb.append("<option value='전북' >전북</option>");
		sb.append("<option value='전남' >전남</option>");
		sb.append("<option value='광주' >광주</option>");
		sb.append("<option value='경북' >경북</option>");
		sb.append("<option value='경남' >경남</option>");
		sb.append("<option value='대구' >대구</option>");
		sb.append("<option value='울산' >울산</option>");
		sb.append("<option value='부산' >부산</option>");
		sb.append("<option value='제주' >제주</option>");
		sb.append("<option value='임원' >임원</option>");
		sb.append("<option value='업체' >업체</option>");
		sb.append("<option value='기타' >기타</option>");
		

		String s = "value='"+branch1+"'";
		String ret = sb.toString();
		ret = ret.replace(s, s+" selected");
		
		return ret;
	}

	/**
	 * 지부를 가져온다. 
	 * @param branch1	지회
	 * @param branch2	지부
	 * @return
	 */
	public String getBranch2(String branch1, String branch2){
		if("임원".equals(branch1)){

			StringBuffer sb = new StringBuffer();
			
			sb.setLength(0);
			sb.append("<option value='회장' >회장</option>");
			sb.append("<option value='부회장' >부회장</option>");
			sb.append("<option value='감사' >감사</option>");
			sb.append("<option value='이사' >이사</option>");
			
			String s = "value='"+branch2+"'";
			String ret = sb.toString();
			ret = ret.replace(s, s+" selected");
			
			return ret;
		}
		sql.setLength(0);
		sql.append("\n	SELECT name, NAME	");
		sql.append("\n	FROM korapis_bunhe	");
		sql.append("\n	WHERE 1=1 ");
		if(!"".equals(branch1)){
			sql.append("\n	and gihe_name = '").append(branch1).append("'	");
		}
		sql.append("\n	ORDER BY name 	");
		
		return getOptionHtml(sql.toString(), branch2);
	}
	
	
	
	
	/**
	 * 지회를 가져온다.
	 * @param val
	 * @return
	 * @deprecated	getBranch1으로 바꿀 것.
	 */
	public String getJihe(String val){
		sql.setLength(0);
		sql.append("\n	SELECT name, NAME	");
		sql.append("\n	FROM korapis_gihe	");
		sql.append("\n	ORDER BY uid	");
		
		return getOptionHtml(sql.toString(), val);
	}
	
	
	/**
	 * 분회를 가져온다.
	 * @param jihe
	 * @param val
	 * @return
	 * @deprecated getBranch2로 변경
	 */
	public String getBunhe(String jihe, String val){
		sql.setLength(0);
		sql.append("\n	SELECT name, NAME	");
		sql.append("\n	FROM korapis_bunhe	");
		sql.append("\n	WHERE 1=1 ");
		if(!"".equals(jihe)){
			sql.append("\n	and gihe_name = '").append(jihe).append("'	");
		}
		sql.append("\n	ORDER BY name 	");
		
		return getOptionHtml(sql.toString(), val);
	}
	
	
	
	/**
	 * 직책을 가져온다.
	 * @param val
	 * @return
	 */
	public String getGrole(String val){
		sql.setLength(0);
		sql.append("\n	SELECT name, NAME	");
		sql.append("\n	FROM korapis_grole	");
		sql.append("\n	WHERE USE_YN = 'Y' 	");
		sql.append("\n	ORDER BY GROLE_ORD 	");
		
		return getOptionHtml(sql.toString(), val);
	}
	
	/**
	 * 역할을 가져온다.
	 * @param val
	 * @return
	 */
	public String getYrole(String val){
		sql.setLength(0);
		sql.append("\n	SELECT name, NAME	");
		sql.append("\n	FROM korapis_yrole	");
		sql.append("\n	ORDER BY uid 	");
		
		return getOptionHtml(sql.toString(), val);
	}
	
	
	
	/**
	 * 공통코드 Checkbox 생성1.
	 * @param mCode
	 * @param sCode
	 * @param code
	 * @return
	 */
	public String getCodeHtml_checkbox(String mCode, String sCode, String inputName, String val) {
		sql.setLength(0);
		sql.append("	SELECT COMM_ID, COMM_NM ");
		sql.append("	FROM MICE_COMM 		");
		sql.append("	WHERE USE_YN = 'Y'		");
		sql.append(" AND COMM_MAINID = '").append(mCode).append("'	");
		sql.append(" AND COMM_SUBID = '").append(sCode).append("'	");
		sql.append(" ORDER BY ORD_SEQ ");
		
		return getCheckboxHtml(sql.toString(), inputName, val);
	}
	
	/**
	 * 공통코드 Checkbox 생성1.
	 * @param mCode
	 * @param sCode
	 * @param code
	 * @return
	 */
	public String getCodeHtml_radio(String mCode, String sCode, String inputName, String val) {
		sql.setLength(0);
		sql.append("	SELECT COMM_ID, COMM_NM ");
		sql.append("	FROM MICE_COMM 		");
		sql.append("	WHERE USE_YN = 'Y'		");
		sql.append(" AND COMM_MAINID = '").append(mCode).append("'	");
		sql.append(" AND COMM_SUBID = '").append(sCode).append("'	");
		sql.append(" ORDER BY ORD_SEQ ");
		
		return getRadioHtml(sql.toString(), inputName, val);
	}
	
	
	
	/**
	 * 공통코드 select박스 생성1.
	 * @param mCode
	 * @param sCode
	 * @param code
	 * @return
	 */
	public String getCodeHtml(String mCode, String sCode, String code) {
		sql.setLength(0);
		sql.append("	SELECT COMM_ID, COMM_NM ");
		sql.append("	FROM MICE_COMM 		");
		sql.append("	WHERE USE_YN = 'Y'		");
		sql.append(" AND COMM_MAINID = '").append(mCode).append("'	");
		sql.append(" AND COMM_SUBID = '").append(sCode).append("'	");
		sql.append(" ORDER BY ORD_SEQ ");
		
		return getOptionHtml(sql.toString(), code);
	}
	
	/**
	 * 공통코드 radio박스 생성1.
	 * @param mCode
	 * @param sCode
	 * @param code
	 * @return
	 */
	public String getCodeRadioHtml(String mCode, String sCode, String code) {
		sql.setLength(0);
		sql.append("	SELECT COMM_ID, COMM_NM ");
		sql.append("	FROM MICE_COMM 		");
		sql.append("	WHERE USE_YN = 'Y'		");
		sql.append(" AND COMM_MAINID = '").append(mCode).append("'	");
		sql.append(" AND COMM_SUBID = '").append(sCode).append("'	");
		sql.append(" ORDER BY ORD_SEQ ");
		
		return getCodeRadioHtml(sql.toString(), code);
	}
	
	
	public String getCodeHtml_json(String mCode, String sCode){
		sql.setLength(0);
		sql.append("	SELECT COMM_ID, COMM_NM ");
		sql.append("	FROM MICE_COMM 		");
		sql.append("	WHERE USE_YN = 'Y'		");
		sql.append(" AND COMM_MAINID = '").append(mCode).append("'	");
		sql.append(" AND COMM_SUBID = '").append(sCode).append("'	");
		sql.append(" ORDER BY ORD_SEQ");
		
		
		DBHandler dbh = new DBHandler();
		ResultSetEntity data = dbh.getQueryData(sql.toString());
		
		JSONArray jsonArr = new JSONArray();
		while(data!=null && data.next()){
			JSONObject obj = new JSONObject();
			obj.put(data.getColumnName(0), data.getString(0));
			obj.put(data.getColumnName(1), data.getString(1));
			
			jsonArr.add(obj);
		}
		
		return jsonArr.toString();
	}

	
	/**
	 * 숫자 SelectBox를 가져온다.
	 */
	public String getCountListHtml(String cnt, int begin, int end, int jump){
		StringBuffer str = new StringBuffer();
		str.setLength(0);
		
		//str.append("<option value='").append(begin).append("'>").append(begin).append("</option>");
		for(int j=1, i=(jump*j) ;  i<=end; j++, i=(jump*j) ){
			str.append("<option value='").append(i).append("'>").append(i).append("</option>");	
		}
		return str.toString().replaceAll("value='"+cnt+"'", "value='"+cnt+"' selected");
	}
	public String getCountListHtml(String cnt, int begin, int end){
		return getCountListHtml(cnt, begin, end, 1);
	}
	public String getCountListHtml(int cnt, int begin, int end){
		return getCountListHtml(cnt+"", begin, end, 1);
	}
	public String getCountListHtml(int cnt, int begin, int end, int jump){
		return getCountListHtml(cnt+"", begin, end, jump);
	}
	
	
	
	
	
	
	/***************************************************************************
	 * Function Name : getBaseSelected Description : SELECT BOX의 OPTION 과 선택코드값을
	 * 비교하여 SELECTED 태그를 추가시켜주는 메소드 Input Data : strOption OPTION HTML구문,strCode
	 * 선택된 코드 Output Data : strOption OPTION HTML구문 /
	 **************************************************************************/
	public String getBaseSelected(String strOption, String strCode) {
		String strSelect = " ";
		String strSelected = " ";
		strCode = strCode.trim();
		strSelect = "value='" + strCode + "'";
		strSelected = "value='" + strCode + "' selected ";

		if (strOption == null) {
			strOption = "";
		} else {
			strOption = strOption.replaceAll(strSelect, strSelected);
		}
		return strOption;
	}
	
	
	/**
	 * SELECT TAG의 OPTION HTML태그를 생성한다. 
	 * SELECT결과의 첫번째 갈럼을 코드, 두번째 칼럼을 명칭으로하여 OPTION TAG를 생성한다.
	 * 결과가 하나이면 첫번째칼럼을 코드와 명칭으로 사용한다.
	 * 
	 * @param strSql SQL문
	 * @param defaultCode 기본선택값
	 * @return OPTION HTML TAG
	 */
	private String getOptionHtml(String sql, String defaultCode) {
		return getOptionHtml(sql, defaultCode, false);
	}
	private String getOptionHtml(String sql, Object[] obj, String defaultCode) {
		return getOptionHtml(sql, obj, defaultCode, false);
	}
	
	/**
	 * radio TAG의 OPTION HTML태그를 생성한다. 
	 * 아피몬디아만 사용한다.
	 * 
	 * @param strSql SQL문
	 * @param defaultCode 기본선택값
	 * @return OPTION HTML TAG
	 */
	private String getCodeRadioHtml(String sql, String defaultCode) {
		return getCodeRadioHtml(sql, defaultCode, false);
	}
	private String getCodeRadioHtml(String sql, Object[] obj, String defaultCode) {
		return getCodeRadioHtml(sql, obj, defaultCode, false);
	}
		
	
	
	/**
	 * SELECT TAG의 OPTION HTML태그를 생성한다. 
	 * SELECT결과의 첫번째 갈럼을 코드, 두번째 칼럼을 명칭으로하여 OPTION TAG를 생성한다.
	 * 결과가 하나이면 첫번째칼럼을 코드와 명칭으로 사용한다.
	 * 
	 * @param strSql SQL문
	 * @param defaultCode 기본선택값
	 * @return OPTION HTML TAG
	 */
	private String getOptionHtml(String strSql, String defaultCode, boolean title) {
		return getOptionHtml(strSql, null, defaultCode, title);
	}
	private String getOptionHtml(String strSql, Object[] obj, String defaultCode, boolean title) {
		DBHandler dbh = new DBHandler();
		//dbh.setTrace(false);
		
		StringBuffer str = new StringBuffer("");
		try {
			ResultSetEntity data = null;
			if(obj==null){
				data = dbh.getQueryData(strSql);
			}else{
				data = dbh.getQueryData(strSql, obj);
			}
			String code, name, strTitle;
			while (data.next()) {
				code = TextFormatter.convNvl(data.getString(0));
				name = TextFormatter.convNvl(data.getString(1));
				strTitle = name;
				if(data.columnSize() > 2){
					strTitle = TextFormatter.toHTMLExceptBrTag(TextFormatter.convNvl(data.getString(2)));
					strTitle = "".equals(strTitle) ? name : name+" ("+strTitle+")";
				}
				
				str.append("<option value='").append(code).append("' ");
				if(title){
					str.append("title='").append(strTitle).append("'");
				}
				str.append(defaultCode.equals(code) ? " selected" : "").append(">").append(name).append(
						"</option>");
	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str.toString();
	}
	
	/**
	 * SELECT TAG의 OPTION HTML태그를 생성한다. 
	 * SELECT결과의 첫번째 갈럼을 코드, 두번째 칼럼을 명칭으로하여 OPTION TAG를 생성한다.
	 * 결과가 하나이면 첫번째칼럼을 코드와 명칭으로 사용한다.
	 * 
	 * @param strSql SQL문
	 * @param defaultCode 기본선택값
	 * @return OPTION HTML TAG
	 */
	private String getCodeRadioHtml(String strSql, String defaultCode, boolean title) {
		return getCodeRadioHtml(strSql, null, defaultCode, title);
	}
	private String getCodeRadioHtml(String strSql, Object[] obj, String defaultCode, boolean title) {
		DBHandler dbh = new DBHandler();
		//dbh.setTrace(false);
		
		StringBuffer str = new StringBuffer("");
		try {
			ResultSetEntity data = null;
			if(obj==null){
				data = dbh.getQueryData(strSql);
			}else{
				data = dbh.getQueryData(strSql, obj);
			}
			String code, name, strTitle;
			while (data.next()) {
				code = TextFormatter.convNvl(data.getString(0));
				name = TextFormatter.convNvl(data.getString(1));
				strTitle = name;
				if(data.columnSize() > 2){
					strTitle = TextFormatter.toHTMLExceptBrTag(TextFormatter.convNvl(data.getString(2)));
					strTitle = "".equals(strTitle) ? name : name+" ("+strTitle+")";
				}
				
				//str.append("<option value='").append(code).append("' ");
				
				str.append("<input type='radio' name='CONF_CATEGORY' value='").append(code).append("' ");
				
				if(title){
					str.append("title='").append(strTitle).append("'");
				}
				str.append(defaultCode.equals(code) ? " checked" : "").append("/> ").append(name).append("<br/> ");
	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str.toString();
	}
	
	
	
	
	
	public String getNumberOptionHtml(int from, int to, int interval, int defValue){
		StringBuffer str = new StringBuffer();
		for(int i=from;from<to?i<=to:i>=to;i+=(from<to?Math.abs(interval):(-Math.abs(interval))))
			str.append("<option value=\"").append(i).append("\" ").append(i==defValue?"selected":"").append(">").append(i).append("</option>");
		return str.toString();
	}
	
	private String getRadioHtml(String strSql, String inputName, String val){
		return getRadioHtml(strSql, null, inputName, val);
	}
	private String getRadioHtml(String strSql, Object[] obj, String inputName, String val){
		DBHandler dbh = new DBHandler();
		
		StringBuffer str = new StringBuffer("");
		try {
			ResultSetEntity data = null;
			if(obj==null){
				data = dbh.getQueryData(strSql);
			}else{
				data = dbh.getQueryData(strSql, obj);
			}
			
			String code, name;
			
			while (data.next()) {
				code = TextFormatter.convNvl(data.getString(0));
				name = TextFormatter.convNvl(data.getString(1));
				
				
				str.append("<span style=\"display:inline-block; margin-left:8px\" class=\"").append("cls_"+inputName).append("\">");
				str.append("<input type=\"radio\" value=\"").append(code).append("\" name=\"").append(inputName).append("\" ");
				if(val.contains(code)){
					str.append("checked");
				}
				str.append(" >&nbsp;");
				str.append(name);
				str.append("</span>");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str.toString();
	}
	
	
	
	/**
	 * 예) ;01;02;03;의 형태 즉 구분자(;)가 앞뒤로 붙는다. 
	 * @param strSql
	 * @param val
	 * @return
	 */
	private String getCheckboxHtml(String strSql, String inputName, String val){
		return getCheckboxHtml(strSql, null, inputName, val);
	}
	private String getCheckboxHtml(String strSql, Object[] obj, String inputName, String val){
		DBHandler dbh = new DBHandler();
		
		StringBuffer str = new StringBuffer("");
		try {
			ResultSetEntity data = null;
			if(obj==null){
				data = dbh.getQueryData(strSql);
			}else{
				data = dbh.getQueryData(strSql, obj);
			}
			
			String code, name;
			
			while (data.next()) {
				code = TextFormatter.convNvl(data.getString(0));
				name = TextFormatter.convNvl(data.getString(1));
				
				
				str.append("<span style=\"display:inline-block; margin-left:8px\" class=\"").append("cls_"+inputName).append("\">");
				str.append("<input type=\"checkbox\" name=\"").append(inputName).append("\" id=\"").append(code).append("\" value=\"").append(code).append("\" ");
				if(val.contains(code)){
					str.append("checked");
				}
				str.append(" >&nbsp;");
				str.append(name);
				str.append("</span>");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str.toString();
	}
	
	
	
	
}
