package kr.or.korapis.member;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.frame.MiceParam;

public class CertiDao {

	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();
	
	
	

	/**
	 * 회비납부내역을 가져온다.
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList(MiceParam param){
		DBHandler dbh = new DBHandler();
		StringBuffer sql = new StringBuffer();
		
		sql.append("\n select A10.uid	");
		sql.append("\n 	, A10.regnum	");
		sql.append("\n 	, A10.bongin	");
		sql.append("\n 	, A10.검체표시	");
		sql.append("\n 	, A10.rqst_prdt_name	");
		sql.append("\n 	, A20.name	");
		sql.append("\n 	, A10.rqst_nmbr	");
		sql.append("\n 	, A10.recv_date	");
		sql.append("\n	, A10.test_endd_date");
		sql.append("\n 	, A10.test_rslt	");
		sql.append("\n FROM korapis_test2 A10, komember A20	");
		sql.append("\n WHERE  A20.id = A10.mmbr_idnt  AND  A10.mmbr_idnt = ?");
		sql.append("\n 		AND (A10.del_yn != 'Y' OR A10.del_yn IS NULL)	");
		sql.append("\n ORDER BY   A10.uid DESC	");

		return dbh.getQueryData(sql.toString(), new Object[]{ param.getString("member_id")});
	}
	
	
	
	/**
	 * 시험성적서 상세정보를 가져온다.
	 * @param uid
	 * @return
	 */
	public ResultSetEntity getDetail(String uid){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n select 	");                                                      				
		sql.append("\n      A10.uid                     -- uid 	");
		sql.append("\n 	,   A10.regnum                  -- 처리번호 	");
		sql.append("\n 	,   A10.bongin                  -- 봉인번호 	");
		sql.append("\n 	,   A10.mmbr_idnt               -- ID 	");
		sql.append("\n 	,   A20.name                    -- 성명 	");
		sql.append("\n 	,   A10.recv_date               -- 접수일자 	");
		sql.append("\n 	,   A10.test_endd_date          -- 완료일자 	");
		
		sql.append("\n 	,   concat('[',IFNULL(A20.hzipcode3,''),']'        -- 집 주소 	");
		sql.append("\n 			,' ', IFNULL(A20.haddr1,'')                                   	");
		sql.append("\n 			,' ', IFNULL(A20.haddr2,'') )  home_addr                      	");
		
		sql.append("\n 	,   concat('[',IFNULL(A20.ozipcode3,''),']'        -- 사무실 주소 	");
		sql.append("\n 			, ' ', IFNULL(A20.oaddr1,'')                                   	");
		sql.append("\n 			, ' ', IFNULL(A20.oaddr2,'') )  offc_addr                      	");
		sql.append("\n 	,   A20.mailreceive             -- 사무실 집 구분 	");
		sql.append("\n 	,   A10.rqst_prdt_name          -- 시험항목 	");
		sql.append("\n 	,   A10.sung_valu               -- 성상 	");
		sql.append("\n 	,   A10.wter                    -- 수분 	");
		sql.append("\n 	,   A10.hwoi                    -- 회분 	");
		sql.append("\n 	,   A10.june_sgar               -- 전화당 	");
		sql.append("\n 	,   A10.ja_sgar                 -- 자당 	");
		sql.append("\n 	,   A10.sando                   -- 산도 	");
		sql.append("\n 	,   A10.gammoryo                -- 사카린나트륨 	");
		sql.append("\n 	,   A10.hmf                     -- HMF 	");
		sql.append("\n 	,   A10.tarr                    -- 타아르 	");
		sql.append("\n 	,   A10.esung                   -- 이성화당 	");
		sql.append("\n 	,   A10.c12                     -- 탄소동위원소 	");
		sql.append("\n 	,   A10.abtc                    -- 항생제 	");
		sql.append("\n 	,   A10.fng                     -- F & G 	");
		sql.append("\n 	,   A10.gita                    -- 기타 	");
		sql.append("\n 	,   A10.test_rslt               -- 판정 	");
		sql.append("\n 	,   A10.rqst_nmbr               -- 접수번호 	");
		sql.append("\n 	,   A10.검체표시              		-- 검체표시     090501추가 	");
		sql.append("\n 	,   A10.클로암페니콜                -- 클로람페니콜 	");
		sql.append("\n 	,   A10.니트로퓨란              	-- 니트로퓨란 	");
		sql.append("\n 	,   A10.설폰아마이드               	-- 설폰아마이드 	");
		sql.append("\n 	,   A10.doxine              	 -- doxine 	");
		sql.append("\n 	,   A10.merazine               	-- merazine 	");
		sql.append("\n 	,   A10.methoxazole               -- methoxazole 	");
		sql.append("\n 	,   A10.pyridine               	-- pyridine 	");
		sql.append("\n 	,   A10.매크로라이드               	-- 매크로라이드 	");
		sql.append("\n 	,   A10.erythro               	-- erythro 	");
		sql.append("\n 	,   A10.spira               	-- spira 	");
		sql.append("\n 	,   A10.tilmico               	-- tilmico 	");
		sql.append("\n 	,   A10.tyrosin               	-- tyrosin 	");
		sql.append("\n 	,   A10.베타락탐               		-- 베타락탐 	");
		sql.append("\n 	,   A10.amoxi             		-- amoxi 	");
		sql.append("\n 	,   A10.ampi            		-- ampi 	");
		sql.append("\n 	,   A10.penicillin               -- penicillin 	");
		sql.append("\n 	,   A10.네오마이신               -- 네오마이신 	");
		sql.append("\n 	,   A10.스트렙토마이신               -- 스트렙토마이신 	");
		sql.append("\n 	,   A10.strep               -- strep 	");
		sql.append("\n 	,   A10.dihydro               -- dihydro 	");
		sql.append("\n 	,   A10.옥시테트라               -- 옥시테트라 	");
		sql.append("\n 	,   A10.테트라사이클린               -- 테트라사이클린 	");
		sql.append("\n 	,   A10.chlor               -- chlor 	");
		sql.append("\n 	,   A10.demeclo               -- demeclo 	");
		sql.append("\n 	,   A10.tetra               -- tetra 	");
		sql.append("\n 	,   A10.doxy               -- doxy 	");
		sql.append("\n 	,   A10.퀴놀론1               -- 퀴놀론1 	");
		sql.append("\n 	,   A10.enro               -- enro 	");
		sql.append("\n 	,   A10.cipro               -- cipro 	");
		sql.append("\n 	,   A10.퀴놀론2               -- 퀴놀론2 	");
		sql.append("\n 	,   A10.dano               -- dano 	");
		sql.append("\n 	,   A10.nor               -- nor 	");
		sql.append("\n 	,   A10.oflo               -- oflo 	");
		sql.append("\n 	,   A10.브로모프로필레이트               -- 브로모프로필레이트 	");
		sql.append("\n 	,   A10.시미아졸               -- 시미아졸 	");
		sql.append("\n 	,   A10.쿠마포스               -- 쿠마포스 	");
		sql.append("\n 	,   A10.아미트라즈               -- 아미트라즈 	");
		sql.append("\n 	,   A10.플루바리네이트               -- 플루바리네이트 	");
		sql.append("\n 	,   A10.플루메쓰린               -- 플루메쓰린 	");
		sql.append("\n 	,   A10.그레이아노톡신               -- 그레이아노톡신 	");
		
		//추가
		sql.append("\n 	,   CONCAT(A20.CP1,'-',A20.CP2,'-',A20.CP3) mobile -- 휴대폰 	");
		sql.append("\n 	,   A10.sel_issuenum            -- 발급번호 	");
		sql.append("\n 	,   A10.검체표시            -- 검체표시 	");
		sql.append("\n 	, 	A10.`등급판정`                AS `등급판정` -- 등급판정 	");
		
		sql.append("\n 	, if(DATEDIFF(test_endd_date, '2009-12-20')>0, 1, 2) AS diffdate	");
		 
		
		sql.append("\n 	from korapis_test2 A10,   komember A20                                  	");
		sql.append("\n 	where A10.uid=?        ");
		sql.append("\n 	AND (A10.del_yn != 'Y' OR A10.del_yn IS NULL)	");
		
		sql.append("\n 	and A20.id=A10.mmbr_idnt ");
		
		Object[] obj = new Object[1];
		obj[0] = uid;
		
		return dbh.getQueryData(sql.toString(), obj);
	}
	
	
	
	
}
