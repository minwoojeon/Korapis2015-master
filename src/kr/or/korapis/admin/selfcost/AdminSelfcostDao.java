package kr.or.korapis.admin.selfcost;

import java.util.HashMap;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.vo.SelfcostVo;

public class AdminSelfcostDao {
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();

/*	//지회를 가져온다.
	public ResultSetEntity getListBranch(String bGubun){
		DBHandler dbh = new DBHandler();
		
		if("branch1".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT name as branch1_name	");
			sql.append("\n 	, '' as branch2_name	");
			sql.append("\n FROM korapis_gihe	");
			sql.append("\n ORDER BY NAME	");
		}else if("branch2".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT gihe_name as branch1_name 	");
			sql.append("\n 	, name as branch2_name	");
			sql.append("\n FROM korapis_bunhe	");
			sql.append("\n ORDER BY gihe_name ASC, NAME ASC	");
		}
		
		return dbh.getQueryData(sql.toString());
	}*/
	
	
	//지회를 가져온다.
	public ResultSetEntity getListBranch_selfcost(String bGubun){
		DBHandler dbh = new DBHandler();
		
		if("branch1".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT name as branch1_name	");
			sql.append("\n 	, '' as branch2_name	");
			sql.append("\n FROM korapis_gihe_selfcost	");
			sql.append("\n ORDER BY ord asc	");
		}else if("branch2".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT a.name AS branch1_name	"); 	
			sql.append("\n 	, b.name AS branch2_name	");	
			sql.append("\n FROM korapis_gihe_selfcost a LEFT OUTER JOIN korapis_bunhe	b	");
			sql.append("\n ON a.name = b.gihe_name	");
			sql.append("\n ORDER BY a.ord asc, gihe_name ASC, b.NAME ASC	");	
		}
		
		return dbh.getQueryData(sql.toString());
	}
	
	
	
	/**
	 * 통계데이터를 가져온다.
	 * @param bGubun
	 * @return
	 */
	public HashMap<String, String> getDataStat(String bGubun){
		DBHandler dbh = new DBHandler();
		
		HashMap<String, String> m = new HashMap<String, String>();
		if("branch1".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT	"); 
			sql.append("\n 	SUBSTR(납부일, 1,4)  AS yea	");
			sql.append("\n 	, 지회	");
			sql.append("\n 	, format(SUM(금액),0) AS map_val	");
			sql.append("\n FROM t자조금납부	");
			sql.append("\n GROUP BY 지회, yea	");
			
			ResultSetEntity d = dbh.getQueryData(sql.toString());
			while(d!=null && d.next()){
				m.put(d.getString("지회")+"_"+d.getString("yea"), d.getString("map_val"));
			}
		}else if("branch2".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT 	");
			sql.append("\n 	SUBSTR(납부일, 1,4)  AS yea	");
			sql.append("\n 	, 지회	");
			sql.append("\n 	, 지부	");
			sql.append("\n 	, format(SUM(금액),0) AS map_val	");
			sql.append("\n FROM t자조금납부	");
			sql.append("\n GROUP BY 지회, 지부, yea	");
			

			ResultSetEntity d = dbh.getQueryData(sql.toString());
			while(d!=null && d.next()){
				m.put(d.getString("지회")+"_"+d.getString("지부")+"_"+d.getString("yea"), d.getString("map_val"));
			}
			
		}
				
		return m;
	}
	/**
	 * 통계데이터를 가져온다.
	 * @param bGubun
	 * @return
	 */
	public HashMap<String, String> getDataStat_month(String bGubun, String selYear){
		DBHandler dbh = new DBHandler();
		
		HashMap<String, String> m = new HashMap<String, String>();
		if("branch1".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT	"); 
			sql.append("\n 	SUBSTR(납부일, 1,4)  AS yea	");
			sql.append("\n 	, SUBSTR(납부일, 6,2)  AS mont 	");
			sql.append("\n 	, 지회	");
			sql.append("\n 	, format(SUM(금액),0) AS map_val	");
			sql.append("\n FROM t자조금납부	");
			sql.append("\n where SUBSTR(납부일, 1,4) = '").append(selYear).append("' ");
			sql.append("\n GROUP BY 지회, yea, mont	");
			
			ResultSetEntity d = dbh.getQueryData(sql.toString());
			while(d!=null && d.next()){
				m.put(d.getString("지회")+"_"+d.getString("yea")+"_"+d.getString("mont"), d.getString("map_val"));
			}
		}else if("branch2".equals(bGubun)){
			sql.setLength(0);
			sql.append("\n SELECT 	");
			sql.append("\n 	SUBSTR(납부일, 1,4)  AS yea	");
			sql.append("\n 	, SUBSTR(납부일, 6,2)  AS mont 	");
			sql.append("\n 	, 지회	");
			sql.append("\n 	, 지부	");
			sql.append("\n 	, format(SUM(금액),0) AS map_val	");
			sql.append("\n FROM t자조금납부	");
			sql.append("\n where SUBSTR(납부일, 1,4) = '").append(selYear).append("' ");
			sql.append("\n GROUP BY 지회, 지부, yea, mont	");
			

			ResultSetEntity d = dbh.getQueryData(sql.toString());
			while(d!=null && d.next()){
				m.put(d.getString("지회")+"_"+d.getString("지부")+"_"+d.getString("yea")+"_"+d.getString("mont"), d.getString("map_val"));
			}
			
		}
				
		return m;
	}

