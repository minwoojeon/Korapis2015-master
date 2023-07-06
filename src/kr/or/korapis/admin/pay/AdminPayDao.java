package kr.or.korapis.admin.pay;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;
import kr.or.korapis.vo.PayVo;

public class AdminPayDao {
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();


	
	/**
	 * 회비납부정보 등록
	 * @param param
	 * @return
	 */
	public int insert(MiceParam param,String memberUid){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	INSERT INTO korapis_member_bill (	");
			sql.append("\n		member_uid, gubun, paydate, pay, price, TS	");
			sql.append("\n	)VALUES(	");
			sql.append("\n		?, ?, ?, ?, ?, NOW()	");
			sql.append("\n	)	");

			obj = new Object[5];
			int idx = 0;
			//obj[idx++] = param.get("price_memberuid");
			obj[idx++] = memberUid;
			obj[idx++] = param.get("price_gubun");
			obj[idx++] = param.get("price_paydate");
			obj[idx++] = param.get("price_pay");
			obj[idx++] = param.get("price_price");
			
			trh.setQueryData(sql.toString(), obj);
			
			
			//회원관리(수정일)순으로 정렬 시 회비납부한 사람도 최근수정으로 포함되므로, (2015.06.10) ts를 업데이트해야함.
			//회비납부(insert, update, delete) 모두
			sql.setLength(0);
			sql.append(" update komember set ts=now() where id = ? ");
			trh.setQueryData(sql.toString(), new Object[]{ memberUid });
			

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
	 * 회비납부정보 수정
	 * @param param
	 * @return
	 */
	public int update(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	UPDATE `korapis_member_bill` 	");
			sql.append("\n	SET `gubun` = ? , 	");
			sql.append("\n		`paydate` = ?, 	");
			sql.append("\n		`pay` = ? , 	");
			sql.append("\n		`price` = ? , 	");
			sql.append("\n		`TS` = now()	");
			sql.append("\n	WHERE `uid` = ?	");
			

			obj = new Object[5];
			int idx = 0;
			obj[idx++] = param.get("price_gubun");
			obj[idx++] = param.get("price_paydate");
			obj[idx++] = param.get("price_pay");
			obj[idx++] = param.get("price_price");
			obj[idx++] = param.get("price_uid");
			
			trh.setQueryData(sql.toString(), obj);

			
			//회원관리(수정일)순으로 정렬 시 회비납부한 사람도 최근수정으로 포함되므로, (2015.06.10) ts를 업데이트해야함.
			//회비납부(insert, update, delete) 모두
			sql.setLength(0);
			sql.append(" update komember set ts=now() where id = ? ");
			trh.setQueryData(sql.toString(), new Object[]{ param.getString("price_memberuid") });
			
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
	 * 회비납부정보 삭제
	 * @param param
	 * @return
	 */
	public int delete(MiceParam param){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		
		try{
			sql.setLength(0);
			sql.append("\n	delete from `korapis_member_bill` 	");
			sql.append("\n	WHERE `uid` = ?	");
			
			obj = new Object[1];
			int idx = 0;
			obj[idx++] = param.get("price_uid");
			
			trh.setQueryData(sql.toString(), obj);

			
			//회원관리(수정일)순으로 정렬 시 회비납부한 사람도 최근수정으로 포함되므로, (2015.06.10) ts를 업데이트해야함.
			//회비납부(insert, update, delete) 모두
			sql.setLength(0);
			sql.append(" update komember set ts=now() where id = ? ");
			trh.setQueryData(sql.toString(), new Object[]{ param.getString("price_memberuid") });
			
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
	 * 회비납부목록을 가져온다
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList_admin(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();
		sqlWhere.setLength(0);
		makeWhere_admin(param);
		
		sql.setLength(0);
		sql.append("\n SELECT p.uid	");
		sql.append("\n 	, p.member_uid	");
		sql.append("\n 	, p.gubun	");
		sql.append("\n 	, p.paydate	");
		sql.append("\n 	, p.pay	");
		sql.append("\n 	, p.price	");
		sql.append("\n 	, m.name	");
		sql.append("\n 	, m.id	");
		sql.append("\n 	, m.uid as muid	");
		sql.append("\n 	, m.branch1	");
		sql.append("\n 	, m.branch2 ");
		sql.append("\n FROM korapis_member_bill p, komember m	");
		sql.append("\n where p.member_uid = m.id	");
		sql.append(sqlWhere);
		sql.append("\n ORDER BY p.uid DESC	");
		sql.append("\n limit ?, ?				");
		Object[] obj = new Object[2];
		obj[0] = from;
		obj[1] = cnt;
		  

		return dbh.getQueryData(sql.toString(), obj);
	}
	public long[] getList_admin_tot(MiceParam param){
		DBHandler dbh = new DBHandler();
		
		sqlWhere.setLength(0);
		makeWhere_admin(param);
		
		sql.setLength(0);
		sql.append("\n SELECT count(p.uid), sum(p.price)	");
		sql.append("\n FROM korapis_member_bill p, komember m	");
		sql.append("\n where p.member_uid = m.id	");
		sql.append(sqlWhere);
		
		ResultSetEntity data = dbh.getQueryData(sql.toString());
		data.next();
		
		return new long[]{Long.parseLong(data.getString(0)), (long)Double.parseDouble(data.getString(1)) };
	}
	
	private void makeWhere_admin(MiceParam param){
		//납부일
		if(!"".equals(param.getString("selPaydate_from"))){
			sqlWhere.append("\n and p.paydate >= cast(").append(param.getString("selPaydate_from")).append(" as date) ");
		}
		if(!"".equals(param.getString("selPaydate_to"))){
			sqlWhere.append("\n and p.paydate < adddate(cast(").append(param.getString("selPaydate_to")).append(" as date), 1) ");
		}
		//구분
		if(!"".equals(param.getString("selGubun"))){
			sqlWhere.append("\n and p.gubun = '").append(param.getString("selGubun")).append("' ");
		}
		//지회
		if(!"".equals(param.getString("selBranch1"))){
			sqlWhere.append("\n and m.branch1 like '%").append(param.getString("selBranch1")).append("%' ");
		}
		//지부
		if(!"".equals(param.getString("selBranch2"))){
			sqlWhere.append("\n and m.branch2 like '%").append(param.getString("selBranch2")).append("%' ");
		}
		//이름
		if(!"".equals(param.getString("selName"))){
			sqlWhere.append("\n and m.name like '%").append(param.getString("selName")).append("%' ");
		}
		//아이디
		if(!"".equals(param.getString("selId"))){
			sqlWhere.append("\n and m.id = '").append(param.getString("selId")).append("' ");
		}
		
		
		if(!"".equals(param.getString("selMembercode"))){
			sqlWhere.append("\n and m.member_code like '%").append(param.getString("selMembercode")).append("%' ");
		}
		
	}
	
	
	/**
	 * 회비납부상세내역을 가져온다.
	 * @param uid
	 * @return
	 */
	public PayVo getDetail(String uid){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n select p.*	");
		sql.append("\n 		, m.id		as member_id	");
		sql.append("\n 		, m.name	as member_name	");
		sql.append("\n 	from korapis_member_bill p, komember m");
		sql.append("\n 	where p.member_uid = m.uid ");
		sql.append("\n 	and p.uid=?	");
		
		Object[] obj = new Object[1];
		obj[0] = uid;
		
		return new PayVo(dbh.getQueryData(sql.toString(), obj));
	}
	
		
}
