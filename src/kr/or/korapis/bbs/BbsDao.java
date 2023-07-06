package kr.or.korapis.bbs;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.util.TextFormatter;
import kr.or.korapis.vo.BbsVo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BbsDao {
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();
	
	public void makeWhere(MiceParam param, StringBuffer sqlWhere, List<Object> objList){
		sqlWhere.setLength(0);
		String stx = param.getString("stx").trim().toUpperCase();
		String sfl = param.getString("sfl");
		if(!stx.isEmpty()){
			if("wr_subject".equals(sfl)){
				sqlWhere.append("\n	AND UPPER(bbs_title) LIKE ?		");
				objList.add("%"+stx+"%");
				
			}else if("wr_content".equals(sfl)){
				sqlWhere.append("\n	AND UPPER(bbs_content) LIKE ?	");
				objList.add("%"+stx+"%");
				
			}else if("wr_subject||wr_content".equals(sfl)){
				sqlWhere.append("\n	AND ( 		");
				sqlWhere.append("\n		UPPER(bbs_title) LIKE ?		");
				sqlWhere.append("\n		OR UPPER(bbs_content) LIKE ?	");
				sqlWhere.append("\n	)		");
				objList.add("%"+stx+"%");
				objList.add("%"+stx+"%");
				
			}else if("mb_id,1".equals(sfl) || "mb_id,0".equals(sfl)){
				sqlWhere.append("\n	AND UPPER(user_id) LIKE ?		");
				objList.add("%"+stx+"%");
				
			}else if("wr_name,1".equals(sfl) || "wr_name,0".equals(sfl)){
				sqlWhere.append("\n	AND UPPER(user_name) LIKE ?	");
				objList.add("%"+stx+"%");
			}
		}
	}

	public ResultSetEntity getBbsList(MiceParam param, int from, int cnt, boolean noticeYn){
		DBHandler dbh = new DBHandler();
		StringBuffer sql = new StringBuffer();
		StringBuffer sqlWhere = new StringBuffer();
		List<Object> objList = new ArrayList<Object>();
		List<Object> objListWhere = new ArrayList<Object>();
		
		makeWhere(param, sqlWhere, objListWhere);
		
		String bflag = param.getString("bflag");

		sql.setLength(0);
		sql.append("\n	SELECT * FROM	(	");
		sql.append("\n		SELECT a.bbs_idx	");
		sql.append("\n 			, a.user_id, a.user_name	");
		sql.append("\n 			, a.bbs_title, a. bbs_content, a.bbs_hit, a.bbs_like	");
		sql.append("\n 			, a.bbs_thread, a.bbs_fid, a.old_code		");
		sql.append("\n 			, a.bbs_secret_yn	");
		sql.append("\n 			, a.cdate, a.udate	");
		sql.append("\n 			, a.bbs_html_yn, a.bbs_notice_yn	");
		sql.append("\n			, IF(DATEDIFF(NOW(), a.cdate) <=3, 'new', 'old') as isnew	");
		sql.append("\n			, a.bbs_link_type		");
		sql.append("\n			, a.bbs_link	");
		sql.append("\n			, (		");
		sql.append("\n				SELECT cdate 		");
		sql.append("\n				FROM korapis_bbs 		");
		sql.append("\n				WHERE bbs_idx = a.bbs_fid		");
		sql.append("\n			) AS fcdate 		");
		sql.append("\n			, '' AS top_user_id 		");
		sql.append("\n 			, b.file_name		");
		sql.append("\n 			, b.file_path		");
		sql.append("\n 			, b.file_ext		");
		
		sql.append("\n		FROM korapis_bbs a	");
		sql.append("\n		LEFT OUTER JOIN (SELECT * FROM korapis_bbs_file WHERE banner_yn = 'Y' GROUP BY bbs_idx) b 	");
		sql.append("\n			ON a.bbs_idx = b.bbs_idx		");
		sql.append("\n		WHERE a.bflag = ?	");
		objList.add(bflag);
		sql.append("\n			AND a.del_yn = 'N'		");
		if(noticeYn) {
			sql.append("\n			AND a.bbs_notice_yn = 'Y'	");
		}else {
			sql.append("\n			AND a.bbs_notice_yn != 'Y'	");
		}
		
		sql.append(sqlWhere);
		objList.addAll(objListWhere);
		
		if("08".equals(bflag)){
			if(!"".equals(param.getString("PYEAR"))){
				sql.append("\n		AND a.bbs_pyear = ?		");
				objList.add(param.getString("PYEAR"));
			}
		}
		sql.append("\n		ORDER BY cdate DESC, bbs_fid DESC, bbs_thread ASC	"); 
		sql.append("\n	) c		");
		sql.append("\n	UNION		");
		sql.append("\n	SELECT * FROM	(	");
		sql.append("\n		SELECT a.bbs_idx	");
		sql.append("\n			, a.user_id, a.user_name	");
		sql.append("\n			, a.bbs_title, a. bbs_content, a.bbs_hit, a.bbs_like	");
		sql.append("\n			, a.bbs_thread, a.bbs_fid, a.old_code		");
		sql.append("\n			, a.bbs_secret_yn	");
		sql.append("\n			, a.cdate, a.udate	");
		sql.append("\n			, a.bbs_html_yn, a.bbs_notice_yn	");
		sql.append("\n			, IF(DATEDIFF(NOW(), a.cdate) <=3, 'new', 'old') as isnew	");
		sql.append("\n			, a.bbs_link_type		");
		sql.append("\n			, a.bbs_link	");
		sql.append("\n			, (		");
		sql.append("\n				SELECT cdate 		");
		sql.append("\n				FROM korapis_bbs 		");
		sql.append("\n				WHERE bbs_idx = a.bbs_fid		");
		sql.append("\n			) AS fcdate 		");
		sql.append("\n			, (		");
		sql.append("\n				SELECT user_id 		");
		sql.append("\n				FROM korapis_bbs 		");
		sql.append("\n				WHERE bbs_idx = a.bbs_fid		");
		sql.append("\n			) AS top_user_id 		");
		sql.append("\n			, b.file_name		");
		sql.append("\n			, b.file_path		");
		sql.append("\n			, b.file_ext		");
		sql.append("\n		FROM korapis_bbs a LEFT OUTER JOIN (SELECT * FROM korapis_bbs_file WHERE banner_yn = 'Y' GROUP BY bbs_idx) b 	");
		sql.append("\n			ON a.bbs_idx = b.bbs_idx		");
		sql.append("\n		WHERE a.bflag = ?	");
		objList.add(bflag);
		sql.append("\n			AND a.del_yn = 'N'		");
		sql.append("\n			AND a.bbs_notice_yn != 'Y'	");
		sql.append(sqlWhere);
		objList.addAll(objListWhere);
		if("08".equals(bflag)){
			if(!"".equals(param.getString("PYEAR"))){
				sql.append("\n		AND a.bbs_pyear = ?		");
				objList.add(param.getString("PYEAR"));
			}
		}
		sql.append("\n 		ORDER BY fcdate DESC, bbs_fid DESC, bbs_thread ASC	"); 
		sql.append("\n		LIMIT ?,?	");
		objList.add(from);
		objList.add(cnt);
		sql.append("\n	) d		");
		
		return dbh.getQueryData(sql.toString(), objList.toArray());
	}
	
	public int getBbsList_tot(MiceParam param){
		DBHandler dbh = new DBHandler();
		StringBuffer sql = new StringBuffer();
		StringBuffer sqlWhere = new StringBuffer();
		List<Object> objList = new ArrayList<Object>();
		List<Object> objListWhere = new ArrayList<Object>();
		
		makeWhere(param, sqlWhere, objListWhere);
		
		String bflag = param.getString("bflag");

		sql.append("\n	SELECT COUNT(*)		");
		sql.append("\n	FROM korapis_bbs a 	");
		sql.append("\n	WHERE 1 = 1		");
		sql.append("\n		AND a.bflag = ?	");
		objList.add(bflag);
		sql.append("\n		AND a.del_yn = 'N'	");
		sql.append("\n		AND a.bbs_notice_yn != 'Y'		");
		sql.append(sqlWhere);
		objList.addAll(objListWhere);
		if("08".equals(bflag)){
			if(!"".equals(param.getString("PYEAR"))){
				sql.append("\n		AND a.bbs_pyear = ? 		");
				objList.add(param.getString("PYEAR"));
			}
		}
		
		return TextFormatter.convNvl(dbh.getAData(sql.toString(), objList.toArray()), 0);
	}
	
	public BbsVo getBbsDetail(String bbsIdx){
		DBHandler dbh = new DBHandler();
		StringBuffer sql = new StringBuffer();
		
		sql.append("\n	SELECT * 		");
		sql.append("\n	FROM korapis_bbs		");
		sql.append("\n	WHERE 1=1		");
		sql.append("\n		AND bbs_idx = ?		");
		sql.append("\n		AND del_yn = 'N'		");
		
		ResultSetEntity data = dbh.getQueryData(sql.toString(), new Object[]{bbsIdx});
		
		return new BbsVo(data, getBbsFiles(bbsIdx));
		
	}
	
	public ResultSetEntity getBbsFiles(String bbsIdx){
		DBHandler dbh = new DBHandler();
		StringBuffer sql = new StringBuffer();
		
		sql.append("\n	SELECT *		");
		sql.append("\n	FROM korapis_bbs_file		");
		sql.append("\n	WHERE bbs_idx = ?		");
		sql.append("\n	ORDER BY file_idx		");
		
		return dbh.getQueryData(sql.toString(), new Object[]{bbsIdx});
	}
	
	public ResultSetEntity getBbsFile(String fileIdx){
		DBHandler dbh = new DBHandler();
		StringBuffer sql = new StringBuffer();
		
		sql.append("\n	SELECT f.*,		");
		sql.append("\n		b.bflag		");
		sql.append("\n	FROM korapis_bbs_file f, korapis_bbs b		");
		sql.append("\n	WHERE 1=1		");
		sql.append("\n		AND f.bbs_idx = b.bbs_idx		");
		sql.append("\n		AND f.file_idx = ?		");
		
		return dbh.getQueryData(sql.toString(), new Object[]{fileIdx});		
	}
		
	public int delete(String bbsIdx){
		TransactionHandler trh = new TransactionHandler();
		StringBuffer sql = new StringBuffer();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	UPDATE korapis_bbs SET del_yn = 'Y'		");
			sql.append("\n	WHERE bbs_idx = ?		");
			sql.append("\n		AND del_yn = 'N'		");
			
			obj = new Object[1];
			obj[0] = bbsIdx;
			
			trh.setQueryData(sql.toString(), obj);
			
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
	

	/*
	public BbsVo getBbsDetail(String no){
		DBHandler dbh = new DBHandler();
	
		sql.setLength(0);
		sql.append("\n	 SELECT a.no, a.user_id, a.name, a.pwd, a.o_pwd	");
		sql.append("\n		, a.email, a.title, a.readnum	");
		sql.append("\n		, a.thread	");
		sql.append("\n		, a.code	");
		sql.append("\n		, DATE(FROM_UNIXTIME(a.write_day)) AS write_day	");
		sql.append("\n		, DATE(FROM_UNIXTIME(a.modify_day)) AS modify_day	");
		sql.append("\n		, a.notice_f	");
		sql.append("\n		, a.bflag	");
		sql.append("\n		, b.no AS zz_no	");
		sql.append("\n		, b.content	");
		sql.append("\n		, a.video_url ");
		sql.append("\n	FROM bbs01 a, zz_board_contents b	");
		sql.append("\n	WHERE a.code = b.ref_no 	");
		sql.append("\n	AND a.no = ?	");
		
		return new BbsVo(dbh.getQueryData(sql.toString(), new Object[]{no}));
	}
	
	public ResultSetEntity getBbsList(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();
		
		sqlWhere.setLength(0);
		
		sql.setLength(0);
		sql.append("\n SELECT a.NO	");
		sql.append("\n 	, a.user_id, NAME	");
		sql.append("\n 	, a.title, a.readnum, a.filedown	");
		sql.append("\n 	, a.thread, a.fid, a.CODE	");
		sql.append("\n 	, a.privacy	");
		sql.append("\n 	, date(FROM_UNIXTIME(a.write_day)) as write_day	");
		sql.append("\n 	, a.html_tag, a.notice_f	");
		sql.append("\n 	, date(FROM_UNIXTIME(-a.modify_day)) as modify_day	");
		sql.append("\n	, IF(DATEDIFF(NOW(), FROM_UNIXTIME(a.write_day)) <=3, 'new', 'old') as isnew	");
		sql.append("\n	, a.video_url	");
		

		sql.append("\n 	, b.image1	");
		sql.append("\n 	, b.real_name1	");
		sql.append("\n 	, b.file_ext1	");
		
		sql.append("\n FROM bbs01 a, zz_board_contents b 	");
		sql.append("\n WHERE a.code = b.ref_no and bflag = ?	");
		sql.append(sqlWhere);
		sql.append("\n ORDER BY notice_f asc, NO DESC	"); 
		sql.append("\n LIMIT ?,?	");
		
		Object[] obj = new Object[3];
		obj[0] = param.getString("bflag");
		obj[1] = from;
		obj[2] = cnt;
		
		return dbh.getQueryData(sql.toString(), obj);
	}

	public int getBbsList_tot(MiceParam param){
		DBHandler dbh = new DBHandler();
		
		sqlWhere.setLength(0);
		
		sql.setLength(0);
		sql.append("\n SELECT COUNT(a.no)	");
		sql.append("\n FROM bbs01 a, zz_board_contents b 	");
		sql.append("\n WHERE a.code = b.ref_no ");
		sql.append("\n and bflag = ?	");
		sql.append(sqlWhere);
		
		Object[] obj = new Object[1];
		obj[0] = param.getString("bflag");
		
		return Integer.parseInt(dbh.getAData(sql.toString(), obj));
	}
	*/
	
	
	public int regist(JSONObject jo){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		String bbsIdx = jo.optString("bbs_idx");
		try{
			//INSERT
			if("".equals(bbsIdx)){
				
				boolean isReply = false;
				if(!"".equals(jo.optString("bbs_fid"))){
					isReply = true;
					String thread = jo.optString("bbs_thread");
					sql.setLength(0);
					sql.append("\n	SELECT bbs_thread FROM korapis_bbs		");
					sql.append("\n	WHERE bflag = ?		");
					sql.append("\n		AND bbs_fid = ?	");
					sql.append("\n		AND bbs_thread LIKE '").append(jo.optString("bbs_thread")).append("%'		");
					sql.append("\n		AND LENGTH(bbs_thread) = ?		");
					sql.append("\n	ORDER BY bbs_thread DESC		");
					sql.append("\n	LIMIT 0,1		");
					String beforeThread = trh.getAData(sql.toString(), new Object[]{ jo.optString("bflag"), jo.optString("bbs_fid"), thread.length()+1 });
					if(beforeThread.length() == thread.length()+1){
						char threadSuffix = beforeThread.charAt(thread.length());
						jo.put("bbs_thread", thread+(char)(threadSuffix+1));
					}else{
						jo.put("bbs_thread", thread+"A");
					}
					
				}else{
					jo.put("bbs_thread", "A");
				}
				
				sql.setLength(0);
				sql.append("\n	INSERT INTO `korapis_bbs` ( 		");
				sql.append("\n		`bflag` 		");
				sql.append("\n		,`user_id` 		");
				sql.append("\n		,`user_name` 		");
				sql.append("\n		,`user_pwd` 		");
				sql.append("\n		,`user_ip` 		");
				sql.append("\n		,`bbs_title` 		");
				sql.append("\n		,`bbs_content` 		");
				sql.append("\n		,`bbs_link_type` 		");
				sql.append("\n		,`bbs_link` 		");
				sql.append("\n		,`bbs_thread` 		");
				sql.append("\n		,`bbs_fid` 		");
				sql.append("\n		,`cdate` 		");
				sql.append("\n		,`udate` 		");
				sql.append("\n		,`bbs_secret_yn` 		");
				sql.append("\n		,`bbs_html_yn` 		");
				sql.append("\n		,`bbs_notice_yn` 		");
				sql.append("\n		,`bbs_hit` 		");
				sql.append("\n		,`bbs_like` 		");
				sql.append("\n		,`bbs_banner_yn` 		");
				sql.append("\n		,`bbs_pyear` 		");
				sql.append("\n		,`del_yn` 		");
				sql.append("\n	) VALUES ( 		");
				sql.append("\n		? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,NOW() 		");
				sql.append("\n		,NOW() 		");
				sql.append("\n		,? 		");
				sql.append("\n		,'Y' 		");
				sql.append("\n		,? 		");
				sql.append("\n		,0 		");
				sql.append("\n		,0 		");
				sql.append("\n		,? 		");
				sql.append("\n		,? 		");
				sql.append("\n		,'N' 		");
				sql.append("\n		)		");
				StringTokenizer st = new StringTokenizer(sql.toString(), "?");
				int idx = 0;
				obj = new Object[st.countTokens()-1];
				obj[idx++] = jo.optString("bflag");
				obj[idx++] = jo.optString("user_id");
				obj[idx++] = jo.optString("user_name");
				obj[idx++] = jo.optString("user_pwd");
				obj[idx++] = jo.optString("user_ip");
				obj[idx++] = jo.optString("bbs_title");
				obj[idx++] = jo.optString("bbs_content");
				obj[idx++] = jo.optString("bbs_link_type");
				obj[idx++] = jo.optString("bbs_link");
				obj[idx++] = jo.optString("bbs_thread");
				obj[idx++] = jo.optInt("bbs_fid");
				obj[idx++] = jo.optString("bbs_secret_yn");
				obj[idx++] = jo.optString("bbs_notice_yn");
				obj[idx++] = jo.optString("bbs_banner_yn");
				obj[idx++] = jo.optString("bbs_pyear");

				trh.setQueryData(sql.toString(), obj);
				
				bbsIdx = trh.getAData("SELECT LAST_INSERT_ID()");
				
				if(!isReply){
					sql.setLength(0);
					sql.append("\n	UPDATE korapis_bbs SET bbs_fid = ? WHERE bbs_idx = ?		");
					trh.setQueryData(sql.toString(), new Object[]{bbsIdx, bbsIdx});
				}
				
			//UPDATE
			}else{
				sql.setLength(0);
				sql.append("\n	UPDATE `korapis_bbs` SET		");
				sql.append("\n		`bbs_title` = ? 		");
				sql.append("\n		, `bbs_content` = ? 		");
				sql.append("\n		, `bbs_link_type` = ? 		");
				sql.append("\n		, `bbs_link` = ? 		");
				sql.append("\n		, `udate` = NOW() 		");
				sql.append("\n		, `bbs_secret_yn` = ? 		");
				sql.append("\n		, `bbs_notice_yn` = ? 		");
				sql.append("\n		, `bbs_banner_yn` = ? 		");
				sql.append("\n		, `bbs_pyear` = ?		");
				sql.append("\n	WHERE		");
				sql.append("\n		`bbs_idx` = ? 		");
				
				StringTokenizer st = new StringTokenizer(sql.toString(), "?");
				int idx = 0;
				obj = new Object[st.countTokens()-1];
				obj[idx++] = jo.optString("bbs_title");
				obj[idx++] = jo.optString("bbs_content");
				obj[idx++] = jo.optString("bbs_link_type");
				obj[idx++] = jo.optString("bbs_link");
				obj[idx++] = jo.optString("bbs_secret_yn");
				obj[idx++] = jo.optString("bbs_notice_yn");
				obj[idx++] = jo.optString("bbs_banner_yn");
				obj[idx++] = jo.optString("bbs_pyear");
				obj[idx++] = bbsIdx;
				
				trh.setQueryData(sql.toString(), obj);

				//삭제한 첨부파일 DB에서 삭제
				if(jo.opt("attached") instanceof String && !jo.getString("attached").equals("")){
					String attached = jo.getString("attached");
					JSONArray ja = new JSONArray();
					ja.add(attached);
					jo.put("attached", ja);
				}
				if(jo.opt("attached") instanceof JSONArray || jo.optString("attached").equals("") ){
					JSONArray attached = jo.optJSONArray("attached")==null?(new JSONArray()):jo.optJSONArray("attached");
					sql.setLength(0);
					sql.append("\n DELETE FROM korapis_bbs_file WHERE bbs_idx = ").append(bbsIdx);
					for(int i=0; i<attached.size(); i++){
						sql.append(" AND file_idx != ").append(attached.getString(i)).append(" ");
					}
					trh.setQueryData(sql.toString());
				}
			}
			
			//관리자 CDATE 변경
			if(!"".equals(jo.optString("cdate"))){
				sql.setLength(0);
				sql.append("\n	UPDATE `korapis_bbs` SET cdate = ? WHERE bbs_idx = ?		");
				obj = new Object[2];
				obj[0] = jo.optString("cdate");
				obj[1] = bbsIdx;
				
				trh.setQueryData(sql.toString(), obj);
			}

			//새로 첨부한 파일 DB 업로드
			if(jo.optJSONArray("files")!=null && jo.optJSONArray("files").size()!=0){
				JSONArray files = jo.optJSONArray("files");
				JSONObject file = null;
				for(int i=0; i<files.size();i++){
					file = files.getJSONObject(i);
					int dot = file.optString("name").lastIndexOf(".");
					String basename=file.optString("name"), ext="";
					if(dot != -1){
						basename = file.optString("name").substring(0, dot);
						ext = file.optString("name").substring(dot+1);
					}
					sql.setLength(0);
					sql.append("\n	INSERT INTO korapis_bbs_file(	");
					sql.append("\n		bbs_idx,		");
					sql.append("\n		file_path,		");
					sql.append("\n		file_ext,		");
					sql.append("\n		file_name,		");
					sql.append("\n		file_size,		");
					sql.append("\n		file_hit,		");
					sql.append("\n		cdate,		");
					sql.append("\n		udate,		");
					sql.append("\n		banner_yn		");
					sql.append("\n	) VALUES (	");
					sql.append("\n		?,		");
					sql.append("\n		?,		");
					sql.append("\n		?,		");
					sql.append("\n		?,		");
					sql.append("\n		?,		");
					sql.append("\n		0,		");
					sql.append("\n		NOW(),		");
					sql.append("\n		NOW(),		");
					sql.append("\n		?		");
					sql.append("\n	)		");
					obj = new Object[6];
					obj[0] = bbsIdx;
					obj[1] = basename;
					obj[2] = ext;
					obj[3] = file.optString("oname");
					obj[4] = file.optInt("size");
					obj[5] = file.optBoolean("isBanner",false)?"Y":"N";
					
					trh.setQueryData(sql.toString(), obj);
				}
			}
			
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

	public void bbsHit(String bbsIdx){
		TransactionHandler trh = new TransactionHandler();
		
		try{
			sql.setLength(0);
			sql.append("\n	UPDATE korapis_bbs SET bbs_hit = bbs_hit + 1 WHERE bbs_idx = ?		");
			trh.setQueryData(sql.toString(), new Object[]{ bbsIdx });
			trh.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
		}finally{
			trh.close();
		}
		
	}
	
	public void bbsFileHit(String fileIdx){
		TransactionHandler trh = new TransactionHandler();
		
		try{
			sql.setLength(0);
			sql.append("\n	UPDATE korapis_bbs_file SET file_hit = file_hit + 1 WHERE file_idx = ?		");
			trh.setQueryData(sql.toString(), new Object[]{ fileIdx });
			trh.commit();
			
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
		}finally{
			trh.close();
		}
		
	}

	public ResultSetEntity getBbsLastCdate() {
		
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sql.append("\n SELECT ");
		sql.append("\n TIMESTAMPDIFF(WEEK,MAX(cdate),NOW()) AS cdateRecentWeek ");
		sql.append("\n FROM ");
		sql.append("\n korapis_bbs ");
		sql.append("\n WHERE del_yn = 'N' ");
		sql.append("\n GROUP BY bflag; ");
		

		return dbh.getQueryData(sql.toString());
			
		
		
	}
	
	public int moveBbsList(String bflag, String bbsIdx) {
		
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
			
		try {
			sql.setLength(0);
			sql.append("\n UPDATE ");
			sql.append("\n   korapis_bbs ");
			sql.append("\n SET ");
			sql.append("\n   bflag = ? ");
			sql.append("\n WHERE bbs_idx = ?");
	
			Object[] obj = new Object[2];
			obj[0] = bflag;
			obj[1] = bbsIdx;
			
			trh.setQueryData(sql.toString(), obj);
			
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
		}finally {
			
			trh.close();
			ret = DefaultCode.SUCCESS;
		}
		return ret;
	}
	

}