	/**
	 * 자조금 납부 가져온다
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();
		sqlWhere.setLength(0);
		makeWhere(param);
		
		sql.setLength(0);
		sql.append("\n SELECT 		");
		sql.append("\n 	`ID`, 	");
		sql.append("\n 	DATE_FORMAT(`납부일`, '%Y-%m-%d')AS regdate, 	 	");
		sql.append("\n 	`지회` as branch1, 	");
		sql.append("\n 	`지부` as branch2, 	");
		sql.append("\n 	`납부자` as membername, 	");
		sql.append("\n 	concat(`금액`) as price, 	");
		sql.append("\n 	`비고` as etc, 	");
		sql.append("\n 	`기타` as etc2, 	");
		sql.append("\n 	`TS`	");
		sql.append("\n FROM  `t자조금납부`	"); 
		sql.append("\n where 1=1	");
		sql.append(sqlWhere);
		sql.append("\n ORDER BY ts desc, regdate DESC, membername asc	");
		sql.append("\n limit ?, ?				");
		Object[] obj = new Object[2];
		obj[0] = from;
		obj[1] = cnt;
		  

		return dbh.getQueryData(sql.toString(), obj);
	}
	
	
	public int getList_tot(MiceParam param){
		DBHandler dbh = new DBHandler();
		
		sqlWhere.setLength(0);
		makeWhere(param);
		
		sql.setLength(0);
		sql.append("\n SELECT count(id)	");
		sql.append("\n FROM  `t자조금납부`	"); 
		sql.append("\n where 1=1	");
		sql.append(sqlWhere);
		
		return Integer.parseInt(dbh.getAData(sql.toString()));
	}
	
	
	
	public String getList_tot_price(MiceParam param){
		DBHandler dbh = new DBHandler();
		sqlWhere.setLength(0);
		makeWhere(param);
		
		sql.setLength(0);
		sql.append("\n SELECT SUM(금액)	");
		sql.append("\n FROM  `t자조금납부`	"); 
		sql.append("\n where 1=1	");
		sql.append(sqlWhere);
		
		return dbh.getAData(sql.toString());
	}
	
	private void makeWhere(MiceParam param){
		//납부일
		if(!"".equals(param.getString("selRegdate_from"))){
			sqlWhere.append("\n and `납부일` >= cast(").append(param.getString("selRegdate_from")).append(" as date) ");
		}
		if(!"".equals(param.getString("selRegdate_to"))){
			sqlWhere.append("\n and `납부일` <= cast(").append(param.getString("selRegdate_to")).append(" as date) ");
		}
		if(!"".equals(param.getString("selBranch1"))){
			sqlWhere.append("\n and `지회` = '").append(param.getString("selBranch1")).append("'	");
		}
		if(!"".equals(param.getString("selBranch2"))){
			sqlWhere.append("\n and `지부` = '").append(param.getString("selBranch2")).append("'	 ");
		}
		if(!"".equals(param.getString("selName"))){
			sqlWhere.append("\n and `납부자` like '%").append(param.getString("selName")).append("%'	 ");
		}
		if(!"".equals(param.getString("selEtc2"))){
			sqlWhere.append("\n and `기타` like '%").append(param.getString("selEtc2")).append("%'	 ");
		}
	}
	
	
	
	
	
	/**
	 * 자조금 상세정보를 가져온다.
	 * @param id
	 * @return
	 */
	public SelfcostVo getDetail(String id){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n SELECT 		");
		sql.append("\n 	`ID`, 	");
		sql.append("\n 	DATE_FORMAT(`납부일`, '%Y-%m-%d')AS regdate, 	 	");
		sql.append("\n 	DATE_FORMAT(`납부일`, '%Y%m%d')AS regdate_yymmdd, 	 	");
		sql.append("\n 	`지회` as branch1, 	");
		sql.append("\n 	`지부` as branch2, 	");
		sql.append("\n 	`납부자` as membername, 	");
		sql.append("\n 	concat(`금액`) as price, 	");
		sql.append("\n 	`비고` as etc, 	");
		sql.append("\n 	`기타` as etc2, 	");
		sql.append("\n 	`TS`	");
		sql.append("\n FROM  `t자조금납부`	"); 
		sql.append("\n where id = ? 	");
		
		return new SelfcostVo(dbh.getQueryData(sql.toString(), new Object[]{ id }));
	}
	
	
	
	
	
