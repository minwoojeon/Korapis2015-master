package kr.or.korapis.admin.certi;


import java.util.StringTokenizer;

import kr.or.korapis.db.DBHandler;
import kr.or.korapis.db.ResultSetEntity;
import kr.or.korapis.db.TransactionHandler;
import kr.or.korapis.frame.MiceParam;
import kr.or.korapis.util.DefaultCode;

public class AdminCertiDao {
	
	
	StringBuffer sql = new StringBuffer();
	StringBuffer sqlWhere = new StringBuffer();
	StringBuffer sqlOrder = new StringBuffer();

	public static final int CERTI_TYPE_DEFAULT = 1;
	public static final int CERTI_TYPE_HAN_0 = 0;
	public static final int CERTI_TYPE_HAN_1 = 1;
	
	/**
	 * 시험성적서 목록을 가져온다.
	 * @param param
	 * @return
	 */
	public ResultSetEntity getList_admin(MiceParam param, int from, int cnt){
		DBHandler dbh = new DBHandler();
		sqlWhere.setLength(0);
		makeWhere_admin(param);
		
		sql.setLength(0);
		sql.append("\n SELECT	");
		sql.append("\n 	  	`korapis_test2`.`sel_issuenum`                AS `sel_issuenum`,	");
		sql.append("\n 	  	`korapis_test2`.`uid`                         AS `NO`,	");
		sql.append("\n 	  	STR_TO_DATE(`korapis_test2`.`recv_date`,_euckr'%Y-%m-%d') AS `접수일`,	");
		sql.append("\n 	  	STR_TO_DATE(`korapis_test2`.`test_endd_date`,_euckr'%Y-%m-%d') AS `시험완료일`,	");
		sql.append("\n 	  	`korapis_test2`.`bongin`                      AS `봉인번호`,	");
		sql.append("\n 	  	`korapis_test2`.`han`                         AS `한벌꿀`,	");
		sql.append("\n 	  	`korapis_test2`.`검체표시`                AS `검체표시`,	");
		sql.append("\n 	  	`korapis_test2`.`mmbr_idnt`                   AS `의뢰자ID`,	");
		sql.append("\n 	  	`korapis_test2`.`regnum`                      AS `접수번호`,	");
		sql.append("\n 	  	`korapis_test2`.`regnum_cnt`                      AS `접수번호 수`,	");
		sql.append("\n 	  	`korapis_test2`.`rqst_prdt_name`              AS `시험항목`,	");
		sql.append("\n 	  	`korapis_test2`.`wght`                        AS `무게`,	");
		sql.append("\n 	  	`korapis_test2`.`aa_F1`                       AS `F`,	");
		sql.append("\n 	  	`korapis_test2`.`등급판정`                       AS `등급판정`,	");
		sql.append("\n 	  	`korapis_test2`.`aa_G1`                       AS `G`,	");
		sql.append("\n 	  	`korapis_test2`.`aa_S1`                       AS `S`,	");
		sql.append("\n 	  	`korapis_test2`.`aa_f2`                       AS `f1`,	");
		sql.append("\n 	  	`korapis_test2`.`aa_g3`                       AS `g1`,	");
		sql.append("\n 	  	`korapis_test2`.`aa_s2`                       AS `s1`,	");
		sql.append("\n 	  	`korapis_test2`.`sgar`                        AS `과당`,	");
		sql.append("\n 	  	`korapis_test2`.`grap_sgar`                   AS `포도당`,	");
		sql.append("\n 	  	`korapis_test2`.`sung`                        AS `성상`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`wter`,_utf8'-')       AS `수분`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`june_sgar`,_utf8'-')  AS `전화당`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`ja_sgar`,_utf8'-')    AS `자당`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`hmf`,_utf8'-')        AS `HMF`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`c12`,_utf8'-')        AS `탄소동위원소`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`fng`,_utf8'-')        AS `F/G`,	");
		sql.append("\n 	  	`korapis_test2`.`클로암페니콜`          AS `클로암페니콜`,	");
		sql.append("\n 	  	`korapis_test2`.`니트로퓨란`             AS `니트로퓨란`,	");
		sql.append("\n 	  	`korapis_test2`.`설폰아마이드`          AS `설폰아마이드`,	");
		sql.append("\n 	  	`korapis_test2`.`매크로라이드`          AS `매크로라이드`,	");
		sql.append("\n 	  	`korapis_test2`.`베타락탐`                AS `베타락탐`,	");
		sql.append("\n 	  	`korapis_test2`.`네오마이신`             AS `네오마이신`,	");
		sql.append("\n 	  	`korapis_test2`.`스트렙토마이신`       AS `스트렙토마이신`,	");
		sql.append("\n 	  	`korapis_test2`.`옥시테트라`             AS `옥시테트라`,	");
		sql.append("\n 	  	`korapis_test2`.`테트라사이클린`       AS `테트라사이클린`,	");
		sql.append("\n 	  	`korapis_test2`.`퀴놀론1`                  AS `퀴놀론1`,	");
		sql.append("\n 	  	`korapis_test2`.`퀴놀론2`                  AS `퀴놀론2`,	");
		sql.append("\n 	  	`korapis_test2`.`브로모프로필레이트` AS `브로모프로필레이트`,	");
		sql.append("\n 	  	`korapis_test2`.`시미아졸`                AS `시미아졸`,	");
		sql.append("\n 	  	`korapis_test2`.`쿠마포스`                AS `쿠마포스`,	");
		sql.append("\n 	  	`korapis_test2`.`아미트라즈`             AS `아미트라즈`,	");
		sql.append("\n 	  	`korapis_test2`.`플루바리네이트`       AS `플루바리네이트`,	");
		sql.append("\n 	  	`korapis_test2`.`플루메쓰린`             AS `플루메쓰린`,	");
		sql.append("\n 	  	`korapis_test2`.`그레이아노톡신`       AS `그레이아노톡신`,	");
		sql.append("\n 	  	`korapis_test2`.`erythro`                     AS `erythro`,	");
		sql.append("\n 	  	`korapis_test2`.`spira`                       AS `spira`,	");
		sql.append("\n 	  	`korapis_test2`.`tilmico`                     AS `tilmico`,	");
		sql.append("\n 	  	`korapis_test2`.`gita`                        AS `기타`,	");
		sql.append("\n 	  	`korapis_test2`.`sung_valu`                   AS `성상1`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`hwoi`,_utf8'-')       AS `물불용물`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`sando`,_utf8'-')      AS `산도`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`gammoryo`,_utf8'-')   AS `사카린나트륨`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`tarr`,_utf8'-')       AS `타이르색소`,	");
		sql.append("\n 	  	IFNULL(`korapis_test2`.`esung`,_utf8'-')      AS `이성화당`,	");
		sql.append("\n 	  	`korapis_test2`.`test_rslt`                   AS `판정`,	");
		sql.append("\n 	  	`komember`.`name`                             AS `성명`,	");
		sql.append("\n 	  	`komember`.`uid`                             AS member_uid,	");
		sql.append("\n 	  	`komember`.`member_code`                     AS member_code,	");
		sql.append("\n 	  	(CASE `komember`.`mailreceive` WHEN _utf8'H' THEN _utf8'자택' WHEN _utf8'O' THEN _utf8'사업장' ELSE _utf8'' END) AS `우편물수취`,	");
		sql.append("\n 	  	(CASE `komember`.`mailreceive` WHEN _euckr'H' THEN `komember`.`Hzipcode3` WHEN _euckr'O' THEN `komember`.`Ozipcode3` ELSE _euckr'' END) AS `S우편번호`,	");
		sql.append("\n 	  	(CASE `komember`.`mailreceive` WHEN _euckr'H' THEN CONCAT(`komember`.`Haddr1`,IFNULL(`komember`.`Haddr2`,_utf8'')) WHEN _euckr'O' THEN CONCAT(`komember`.`Oaddr1`,IFNULL(`komember`.`Oaddr2`,_utf8'')) ELSE _euckr'' END) AS `S주소`	");
		sql.append("\n	FROM `korapis_test2` LEFT JOIN `komember`	");
		sql.append("\n 	ON `korapis_test2`.`mmbr_idnt` = `komember`.`id`	");
		sql.append("\n 	where 1=1	");
		sql.append("\n 	AND (korapis_test2.del_yn != 'Y' OR korapis_test2.del_yn IS NULL)	");
		sql.append(sqlWhere);
		sql.append("\n 	ORDER BY korapis_test2.uid DESC	");
		sql.append("\n limit ?, ?				");
		Object[] obj = new Object[2];
		obj[0] = from;
		obj[1] = cnt;
		  

		return dbh.getQueryData(sql.toString(), obj);
	}
	public int getList_admin_tot(MiceParam param){
		DBHandler dbh = new DBHandler();
		
		sqlWhere.setLength(0);
		makeWhere_admin(param);
		
		sql.setLength(0);
		sql.append("\n SELECT count(korapis_test2.uid) ");
		sql.append("\n	FROM `korapis_test2` LEFT JOIN `komember`	");
		sql.append("\n 	ON `korapis_test2`.`mmbr_idnt` = `komember`.`id`	");
		sql.append("\n 	where 1=1	");
		sql.append("\n 	AND (korapis_test2.del_yn != 'Y' OR korapis_test2.del_yn IS NULL)	");
		sql.append(sqlWhere);
		
		return Integer.parseInt(dbh.getAData(sql.toString()));
	}
	private void makeWhere_admin(MiceParam param){
		//접수일
		if(!"".equals(param.getString("sel_recv_date_from"))){
			sqlWhere.append("\n and korapis_test2.recv_date >= cast(").append(param.getString("sel_recv_date_from")).append(" as date) ");
		}
		if(!"".equals(param.getString("sel_recv_date_to"))){
			sqlWhere.append("\n and korapis_test2.recv_date < adddate(cast(").append(param.getString("sel_recv_date_to")).append(" as date), 1) ");
		}

		//접수번호	
		if(!"".equals(param.getString("sel_regnum_from"))){
			if("".equals(param.getString("sel_regnum_to"))) {
				sqlWhere.append("\n and korapis_test2.regnum like '%").append(param.getString("sel_regnum_from")).append("%'");
			}
			sqlWhere.append("\n and korapis_test2.regnum >= '").append(param.getString("sel_regnum_from")).append("' ");
		}
		if(!"".equals(param.getString("sel_regnum_to"))){
			sqlWhere.append("\n and korapis_test2.regnum <= '").append(param.getString("sel_regnum_to")).append("' ");
		}
		
		//성명
		if(!"".equals(param.getString("sel_name"))){
			sqlWhere.append("\n and komember.name like '%").append(param.getString("sel_name")).append("%' ");
		}

		//검체표시
		if(!"".equals(param.getString("sel_uripoomname"))){
			sqlWhere.append("\n and korapis_test2.검체표시 like '%").append(param.getString("sel_uripoomname")).append("%' ");
		}
		
		
		//시험완료일
		if(!"".equals(param.getString("sel_test_endd_date_from"))){
			if("".equals(param.getString("sel_test_endd_date_to"))) {
				sqlWhere.append("\n and korapis_test2.test_endd_date = cast(").append(param.getString("sel_test_endd_date_from")).append(" as date) ");
			}else {
			sqlWhere.append("\n and korapis_test2.test_endd_date >= cast(").append(param.getString("sel_test_endd_date_from")).append(" as date) ");
			}
		}
		if(!"".equals(param.getString("sel_test_endd_date_to"))){
			sqlWhere.append("\n and korapis_test2.test_endd_date <= adddate(cast(").append(param.getString("sel_test_endd_date_to")).append(" as date), 1) ");
		}
		
	
		//봉인번호
		if(!"".equals(param.getString("sel_bongin_from"))){
			if("".equals(param.getString("sel_bongin_to"))) {
				sqlWhere.append("\n and korapis_test2.bongin like '%").append(param.getString("sel_bongin_from")).append("%'");
			}else {
			sqlWhere.append("\n and korapis_test2.bongin >='").append(param.getString("sel_bongin_from")).append("' ");
			}
		}
		if(!"".equals(param.getString("sel_bongin_to"))){
			sqlWhere.append("\n and korapis_test2.bongin <= '").append(param.getString("sel_bongin_to")).append("' ");
		}
		//시험항목
		if(!"".equals(param.getString("sel_rqst_prdt_name"))){
			sqlWhere.append("\n and korapis_test2.rqst_prdt_name like '%").append(param.getString("sel_rqst_prdt_name")).append("%' ");
		}
		
		

		//NO	
		if(!"".equals(param.getString("sel_uid_from"))){
			sqlWhere.append("\n and korapis_test2.uid >= '").append(param.getString("sel_uid_from")).append("' ");
		}
		if(!"".equals(param.getString("sel_uid_to"))){
			sqlWhere.append("\n and korapis_test2.uid <= '").append(param.getString("sel_uid_to")).append("' ");
		}
		

		
		//판정여부
		if(!"".equals(param.getString("sel_test_rslt"))){
			sqlWhere.append("\n and korapis_test2.test_rslt like '%").append(param.getString("sel_test_rslt")).append("%' ");
		}
	
		if("Y".equals(param.getString("sel_han"))){
			sqlWhere.append("\n and korapis_test2.han != '0' ");
		}
		
		
		//발급번호
		if(!"".equals(param.getString("sel_issuenum"))){
			sqlWhere.append("\n and korapis_test2.sel_issuenum like '%").append(param.getString("sel_issuenum")).append("%' ");
		}
		//협회코드
		if(!"".equals(param.getString("sel_member_code"))){
			sqlWhere.append("\n and komember.member_code like '%").append(param.getString("sel_member_code")).append("%' ");
		}
		
	}
	
	
	/**
	 * 시험성적서 상세정보를 가져온다.
	 * PDF단일 다운로드에서도 사용됨.
	 * @param uid
	 * @return
	 */
	public ResultSetEntity getDetail(MiceParam param,String uid){
		DBHandler dbh = new DBHandler();
		sql.setLength(0);
		sql.append("\n select 	");                                                      				
		sql.append("\n      A10.uid                     -- uid 	");        				
		sql.append("\n ,   A10.han                     -- han 	");
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
		sql.append("\n 	,   CONCAT(A20.Hphone1,'-',A20.Hphone2,'-',A20.Hphone3) Hphone -- 전화번호 	");
		sql.append("\n 	, 	A10.`검체표시`                AS `검체표시` -- 검체표시 	");
		sql.append("\n 	, 	A10.`등급판정`                AS `등급판정` -- 등급판정 	");
		
		sql.append("\n 	, if(DATEDIFF(test_endd_date, '2009-12-20')>0, 1, 2) AS diffdate	");
		 
		
		sql.append("\n 	from korapis_test2 A10,   komember A20                                  	");
		sql.append("\n 	where A10.uid=?        ");
		sql.append("\n 	and A20.id=A10.mmbr_idnt ");
		
		Object[] obj = new Object[1];
		obj[0] = uid;
		
		return dbh.getQueryData(sql.toString(), obj);
	}
	
	
	/**
	 * 시험성적서 상세정보를 가져온다.PDF 검색조건활용한 다운로드(전체)
	 * @param uid
	 * @return
	 */
	public ResultSetEntity getDetail_ALLPDF(MiceParam param){
		DBHandler dbh = new DBHandler();
		Object[] obj = null;
		sqlWhere.setLength(0);
		makeWhere_admin(param);
		
		sql.setLength(0);
		sql.append("\n select 	");                                                      				
		sql.append("\n      korapis_test2.uid                     -- uid 	");
		sql.append("\n 	,   korapis_test2.han                  -- han 	");
		sql.append("\n 	,   korapis_test2.regnum                  -- 처리번호 	");
		sql.append("\n 	,   korapis_test2.bongin                  -- 봉인번호 	");
		sql.append("\n 	,   korapis_test2.mmbr_idnt               -- ID 	");
		sql.append("\n 	,   A20.name                    -- 성명 	");
		sql.append("\n 	,   korapis_test2.recv_date               -- 접수일자 	");
		sql.append("\n 	,   korapis_test2.test_endd_date          -- 완료일자 	");
		sql.append("\n 	,   concat('[',IFNULL(A20.hzipcode3,'') ,']'       -- 집 주소 	");
		sql.append("\n 			,' ', IFNULL(A20.haddr1,'')                                   	");
		sql.append("\n 			,' ', IFNULL(A20.haddr2,'') )  home_addr                      	");
		
		sql.append("\n 	,   concat('[',IFNULL(A20.ozipcode3,''),']'        -- 사무실 주소 	");
		sql.append("\n 			, ' ', IFNULL(A20.oaddr1,'')                                   	");
		sql.append("\n 			, ' ', IFNULL(A20.oaddr2,'') )  offc_addr                      	");
		sql.append("\n 	,   A20.mailreceive             -- 사무실 집 구분 	");
		sql.append("\n 	,   CONCAT(A20.Hphone1,'-',A20.Hphone2,'-',A20.Hphone3) Hphone -- 전화번호 	");
		sql.append("\n 	,   CONCAT(A20.CP1,'-',A20.CP2,'-',A20.CP3) mobile -- 휴대폰 	");
		sql.append("\n 	,   korapis_test2.sel_issuenum            -- 발급번호 	");
		sql.append("\n 	,   korapis_test2.rqst_prdt_name          -- 시험항목 	");
		sql.append("\n 	,   korapis_test2.sung_valu               -- 성상 	");
		sql.append("\n 	,   korapis_test2.wter                    -- 수분 	");
		sql.append("\n 	,   korapis_test2.hwoi                    -- 회분 	");
		sql.append("\n 	,   korapis_test2.june_sgar               -- 전화당 	");
		sql.append("\n 	,   korapis_test2.ja_sgar                 -- 자당 	");
		sql.append("\n 	,   korapis_test2.sando                   -- 산도 	");
		sql.append("\n 	,   korapis_test2.gammoryo                -- 사카린나트륨 	");
		sql.append("\n 	,   korapis_test2.hmf                     -- HMF 	");
		sql.append("\n 	,   korapis_test2.tarr                    -- 타아르 	");
		sql.append("\n 	,   korapis_test2.esung                   -- 이성화당 	");
		sql.append("\n 	,   korapis_test2.c12                     -- 탄소동위원소 	");
		sql.append("\n 	,   korapis_test2.abtc                    -- 항생제 	");
		sql.append("\n 	,   korapis_test2.fng                     -- F & G 	");
		sql.append("\n 	,   korapis_test2.gita                    -- 기타 	");
		sql.append("\n 	,   korapis_test2.test_rslt               -- 판정 	");
		sql.append("\n 	,   korapis_test2.rqst_nmbr               -- 접수번호 	");
		sql.append("\n 	,   korapis_test2.검체표시              		-- 검체표시     090501추가 	");
		sql.append("\n 	,   korapis_test2.클로암페니콜                -- 클로람페니콜 	");
		sql.append("\n 	,   korapis_test2.니트로퓨란              	-- 니트로퓨란 	");
		sql.append("\n 	,   korapis_test2.설폰아마이드               	-- 설폰아마이드 	");
		sql.append("\n 	,   korapis_test2.doxine              	 -- doxine 	");
		sql.append("\n 	,   korapis_test2.merazine               	-- merazine 	");
		sql.append("\n 	,   korapis_test2.methoxazole               -- methoxazole 	");
		sql.append("\n 	,   korapis_test2.pyridine               	-- pyridine 	");
		sql.append("\n 	,   korapis_test2.매크로라이드               	-- 매크로라이드 	");
		sql.append("\n 	,   korapis_test2.erythro               	-- erythro 	");
		sql.append("\n 	,   korapis_test2.spira               	-- spira 	");
		sql.append("\n 	,   korapis_test2.tilmico               	-- tilmico 	");
		sql.append("\n 	,   korapis_test2.tyrosin               	-- tyrosin 	");
		sql.append("\n 	,   korapis_test2.베타락탐               		-- 베타락탐 	");
		sql.append("\n 	,   korapis_test2.amoxi             		-- amoxi 	");
		sql.append("\n 	,   korapis_test2.ampi            		-- ampi 	");
		sql.append("\n 	,   korapis_test2.penicillin               -- penicillin 	");
		sql.append("\n 	,   korapis_test2.네오마이신               -- 네오마이신 	");
		sql.append("\n 	,   korapis_test2.스트렙토마이신               -- 스트렙토마이신 	");
		sql.append("\n 	,   korapis_test2.strep               -- strep 	");
		sql.append("\n 	,   korapis_test2.dihydro               -- dihydro 	");
		sql.append("\n 	,   korapis_test2.옥시테트라               -- 옥시테트라 	");
		sql.append("\n 	,   korapis_test2.테트라사이클린               -- 테트라사이클린 	");
		sql.append("\n 	,   korapis_test2.chlor               -- chlor 	");
		sql.append("\n 	,   korapis_test2.demeclo               -- demeclo 	");
		sql.append("\n 	,   korapis_test2.tetra               -- tetra 	");
		sql.append("\n 	,   korapis_test2.doxy               -- doxy 	");
		sql.append("\n 	,   korapis_test2.퀴놀론1               -- 퀴놀론1 	");
		sql.append("\n 	,   korapis_test2.enro               -- enro 	");
		sql.append("\n 	,   korapis_test2.cipro               -- cipro 	");
		sql.append("\n 	,   korapis_test2.퀴놀론2               -- 퀴놀론2 	");
		sql.append("\n 	,   korapis_test2.dano               -- dano 	");
		sql.append("\n 	,   korapis_test2.nor               -- nor 	");
		sql.append("\n 	,   korapis_test2.oflo               -- oflo 	");
		sql.append("\n 	,   korapis_test2.브로모프로필레이트               -- 브로모프로필레이트 	");
		sql.append("\n 	,   korapis_test2.시미아졸               -- 시미아졸 	");
		sql.append("\n 	,   korapis_test2.쿠마포스               -- 쿠마포스 	");
		sql.append("\n 	,   korapis_test2.아미트라즈               -- 아미트라즈 	");
		sql.append("\n 	,   korapis_test2.플루바리네이트               -- 플루바리네이트 	");
		sql.append("\n 	,   korapis_test2.플루메쓰린               -- 플루메쓰린 	");
		sql.append("\n 	,   korapis_test2.그레이아노톡신               -- 그레이아노톡신 	");
		
		sql.append("\n 	, 	korapis_test2.`등급판정`                AS `등급판정` -- 등급판정 	");
		
		sql.append("\n 	, if(DATEDIFF(test_endd_date, '2009-12-20')>0, 1, 2) AS diffdate	");
		 
		
		sql.append("\n 	from korapis_test2 korapis_test2,   komember A20                                  	");
		sql.append("\n 	where 1=1        ");
		sql.append("\n 	AND (korapis_test2.del_yn != 'Y' OR korapis_test2.del_yn IS NULL)	");
		sql.append("\n 	and A20.id=korapis_test2.mmbr_idnt ");
		
		if(!("0".equals(param.getString("no"))
				|| "-1".equals(param.getString("no")))
				){
			sql.append("\n 	and korapis_test2.uid in ("+param.getString("no")+")");	
		}
		
		return dbh.getQueryData(sql.toString());
	}
	
	
	/**
	 * 성적서삭제
	 * @param no
	 * @return
	 */
	public int del_Board(MiceParam param, int no){
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		try{
			//1. 전송이력
			sql.setLength(0);
			
			sql.append("\n	UPDATE KORAPIS_TEST2 SET" ); 
			sql.append("\n	DEL_YN =  'Y'			");
			sql.append("\n	WHERE UID = ?		");
			StringTokenizer st = new StringTokenizer(sql.toString(), "?");
			int cnt = st.countTokens();
			int idx = 0;
			obj = new Object[cnt-1];
			obj[idx++] = no;
			
			
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
	
	public int update_maxRegnumCnt(MiceParam param,String regCnt) {
		
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		
		
		try {
			sql.setLength(0);
			sql.append("\n	UPDATE	");
			sql.append("\n		korapis_test2	");
			sql.append("\n	SET	");
			sql.append("\n		regnum_cnt =");
			sql.append("\n		(SELECT	");
			sql.append("\n			*");
			sql.append("\n		FROM");
			sql.append("\n			(SELECT");
			sql.append("\n				COUNT(regnum) -1 ");
			sql.append("\n		 	FROM	");
			sql.append("\n				korapis_test2");
			sql.append("\n			 WHERE regnum = ?	");
			sql.append("\n				AND del_yn IS NULL) AS t1)");
			sql.append("\n	WHERE uid =	");
			sql.append("\n		(SELECT * FROM");
			sql.append("\n			(SELECT  " );
			sql.append("\n			MAX(uid)");
			sql.append("\n		FROM");
			sql.append("\n			korapis_test2");
			sql.append("\n		 WHERE regnum = ? ");
			sql.append("\n			AND del_yn IS NULL) AS t2);");
			
			
			Object[] obj = new Object[2];
			obj[0] = regCnt;
			obj[1] = regCnt;
			
			
			trh.setQueryData(sql.toString(), obj);
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
	
public int update_otherRegnumCnt(MiceParam param,String regnum) {
		
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		
		
		try {
			sql.setLength(0);
			sql.append("\n	UPDATE	");
			sql.append("\n		korapis_test2	");
			sql.append("\n	SET	");
			sql.append("\n		regnum_cnt = regnum_cnt - 1	");
			sql.append("\n	WHERE regnum = ?	");
			sql.append("\n		AND del_yn IS NULL");
			sql.append("\n 		AND uid != ");
			sql.append("\n			(SELECT * FROM");
			sql.append("\n				(SELECT  " );
			sql.append("\n				MAX(uid)");
			sql.append("\n			FROM");
			sql.append("\n				korapis_test2");
			sql.append("\n			 WHERE regnum =  ? ");
			sql.append("\n				AND del_yn IS NULL) AS t2);");
			
			
			Object[] obj = new Object[2];
			obj[0] = regnum;
			obj[1] = regnum;
			
			
			trh.setQueryData(sql.toString(), obj);
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

	public int update_regnumCnt(MiceParam param, String regnum,int regCnt) {
		
		TransactionHandler trh = new TransactionHandler();
		int ret = DefaultCode.FAIL;
		
		try {
			sql.setLength(0);
			sql.append("\n	UPDATE	");
			sql.append("\n		korapis_test2	");
			sql.append("\n	SET	");
			sql.append("\n		regnum_cnt = ? ");
			sql.append("\n	WHERE regnum = ?	");
		
			Object[] obj = new Object[2];
			obj[0] = regnum;
			obj[1] = regCnt;
			
			
			trh.setQueryData(sql.toString(), obj);
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
	
	public int update_certi(MiceParam param) {
		
		TransactionHandler trh = new TransactionHandler();
		
		int ret = DefaultCode.FAIL;
		Object[] obj = null;
		String[] arr = new String[]{"regnum","recv_date","rqst_prdt_name","bongin","test_endd_date","검체표시","sung_valu","wter","ja_sgar","june_sgar","fng","hmf","sando","hwoi","tarr",
									"gammoryo","esung","c12","클로암페니콜","스트렙토마이신","시미아졸","니트로퓨란","옥시테트라","쿠마포스","설폰아마이드","테트라사이클린","아미트라즈","매크로라이드","퀴놀론1","플루바리네이트",
									"베타락탐","퀴놀론2","플루메쓰린","네오마이신","브로모프로필레이트","그레이아노톡신","등급판정","test_rslt","uid"};
		
		try {
			sql.setLength(0);
			
			sql.append("\n	UPDATE korapis_test2 SET	");
			sql.append("\n		regnum = ?");
			sql.append("\n		,recv_date= ?");
			sql.append("\n		,rqst_prdt_name = ?"); 	// 시험항목
			sql.append("\n		,bongin = ?"); 		// 봉인번호
			sql.append("\n		,test_endd_date = ?"); 	// 완료일
			sql.append("\n		,검체표시 = ?"); 		// 검체표시
			sql.append("\n		,sung_valu = ?"); 		// 성상
			sql.append("\n		,wter = ?"); 		// 수분
			sql.append("\n		,ja_sgar = ?");		// 자당
			sql.append("\n		,june_sgar = ?"); 		// 전화당
			sql.append("\n		,fng = ?"); 		// 당비율
			sql.append("\n		,hmf = ?"); 		// H.M.F
			sql.append("\n		,sando = ?"); 		// 산도
			sql.append("\n		,hwoi = ?"); 		// 물불용물
			sql.append("\n		,tarr = ?"); 		// 타르색소
			sql.append("\n		,gammoryo = ?");		// 사카린나트륨
			sql.append("\n		,esung = ?");		// 이성화당
			sql.append("\n		,c12 = ?");		// 탄소동위원소비
			sql.append("\n		,클로암페니콜 = ?");		// 클로암페니콜
			sql.append("\n		,스트렙토마이신 = ?");	// 스트렙토마이신
			sql.append("\n		,시미아졸 = ?");		// 시미아졸
			sql.append("\n		,니트로퓨란 = ?");		// 니트로퓨란
			sql.append("\n		,옥시테트라 = ?");		// 옥시테트라
			sql.append("\n		,쿠마포스 = ?");		// 코마포스
			sql.append("\n		,설폰아마이드 = ?");		// 설폰아마이드
			sql.append("\n		,테트라사이클린 = ?");	// 테트라사이클린
			sql.append("\n		,아미트라즈 = ?");		// 아미트라즈
			sql.append("\n		,매크로라이드 = ?");		// 매크로라이드
			sql.append("\n		,퀴놀론1 = ?");		// 퀴놀론1
			sql.append("\n		,플루바리네이트 = ?");	// 플루바리네이트
			sql.append("\n		,베타락탐 = ?");		// 베타락탐
			sql.append("\n		,퀴놀론2	= ?");		// 퀴놀론2
			sql.append("\n		,플루메쓰린 = ?");		// 플루메쓰린
			sql.append("\n		,네오마이신 = ?");		// 네오마이신
			sql.append("\n		,브로모프로필레이트 = ?");	// 브로모프로필레이트
			sql.append("\n		,그레이아노톡신 = ?"); 	// 그레이아노톡신		
			sql.append("\n		,등급판정 = ?"); 	// 종합결과
			sql.append("\n		,test_rslt = ?"); 	// 종합결과	
			sql.append("\n		WHERE uid = ?");
			
			StringTokenizer st = new StringTokenizer(sql.toString(), "?");
			int cnt = st.countTokens();
			
			
			obj = new Object[cnt];
			
			for(int i=0;i<cnt;i++) {
				obj[i] = param.get(arr[i]);
			}
			
			trh.setQueryData(sql.toString(), obj);
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
	
		
}
