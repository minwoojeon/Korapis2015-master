package kr.or.korapis.admin.bbs;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.MiceParam;

public class AdminBbsDao {
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();


	/**
	 * 게시판 목록을 가져온다
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();
		sqlWhere.setLength(0);
		makeWhere(param);
		
		sql.setLength(0);
		sql.append("\n	SELECT * FROM (		");
		sql.append("\n		SELECT *		");
		sql.append("\n			, (		");
		sql.append("\n				SELECT cdate 		");
		sql.append("\n				FROM korapis_bbs 		");
		sql.append("\n				WHERE bbs_idx = b.bbs_fid		");
		sql.append("\n			) AS fcdate 		");
		sql.append("\n		FROM korapis_bbs b  		");
		sql.append("\n		WHERE b.bflag=?		");
		sql.append("\n			AND b.del_yn='N'		");
		sql.append( sqlWhere );
		sql.append("\n		) c		");
		sql.append("\n	ORDER BY fcdate DESC, bbs_fid DESC, bbs_thread ASC		");

		sql.append("\n LIMIT ?, ?				");
		Object[] obj = new Object[3];
		obj[0] = param.getString("bflag");
		obj[1] = from;
		obj[2] = cnt;
		  

		return dbh.getQueryData(sql.toString(), obj);
	}
	public int getList_tot(MiceParam param){
		DBHandler dbh = new DBHandler();
		
		sqlWhere.setLength(0);
		makeWhere(param);
		
		sql.setLength(0);
		sql.append("\n SELECT COUNT(*)	");
		sql.append("\n FROM  korapis_bbs	"); 
		sql.append("\n WHERE 1=1	");
		sql.append("\n		AND bflag = ?		");
		sql.append("\n		AND del_yn='N'		");
		sql.append(sqlWhere);
		Object[] obj = new Object[1];
		obj[0] = param.getString("bflag");
		
		return Integer.parseInt(dbh.getAData(sql.toString(), obj));
	}
	
	private void makeWhere(MiceParam param){
		String searchGubun = param.getString("searchGubun");
		String searchText = param.getString("searchText");
		
		if(!"".equals(searchText)){
			if("title".equals(searchGubun)){
				sqlWhere.append("\n	AND bbs_title LIKE '%").append(searchText).append("%' ");
			}else if("content".equals(searchGubun)){
				sqlWhere.append("\n	AND bbs_content LIKE '%").append(searchText).append("%' ");
			}else if("title|content".equals(searchGubun)){
				sqlWhere.append("\n	AND ( bbs_title LIKE '%").append(searchText).append("%' ");
				sqlWhere.append("\n		OR bbs_content LIKE '%").append(searchText).append("%' )		");
			}else if("writer".equals(searchGubun)){
				sqlWhere.append("\n	AND user_name LIKE '%").append(searchText).append("%' ");
			}else if("title|content|writer".equals(searchGubun)){
				sqlWhere.append("\n	AND ( bbs_title LIKE '%").append(searchText).append("%' ");
				sqlWhere.append("\n		OR bbs_content LIKE '%").append(searchText).append("%' 		");
				sqlWhere.append("\n		OR user_name LIKE '%").append(searchText).append("%' )		");
				
			}
		}
		
	}
	
	
	
	
	
			
}
