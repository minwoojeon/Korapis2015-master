package kr.or.korapis.member;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.MiceParam;

public class PayDao {

	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();
	
	
	

	/**
	 * 회비납부내역을 가져온다.
	 * @param param
	 * @return
	 */
	public ResultSetEntity getPayList(MiceParam param){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n SELECT * 	");
		sql.append("\n FROM korapis_member_bill	");
		sql.append("\n WHERE 1=1	");
		sql.append("\n 	AND member_uid = ?	");
		sql.append("\n 	AND ( gubun >= 2000	 OR gubun = '가입비' )	");
		sql.append("\n ORDER BY gubun DESC	");

		return dbh.getQueryData(sql.toString(), new Object[]{ param.getString("member_uid")});
	}
	
	
	

	/**
	 * 년간 회비를 가져온다.  
	 * @return
	 */
	public String getYearlyPay(){
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sql.append("\n SELECT price 	");
		sql.append("\n FROM korapis_bill	"); 
		sql.append("\n WHERE kind = '회비'	");
		
		return dbh.getAData(sql.toString());
	}
	
	
	
	
	
}
