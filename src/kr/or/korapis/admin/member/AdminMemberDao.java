package kr.or.korapis.admin.member;

import java.util.StringTokenizer;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DateC;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.vo.MemberVo;

public class AdminMemberDao {


	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlWhere2 = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();


	/**
	 * 홈페이지에서 지회장, 사무국장 정보 불러오기
	 * @return
	 */
	public ResultSetEntity getHomepageGihe(){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n	SELECT branch1, branch2, NAME	");
		sql.append("\n		, role, role_pos	");
		sql.append("\n		, ozipcode3 as zipcode	");
		sql.append("\n		, CONCAT(oaddr1, ' ' ,oaddr2) as oaddr		");
		sql.append("\n		, CONCAT(ophone1, '-', ophone2,'-',ophone3)	as ophone");
		sql.append("\n		, CONCAT(ofax1, '-', ofax2,'-',ofax3) as ofax ");

		sql.append("\n		, mailreceive ");
		sql.append("\n		, Hzipcode1, Hzipcode2, Hzipcode3 ");
		sql.append("\n		, Haddr1, Haddr2 ");
		sql.append("\n		, Ozipcode1, Ozipcode2, Ozipcode3 ");
		sql.append("\n		, Oaddr1, Oaddr2 ");
		sql.append("\n		, cp1, cp2, cp3 ");

		sql.append("\n	FROM komember	");
		sql.append("\n	WHERE role_pos IN ('지회장', '사무국장')	");
		sql.append("\n	ORDER BY branch1 , role_pos desc, NAME	");

		return dbh.getQueryData(sql.toString());

	}



	/**
	 * 회원코드 초기배치.
	 */
	public void setMembercode_batch(){
		TransactionHandler trh = new TransactionHandler();
		ResultSetEntity d = null;
		ResultSetEntity d_user = null;
		try{
			sql.setLength(0);
			sql.append("\n SELECT NAME, gihe_name, bunhe_code	");
			sql.append("\n FROM korapis_bunhe ORDER BY bunhe_code	");
			d = trh.getQueryData(sql.toString());


			while(d!=null && d.next()){
				sql.setLength(0);
				sql.append(" select uid from komember where branch1=? and branch2=? order by id ");

				d_user = trh.getQueryData(sql.toString(), new Object[]{d.getString("gihe_name"), d.getString("name")});
				String str = "";
				int c = 1;
				while(d_user!=null && d_user.next()){
					str = d.getString("bunhe_code")+"-";
					sql.setLength(0);
					sql.append("\n update komember set member_code = concat('").append(str).append("', LPAD(?, 4, '0'))  where uid = ? ");
					trh.setQueryData(sql.toString(), new Object[]{c++, d_user.getString("uid")});
				}
			}


			//2. 커밋
			trh.commit();

		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();

		}finally{
			trh.close();
		}

	}

	/**
	 * 미납내역을 가져온다.
	 * @param param
	 * @return
	 */
	public ResultSetEntity getPayN(String id){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n SELECT *		");
		sql.append("\n FROM korapis_member_bill	");
		sql.append("\n WHERE member_uid = ? ");
		sql.append("\n AND pay = 'N'	");
		sql.append("\n ORDER BY gubun DESC	");

		return dbh.getQueryData(sql.toString(), new Object[]{ id });
	}

