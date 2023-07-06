package kr.or.korapis.util;



public class DefaultCode {
	

	public static final String DEFAULT_JNDI ="java:comp/env/jdbc/MySqlDB";
	public static final String JNDI_MYSQL_V21 ="java:comp/env/jdbc/MySqlDB_v21";
	public static final String JNDI_MYSQL_V22 ="java:comp/env/jdbc/MySqlDB_v22";
	
	
	public static final String JNDI_ORACLE ="java:comp/env/jdbc/OracleDB";
	public static final String JNDI_MYSQL ="java:comp/env/jdbc/MySqlDB";

	public static final String GCM_KEY = "here is for gcm key";
	
	public static final String BRANCH2_EXECUTIVE = "[{\"id\":\"회장\",\"name\":\"회장\"},{\"id\":\"부회장\",\"name\":\"부회장\"},{\"id\":\"감사\",\"name\":\"감사\"},{\"id\":\"이사\",\"name\":\"이사\"}]";
	
	
	//일반 Action
	public static final int ACT_DEFAULT 			= 100;
	public static final int ACT_INS	 				= 101;
	public static final int ACT_DEL 				= 102;
	public static final int ACT_UPD 				= 103;
	public static final int ACT_ADD 				= 104;
	public static final int ACT_MOVE 				= 105;
	
	public static final int ACT_LOGIN 				= 106;
	public static final int ACT_LOGOUT 				= 107;
	public static final int ACT_SIGN 				= 108;
	
	public static final int ACT_COST				= 109;
	public static final int ACT_SELF				= 110;
	public static final int ACT_PUB					= 111;

	public static final int ACT_MAIL				= 125;
	
	//첨부파일업로드.
	public static final int ACT_ATTACH_INS 			= 126;
	public static final int ACT_ATTACH_DEL 			= 127;
	public static final int ACT_ATTACH_UPD 			= 128;
	
	
	public static final int ACT_BBS_INS 			= 600;
	public static final int ACT_BBS_DEL 			= 601;
	public static final int ACT_BBS_COMM_INS 		= 602;
	public static final int ACT_BBS_COMM_DEL 		= 603;
	public static final int ACT_NO_AUTH 			= 604;
	
	

	//로그인관련 Action
	public static final int ACT_LOGIN_REQ 			= 701;
	public static final int ACT_JOIN_VALID 			= 702;
	public static final int ACT_FAIR_LOGIN_REQ	= 703;
	public static final int ACT_JOIN_VALID_START 			= 704;
	
	
	//Action RESLUT
	public static final int SUCCESS 		= 1001;
	public static final int FAIL 			= 1002;
	public static final int FAIL_CNT 		= 10021;
	public static final int FAIL_ID 		= 1003;
	public static final int FAIL_PWD 		= 1004;
	public static final int FAIL_IDPWD 		= 10041;
	public static final int FAIL_LOGIN_CANCEL 		= 10042;
	public static final int FAIL_EMAIL		= 1006;
	public static final int EXPIRED 			= 1007;
	public static final int MAIL_SUCCESS 			= 1008;
	public static final int MAIL_FAIL			= 1009;
	
	public static final String UPLOAD_BBS_IMG_PATH = "UPLOAD_BBS_IMG_PATH";
	
	//String Validation RegEx
	public static final String REGEX_EMAIL = "[A-z0-9._%+-]+@[A-z0-9.-]+\\.[A-z]{2,4}";
	
}
