package kr.or.korapis.util;

import kr.or.korapis.db.DBHandler;


public class FunctionDao {

	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	
	
	
	/**
	 * 코드명을 가져온다. 
	 */
	public String getCodeName(String mCode, String sCode, String code){
		return getCodeName(mCode, sCode, code, "COMM_NM");
	}
	public String getCode_note(String mCode, String sCode, String code){
		return getCodeName(mCode, sCode, code, "COMM_NOTE");
	}
	public String getCode_ext1(String mCode, String sCode, String code){
		return getCodeName(mCode, sCode, code, "COMM_EXT1");
	}
	public String getCode_ext2(String mCode, String sCode, String code){
		return getCodeName(mCode, sCode, code, "COMM_EXT2");
	}
	public String getCode_ext3(String mCode, String sCode, String code){
		return getCodeName(mCode, sCode, code, "COMM_EXT3");
	}
	public String getCodeName(String mCode, String sCode, String code, String gbn){
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sql.append("\n	SELECT ").append(gbn).append(" ");
		sql.append("\n	FROM mice_comm 			");
		sql.append("\n	WHERE USE_YN = 'Y'		");
		sql.append("\n 	AND COMM_MAINID = ? 	");
		sql.append("\n 	AND COMM_SUBID = ? 		");
		sql.append("\n	AND COMM_ID = ? 		");
   		Object[] obj = new Object[3];
   		obj[0] = mCode;
   		obj[1] = sCode;
   		obj[2] = code;
   		
		return dbh.getAData(sql.toString(), obj);
	}
	
	
}
