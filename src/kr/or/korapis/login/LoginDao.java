package kr.or.korapis.login;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.vo.UserInfoVo;





public class LoginDao {

	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();


	
	/**
	 * 홈페이지 로그인세션정보
	 * @param id
	 * @param pwd
	 * @return
	 */
	public UserInfoVo getUserInfo(String id, String pwd, String userGbn){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		if("01".equals(userGbn)){
			sql.append(" SELECT * FROM komember WHERE id=? AND passwd=? ");
		}else{
			sql.append(" SELECT * FROM usermember WHERE id=? AND passwd=? ");
		}
		ResultSetEntity d = dbh.getQueryData(sql.toString(), new Object[]{id, pwd});
		
		UserInfoVo vo = new UserInfoVo(d, UserInfoVo.MEMBER);
		
		if("01".equals(userGbn)){
			vo.setUserGbn("01");
		}else{
			vo.setUserGbn("02");
		}
		
		return vo;
	}
	

	
	/**
	 * 관리자 시스템 로그인세션정보
	 * @param id
	 * @param pwd
	 * @return
	 */
	public UserInfoVo getAdminInfo(String id, String pwd){
		DBHandler dbh = new DBHandler();
		
		sql.setLength(0);
		sql.append(" SELECT * FROM useradmin WHERE id=? AND passwd=? AND del_yn='N' ");
		ResultSetEntity d = dbh.getQueryData(sql.toString(), new Object[]{id, pwd});
		UserInfoVo vo = new UserInfoVo(d, UserInfoVo.ADMIN);
		return vo;
	}
		
}
