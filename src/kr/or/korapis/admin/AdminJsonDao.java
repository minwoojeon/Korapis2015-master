package kr.or.korapis.admin;


import java.util.StringTokenizer;



import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;


public class AdminJsonDao {
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();

	
	/**
	 * 주민번호 체크
	 * @param param
	 * @return Y: 가입이가능한 경우, N: 가입불가 (기존회원존재) 
	 */
	public String check_userid(String id){
		DBHandler dbh = new DBHandler();
		dbh.setTrace(true);
		
		sql.setLength(0);
		sql.append("\n	SELECT IF(COUNT(1)>0, 'N', 'Y') ");
		sql.append("\n	FROM usermember ");
		sql.append("\n	WHERE id = ? ");
		Object[] obj = new Object[1];
		obj[0] = id;
		
		return dbh.getAData(sql.toString(), obj);
	}	
	
	/**
	 * 주민번호 체크
	 * @param param
	 * @return Y: 가입이가능한 경우, N: 가입불가 (기존회원존재) 
	 */
	public String check_regnumber(MiceParam param){
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sql.append("\n	SELECT IF(COUNT(1)>0, 'N', 'Y') ");
		sql.append("\n	FROM komember ");
		sql.append("\n	WHERE regnumber = ? ");
		sql.append("\n	AND regnumber2 = ? ");
		Object[] obj = new Object[2];
		obj[0] = param.getString("regnumber");
		obj[1] = param.getString("regnumber2");
		
		return dbh.getAData(sql.toString(), obj);
	}
	
	
	/**
	 * 지부정보를 가져온다.ㄴ
	 * @param branch1
	 * @return
	 */
	public ResultSetEntity getBranch2(String branch1){
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sql.append("\n	SELECT name, name	");
		sql.append("\n	FROM korapis_bunhe	");
		sql.append("\n	WHERE 1=1 ");
		sql.append("\n	and gihe_name = '").append(branch1).append("'	");
		sql.append("\n	ORDER BY name 	");

		return dbh.getQueryData(sql.toString());
	}
	
	/**
	 * 최근사용한 확인증번호 다음을 가져온다.
	 */
	public String getCheckPrintNumber(){
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sql.append("\n	SELECT PRINT_NUMBER+1 AS PRINT_NUMBER		");
		sql.append("\n	FROM korapis_printnumber	");
		sql.append("\n	WHERE 1=1 ");
		sql.append("\n	limit 0,1 	");
	
		return dbh.getAData(sql.toString());
	}
	
	/**
	 * 최근사용한 확인증번호 다음을 가져온다.
	 */
	public String getInsertPrintNumber(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		String ret = "Fail";
		Object[] obj = null;
		try{
		
			sql.setLength(0);
			sql.append("\n	UPDATE KORAPIS_PRINTNUMBER SET 	"); 
			sql.append("\n		PRINT_NUMBER = ?			");
			
			StringTokenizer st = new StringTokenizer(sql.toString(), "?");
			
			int cnt = st.countTokens();
			int idx = 0;
			obj = new Object[cnt-1];
			obj[idx++] = param.get("PRINT_NUMBER");
			
			trh.setQueryData(sql.toString(), obj);
			
			trh.commit();
			ret = "SUCCESS";
		
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
			ret = "Fail";
					
		}finally{
			trh.close();
		}
		
		return ret;
	}
	
}
