package kr.or.korapis.frame;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.util.TextFormatter;

public class BaseBoxDao {

	
	
	
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
	public String getOptionHtml(String cls, String strSql, String defaultCode) {
		return getOptionHtml(cls, strSql, defaultCode, false);
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
	public String getOptionHtml(String cls,String strSql, String defaultCode, boolean title) {
		DBHandler dbh = new DBHandler();
		//dbh.setTrace(false);
		
		StringBuffer str = new StringBuffer("");
		try {
			ResultSetEntity data = dbh.getQueryData(strSql);
			String code, name, strTitle;
			while (data.next()) {
				code = TextFormatter.convNvl(data.getString(0));
				name = TextFormatter.convNvl(data.getString(1));
				strTitle = name;
				if(data.columnSize() > 2){
					strTitle = TextFormatter.toHTMLExceptBrTag(TextFormatter.convNvl(data.getString(2)));
					strTitle = "".equals(strTitle) ? name : name+" ("+strTitle+")";
				}
				
				str.append("<option id='"+cls+"_"+code+"' value='").append(code).append("' ");
				if(title){
					str.append("title='").append(strTitle).append("'");
				}
				str.append(defaultCode.equals(code) ? "selected" : "").append(">").append(name).append(
						"</option>");
	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str.toString();
	}
	
	/**
	 * SELECT TAG의 Hidden Input HTML태그를 생성한다. 
	 * 
	 * @param strSql SQL문
	 * @param defaultCode 기본선택값
	 * @return OPTION HTML TAG
	 */
	public String getHiddenHtml(String cls, String strSql, String defaultCode, boolean title) {
		DBHandler dbh = new DBHandler();
		//dbh.setTrace(false);
		
		StringBuffer str = new StringBuffer("");
		try {
			ResultSetEntity data = dbh.getQueryData(strSql);
			String code, name, strTitle;
			while (data.next()) {
				code = TextFormatter.convNvl(data.getString(0));
				name = TextFormatter.convNvl(data.getString(1));
				strTitle = name;
				if(data.columnSize() > 2){
					strTitle = TextFormatter.toHTMLExceptBrTag(TextFormatter.convNvl(data.getString(2)));
					strTitle = "".equals(strTitle) ? name : name+" ("+strTitle+")";
				}
				
				str.append("<input type='hidden' value='").append(name).append("' ");
				if(title){
					str.append("title='").append(strTitle).append("' ");
				}
				str.append("id='"+cls+"_"+code+"'").append(">");
	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str.toString();
	}
	
	
	
}