	/**
	 * 자조금을 등록한다.
	 * @param param
	 * @return
	 */
	public int insert(MiceParam param,String insName){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	INSERT INTO `t자조금납부` (	");
			sql.append("\n			 `납부일`, `지회`, `지부`, `납부자`, `금액`, `비고`, `기타`, `TS`	");
			sql.append("\n	)VALUES(	");
			sql.append("\n			?, ?, ? ,?, ?, ?, ?, NOW()	");
			sql.append("\n	);	");
			

			obj = new Object[7];
			int idx = 0;
			obj[idx++] = param.get("ins_regdate");
			obj[idx++] = param.get("ins_branch1");
			obj[idx++] = param.get("ins_branch2");
			obj[idx++] = insName;
			obj[idx++] = param.get("ins_price");
			obj[idx++] = param.get("ins_etc");
			obj[idx++] = param.get("ins_etc2");
			
			trh.setQueryData(sql.toString(), obj);

			//2. 커밋
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
					
		}finally{
			trh.close();
		}
		
		return ret;
	}
	
	
	/**
	 * 자조금을 수정한다.
	 * @param param
	 * @return
	 */
	public int update(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	UPDATE `t자조금납부`	"); 
			sql.append("\n	SET`납부일` = ? , 	");
			sql.append("\n		`지회` = ? , 	");
			sql.append("\n		`지부` = ? , 	");
			sql.append("\n		`납부자` = ? , 	");
			sql.append("\n		`금액` = ? , 	");
			sql.append("\n		`비고` = ? , 	");
			sql.append("\n		`기타` = ? , 	");
			sql.append("\n		`TS` =  NOW()	");
			sql.append("\n	WHERE `ID` = ?	");


			obj = new Object[8];
			int idx = 0;
			obj[idx++] = param.get("ins_regdate");
			obj[idx++] = param.get("ins_branch1");
			obj[idx++] = param.get("ins_branch2");
			obj[idx++] = param.get("ins_name");
			obj[idx++] = param.get("ins_price");
			obj[idx++] = param.get("ins_etc");
			obj[idx++] = param.get("ins_etc2");
			obj[idx++] = param.get("ins_id");
			trh.setQueryData(sql.toString(), obj);

			//2. 커밋
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
					
		}finally{
			trh.close();
		}
		
		return ret;
	}
	
	
	/**
	 * 자조금을 삭제한다.
	 * @param param
	 * @return
	 */
	public int delete(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	DELETE FROM `t자조금납부` WHERE`ID` = ? ");

			obj = new Object[1];
			int idx = 0;
			obj[idx++] = param.get("ins_id");
			trh.setQueryData(sql.toString(), obj);

			//2. 커밋
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
					
		}finally{
			trh.close();
		}
		
		return ret;
	}
	
	
	/**
	 * 자조금 납부 가져온다 - 연속납부Y
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList_Print_Y(MiceParam param,String branch1, String branch2, String membername){
		DBHandler dbh = new DBHandler();
		sqlWhere.setLength(0);
		makeWhere(param);
		
		sql.setLength(0);
		sql.append("\n 	SELECT 		");
		sql.append("\n 		DATE_FORMAT(`납부일`, '%Y-%m-%d')AS regdate, 	 	");
		sql.append("\n 		DATE_FORMAT(`납부일`, '%Y%m%d')AS regdate_yymmdd, 	 	");
		sql.append("\n 		CONCAT(SUM(`금액`)) AS price 	 	");
		sql.append("\n	 FROM  `t자조금납부`	"); 
		sql.append("\n	 WHERE 1=1	");
		sql.append("\n	 	AND DATE_FORMAT(`납부일`, '%Y') >= (DATE_FORMAT(NOW()-3, '%Y') - 3) 	 	");
		sql.append("\n	 	AND `납부자` = '"+membername+"' 	 	");
		sql.append("\n	 	AND `지회` = '"+branch1+"' 	 	");
		sql.append("\n	 	AND `지부` = '"+branch2+"' 	 	");
		sql.append("\n	 GROUP BY DATE_FORMAT(`납부일`, '%Y') 	 	");
		sql.append("\n	 ORDER BY `납부일` 	 	");
		  

		return dbh.getQueryData(sql.toString());
	}
	
	/**
	 * 자조금 납부 가져온다 - 연속납부N
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList_Print_N(MiceParam param,String id){
		DBHandler dbh = new DBHandler();
		sqlWhere.setLength(0);
		makeWhere(param);
		
		sql.setLength(0);
		sql.append("\n SELECT 		");
		sql.append("\n 	`ID`, 	");
		sql.append("\n 	DATE_FORMAT(`납부일`, '%Y-%m-%d')AS regdate, 	 	");
		sql.append("\n 	DATE_FORMAT(`납부일`, '%Y%m%d')AS regdate_yymmdd, 	 	");
		sql.append("\n 	`지회` as branch1, 	");
		sql.append("\n 	`지부` as branch2, 	");
		sql.append("\n 	`납부자` as membername, 	");
		sql.append("\n 	concat(`금액`) as price, 	");
		sql.append("\n 	`비고` as etc, 	");
		sql.append("\n 	`기타` as etc2, 	");
		sql.append("\n 	`TS`	");
		sql.append("\n FROM  `t자조금납부`	"); 
		sql.append("\n where id = ? 	");
		  

		return dbh.getQueryData(sql.toString(),new Object[]{ id } );
	}
		
}
