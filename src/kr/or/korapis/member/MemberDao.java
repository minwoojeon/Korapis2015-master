package kr.or.korapis.member;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DateC;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.vo.MemberVo;

public class MemberDao {




	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();


	/**
	 * 홈페이지에서 일반 회원정보등록
	 * @param req
	 * @return
	 */
	public int insert_member_ilban(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		SimpleDateFormat day = new SimpleDateFormat("yyyy-mm-dd");
		String str = day.format(new Date());
		try{

			sql.setLength(0);
			sql.append("\n	INSERT INTO `usermember`(	");
			sql.append("\n		`name`, 	");
			sql.append("\n		`id`, 	");
			sql.append("\n		`passwd`, 	");
			sql.append("\n		`regnumber`,	");
			sql.append("\n		`email`, 	");
			sql.append("\n		`cp1`, 	");
			sql.append("\n		`cp2`, 	");
			sql.append("\n		`cp3`, 	");
			sql.append("\n		`Hphone1`, 	");
			sql.append("\n		`Hphone2`, 	");
			sql.append("\n		`Hphone3`, 	");
			sql.append("\n		`hzipcode1`, 	");
			sql.append("\n		`hzipcode2`, 	");
			sql.append("\n		`hzipcode3`, 	");
			sql.append("\n		`Haddr1`, 	");
			sql.append("\n		`Haddr2`, 	");
			sql.append("\n		`registdate` 	");

			sql.append("\n	)VALUES( 	");
			sql.append("\n		? 	-- name	");
			sql.append("\n		, ? 	-- id    ");
			sql.append("\n		, ? 	-- passwd    ");
			sql.append("\n		, ? 	-- regnumber    ");
			sql.append("\n		, ? 	-- email    ");
			sql.append("\n		, ? 	-- cp1    ");
			sql.append("\n		, ? 	-- cp2    ");
			sql.append("\n		, ? 	-- cp3    ");
			sql.append("\n		, ? 	-- Hphone1    ");
			sql.append("\n		, ? 	-- Hphone2    ");
			sql.append("\n		, ? 	-- Hphone3    ");
			sql.append("\n		, ? 	-- Hzipcode1    ");
			sql.append("\n		, ? 	-- Hzipcode2    ");
			sql.append("\n		, ? 	-- Hzipcode3    ");
			sql.append("\n		, ? 	-- Haddr1    ");
			sql.append("\n		, ? 	-- Haddr2    ");
			sql.append("\n		, ? 	-- registDate    ");
			sql.append("\n	);	");


			StringTokenizer st = new StringTokenizer(sql.toString(), "?");
			int cnt = st.countTokens();
			int idx = 0;
			obj = new Object[cnt - 1];

			obj[idx++] = param.get("name");
			obj[idx++] = param.get("id");
			obj[idx++] = param.get("passwd");
			obj[idx++] = param.get("regnumber");
			obj[idx++] = param.get("email");
			obj[idx++] = param.get("cp1");
			obj[idx++] = param.get("cp2");
			obj[idx++] = param.get("cp3");
			obj[idx++] = param.get("hphone1");
			obj[idx++] = param.get("hphone2");
			obj[idx++] = param.get("hphone3");
			obj[idx++] = param.get("hzipcode1");
			obj[idx++] = param.get("hzipcode2");
			obj[idx++] = param.get("hzipcode3");
			obj[idx++] = param.get("haddr1");
			obj[idx++] = param.get("haddr2");
			obj[idx++] = str;

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
	 * 홈페이지에서 - 회원정보를 수정한다.
	 * @param req
	 * @return
	 */
	public int updateMember(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;

		try{
			sql.setLength(0);
			sql.append("\n	UPDATE komember 	");
			sql.append("\n	SET  	");
			sql.append("\n		`name` = ? ,   	");
			sql.append("\n		`passwd` = ? ,  	");
			sql.append("\n		`age` = ? ,  	");
			sql.append("\n		`sex` = ? ,  	");
			sql.append("\n		`companyname` = ? ,  	");
			sql.append("\n		`branch1` = ? ,  	");
			sql.append("\n		`branch2` = ? ,  	");
			sql.append("\n		`Hzipcode1` = ? ,  	");
			sql.append("\n		`Hzipcode2` = ? ,  	");
			sql.append("\n		`Hzipcode3` = ? ,  	");
			sql.append("\n		`Haddr1` = ? ,  	");
			sql.append("\n		`Haddr2` = ? ,  	");
			sql.append("\n		`Ozipcode1` = ? ,  	");
			sql.append("\n		`Ozipcode2` = ? ,  	");
			sql.append("\n		`Ozipcode3` = ? ,  	");
			sql.append("\n		`Oaddr1` = ? ,  	");
			sql.append("\n		`Oaddr2` = ? ,  	");
			sql.append("\n		`Hphone1` = ? ,  	");
			sql.append("\n		`Hphone2` = ? ,  	");
			sql.append("\n		`Hphone3` = ? ,  	");
			sql.append("\n		`Ophone1` = ? ,  	");
			sql.append("\n		`Ophone2` = ? ,  	");
			sql.append("\n		`Ophone3` = ? ,  	");
			sql.append("\n		`cp1` = ? ,  	");
			sql.append("\n		`cp2` = ? ,  	");
			sql.append("\n		`cp3` = ? ,  	");
			sql.append("\n		`Ofax1` = ? ,  	");
			sql.append("\n		`Ofax2` = ? ,  	");
			sql.append("\n		`Ofax3` = ? ,  	");
			sql.append("\n		`email` = ? ,  	");
			sql.append("\n		`mailreceive` = ? ,  	");
			sql.append("\n		`regnumber` = ? ,  	");
			sql.append("\n		`regnumber2` = ? ,  	");
//			sql.append("\n		`registDate` = ? ,  	");
//			sql.append("\n		`comment` = ? ,  	");
			sql.append("\n		`biznumber1` = ? ,  	");
			sql.append("\n		`biznumber2` = ? ,  	");
			sql.append("\n		`biznumber3` = ? ,  	");
			sql.append("\n		`role` = ? ,  	");
			sql.append("\n		`role_pos` = ? ,  	");
			sql.append("\n		`O2phone1` = ? ,  	");
			sql.append("\n		`O2phone2` = ? ,  	");
			sql.append("\n		`O2phone3` = ? ,  	");
			sql.append("\n		`O3phone1` = ? ,  	");
			sql.append("\n		`O3phone2` = ? ,  	");
			sql.append("\n		`O3phone3` = ? ,  	");
			sql.append("\n		`breednumber` = ? ,  	");
			sql.append("\n		`carrier` = ? ,  	");
			sql.append("\n		`TS` = now() 	");
			sql.append("\n	WHERE	`uid` = ? 	");



			StringTokenizer st = new StringTokenizer(sql.toString(), "?");
			int cnt = st.countTokens();
			int idx = 0;
			obj = new Object[cnt - 1];

			obj[idx++] = param.get("name");
			obj[idx++] = param.get("passwd");
			obj[idx++] = param.get("age");
			obj[idx++] = param.get("sex");
			obj[idx++] = param.get("companyname");
			obj[idx++] = param.get("branch1");
			obj[idx++] = param.get("branch2");
			obj[idx++] = param.get("hzipcode1");
			obj[idx++] = param.get("hzipcode2");
			obj[idx++] = param.get("hzipcode3");
			obj[idx++] = param.get("haddr1");
			obj[idx++] = param.get("haddr2");
			obj[idx++] = param.get("ozipcode1");
			obj[idx++] = param.get("ozipcode2");
			obj[idx++] = param.get("ozipcode3");
			obj[idx++] = param.get("oaddr1");
			obj[idx++] = param.get("oaddr2");
			obj[idx++] = param.get("hphone1");
			obj[idx++] = param.get("hphone2");
			obj[idx++] = param.get("hphone3");
			obj[idx++] = param.get("ophone1");
			obj[idx++] = param.get("ophone2");
			obj[idx++] = param.get("ophone3");
			obj[idx++] = param.get("cp1");
			obj[idx++] = param.get("cp2");
			obj[idx++] = param.get("cp3");
			obj[idx++] = param.get("ofax1");
			obj[idx++] = param.get("ofax2");
			obj[idx++] = param.get("ofax3");
			obj[idx++] = param.get("email");
			obj[idx++] = param.get("mailreceive");
			obj[idx++] = param.get("regnumber");
			obj[idx++] = param.get("regnumber2");
//			obj[idx++] = param.get("registdate");
//			obj[idx++] = param.get("comment");
			obj[idx++] = param.get("biznumber1");
			obj[idx++] = param.get("biznumber2");
			obj[idx++] = param.get("biznumber3");
			obj[idx++] = param.get("role");
			obj[idx++] = param.get("role_pos");
			obj[idx++] = param.get("o2phone1");
			obj[idx++] = param.get("o2phone2");
			obj[idx++] = param.get("o2phone3");
			obj[idx++] = param.get("o3phone1");
			obj[idx++] = param.get("o3phone2");
			obj[idx++] = param.get("o3phone3");
			obj[idx++] = param.get("breednumber");
			obj[idx++] = param.get("carrier");
			obj[idx++] = param.get("uid");

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
	 * 홈페이지에서 - 일반회원정보를 수정한다.
	 * @param req
	 * @return
	 */
	public int updateMember_ilban(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;

		try{
			sql.setLength(0);
			sql.append("\n	UPDATE usermember 	");
			sql.append("\n	SET  	");
			sql.append("\n		`name` = ? ,   	");
			sql.append("\n		`passwd` = ? ,  	");
			sql.append("\n		`regnumber` = ? ,  	");
			sql.append("\n		`email` = ? ,  	");
			sql.append("\n		`Hphone1` = ? ,  	");
			sql.append("\n		`Hphone2` = ? ,  	");
			sql.append("\n		`Hphone3` = ? ,  	");
			sql.append("\n		`cp1` = ? ,  	");
			sql.append("\n		`cp2` = ? ,  	");
			sql.append("\n		`cp3` = ? ,  	");
			sql.append("\n		`Hzipcode1` = ? ,  	");
			sql.append("\n		`Hzipcode2` = ? ,  	");
			sql.append("\n		`Hzipcode3` = ? ,  	");
			sql.append("\n		`Haddr1` = ? ,  	");
			sql.append("\n		`Haddr2` = ?   	");
			sql.append("\n	WHERE	`uid` = ? 	");

			StringTokenizer st = new StringTokenizer(sql.toString(), "?");
			int cnt = st.countTokens();
			int idx = 0;
			obj = new Object[cnt - 1];

			obj[idx++] = param.get("name");
			obj[idx++] = param.get("passwd");
			obj[idx++] = param.get("regnumber");
			obj[idx++] = param.get("email");
			obj[idx++] = param.get("hphone1");
			obj[idx++] = param.get("hphone2");
			obj[idx++] = param.get("hphone3");
			obj[idx++] = param.get("cp1");
			obj[idx++] = param.get("cp2");
			obj[idx++] = param.get("cp3");
			obj[idx++] = param.get("hzipcode1");
			obj[idx++] = param.get("hzipcode2");
			obj[idx++] = param.get("hzipcode3");
			obj[idx++] = param.get("haddr1");
			obj[idx++] = param.get("haddr2");
			obj[idx++] = param.get("uid");

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
	 * 지회목록가져오기
	 * @param param
	 * @return
	 */
	public int getList_branch_pay_tot(MiceParam param){
		DBHandler dbh = new DBHandler();

		sqlWhere.setLength(0);
		makeWhere_branch(param);

		sql.setLength(0);
		sql.append("\n SELECT count(1) ");
		sql.append("\n FROM komember	");
		sql.append("\n where 1=1 ");
		sql.append("\n and branch1 != '' ");
		sql.append("\n and branch2 != '' ");
		sql.append(sqlWhere);

		return Integer.parseInt(dbh.getAData(sql.toString()));
	}



	/**
	 * 지회목록가져오기
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList_branch_pay(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();

		sqlWhere.setLength(0);
		makeWhere_branch(param);

		int startYear = DateC.getKorapisBillYear();
		sql.setLength(0);
		sql.append("\n SELECT * ");
//		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2015) AS pay_2015	");
//		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2014) AS pay_2014	");
//		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2013) AS pay_2013	");
//		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2012) AS pay_2012	");

		for(int i = startYear; i > startYear - 4; i--){
			sql.append("\n 	, (SELECT SUM(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun="+i+" LIMIT 1) AS pay_"+i+"		");
		}

		sql.append("\n FROM komember m	");
		sql.append("\n where 1=1 ");
		sql.append(sqlWhere);
		sql.append("\n order by name asc");
		sql.append("\n limit ?, ?				");
		Object[] obj = new Object[2];
		obj[0] = from;
		obj[1] = cnt;

		return dbh.getQueryData(sql.toString(), obj);
	}




	/**
	 * 지회목록가져오기
	 * @param param
	 * @return
	 */
	public int getList_branch_tot(MiceParam param){
		DBHandler dbh = new DBHandler();

		sqlWhere.setLength(0);
		makeWhere_branch(param);

		sql.setLength(0);
		sql.append("\n SELECT count(1) ");
		sql.append("\n FROM komember	");
		sql.append("\n where 1=1 ");
		sql.append("\n and branch1 != '' ");
		sql.append("\n and branch2 != '' ");
		sql.append(sqlWhere);

		return Integer.parseInt(dbh.getAData(sql.toString()));
	}



	/**
	 * 지회목록가져오기
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList_branch(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();

		sqlWhere.setLength(0);
		makeWhere_branch(param);

		sql.setLength(0);
		sql.append("\n SELECT * ");
		sql.append("\n FROM komember	");
		sql.append("\n where 1=1 ");
		sql.append("\n and branch1 != '' ");
		sql.append("\n and branch2 != '' ");
		sql.append(sqlWhere);
		sql.append("\n order by name asc");
		sql.append("\n limit ?, ?				");
		Object[] obj = new Object[2];
		obj[0] = from;
		obj[1] = cnt;

		return dbh.getQueryData(sql.toString(), obj);
	}




	/**
	 * 조건절 생성
	 */
	private void makeWhere_branch(MiceParam param){

		/*
		if(!"".equals(param.getString("selUserlevel"))){
			sqlWhere.append("and userlevel = '").append(param.getString("selUserlevel")).append("' ");
		}
		*/
		
		sqlWhere.append("\n	AND contact_status != 'D'	");

		if("지회장".equals(param.getString("role_pos")) || "사무국장".equals(param.getString("role_pos"))){
			sqlWhere.append("\n and branch1 = '").append(param.getString("branch1")).append("' ");
		}else if("지부장".equals(param.getString("role_pos"))){
			sqlWhere.append("\n and branch1 = '").append(param.getString("branch1")).append("' ");
			sqlWhere.append("\n and branch2 = '").append(param.getString("branch2")).append("' ");
		}else{
			sqlWhere.append("\n and 1=2 ");
		}


		String searchText = param.getString("searchText").trim().toUpperCase().replaceAll("'", "''");
		String searchGubun = param.getString("searchGubun");
		if(!"1".equals(param.getString("selSearchType")) && !"".equals(searchText)){
			if("name".equals(searchGubun)){
				sqlWhere.append("\n and name like '%").append(searchText).append("%' ");
			}else if("id".equals(searchGubun)){
				sqlWhere.append("\n and id like '%").append(searchText).append("%' ");
			}else if("branch2".equals(searchGubun)){
				sqlWhere.append("\n and branch2 like '%").append(searchText).append("%' ");
			}else if("role_pos".equals(searchGubun)){
				sqlWhere.append("\n and role_pos like '%").append(searchText).append("%' ");
			}
		}

		if("1".equals(param.getString("selSearchType"))){

			if(!"".equals(param.getString("selName"))){
				sqlWhere.append("\n AND name LIKE '%").append(param.getString("selName")).append("%'		");
			}
			if(!"".equals(param.getString("selHaddr"))){
				//sqlWhere.append("\n AND CONCAT(Haddr1, ' ', Haddr2) LIKE '%").append(param.getString("selHaddr")).append("%'		");
				sqlWhere.append("\n AND ( Haddr1 LIKE '%").append(param.getString("selHaddr")).append("%' or Haddr2 LIKE '%").append(param.getString("selHaddr")).append("%' ) ");
			}
			if(!"".equals(param.getString("selOaddr"))){
				//sqlWhere.append("\n AND CONCAT(Oaddr1, ' ', Oaddr2) LIKE '%").append(param.getString("selOaddr")).append("%'		");
				sqlWhere.append("\n AND ( Oaddr1 LIKE '%").append(param.getString("selOaddr")).append("%' or Oaddr2 LIKE '%").append(param.getString("selOaddr")).append("%' ) ");
			}

			/*
			if(!"".equals(param.getString("selUserlevel2"))){
				sqlWhere.append("AND userlevel = '").append(param.getString("selUserlevel2")).append("'		");
			}
			*/
			if(!"".equals(param.getString("selSex"))){
				sqlWhere.append("\n	AND sex = '").append(param.getString("selSex")).append("'		");
			}
			if(!"".equals(param.getString("selRolePos"))){
				sqlWhere.append("\n	AND role_pos = '").append(param.getString("selRolePos")).append("'		");
			}
			if(!"".equals(param.getString("selBranch1"))){
				sqlWhere.append("\n	AND branch1 = '").append(param.getString("selBranch1")).append("'		");
			}
			if(!"".equals(param.getString("selBranch2"))){
				sqlWhere.append("\n	AND branch2 = '").append(param.getString("selBranch2")).append("'		");
			}
			if(!"".equals(param.getString("selContactStatus"))){
				sqlWhere.append("\n	AND contact_status = '").append(param.getString("selContactStatus")).append("'		");
			}
			if(!"".equals(param.getString("selMailsent"))){
				sqlWhere.append("\n	AND mailsent = '").append(param.getString("selMailsent")).append("'		");
			}


		}


	}















	/**
	 * 조건절 생성
	 */
	private void makeWhere(MiceParam param){

		if(!"".equals(param.getString("searchText"))){
			if("name".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n and name like '%").append(param.getString("searchText")).append("%' ");
			}else if("id".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n and id like '%").append(param.getString("searchText")).append("%' ");
			}else if("branch1".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n and branch1 like '%").append(param.getString("searchText")).append("%' ");
			}else if("role_pos".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n and role_pos like '%").append(param.getString("searchText")).append("%' ");
			}
		}
	}



	/**
	 * 회원목록을가져온다.
	 * @param param
	 * @param from
	 * @param cnt
	 * @return
	 */
	public ResultSetEntity getList(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();

		sqlWhere.setLength(0);
		makeWhere(param);

		sql.setLength(0);
		sql.append("\n SELECT * ");
		sql.append("\n FROM usermember	");
		sql.append("\n where 1=1 ");
		sql.append(sqlWhere);
		sql.append("\n order by registdate desc	");
		sql.append("\n limit ?, ?				");
		Object[] obj = new Object[2];
		obj[0] = from;
		obj[1] = cnt;

		return dbh.getQueryData(sql.toString(), obj);
	}

	/**
	 * 총갯수를 가져온다.
	 * @param param
	 * @return
	 */
	public int getList_tot(MiceParam param){
		DBHandler dbh = new DBHandler();

		sqlWhere.setLength(0);
		makeWhere(param);

		sql.setLength(0);
		sql.append("\n select count(a.uid) 		");
		sql.append("\n FROM usermember a	");
		sql.append("\n where 1=1 ");
		sql.append(sqlWhere);


		return Integer.parseInt(dbh.getAData(sql.toString()));
	}



	/**
	 * 사용자 상세정보를 가져온다.
	 * @param uid
	 * @return
	 */
	public MemberVo getDetail(String uid){
		DBHandler dbh = new DBHandler();
		ResultSetEntity d = dbh.getQueryData(" SELECT * FROM komember WHERE uid = ? ", new Object[]{uid});
		return new MemberVo(d);
	}

	/**
	 * 사용자 상세정보를 가져온다.(일반멤버)
	 * @param uid
	 * @return
	 */
	public MemberVo getDetail_ilban(String uid){
		DBHandler dbh = new DBHandler();
		ResultSetEntity d = dbh.getQueryData(" SELECT * FROM usermember WHERE uid = ? ", new Object[]{uid});
		return new MemberVo(d);
	}



}
