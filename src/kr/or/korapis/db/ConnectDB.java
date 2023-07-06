package kr.or.korapis.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import kr.or.korapis.util.DefaultCode;



public class ConnectDB {
	private static DataSource ds = null;
	private Connection conn = null;

    PreparedStatement pstmt = null;
    ResultSet result = null;

    		
//    		
//    /**
//     * 생성자.
//     * jdbc이름을 받아 해당되는 Connection을 가져온다.
//     * @param String
//     */
//	public ConnectDB(){
//			
//		try{
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE", "exhibitor", "***REMOVED***");
//			conn.setAutoCommit(false);
//		
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//	}
	
//    /**
//     * Library:		commons-collections-3.2.1.jar
//     * 				commons-dbcp-1.3.jar
//     * 				commons-pool-1.5.6.jar
//     * 
//     * 설정파일1: 	context.xml :: <Resource... />
//     * 설정파일2: 	web.xml ::	<resource-ref>.../>
//     */
    
    
    public ConnectDB(int i){
    	try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://49.247.226.15:3306/micehub_1022?zeroDateTimeBehavior=convertToNull&amp;useOldAliasMetadataBehavior=true&amp;autoDeserialize=true", "miceowl", "***REMOVED***");
			//conn.setAutoCommit(false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
    }
    
    
	public ConnectDB(){
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup(DefaultCode.DEFAULT_JNDI);
	    	conn = ds.getConnection();
			conn.setAutoCommit(false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	
	public ConnectDB(String jndi){
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup(jndi);
	    	conn = ds.getConnection();
			conn.setAutoCommit(false);
		
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	



    /**
     * getConnection().
     * Connection을 얻는다.
     * @param void
     * @return Connection
     */
	public Connection getConnection() throws Exception{
		if( conn == null){
			throw new Exception("connection is Not available");
		}
		return conn;
	}
	
    /**
     * release().
     * 사용이 끝난 Connection을 반납한다.
     * @param void
     * @return Connection
     */
	public void release(){
		//release conn into "Connection pool"
		if( conn != null){
			try{
				conn.close();
			}catch(Exception e){}
			conn = null;
		}
	}   
	
	/**
     * close PreparedStatement
    *
    */
   public void closeStatement() {
       if (pstmt != null) {
           try {
               pstmt.close();
           } catch (Exception e) {
               e.printStackTrace();
           }
       }
   }

   /**
    * select query PreparedStatement
    * @param sql    : Query string
    * @return
    * @throws SQLException
    */
   public ResultSet prepareExecute(String sql) throws SQLException {
       try {
           pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
           result = pstmt.executeQuery();
       } catch(Exception e) {
           e.printStackTrace();
       }
       return result;
   }

   /**
    * transaction query PreparedStatement
    * @param sql  : Query string
    * @return
    * @throws SQLException
    */
   public int prepareUpdate(String sql) throws SQLException {
       
       int ireturn = 0;
       try {
           pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
           ireturn = pstmt.executeUpdate();
       } catch (SQLException e) {
           e.printStackTrace();
       }
       
       return ireturn;
   }
	   
}

