package kr.or.korapis.certi;

import javax.servlet.http.HttpServletRequest;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.vo.MemberVo;

public class MemberDao {
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();
	
	
/*	
	*//**
	 * 회원정보를 수정한다. 
	 * @param req
	 * @return
	 *//*
	public int updateMember(HttpServletRequest req){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	INSERT INTO mice_ex_agent(	");
			sql.append("\n			EX_IDX, AGENT_IDX,AGENT_IDX,AGENT_PWD,AGENT_NAME	");
			sql.append("\n	)	");
			sql.append("\n		select ?, agent_idx, agent_code, agent_code, concat(agent_nm_kor, ' 무역관') 	");
			sql.append("\n		from mice_agent 	");
			sql.append("\n		where agent_idx = ?  	");

			obj = new Object[5];
			int idx = 0;
			obj[idx++] = param.get("EX_IDX");
			obj[idx++] = param.get("AGENT_IDX");
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
	}*/
	
	
	
/*
	*//**
	 * 지회목록가져오기
	 * @param param
	 * @return
	 *//*
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
	
	
	
	*//**
	 * 지회목록가져오기
	 * @param param
	 * @return
	 *//*
	public ResultSetEntity getList_branch_pay(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();
		
		sqlWhere.setLength(0);
		makeWhere_branch(param);
		
		sql.setLength(0);
		sql.append("\n SELECT * ");
		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2015) AS pay_2015	");
		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2014) AS pay_2014	");
		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2013) AS pay_2013	");
		sql.append("\n 	, (SELECT MAX(price) FROM korapis_member_bill b WHERE b.member_uid = m.id AND b.gubun=2012) AS pay_2012	");
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
	
	
	
	
	*//**
	 * 지회목록가져오기
	 * @param param
	 * @return
	 *//*
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
	
	
	
	*//**
	 * 지회목록가져오기
	 * @param param
	 * @return
	 *//*
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
	
	
	
	
	*//**
	 * 조건절 생성
	 *//*
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	*//**
	 * 조건절 생성
	 *//*
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

	
	
	*//**
	 * 회원목록을가져온다.
	 * @param param
	 * @param from
	 * @param cnt
	 * @return
	 *//*
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

	*//**
	 * 총갯수를 가져온다. 
	 * @param param
	 * @return
	 *//*
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
	
	
	
	*//**
	 * 사용자 상세정보를 가져온다.
	 * @param uid
	 * @return
	 *//*
	public MemberVo getDetail(String uid){
		DBHandler dbh = new DBHandler();
		ResultSetEntity d = dbh.getQueryData(" SELECT * FROM komember WHERE uid = ? ", new Object[]{uid});
		return new MemberVo(d);
	}
	
	*/
	
}