	/**
	 * 삭제시 어떤 플래그를 업데이트 하는지 혹은 정말로 delete를 해버리는지 확인 후 처리할 것.
	 * @param param
	 * @return
	 */
	public int deleteMember(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;

		try{
			sql.setLength(0);
			sql.append("\n delete from komember where uid=? ");

			obj = new Object[1];
			obj[0] = param.get("uid");
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
	 * 회원정보를 수정한다.
	 * @param req
	 * @return
	 */
	public int update_member(MiceParam param){
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
			sql.append("\n		`registDate` = ? ,  	");
			sql.append("\n		`comment` = ? ,  	");
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
			//sql.append("\n		`userlevel` = ? ,  	");
			//sql.append("\n		`mailsent` = ? ,  	");
			sql.append("\n		`contact_status` = ? ,  	");
			//sql.append("\n		`join_bill` =? ,  	");
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
			obj[idx++] = param.get("registdate");
			obj[idx++] = param.get("comment");
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
			//obj[idx++] = param.get("userlevel");
			//obj[idx++] = param.get("mailsent");
			obj[idx++] = param.get("contact_status");
			//obj[idx++] = param.get("join_bill");
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
	 * 회원정보를 수정한다.
	 * @param req
	 * @return
	 */
	public String insert_member(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		String retStr = "";
		Object[] obj = null;

		try{


			//0. 회웥코드
			String mcode = "";
			sql.setLength(0);
			sql.append("\n	SELECT CONCAT( SUBSTR(MAX(member_code), 1, 4), '-', LPAD(SUBSTR(MAX(member_code), 6)+1, 4, 0) )	");
			sql.append("\n	FROM komember	");
			sql.append("\n	WHERE branch1 = ?	");
			sql.append("\n	AND branch2 = ?	");
			obj = new Object[2];
			obj[0] = param.get("branch1");
			obj[1] = param.get("branch2");
			mcode = trh.getAData(sql.toString(), obj);


			sql.setLength(0);
			sql.append("\n	SELECT CONCAT( YEAR(CURDATE()) ,'-', IFNULL(MAX( CONVERT(SUBSTRING(id, 6), UNSIGNED) )+1, '1') )	");
			sql.append("\n	FROM komember	");
			sql.append("\n	WHERE YEAR(CURDATE()) = SUBSTRING(id, 1, 4)	");
			String nId = trh.getAData(sql.toString());

			sql.setLength(0);
			sql.append("\n	INSERT INTO `komember`(	");
			sql.append("\n		`name`, 	");
			sql.append("\n		`id`, 	");
			sql.append("\n		`passwd`, 	");
			sql.append("\n		`age`, 	");
			sql.append("\n		`sex`, 	");
			sql.append("\n		`companyname`,	");
			sql.append("\n		`branch1`, 	");
			sql.append("\n		`branch2`, 	");
			sql.append("\n		`Hzipcode1`, 	");
			sql.append("\n		`Hzipcode2`, 	");
			sql.append("\n		`Hzipcode3`, 	");
			sql.append("\n		`Haddr1`, 	");
			sql.append("\n		`Haddr2`, 	");
			sql.append("\n		`Ozipcode1`, 	");
			sql.append("\n		`Ozipcode2`, 	");
			sql.append("\n		`Ozipcode3`, 	");
			sql.append("\n		`Oaddr1`, 	");
			sql.append("\n		`Oaddr2`, 	");
			sql.append("\n		`Hphone1`, 	");
			sql.append("\n		`Hphone2`, 	");
			sql.append("\n		`Hphone3`, 	");
			sql.append("\n		`Ophone1`, 	");
			sql.append("\n		`Ophone2`, 	");
			sql.append("\n		`Ophone3`, 	");
			sql.append("\n		`cp1`, 	");
			sql.append("\n		`cp2`, 	");
			sql.append("\n		`cp3`, 	");
			sql.append("\n		`Ofax1`, 	");
			sql.append("\n		`Ofax2`, 	");
			sql.append("\n		`Ofax3`, 	");
			sql.append("\n		`email`, 	");
			sql.append("\n		`mailreceive`, 	");
			sql.append("\n		`regnumber`, 	");
			sql.append("\n		`regnumber2`, 	");
			sql.append("\n		`registDate`, 	");
			sql.append("\n		`comment`, 	");
			sql.append("\n		`biznumber1`, 	");
			sql.append("\n		`biznumber2`, 	");
			sql.append("\n		`biznumber3`, 	");
			sql.append("\n		`role`, 	");
			sql.append("\n		`role_pos`, 	");
			sql.append("\n		`O2phone1`, 	");
			sql.append("\n		`O2phone2`, 	");
			sql.append("\n		`O2phone3`, 	");
			sql.append("\n		`O3phone1`, 	");
			sql.append("\n		`O3phone2`, 	");
			sql.append("\n		`O3phone3`, 	");
			sql.append("\n		`breednumber`, 	");
			sql.append("\n		`carrier`, 	");
			//sql.append("\n		`userlevel`, 	");
			//sql.append("\n		`mailsent`, 	");
			sql.append("\n		`contact_status`, 	");
			//sql.append("\n		`join_bill`, 	");
			sql.append("\n		`member_code`, 	");
			sql.append("\n		`TS`	");
			sql.append("\n	)VALUES( 	");
			sql.append("\n		? 	-- name	");
			sql.append("\n		, ? 	-- id    ");
			sql.append("\n		, ? 	-- passwd    ");
			sql.append("\n		, ? 	-- age    ");
			sql.append("\n		, ? 	-- sex    ");
			sql.append("\n		, ? 	-- companyname',	");
			sql.append("\n		, ? 	-- branch1    ");
			sql.append("\n		, ? 	-- branch2    ");
			sql.append("\n		, ? 	-- Hzipcode1    ");
			sql.append("\n		, ? 	-- Hzipcode2    ");
			sql.append("\n		, ? 	-- Hzipcode3    ");
			sql.append("\n		, ? 	-- Haddr1    ");
			sql.append("\n		, ? 	-- Haddr2    ");
			sql.append("\n		, ? 	-- Ozipcode1    ");
			sql.append("\n		, ? 	-- Ozipcode2    ");
			sql.append("\n		, ? 	-- Ozipcode3    ");
			sql.append("\n		, ? 	-- Oaddr1    ");
			sql.append("\n		, ? 	-- Oaddr2    ");
			sql.append("\n		, ? 	-- Hphone1    ");
			sql.append("\n		, ? 	-- Hphone2    ");
			sql.append("\n		, ? 	-- Hphone3    ");
			sql.append("\n		, ? 	-- Ophone1    ");
			sql.append("\n		, ? 	-- Ophone2    ");
			sql.append("\n		, ? 	-- Ophone3    ");
			sql.append("\n		, ? 	-- cp1    ");
			sql.append("\n		, ? 	-- cp2    ");
			sql.append("\n		, ? 	-- cp3    ");
			sql.append("\n		, ? 	-- Ofax1    ");
			sql.append("\n		, ? 	-- Ofax2    ");
			sql.append("\n		, ? 	-- Ofax3    ");
			sql.append("\n		, ? 	-- email    ");
			sql.append("\n		, ? 	-- mailreceive    ");
			sql.append("\n		, ? 	-- regnumber    ");
			sql.append("\n		, ? 	-- regnumber2    ");
			sql.append("\n		, ? 	-- registDate    ");
			sql.append("\n		, ? 	-- comment    ");
			sql.append("\n		, ? 	-- biznumber1    ");
			sql.append("\n		, ? 	-- biznumber2    ");
			sql.append("\n		, ? 	-- biznumber3    ");
			sql.append("\n		, ? 	-- role    ");
			sql.append("\n		, ? 	-- role_pos    ");
			sql.append("\n		, ? 	-- O2phone1    ");
			sql.append("\n		, ? 	-- O2phone2    ");
			sql.append("\n		, ? 	-- O2phone3    ");
			sql.append("\n		, ? 	-- O3phone1    ");
			sql.append("\n		, ? 	-- O3phone2    ");
			sql.append("\n		, ? 	-- O3phone3    ");
			sql.append("\n		, ? 	-- breednumber    ");
			sql.append("\n		, ? 	-- carrier    ");
			//sql.append("\n		, ? 	-- userlevel    ");
			//sql.append("\n		, ? 	-- mailsent    ");
			sql.append("\n		, ? 	-- contact_status    ");
			//sql.append("\n		, ? 	-- join_bill    ");
			sql.append("\n		, ? 	-- member_code    ");
			sql.append("\n		, now()	");
			sql.append("\n	);	");


			StringTokenizer st = new StringTokenizer(sql.toString(), "?");
			int cnt = st.countTokens();
			int idx = 0;
			obj = new Object[cnt - 1];

			obj[idx++] = param.get("name");
			obj[idx++] = nId;
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
			obj[idx++] = param.get("registdate");
			obj[idx++] = param.get("comment");
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
			//obj[idx++] = param.get("userlevel");
			//obj[idx++] = param.get("mailsent");
			obj[idx++] = param.get("contact_status");
			//obj[idx++] = param.get("join_bill");
			obj[idx++] = mcode;

			trh.setQueryData(sql.toString(), obj);

			retStr = trh.getAData(" select last_insert_id() ");

			//2. 커밋
			trh.commit();
			ret = DefaultCode.SUCCESS;
		}catch(Exception e){
			e.printStackTrace();
			trh.rollback();
			ret = DefaultCode.FAIL;
			retStr = "";

		}finally{
			trh.close();
		}

		return retStr;
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
		for(int i=startYear; i > startYear - 4; i--){
			sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun="+i+") AS pay_"+i+"	");
		}
		sql.append("\n FROM komember m	");
		sql.append("\n WHERE 1=1 ");
		sql.append(sqlWhere);
		sql.append("\n ORDER BY name asc");
		sql.append("\n LIMIT ?, ?				");
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

		if(!"".equals(param.getString("selUserlevel"))){
			sqlWhere.append("and userlevel = '").append(param.getString("selUserlevel")).append("' ");
		}



		if("지회장".equals(param.getString("role_pos")) || "사무국장".equals(param.getString("role_pos"))){
			sqlWhere.append("\n and branch1 = '").append(param.getString("branch1")).append("' ");
		}else if("지부장".equals(param.getString("role_pos"))){
			sqlWhere.append("\n and branch2 = '").append(param.getString("branch2")).append("' ");
		}else{
			sqlWhere.append("\n and 1=2 ");
		}



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
	 * 조건절 생성
	 */
	private void makeWhere(MiceParam param){

		String searchText = param.getString("searchText").trim().toUpperCase().replaceAll("'", "''");
		if(!"".equals(searchText)){
			if("name".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n AND UPPER(name) LIKE '%").append(searchText).append("%' ");
				
			}else if("id".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n AND UPPER(id) LIKE '%").append(searchText).append("%' ");
				
			}else if("branch1".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n AND UPPER(branch1) LIKE '%").append(searchText).append("%' ");
				
			}else if("role_pos".equals(param.getString("searchGubun"))){
				sqlWhere.append("\n AND UPPER(role_pos) LIKE '%").append(searchText).append("%' ");
			}
		}



		if(!"".equals(param.getString("selUserlevel"))){
			sqlWhere.append("\n AND userlevel = '").append(param.getString("selUserlevel")).append("' ");
		}
		if(!"".equals(param.getString("selName"))){
			sqlWhere.append("\n AND name like '%").append(param.getString("selName")).append("%' ");
		}
		if(!"".equals(param.getString("selRegnum"))){
			sqlWhere.append("\n and concat(regnumber, regnumber2) like '%").append(param.getString("selRegnum").replace("-", "")).append("%' ");
		}
		if(!"".equals(param.getString("selCphone"))){
			sqlWhere.append("\n and concat(cp1, cp2, cp3) like '%").append(param.getString("selCphone").replace("-", "")).append("%' ");
		}
		if(!"".equals(param.getString("selHphone"))){
			sqlWhere.append("\n and concat(hphone1, hphone2, hphone3) like '%").append(param.getString("selHphone").replace("-", "")).append("%' ");
		}


		if(!"".equals(param.getString("selCompanyname"))){
			sqlWhere.append("\n and companyname like '%").append(param.getString("selCompanyname")).append("%' ");
		}

		if(!"".equals(param.getString("selBranch1"))){
			sqlWhere.append("\n and branch1 = '").append(param.getString("selBranch1")).append("' ");
		}
		if(!"".equals(param.getString("selBranch2"))){
			sqlWhere.append("\n and branch2 = '").append(param.getString("selBranch2")).append("' ");
		}

		if(!"".equals(param.getString("selRole"))){
			sqlWhere.append("\n and role = '").append(param.getString("selRole")).append("' ");
		}
		if(!"".equals(param.getString("selRolepos"))){
			sqlWhere.append("\n and role_pos = '").append(param.getString("selRolepos")).append("' ");
		}
		if(!"".equals(param.getString("selHaddr"))){
			sqlWhere.append("\n and concat(haddr1, haddr2) like '%").append(param.getString("selHaddr")).append("%' ");
		}



		if(!"".equals(param.getString("selMailreceive"))){
			sqlWhere.append("\n and mailreceive = '").append(param.getString("selMailreceive")).append("' ");
		}
		if(!"".equals(param.getString("selMailsent"))){
			sqlWhere.append("\n and mailsent = '").append(param.getString("selMailsent")).append("' ");
		}
		String selContactStatus = param.getString("selContactStatus");
		if(!"".equals(selContactStatus)){
			if(!"D-include".equals(selContactStatus)) {
				sqlWhere.append("\n	AND contact_status = '").append(selContactStatus).append("' ");
			}
			if(!"L".equals(selContactStatus)) {
			 sqlWhere.append("\n AND contact_status != 'L'    ");
			}
		}else {
			sqlWhere.append("\n	AND contact_status NOT IN ('D', 'L')	");
		}
		
		if(!"".equals(param.getString("selJoinbill"))){
			sqlWhere.append("\n and join_bill = '").append(param.getString("selJoinbill")).append("' ");
		}

		if(!"".equals(param.getString("selOaddr"))){
			sqlWhere.append("\n and concat(oaddr1, oaddr2) like '%").append(param.getString("selOaddr")).append("%' ");
		}

		if(!"".equals(param.getString("selMember_code"))){
			sqlWhere.append("\n and Member_code = '").append(param.getString("selMember_code")).append("' ");
		}

		//접수일
		if(!"".equals(param.getString("selRegdate_from"))){
			sqlWhere.append("\n and registdate >= cast(").append(param.getString("selRegdate_from")).append(" as date) ");
		}
		if(!"".equals(param.getString("selRegdate_to"))){
			sqlWhere.append("\n and registdate < adddate(cast(").append(param.getString("selRegdate_to")).append(" as date), 1) ");
		}

		//접수일
		if(!"".equals(param.getString("selAge_from"))){
			sqlWhere.append("\n and age >= '").append(param.getString("selAge_from")).append("' ");
		}
		if(!"".equals(param.getString("selAge_to"))){
			sqlWhere.append("\n and age <= '").append(param.getString("selAge_to")).append("' ");
		}



		//회비납부 (year04는 60000원)
		if("Y".equals(param.getString("sel_pay_yn"))){

			int pFrom = param.getInt("sel_pay_from");
			int pTo = param.getInt("sel_pay_to");
			String s = "";
			for(int i=0;pFrom<(pTo+1); pFrom++, i++){
				if(i==0) s="\n and ( ";

				if(pFrom==2013){
					s += "tot_"+pFrom+" >= 60000 ";
				}else{
					s += "tot_"+pFrom+" >= 100000 ";
				}

				s += (pFrom==pTo)? " ) " : " or ";
			}
			sqlWhere2.append(s);

		//회비미납
		}else if("N".equals(param.getString("sel_pay_yn"))){

			int pFrom = param.getInt("sel_pay_from");
			int pTo = param.getInt("sel_pay_to");
			String s = "";
			for(int i=0;pFrom<(pTo+1); pFrom++, i++){
				if(i==0) s="\n and ( ";

				if(pFrom==2013){
					s += " (tot_2013 <100000 OR tot_2013 IS NULL)  ";
				}else{
					s += "tot_"+pFrom+" IS NULL ";
				}

				s += (pFrom==pTo)? " ) " : " AND ";
			}
			sqlWhere2.append(s);



		// 연속납부
		}else if("A".equals(param.getString("sel_pay_yn"))){
			int pFrom = param.getInt("sel_pay_from");
			int pTo = param.getInt("sel_pay_to");
			String s = "";
			for(int i=0;pFrom<(pTo+1); pFrom++, i++){
				if(pFrom==2013){
					s += "\n and tot_"+pFrom+" >= 60000 ";
				}else{
					s += "\n and tot_"+pFrom+" >= 100000 ";
				}
			}
			sqlWhere2.append(s);
		}

		//2013년도 6만원 납부자
		if("Y".equals(param.getString("selPayLimit"))){
			sqlWhere2.append("\n and tot_2013=60000  ");
		}

		sqlOrder.setLength(0);
		if(!"".equals(param.getString("selBranch1"))
				|| !"".equals(param.getString("selBranch2"))){
			sqlOrder.append("\n order by name asc	");
		}
	}

	 public ResultSetEntity getList_order(MiceParam param, int from, int cnt){
			DBHandler dbh = new DBHandler();
			dbh.setTrace(true);
			sqlWhere.setLength(0);
			makeWhere(param);

			int startYear = DateC.getKorapisBillYear();

			sql.setLength(0);
			sql.append("\n SELECT * 		");
			for(int i = startYear; i > startYear - 4; i--){
				sql.append("\n  	, (SELECT IFNULL(SUM(price), 0) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun="+i+" ) AS tot_"+i+"	");
			}
			sql.append("\n  FROM komember m	");
			sql.append("\n  WHERE 1=1	");
			sql.append(sqlWhere);
			if(!"".equals(param.getString("selBranch1")) || !"".equals(param.getString("selBranch2"))){
				sql.append("\n ORDER BY m.name asc	");
			}else{
				sql.append("\n  ORDER BY m.ts DESC	");
			}

			sql.append("\n limit ?, ?				");
			Object[] obj = new Object[2];
			obj[0] = from;
			obj[1] = cnt;

		return dbh.getQueryData(sql.toString(), obj);
	}

	 public int getList_order_tot(MiceParam param){
			DBHandler dbh = new DBHandler();
			//dbh.setTrace(true);
			sqlWhere.setLength(0);
			makeWhere(param);

			sql.setLength(0);
			sql.append("\n SELECT count(m.uid)	 		");
			sql.append("\n  FROM komember m	");
			sql.append("\n  WHERE 1=1	");
			sql.append(sqlWhere);

		return Integer.parseInt(dbh.getAData(sql.toString()));
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
			dbh.setTrace(true);
			sqlWhere.setLength(0);
			sqlWhere2.setLength(0);

			int startYear = DateC.getKorapisBillYear();
			int pFrom = param.getInt("sel_pay_from");
			int pTo = param.getInt("sel_pay_to");
			makeWhere(param);

			sql.setLength(0);
			sql.append("\n	SELECT * 	");
			sql.append("\n	FROM ( 		");
			sql.append("\n		SELECT * 		");
			for(int yy=pFrom;yy<(pTo+1); yy++){
				sql.append("\n  		, (SELECT IFNULL(SUM(price), 0) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=").append(yy).append(" ) AS tot_").append(yy).append("	");
			}
			//리스트필수 시작 (리스트에 표현되야 하므로 필수로있어야 한다)
			for(int i = startYear; i > startYear - 5; i--){
				if(!(pFrom<=i && i<=pTo)){
					sql.append("\n  		, (SELECT IFNULL(SUM(price), 0) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun="+i+" ) AS tot_"+i+"	");
				}
			}
			//리스트필수 끝

			sql.append("\n		FROM komember m	");
			sql.append("\n		WHERE 1=1	");
			sql.append(sqlWhere);
			sql.append("\n	) kk 		");
			sql.append("\n	WHERE 1=1	");
			sql.append(sqlWhere2);
			sql.append(sqlOrder);
			sql.append("\n	LIMIT ?, ?				");
			Object[] obj = new Object[2];
			obj[0] = from;
			obj[1] = cnt;

		return dbh.getQueryData(sql.toString(), obj);
	}
	public int getList_tot(MiceParam param){
		DBHandler dbh = new DBHandler();

		sqlWhere.setLength(0);
		sqlWhere2.setLength(0);

		int startYear = DateC.getKorapisBillYear();
		int pFrom = param.getInt("sel_pay_from");
		int pTo = param.getInt("sel_pay_to");
		makeWhere(param);
		sql.setLength(0);
		sql.append("\n SELECT count(uid) 	");
		sql.append("\n from ( 		");
		sql.append("\n 		SELECT uid 		");
		for(int yy=pFrom;yy<(pTo+1); yy++){
			sql.append("\n  		, (SELECT IFNULL(SUM(price), 0) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=").append(yy).append(" ) AS tot_").append(yy).append("	");
		}

		for(int i = startYear; i > startYear - 4; i--){
			if(!(pFrom<=i && i<=pTo)){
				sql.append("\n  		, (SELECT IFNULL(SUM(price), 0) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun="+i+" ) AS tot_"+i+"	");
			}
		}
		sql.append("\n  	FROM komember m	");
		sql.append("\n 		WHERE 1=1	");
		sql.append(sqlWhere);
		sql.append("\n ) kk 		");
		sql.append("\n WHERE 1=1	");
		sql.append(sqlWhere2);

		return Integer.parseInt(dbh.getAData(sql.toString()));
	}










	/**
	 * 회원DM발송
	 * @param param
	 * @param from
	 * @param cnt
	 * @return
	 */
	
//	public ResultSetEntity getListTot(MiceParam param){
//		DBHandler dbh = new DBHandler();
//		//dbh.setTrace(true);
//
//		sqlWhere.setLength(0);
//		makeWhere(param);
//
//		sql.setLength(0);
//		sql.append("\n SELECT * 	");
//		sql.append("\n 		, YEAR(NOW()) as year01_gubun	");
//		sql.append("\n 		, year01.tot as year01_tot	");
//		sql.append("\n 		, YEAR(NOW())-1 as year02_gubun	");
//		sql.append("\n 		, year02.tot as year02_tot	");
//		sql.append("\n 		, YEAR(NOW())-2 as year03_gubun	");
//		sql.append("\n 		, year03.tot as year03_tot	");
//		sql.append("\n 		, YEAR(NOW())-3 as year04_gubun	");
//		sql.append("\n 		, year04.tot as year04_tot	");
//		sql.append("\n FROM komember m		");
//		sql.append("\n LEFT OUTER JOIN 	");
//		sql.append("\n 	( SELECT member_uid, IFNULL(SUM(price), 0)  AS tot, pay FROM korapis_member_bill WHERE gubun = YEAR(NOW())  GROUP BY member_uid)  year01	");
//		sql.append("\n ON m.id = year01.member_uid	");
//		sql.append("\n LEFT OUTER JOIN 	");
//		sql.append("\n 	( SELECT member_uid, IFNULL(SUM(price), 0)  AS tot, pay FROM korapis_member_bill WHERE gubun = YEAR(NOW())-1  GROUP BY member_uid)  year02	");
//		sql.append("\n ON m.id = year02.member_uid	");
//		sql.append("\n LEFT OUTER JOIN 	");
//		sql.append("\n 	( SELECT member_uid, IFNULL(SUM(price), 0)  AS tot, pay FROM korapis_member_bill WHERE gubun = YEAR(NOW())-2  GROUP BY member_uid)  year03	");
//		sql.append("\n ON m.id = year03.member_uid	");
//		sql.append("\n LEFT OUTER JOIN 	");
//		sql.append("\n 	( SELECT member_uid, IFNULL(SUM(price), 0)  AS tot, pay FROM korapis_member_bill WHERE gubun = YEAR(NOW())-3  GROUP BY member_uid)  year04	");
//		sql.append("\n ON m.id = year04.member_uid	");
//		sql.append("\n where 1=1 ");
//		sql.append(sqlWhere);
//		//sql.append("\n order by name asc	");
//		//sql.append("\n limit 0, 50				");
//		return dbh.getQueryData(sql.toString());
//	}

	public ResultSetEntity getDmList(MiceParam param) {
		
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		String test = param.getString("test");
		makeWhere(param);
		sql.append("\n	SELECT SQL_NO_CACHE m.*, GROUP_CONCAT(mb.`gubun`) as gubun1   ");
		sql.append("\n	,IF(IF(m.cp1 = '' || m.cp2 = '' || m.cp3 = '', CONCAT(m.Hphone1,'-',m.Hphone2,'-',m.Hphone3) , CONCAT(m.cp1,'-',m.cp2,'-',m.cp3))  ");
		sql.append("\n	= '--','',IF(m.cp1 = '' || m.cp2 = '' || m.cp3 = '', CONCAT(m.Hphone1,'-',m.Hphone2,'-',m.Hphone3) , CONCAT(m.cp1,'-',m.cp2,'-',m.cp3)))AS tel");
		sql.append("\n	FROM komember m  ");
		sql.append("\n	LEFT OUTER JOIN korapis_member_bill mb   ");
		sql.append("\n	ON m.id = mb.member_uid    ");
		sql.append("\n		AND mb.gubun >= YEAR(NOW())-3    ");
		sql.append("\n		AND mb.gubun <= YEAR(NOW())  ");
		sql.append("\n		WHERE 1=1  ");
		sql.append(sqlWhere);
		if("Y".equals(test)) {
			sql.append("\n	AND EXISTS( SELECT 1 FROM korapis_test2 t WHERE t.mmbr_idnt = m.id  ");
			if(!"".equals(param.getString("no"))) {
				sql.append(" AND t.uid IN(").append(param.getString("no")).append( ")");
			}
			sql.append(")");
		}
		sql.append("\n	GROUP BY m.id   ");
		
		return dbh.getQueryData(sql.toString());

		
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
	 * 상세화면에서 회비납부내역을 가져온다.
	 * @param uid
	 * @return
	 */
	public ResultSetEntity getDetail_pay(String uid){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n	SELECT b.*  ");
		sql.append("\n	FROM korapis_member_bill b, komember m ");
		sql.append("\n	WHERE b.member_uid = m.id ");
		sql.append("\n	AND m.id = ? ");
		sql.append("\n 	ORDER by b.gubun desc ");

		Object[] obj = new Object[1];
		obj[0] = uid;

		return dbh.getQueryData(sql.toString(), obj);
	}


	/**
	 * 상세화면에서 시험성적서목록을 가져온다.
	 * @param uid
	 * @return
	 */
	public ResultSetEntity getDetail_certi(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);

		sql.append("\n	SELECT  ");
		sql.append("\n		a.regnum  ");
		sql.append("\n		, STR_TO_DATE(a.test_endd_date,'%Y-%m-%d') AS test_endd_date  ");
		sql.append("\n		, a.rqst_prdt_name  ");
		sql.append("\n		, a.test_rslt  ");
		sql.append("\n		, b.name  ");
		sql.append("\n	FROM korapis_test2 a, komember b  ");
		sql.append("\n	WHERE a.mmbr_idnt = b.id  ");
		sql.append("\n	and b.uid = ?   ");
		sql.append("\n	ORDER BY test_endd_Date DESC  ");
		sql.append("\n	LIMIT ?, ?  ");

		Object[] obj = new Object[3];
		obj[0] = param.getString("uid");
		obj[1] = from;
		obj[2] = cnt;

		return dbh.getQueryData(sql.toString(), obj);
	}
	public int getDetail_certi_tot(MiceParam param){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);

		sql.append("\n	SELECT count(a.regnum)   ");
		sql.append("\n	FROM korapis_test2 a, komember b  ");
		sql.append("\n	WHERE a.mmbr_idnt = b.id  ");
		sql.append("\n	and b.uid = ?   ");

		Object[] obj = new Object[1];
		obj[0] = param.getString("uid");

		return Integer.parseInt(dbh.getAData(sql.toString(), obj));
	}



}
