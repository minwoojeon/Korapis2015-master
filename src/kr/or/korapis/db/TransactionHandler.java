package kr.or.korapis.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import kr.or.korapis.util.DefaultCode;

public class TransactionHandler {
	DBHandler dbh = null;
	Connection conn = null;

	/**
	 * 생성자. Default JDBC이름을 입력한다.
	 * 
	 * @param void
	 */
	public TransactionHandler() {
		this(DefaultCode.DEFAULT_JNDI);
	}

	
	/**
	 * 생성자. JDBC이름을 받아 입력한다.
	 * 
	 * @param String
	 */
	public TransactionHandler(String jndiName) {
		dbh = new DBHandler();
		ConnectDB resource = null;

		try {
			resource = new ConnectDB(jndiName);
			conn = resource.getConnection();
			conn.setAutoCommit(false);
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 생성자. JDBC이름을 받아 입력한다.
	 * 
	 * @param String
	 */
	public TransactionHandler(Connection conn) {
		dbh = new DBHandler();
		try {
			this.conn = conn;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * getQueryData(). SQL를 실행하여 결과를 반환한다.(SELECT 문)
	 * 
	 * @param String
	 * @return ResultSetEntity
	 */
	public ResultSetEntity getQueryData(String sql, Object[] params) {
		return dbh.getQueryData(conn, sql, params);
	}

	/**
	 * getQueryData(). SQL를 실행하여 결과를 반환한다.(SELECT 문)
	 * 
	 * @param String
	 * @return ResultSetEntity
	 */
	public ResultSetEntity getQueryData(String sql) {
		return dbh.getQueryData(conn, sql, null);
	}

	public String getAData(String sql, Object[] params) {
		return dbh.getAData(conn, sql, params);
	}

	public String getAData(String sql) {
		return dbh.getAData(conn, sql, null);
	}

	/**
	 * setQueryData(). SQL를 실행한다.(INSERT, UPDATE, DELETE 문 등)
	 * 
	 * @param String
	 * @return int
	 */
	public int setQueryData(String sql, Object[] params) throws SQLException {
		return dbh.setQueryData(conn, sql, params);
	}

	public int setQueryData(String sql) throws SQLException {
		return setQueryData(sql, null);
	}

	public int insertTable(String tableName, String[] columns, HashMap hash)
			throws SQLException {
		return dbh.insertTable(conn, tableName, columns, hash);
	}

	public int updateTable(String tableName, String[] updateColumns,
			String[] whereColumns, HashMap hash) throws SQLException {
		return dbh.updateTable(conn, tableName, updateColumns, whereColumns,
				hash);
	}



	public void commit() throws SQLException {
		conn.commit();
	}

	public void rollback() {
		try {
			conn.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		if (conn != null) {
			try {
				conn.close();
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	

	public void finalize() {
		if (conn != null) {
			try {
				conn.close();
				conn = null;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public boolean isTrace() {
		return dbh.isTrace();
	}

	public void setTrace(boolean trace) {
		dbh.setTrace(trace);
	}

}