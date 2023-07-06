package kr.or.korapis.admin.QRCode;

import java.sql.SQLException;
import java.util.StringTokenizer;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class AdminSelfQRCodeDao {
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlJointable = new StringBuffer();
	StringBuffer sqlwhere = new StringBuffer();
	StringBuffer sqlGroupBy = new StringBuffer();

	String qrcd = "";
	
	public void makeWhere_qrCode(MiceParam param) {
		boolean hasSearch = false;
		if(!"".equals(param.getString("pdate"))) {
			sqlwhere.append("\n AND pdate LIKE '%").append(param.getString("pdate")).append("%'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("owner_history"))) {
			sqlwhere.append("\n AND prod_owner LIKE '%").append(param.getString("owner_history")).append("%'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_idx"))) {
			sqlwhere.append("\n AND h.prod_idx ='").append(param.getString("prod_idx")).append("'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_qrcd"))) {
			sqlwhere.append("\n AND	h.prod_qrcd='").append(param.getString("prod_qrcd")).append("'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("src"))) {
			qrcd = "prod_qrcd_enc";
			sqlwhere.append("\n AND	h.prod_qrcd_enc='").append(param.getString("src")).append("'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("qrcd"))) {
			qrcd = "prod_qrcd";
			sqlwhere.append("\n AND	h.prod_qrcd ='").append(param.getString("qrcd")).append("'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_no"))) {
			sqlwhere.append("\n AND	o.prod_no like'%").append(param.getString("prod_no")).append("%'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_title"))) {
			sqlwhere.append("\n AND	h.prod_title like'%").append(param.getString("prod_title")).append("%'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_orign"))) {
			sqlwhere.append("\n AND	o.prod_orign like'%").append(param.getString("prod_orign")).append("%'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("org_producer"))) {
			sqlwhere.append("\n AND	h.org_producer like'%").append(param.getString("org_producer")).append("%'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("rating"))) {
			sqlwhere.append("\n AND	h.rating = '").append(param.getString("rating")+"'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("rating_date"))) {
			sqlwhere.append("\n AND	h.rating_date ='").append(param.getString("rating_date")+"'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("subdiv_date"))) {
			sqlwhere.append("\n AND	h.subdiv_date ='").append(param.getString("subdiv_date")+"'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("cdate"))) {
			sqlwhere.append("\n AND	h.cdate ='").append(param.getString("cdate")+"'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_category"))){
			sqlwhere.append("\n AND	h.prod_category ='").append(param.getString("prod_category")+"'");	
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_seq_from"))) {
			sqlwhere.append("\n AND	h.prod_seq >='").append(param.getString("prod_seq_from")+"'");	
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_seq_to"))) {
			sqlwhere.append("\n AND	h.prod_seq <='").append(param.getString("prod_seq_to")+"'");	
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_no_from"))) {
			sqlwhere.append("\n AND	h.prod_no >='").append(param.getString("prod_no_from")+"'");	
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_no_to"))) {
			sqlwhere.append("\n AND	h.prod_no <='").append(param.getString("prod_no_to")+"'");	
			hasSearch |= true;
		}
		if(!"".equals(param.getString("put_sts"))) {
			sqlwhere.append("\n AND	h.put_sts ='").append(param.getString("put_sts")+"'");
			hasSearch |= true;
		}
		if(!"".equals(param.getString("prod_name"))) {
			sqlwhere.append("\n AND	o.prod_name like'%").append(param.getString("prod_name")).append("%'");
			hasSearch |= true;
		}
		if(hasSearch) {
			sqlJointable.append("\n			LEFT OUTER JOIN korapis_history_owner ho	");
			sqlJointable.append("\n				ON h.prod_category = ho.h_category	");
			sqlJointable.append("\n				AND h.prod_seq = ho.h_seq	");
			sqlJointable.append("\n			LEFT OUTER JOIN korapis_prod_owner o	");
			sqlJointable.append("\n				ON ho.o_idx = o.idx		");
			
			sqlGroupBy.append("\n		GROUP BY h.prod_idx	");
		}
	}
	
	public ResultSetEntity getQRCodeList(MiceParam param,int from) {
		
		DBHandler dbh = new DBHandler();
		Object obj[] = null;
		
		sql.setLength(0);
		sqlwhere.setLength(0);
		
		makeWhere_qrCode(param);
		sql.append("\n SELECT * FROM	");
		sql.append("\n 		korapis_prod_history h	");
		sql.append("\n WHERE	");
		sql.append("\n 		del_yn='N'	");
		sql.append(sqlwhere);
		sql.append("\n	limit 	? , 100");
		obj = new Object[1];	
		obj[0] = from;
		return dbh.getQueryData(sql.toString(),obj);
		
	}
	
	public ResultSetEntity getQRCode_ownerList(MiceParam param,int from) {
		
		DBHandler dbh = new DBHandler();
		Object obj[] = null;
		
		sql.setLength(0);
		sqlJointable.setLength(0);
		sqlwhere.setLength(0);
		sqlGroupBy.setLength(0);
		
		makeWhere_qrCode(param);
		sql.append("\n	SELECT a.*	");
		sql.append("\n		, GROUP_CONCAT(o.prod_name,'(',o.prod_no,')') AS owner_info");
		sql.append("\n	FROM (");	
		sql.append("\n		SELECT h.*	");
		sql.append("\n			FROM korapis_prod_history h		");
		sql.append(sqlJointable);
		sql.append("\n			WHERE h.del_yn = 'N'	");
		sql.append(sqlwhere);
		sql.append(sqlGroupBy);
		sql.append("\n		LIMIT ?, 100	");
		sql.append("\n	) a	");
		sql.append("\n	left outer join korapis_history_owner ho	");
		sql.append("\n		ON a.prod_category = ho.h_category	");
		sql.append("\n		AND a.prod_seq = ho.h_seq");
		sql.append("\n	LEFT OUTER JOIN korapis_prod_owner o	");
		sql.append("\n		ON ho.o_idx = o.idx");
		sql.append("\n		AND ho.del_yn = 'N'");
		sql.append("\n	GROUP BY a.prod_idx	");
	

		obj = new Object[1];	
		obj[0] = from;
		return dbh.getQueryData(sql.toString(),obj);
		
	}
	
	public ResultSetEntity getQRCodeDetail_cert(MiceParam param,String src) {
		
		DBHandler dbh = new DBHandler();
		Object obj[] = null;
		
		sql.setLength(0);
		
		
		sql.append("\n      SELECT       "); 
		sql.append("\n      * FROM       "); 
		sql.append("\n			korapis_prod_owner       "); 
		sql.append("\n      WHERE idx IN       "); 
		sql.append("\n		(SELECT       "); 
		sql.append("\n			o_idx       "); 
		sql.append("\n		FROM       "); 
		sql.append("\n			korapis_history_owner       "); 
		sql.append("\n		WHERE del_yn = 'N' ");
		sql.append("\n  	AND h_category =	");
		sql.append("\n			(SELECT       "); 
		sql.append("\n				prod_category       "); 
		sql.append("\n			FROM       "); 
		sql.append("\n				korapis_prod_history       "); 
		sql.append("\n			WHERE ").append(qrcd).append(" = ?)       ");
		sql.append("\n			AND h_seq =       "); 
		sql.append("\n			(SELECT       "); 
		sql.append("\n				prod_seq       "); 
		sql.append("\n			FROM       "); 
		sql.append("\n				korapis_prod_history       "); 
		sql.append("\n			WHERE ").append(qrcd).append(" = ?))       ");
		
		obj = new Object[2];
		obj[0] = src;
		obj[1] = src;
		
		return dbh.getQueryData(sql.toString(),obj);
		
		
	}
	
	public int getQRCodeList_cnt(MiceParam param) {
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sqlwhere.setLength(0);
		
		makeWhere_qrCode(param);
		sql.append("\n SELECT COUNT(*) FROM	");
		sql.append("\n 		korapis_prod_history h	");
		sql.append("\n WHERE	");
		sql.append("\n 		del_yn='N'	");
		sql.append(sqlwhere);
		
		
		return Integer.parseInt(dbh.getAData(sql.toString()));
	}
	
	public int getQRCodeList_cnt1(MiceParam param) {
		DBHandler dbh = new DBHandler();

		sql.setLength(0);
		sqlJointable.setLength(0);
		sqlwhere.setLength(0);
		sqlGroupBy.setLength(0);
		
		makeWhere_qrCode(param);
		if(sqlGroupBy.length() != 0) {
			sql.append("\n	SELECT COUNT(*) AS cnt	");
			sql.append("\n	FROM (		");
			sql.append("\n		SELECT h.*	");
		}else {
			sql.append("\n	SELECT COUNT(*) ");
		}
		sql.append("\n		FROM korapis_prod_history h		");
		sql.append(sqlJointable);
		sql.append("\n		WHERE h.del_yn = 'N'	");
		sql.append(sqlwhere);
		sql.append(sqlGroupBy);
		if(sqlGroupBy.length() != 0) {
			sql.append("\n	) a");
		}

		
		
		return Integer.parseInt(dbh.getAData(sql.toString()));
	}
	

	
	
	
	public ResultSetEntity get_prod_categoryList() {
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n	SELECT	");
		sql.append("\n		prod_category	");
		sql.append("\n	FROM	");
		sql.append("\n		  `korapis_prod_history`	");
		sql.append("\n	GROUP BY prod_category	");
		
		return dbh.getQueryData(sql.toString());
	}	

	public int update_QRCodeList(MiceParam param) {
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		try {
			sql.setLength(0);
			sql.append("\n	UPDATE	");
			sql.append("\n 		 korapis_prod_history	");; 
			sql.append("\n  SET	");		
			sql.append("\n  	rating = ?,	");	
			sql.append("\n  	subdiv_date = ?,	");
			sql.append("\n  	prod_orign = ?,	");
			sql.append("\n  	org_manager = ?,	");
			sql.append("\n  	org_inspecter = ?,	");
			sql.append("\n  	sale_shop  = ?,	");
			sql.append("\n  	prod_orign = ?,	");
			sql.append("\n  	prod_orign1 = ?,	");
			sql.append("\n  	prod_area = ?,	");
			sql.append("\n  	quality_mgr = ?,	");
			sql.append("\n  	pub_sts  = ?	");		
			sql.append("\n 	WHERE prod_category = ?	");
			sql.append("\n 	AND prod_seq between ? and ?	");
			
			StringTokenizer st = new StringTokenizer(sql.toString(),"?");
			int cnt = st.countTokens()-1;
			int idx = 0;
			obj = new Object[cnt];
					
			obj[idx++] = param.getString("rating");
			obj[idx++] = param.getString("subdiv_date");
			obj[idx++] = param.getString("prod_orign");
			obj[idx++] = param.getString("org_manager");
			obj[idx++] = param.getString("org_inspecter");
			obj[idx++] = param.getString("sale_shop");	
			obj[idx++] = param.getString("prod_orign");
			obj[idx++] = param.getString("prod_orign1");
			obj[idx++] = param.getString("prod_area");
			obj[idx++] = param.getString("quality_mgr");	
			obj[idx++] = param.getString("pub_sts");		
			obj[idx++] = param.getString("prod_category");
			obj[idx++] = param.getString("prod_seq_from");
			obj[idx++] = param.getString("prod_seq_to");
			
			trh.setQueryData(sql.toString(),obj);
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
		}finally {
			
			trh.close();
			
		}	
		return ret;
		
	}	

	public void pub_qrcdist(MiceParam param,String prod_idx,TransactionHandler trh) throws SQLException {
		
		Object[] obj = null;
		sql.setLength(0);
		sql.append("\n	UPDATE	");
		sql.append("\n 		 korapis_prod_history	");; 
		sql.append("\n  SET	");
		sql.append("\n  	rating = ?,	");	
		sql.append("\n  	subdiv_date = ?,	");		
		sql.append("\n  	org_manager = ?,	");
		sql.append("\n  	org_inspecter = ?,	");
		sql.append("\n  	pub_sts  = ?,	");
		sql.append("\n  	sale_shop  = ?,	");
		
		sql.append("\n  	prod_orign  = ?,	");
		sql.append("\n  	prod_orign1  = ?,	");
		sql.append("\n  	quality_mgr  = ?,	");
		sql.append("\n  	prod_area  = ?,	");
		
		
		
		sql.append("\n  	cdate = now()	");
		if(!"".equals(param.getString("prod_idx"))) {
			sql.append("\n 	WHERE prod_idx = "+prod_idx);
		}
		
		if(!"".equals(param.getString("prod_category"))&&!"".equals(param.getString("prod_seq_from"))&&!"".equals(param.getString("prod_seq_to"))) {
			sql.append("\n WHERE	prod_category ='").append(param.getString("prod_category")+"'");	
			sql.append("\n AND	prod_seq >='").append(param.getString("prod_seq_from")+"'");	
			sql.append("\n AND	prod_seq <='").append(param.getString("prod_seq_to")+"'");	
			
		}
		
		StringTokenizer st = new StringTokenizer(sql.toString(),"?");
		int cnt = st.countTokens()-1;
		int idx = 0;
		obj = new Object[cnt];
		
		obj[idx++] = param.getString("rating");
		obj[idx++] = param.getString("subdiv_date");
		obj[idx++] = param.getString("org_manager");
		obj[idx++] = param.getString("org_inspecter");
		obj[idx++] = param.getString("pub_sts");
		obj[idx++] = param.getString("sale_shop");
		obj[idx++] = param.getString("prod_orign");
		obj[idx++] = param.getString("prod_orign1");
		obj[idx++] = param.getString("quality_mgr");
		obj[idx++] = param.getString("prod_area");
		
		trh.setQueryData(sql.toString(),obj);
	}
	
	public int pub_qrcdist(MiceParam param,String prod_idx) {
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		try {
			sql.setLength(0);
			sql.append("\n	UPDATE	");
			sql.append("\n 		 korapis_prod_history	");; 
			sql.append("\n  SET	");
			sql.append("\n  	rating = ?,	");	
			sql.append("\n  	subdiv_date = ?,	");		
			sql.append("\n  	org_manager = ?,	");
			sql.append("\n  	org_inspecter = ?,	");
			sql.append("\n  	pub_sts  = ?,	");
			sql.append("\n  	sale_shop  = ?,	");
			
			sql.append("\n  	prod_orign  = ?,	");
			sql.append("\n  	prod_orign1  = ?,	");
			sql.append("\n  	quality_mgr  = ?,	");
			sql.append("\n  	prod_area  = ?,	");
			
			
			
			sql.append("\n  	cdate = now()	");
			if(!"".equals(param.getString("prod_idx"))) {
				sql.append("\n 	WHERE prod_idx = "+prod_idx);
			}
			
			if(!"".equals(param.getString("prod_category"))&&!"".equals(param.getString("prod_seq_from"))&&!"".equals(param.getString("prod_seq_to"))) {
				sql.append("\n WHERE	prod_category ='").append(param.getString("prod_category")+"'");	
				sql.append("\n AND	prod_seq >='").append(param.getString("prod_seq_from")+"'");	
				sql.append("\n AND	prod_seq <='").append(param.getString("prod_seq_to")+"'");	
				
			}
			
			StringTokenizer st = new StringTokenizer(sql.toString(),"?");
			int cnt = st.countTokens()-1;
			int idx = 0;
			obj = new Object[cnt];
			
			obj[idx++] = param.getString("rating");
			obj[idx++] = param.getString("subdiv_date");
			obj[idx++] = param.getString("org_manager");
			obj[idx++] = param.getString("org_inspecter");
			obj[idx++] = param.getString("pub_sts");
			obj[idx++] = param.getString("sale_shop");
			obj[idx++] = param.getString("prod_orign");
			obj[idx++] = param.getString("prod_orign1");
			obj[idx++] = param.getString("quality_mgr");
			obj[idx++] = param.getString("prod_area");
			
			trh.setQueryData(sql.toString(),obj);
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
		}finally {
			
			trh.close();
			
		}	
		return ret;
		
	}	
	
	public void pub_owner(MiceParam param, String prod_name, String prod_no, String prod_orign, 
			String prod_rating, String prod_province, String prod_date,TransactionHandler trh ) throws SQLException {
		
		Object[] obj = null;
		sql.append("\n	INSERT INTO korapis_prod_owner ( 	");
		sql.append("\n		prod_name,	 ");
		sql.append("\n		prod_no, 	");
		sql.append("\n		prod_orign,	 ");
		sql.append("\n		prod_rating, 	");
		sql.append("\n		prod_province,	 ");
		sql.append("\n		prod_date	");

		sql.append("\n		) ");
		sql.append("\n	VALUES ");
		sql.append("\n		(?,?,?,?,?,?) ");
		
		obj = new Object[6];
		obj[0] = prod_name;
		obj[1] = prod_no;
		obj[2] = prod_orign;
		obj[3] = prod_rating;
		obj[4] = prod_province;
		obj[5] = prod_date;

		
		trh.setQueryData(sql.toString(),obj);
		
	}
	public int pub_owner(MiceParam param, String prod_name, String prod_no, String prod_orign, String prod_orign1,
		String prod_rating, String prod_province, String prod_date ) {
		
		TransactionHandler trh = new TransactionHandler();
		StringBuffer sql = new StringBuffer();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try {
			sql.append("\n	INSERT INTO korapis_prod_owner ( 	");
			sql.append("\n		prod_name,	 ");
			sql.append("\n		prod_no, 	");
			sql.append("\n		prod_orign,	 ");
			sql.append("\n		prod_orign1,	 ");
			sql.append("\n		prod_rating, 	");
			sql.append("\n		prod_province,	 ");
			sql.append("\n		prod_date	");

			sql.append("\n		) ");
			sql.append("\n	VALUES ");
			sql.append("\n		(?,?,?,?,?,?,?) ");
			
			obj = new Object[7];
			obj[0] = prod_name;
			obj[1] = prod_no;
			obj[2] = prod_orign;
			obj[3] = prod_orign1;
			obj[4] = prod_rating;
			obj[5] = prod_province;
			obj[6] = prod_date;

			
			trh.setQueryData(sql.toString(),obj);
			
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
		}catch(Exception e) {
			
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
		}finally {
			trh.close();
		}
		return ret;
	}

	public void insert_pub_owner(String category, int seq, int idx, TransactionHandler trh) throws SQLException {
		StringBuffer sql = new StringBuffer();
		Object[] obj = null;
		sql.append("\n	INSERT INTO korapis_history_owner(h_category,h_seq,o_idx )  	");
		sql.append("\n	VALUES	(?,?,?)");
		sql.append("\n	");
		
		obj = new Object[3];
		obj[0] = category;
		obj[1] = seq;
		obj[2] = idx;
		
		trh.setQueryData(sql.toString(), obj);
		
	}
	public int insert_pub_owner(String category, int seq, int idx) {
		
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		
		try {
			insert_pub_owner(category, seq, idx, trh);
			
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
		}finally {
			trh.close();
			
		}
		
		return ret;
		
	}
	
	public int last_idx() {
		
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		
		sql.append("\n SELECT LAST_INSERT_ID();");
		
		return Integer.parseInt(dbh.getAData(sql.toString()));
				
	}
	
	public ResultSetEntity getOwnerList(MiceParam param) {
		
		DBHandler dbh = new DBHandler();
		Object obj[] = null;
		
		sql.setLength(0);
		
		sql.append("\n	SELECT	*	FROM	");
		sql.append("\n		korapis_prod_owner	");
		sql.append("\n	WHERE idx IN	");
		sql.append("\n		(SELECT		");
		sql.append("\n  		o_idx	");
		sql.append("\n 		FROM		");
		sql.append("\n 			korapis_history_owner	");
		sql.append("\n		WHERE del_yn = 'N' ");
		sql.append("\n 		AND h_category =	");
		sql.append("\n  	(SELECT		");
		sql.append("\n   		 prod_category	");
		sql.append("\n 		FROM		");
		sql.append("\n    		korapis_prod_history	");
		sql.append("\n  	WHERE prod_idx = ?)		");
		sql.append("\n  		AND h_seq =		");
		sql.append("\n 	 			(SELECT		");
		sql.append("\n   				prod_seq	");
		sql.append("\n 				FROM		");
		sql.append("\n  				korapis_prod_history	");
		sql.append("\n				WHERE prod_idx = ?));	");
		obj = new Object[2];
		obj[0] = param.getString("prod_idx");
		obj[1] = param.getString("prod_idx");
		
		return dbh.getQueryData(sql.toString(), obj);
	}
	
	public ResultSetEntity getOwnerDetail(MiceParam param) {
		
		DBHandler dbh = new DBHandler();
		Object obj[] = null;
		
		sql.setLength(0);
		sql.append("\n      SELECT       "); 
		sql.append("\n      * FROM       "); 
		sql.append("\n			korapis_prod_owner       "); 
		sql.append("\n      WHERE idx = ?       "); 

		
		obj = new Object[1];
		obj[0] = param.getString("idx");
		
		return dbh.getQueryData(sql.toString(),obj);
		
		
	}
	
	public int update_owner(MiceParam param) {
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		try {
			sql.setLength(0);
			sql.append("\n	UPDATE	");
			sql.append("\n 		 korapis_prod_owner	");; 
			sql.append("\n  SET	");
			sql.append("\n  	prod_name = ?,	");
			sql.append("\n  	prod_no = ?,	");
			sql.append("\n  	prod_orign = ?,	");
			sql.append("\n  	prod_orign1 = ?,	");
			sql.append("\n  	prod_rating = ?,	");
			sql.append("\n  	prod_province = ?,	");
			sql.append("\n  	prod_date = ?	");
			sql.append("\n 	WHERE	");
			sql.append("\n  	idx = ?	");
			int idx = 0;
			obj = new Object[8];
			obj[idx++] = param.getString("prod_name");
			obj[idx++] = param.getString("prod_no");
			obj[idx++] = param.getString("prod_orign");
			obj[idx++] = param.getString("prod_orign1");
			obj[idx++] = param.getString("prod_rating");
			obj[idx++] = param.getString("prod_province");
			obj[idx++] = param.getString("prod_date");
			obj[idx++] = param.getString("idx");
			
			
			trh.setQueryData(sql.toString(),obj);
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
			
		}catch(Exception e){
			
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
		}finally {
			
			trh.close();
			
		}	
		return ret;
		
	}	
	
	public int update_history_owner(MiceParam param) {
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		try {
			sql.setLength(0);
			sql.append("\n	UPDATE	");
			sql.append("\n 		 korapis_history_owner	");; 
			sql.append("\n  SET	");
			sql.append("\n  	del_yn = 'Y'	");
			sql.append("\n  WHERE	");
			sql.append("\n  	o_idx = ?	");
			sql.append("\n  AND	");
			sql.append("\n  	h_category = ?	");
			sql.append("\n  AND	");
			sql.append("\n  	h_seq >= ? AND ");
			sql.append("\n  	h_seq <= ?  ");
			
			int idx = 0;
			obj = new Object[4];
			obj[idx++] = param.getString("o_idx");
			obj[idx++] = param.getString("h_category");
			obj[idx++] = param.getString("h_seq_from");
			obj[idx++] = param.getString("h_seq_to");
			
			trh.setQueryData(sql.toString(),obj);
			trh.commit();
			ret = DefaultCode.SUCCESS;
			
		}catch (Exception e) {
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			
		}finally {
			
			trh.close();
		}
		
		return ret;
		
	}
	
	public int getQrcode_pub_cnt(MiceParam param) {
		
		DBHandler dbh = new DBHandler();
		Object[] obj = null;
		
		sql.setLength(0);
		sql.append("\n	SELECT	");
		sql.append("\n		COUNT(*) FROM	");
		sql.append("\n	 korapis_prod_history	");
		sql.append("\n		WHERE prod_category = ? ");
		sql.append("\n		AND prod_seq >= ?	");
		sql.append("\n		AND prod_seq <= ?");
		sql.append("\n		AND pub_sts > 0;");
		
		obj = new Object[3];
		obj[0] = param.getString("prod_category");
		obj[1] = param.getString("prod_seq_from");
		obj[2] = param.getString("prod_seq_to");
		
		return Integer.parseInt(dbh.getAData(sql.toString(), obj));

		
	}
	
	public ResultSetEntity getQrcode_history(MiceParam param) {
		
		DBHandler dbh = new DBHandler();
		
		sqlwhere.setLength(0);		
		sql.setLength(0);
		
		makeWhere_qrCode(param);
		sql.append("\n	SELECT	");
		sql.append("\n		* FROM	");
		sql.append("\n	 korapis_pub_history	");
		sql.append("\n	 WHERE del_yn = 'N'	");
		sql.append(sqlwhere);
		sql.append("\n	 ORDER BY pdate DESC	");
	
		return dbh.getQueryData(sql.toString());
	}
	
	public int getQrcode_history_cnt(MiceParam param) {
		
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sqlwhere.setLength(0);
		
		makeWhere_qrCode(param);		
		sql.append("\n	SELECT	");
		sql.append("\n		COUNT(*) FROM	");
		sql.append("\n	 korapis_pub_history	");
		sql.append("\n	 WHERE del_yn = 'N'	");
		sql.append(sqlwhere);
		
		return Integer.parseInt(dbh.getAData(sql.toString()));
		
	}
	
	public void pub_history(String category, String ownerInfo, int from, int to, TransactionHandler trh) throws SQLException {
		
		Object[] obj = null;	
		sql.append("\n	INSERT INTO korapis_pub_history ( 	");
		sql.append("\n		category,	 ");
		sql.append("\n		owner_info, 	");
		sql.append("\n		seq_from,	 ");
		sql.append("\n		seq_to,	");
		sql.append("\n		pdate	");
		sql.append("\n		) ");
		sql.append("\n	VALUES ");
		sql.append("\n		(?,?,?,?,now())");
		
		obj = new Object[4];
		
		obj[0] = category;
		obj[1] = ownerInfo;
		obj[2] = from;
		obj[3] = to;
		
		trh.setQueryData(sql.toString(),obj);
		
	}
	
	public int pub_history(String category, String ownerInfo, int from, int to) {
			
			TransactionHandler trh = new TransactionHandler();
			StringBuffer sql = new StringBuffer();
			int ret = DefaultCode.FAIL;
			Object[] obj = null;
			
			try {
				sql.append("\n	INSERT INTO korapis_pub_history ( 	");
				sql.append("\n		category,	 ");
				sql.append("\n		owner_info, 	");
				sql.append("\n		seq_from,	 ");
				sql.append("\n		seq_to,	");
				sql.append("\n		pdate	");
				sql.append("\n		) ");
				sql.append("\n	VALUES ");
				sql.append("\n		(?,?,?,?,now())");
				
				obj = new Object[4];
				
				obj[0] = category;
				obj[1] = ownerInfo;
				obj[2] = from;
				obj[3] = to;
				
				trh.setQueryData(sql.toString(),obj);
				
				trh.commit();
				ret = DefaultCode.SUCCESS;
				
			}catch(Exception e) {
				
				e.printStackTrace();
				trh.rollback();
				ret = DefaultCode.FAIL;
				
			}finally {
				trh.close();
			}
			return ret;
		}
	
	public int getQrcode_maxCnt(MiceParam param) {
		
		DBHandler dbh = new DBHandler();
		Object[] obj = null;
		
		sql.setLength(0);
		sql.append("\n	SELECT	");
		sql.append("\n		MAX(prod_seq) FROM	");
		sql.append("\n	 korapis_prod_history	");
		sql.append("\n		WHERE prod_category = ? ");
		
		obj = new Object[1];
		obj[0] = param.getString("prod_category");

		return Integer.parseInt(dbh.getAData(sql.toString(), obj));
	
	}
	
	public int pub_qrcd(MiceParam param) {
		
		TransactionHandler trh = new TransactionHandler();
		int from = param.getInt("prod_seq_from");
		int to = param.getInt("prod_seq_to");
		String idx = param.getString("prod_idx");
		String [] idxList = idx.split(",");
		String category = param.getString("prod_category");
		String ownerInfo = "";
		int pubCnt;
		int script_ret = DefaultCode.FAIL;
		
		JSONArray ownerData = JSONArray.fromObject(param.getString("ownerData"));
		pubCnt = getQrcode_pub_cnt(param);
		
		try {
			pubCnt = getQrcode_pub_cnt(param);	
			for(int i = 0; i < ownerData.size(); ++i) {			
				
				JSONObject owner = ownerData.getJSONObject(i);	
				
				if(pubCnt>0) {
					throw new Exception("이미 발급된 QR코드 입니다");
					
				}else {
					String comma = "";
					if(i<ownerData.size()-1) {
						comma = ",";
					}else {
						comma = "";
					}
					
					pub_owner(
					param, owner.getString("name")
					, owner.getString("no")
					, owner.getString("orign")
					, owner.getString("rating")
					, owner.getString("province")
					, owner.getString("date")
					,trh);		
					
					ownerInfo+=owner.getString("name")+"("+owner.getString("no")+")"+comma;
					
					int prodIdx = last_idx();
					
					for(int j = from;j <= to; j++) {
						
						if(pubCnt>0) {
							throw new Exception("이미 발급된 QR코드 입니다");
						}else {
							insert_pub_owner(param.getString("prod_category"), j, prodIdx, trh);
						}
					}
													
				}
			}
	
			if(pubCnt>0) {
				throw new Exception("이미 발급된 QR코드 입니다");				
			}else {
				pub_history(category, ownerInfo, from, to,trh);	
			}
					
			for(int i=0;i<idxList.length;i++) {
				
				if(pubCnt>0) {
					throw new Exception("이미 발급된 QR코드 입니다");
				}else{
					pub_qrcdist(param, idxList[i],trh);	
				}		
			}
			
			trh.commit();
			script_ret = DefaultCode.SUCCESS;
		}catch(Exception e) {
			trh.rollback();
			script_ret = DefaultCode.FAIL;
		}finally {
			trh.close();
		}
		return script_ret;
		
	}
}
