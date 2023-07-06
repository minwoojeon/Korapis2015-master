package kr.or.korapis.db;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import kr.or.korapis.util.DefaultCode;

import org.apache.log4j.Logger;



public class DBHandler {
	private Logger LOG = Logger.getLogger(this.getClass());
	private String jndiName = null;
	private boolean trace = true;

    public boolean isTrace() {
		return trace;
	}

	public void setTrace(boolean trace) {
		this.trace = trace;
	}


	
	/**
     * 생성자.
     * Default JDBC이름을 입력한다.
     * @param void
     */
	public DBHandler() {
		// Default constructor
		this(DefaultCode.DEFAULT_JNDI);
	}
	
    /**
     * 생성자.
     * JDBC이름을 받아 입력한다.
     * @param String
     */
	public DBHandler(String jndiName) {
		// Default constructor
		this.jndiName = jndiName;
	}
	
	public PreparedStatement prepareStatement( Connection conn, String sql) throws SQLException {
		//return conn.prepareStatement(sql, 1004, 1008);
		return conn.prepareStatement(sql);
	}

	public Statement createStatement( Connection conn) throws SQLException {
		//return conn.createStatement( 1004, 1008);
		return conn.createStatement();
	}
	
    /**
     * getQueryData().
     * SQL를 실행하여 결과를 반환한다.(SELECT 문)
     * @param String 
     * @return ResultSetEntity
     */
	public ResultSetEntity getQueryData( Connection conn, String sql, Object[] params) {

		writeSQLLog(sql, params);
		
		ResultSetEntity rset = null;
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			if( params==null) {
				stmt = createStatement( conn);
				rs = stmt.executeQuery(sql);
			} else {
				ps = prepareStatement( conn, sql);
				for (int i = 0; i < params.length; i++) {
					ps.setObject( i+1, params[i]);
				}
				rs = ps.executeQuery();
			}
			rset = new ResultSetEntity(rs);
		} catch (Exception e) {
			System.out.println("Exception Occurence :: "+e.toString());
			e.getStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
					System.out.println("Close Statement exception: "
							+ e.getMessage());
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
					System.out.println("Close Prepared Statement exception: "
							+ e.getMessage());
				}
			}
		}
		return rset;
	}	

    /**
     * getQueryData().
     * SQL를 실행하여 결과를 반환한다.(SELECT 문)
     * @param String
     * @return ResultSetEntity
     */
	public ResultSetEntity getQueryData(Connection conn, String sql) {
		return getQueryData( conn, sql, null);
	}
	
    /**
     * getQueryData().
     * SQL를 실행하여 결과를 반환한다.(SELECT 문)
     * @param String
     * @return ResultSetEntity
     */
	public ResultSetEntity getQueryData(String sql, Object[] params) {
		ConnectDB resource = null;
		Connection conn = null;
		try {
			resource = new ConnectDB(this.jndiName);
			//resource = new ConnectDB(1);
			conn = resource.getConnection();
			return getQueryData( conn, sql, params);
		} catch (Exception e) {
			e.getStackTrace();
		} finally {
			resource.release();
		}
		return null;
	}

	/**
     * getQueryData().
     * SQL를 실행하여 결과를 반환한다.(SELECT 문)
     * @param String
     * @return ResultSetEntity
     */
	public ResultSetEntity getQueryData(String sql) {
		return getQueryData( sql, null);
	}

	/**
     * getQueryData().
     * SQL를 실행하여 결과를 반환한다.(SELECT 문)
     * @param String
     * @return ResultSetEntity
     */
	public ResultSetEntity getQueryData(StringBuffer sql) {
		return getQueryData( sql.toString(), null);
	}

	

    /**
     * getQueryData().
     * SQL를 실행하여 결과를 반환한다.(SELECT 문)
     * @param String 
     * @return ResultSetEntity
     */
	public String getAData( Connection conn, String sql, Object[] params) {

		// write SQL log
		writeSQLLog(sql, params);
		
		Statement stmt = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			if( params==null) {
				stmt = createStatement( conn);
				rs = stmt.executeQuery(sql);
			} else {
				ps = prepareStatement( conn, sql);
				for (int i = 0; i < params.length; i++) {
					ps.setObject( i+1, params[i]);
				}
				rs = ps.executeQuery();
			}
			if( rs.next()) {
				return rs.getString( 1);
			}
		} catch (Exception e) {
			System.out.println("Exception Occurence :: "+e.toString());
			e.getStackTrace();
		} finally {
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
					System.out.println("Close Statement exception: "
							+ e.getMessage());
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
					System.out.println("Close Prepared Statement exception: "
							+ e.getMessage());
				}
			}
		}
		return "";
	}		
	
	public String getAData( Connection conn, String sql) {
		return getAData( conn, sql, null);
	}

	public String getAData(StringBuffer sql, Object[] params) {
		return getAData(sql.toString(), params);
	}
	public String getAData(String sql, Object[] params) {

		String aData = "";
		ConnectDB resource = null;
		Connection conn = null;
		try {
			resource = new ConnectDB(this.jndiName);
			//resource = new ConnectDB(1);
			conn = resource.getConnection();
			return getAData( conn, sql, params);
		} catch (Exception e) {
			System.out.println("Exception Occurence :: "+e.toString());
			e.getStackTrace();
		} finally {
			if (resource != null) {
				resource.release();
			}
		}
		return aData;
	}
	
	public String getAData(String sql) {
		return getAData( sql, null);
	}

	
    /**
     * setQueryData().
     * SQL를 실행한다.(INSERT, UPDATE, DELETE 문 등)
     * JDNI를 사용하지 않고 Connection을 가져올 경우에 사용한다.(스케줄러)
     * @param Connection, String
     * @return int
     */
	public int setQueryData(Connection conn, String sql, Object[] params) throws SQLException{

		// write SQL log
		writeSQLLog(sql, params);
		
		int rset = -1;
		Statement stmt = null;
		PreparedStatement ps = null;
		try {
			if( params == null) {
				stmt = createStatement( conn);
				rset = stmt.executeUpdate(sql);
			} else {
				ps = prepareStatement( conn, sql);
				for (int i = 0; i < params.length; i++) {
					ps.setObject(i+1, params[i]);
				}
				rset = ps.executeUpdate();
			}
		} catch (SQLException e) {
			throw e;
		} finally {			
			if (stmt != null) {
				try {
					stmt.close();
				} catch (Exception e) {
					System.out.println("Close Statement exception: "
							+ e.getMessage());
				}
			}
			if (ps != null) {
				try {
					ps.close();
				} catch (Exception e) {
					System.out.println("Close Prepared Statement exception: "
							+ e.getMessage());
				}
			}
		}
		return rset;
	}

	public int setQueryData(Connection conn, String sql) throws SQLException{
		return setQueryData( conn, sql, null);
	}
	/**
     * setQueryData().
     * SQL를 실행한다.(INSERT, UPDATE, DELETE 문 등)
     * @param String
     * @return int
     */
	public int setQueryData(String sql, Object[] params) throws SQLException{
		int rset;
		ConnectDB resource = null;
		Connection conn = null;
		try {
			resource = new ConnectDB(this.jndiName);
			conn = resource.getConnection();
			rset = setQueryData( conn, sql, params);
			conn.commit();
		} catch (SQLException se) {
			throw se;
		} catch (Exception e) {
			throw new SQLException( e.getMessage());
		} finally {
			try {conn.setAutoCommit(true);} catch (Exception ex){}
			resource.release();
		}
		return rset;
	}	

	public int setQueryData(String sql) throws SQLException{
		return setQueryData(sql, null);
	}
	
	public int insertTable( Connection conn, String tableName, String[] columns, HashMap hash) throws SQLException {
		String sql = " INSERT INTO " + tableName + " ( ";
		for (int i = 0; i < columns.length; i++) {
			if( i >0 ) sql += ", ";
			sql += columns[i];
		}
		sql += " ) values ( ";
		for (int i = 0; i < columns.length; i++) {
			if( i >0 ) sql += ", ";
			sql += "?";
		}
		sql += " ) ";
		
		Object[] params = new Object[ columns.length];
		for (int i = 0; i < params.length; i++) {
			params[i] = hash.get( columns[i]);
		}
		return setQueryData(conn, sql, params);
	}

	public int updateTable( Connection conn, String tableName, String[] updateColumns, String[] whereColumns,  HashMap hash) throws SQLException {
		String sql = " UPDATE " + tableName + " SET ";
		for (int i = 0; i < updateColumns.length; i++) {
			if( i >0 ) sql += ", ";
			sql += updateColumns[i] + " = ? ";
		}
		sql += " WHERE  ";
		for (int i = 0; i < whereColumns.length; i++) {
			if( i >0 ) sql += " AND ";
			sql += whereColumns[i] + " = ? ";
		}
		
		Object[] params = new Object[ updateColumns.length + whereColumns.length];
		for (int i = 0; i < updateColumns.length; i++) {
			params[i] = hash.get( updateColumns[i]);
		}
		for (int i = 0; i < whereColumns.length; i++) {
			params[ updateColumns.length + i] = hash.get( whereColumns[i]);
		}
		
		return setQueryData(conn, sql, params);
	}
	
	private void writeSQLLog( String sql, Object params[]) {
		if(!trace) return;
		StringBuffer s = new StringBuffer();
		s.append("\n"+sql);
		if( params != null) {
			for (int i = 0; i < params.length; i++) {
				s.append("\n param " + ( i + 1)  + " : [" + ( params[i] == null ? "<null>" : params[i].toString()) + "]");
			}
		}
		LOG.info(s);
	}
	
}